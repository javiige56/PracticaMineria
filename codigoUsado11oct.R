


boxplot(nadadoresParticipantes$edad)
summary(boxplot(nadadoresParticipantes$edad))
summary(nadadoresParticipantes$edad)

ggplot(nadadoresParticipantes, aes(x = edad, colour = gender)) +
  +   geom_density(lwd=2, linetype=1)

boxplot(nadadoresParticipantes$edad)
t.test(edad~gender,data=nadadoresParticipantes)


table(nadadoresParticipantes$edad>30)

table(nadadoresParticipantes$edad>30,nadadoresParticipantes$gender)


tabla1<-table(nadadoresParticipantes$edad>30,nadadoresParticipantes$gender)
chisq.test(tabla1)


tabla1<-table(nadadoresParticipantes$edad<18,nadadoresParticipantes$gender)
tabla1


chisq.test(tabla1)

## Código salma

##paises 


##si alguien sabe ocultar este codigo q esta en sucio
library(dplyr)
library(ggplot2)
library(ggimage)
library(countrycode)

datos2015<-read.csv("datos/2015_FINA.csv", header=TRUE, sep = ',')
#bueno explico pa tontos como se hace 

# NUESTRA TABLA ES nadadoresParticipantes
# Agregar el código ISO de dos dígitos, DIRAS PORQUE NO USAS CODE ESQ EN R PONE QUE TIENE Q SER DE DOS ASIQ ES LO Q TOCA HAY Q CONVERTIR 
#ASI LO PONE LA WEB 
nadadoresParticipantes$iso2 <- countrycode(nadadoresParticipantes$name, "country.name", "iso2c")
#UY SALTA ERROR PARECE QUE EN FINA, KOSOVO,MICRONESIA Y VIRGIN ISLAND NO SABE HACERLO
#VEO TODOS LOS NOMBRES PA BICHEAR 
nombres<- unique(nadadoresParticipantes$name) #NO REPETIR CLARO
print(nombres)

#Verificar qué nombres no fueron convertidos por si me olvido alguno
no_convertidos <- nadadoresParticipantes %>%
  filter(is.na(iso2)) %>%
  select(name)
print(no_convertidos)

#nombres problemáticos
manual <- data.frame(
  nombre = c("Fina", "Kosovo", "Micronesia", "Virgin Islands"),
  iso2 = c("FI", "XK", "FM", "VI")  
)

#Combina
nadadoresParticipantes <- nadadoresParticipantes %>%
  left_join(manual, by = c("name" = "nombre"), suffix = c("", ".nuevo")) %>%
  mutate(iso2 = ifelse(is.na(iso2), iso2.nuevo, iso2)) %>%
  select(-iso2.nuevo)  #Eliminar columna 


no_convertidos_final <- nadadoresParticipantes %>%
  filter(is.na(iso2)) %>%
  select(name)
print(no_convertidos_final)
#wue ya no hay ninguno no convertido

# Agregar variable de continente como hace la pagina
nadadoresParticipantes$continent <- countrycode(nadadoresParticipantes$iso2, "iso2c", "continent")
#vuelve a fallar

#continentess no asignados
continentes_no_asignados <- nadadoresParticipantes %>%
  filter(is.na(continent)) %>%
  select(iso2)
print(continentes_no_asignados)

#solo es XK(KOSOVO, Esta en europa para los catetos)
#manualmente el continente para Kosovo (XK)
nadadoresParticipantes <- nadadoresParticipantes %>%
  mutate(continent = ifelse(iso2 == "XK", "Europe", continent))  

#todos los continentes están asignados
continentes_final <- nadadoresParticipantes %>%
  filter(is.na(continent)) %>%
  select(iso2)

#siii
print(continentes_final)



#nadadores por país
resumen_paises <- nadadoresParticipantes %>%
  group_by(name, iso2, continent) %>%
  summarise(num_nadadores = n(), .groups = "drop") %>%
  arrange(desc(num_nadadores))  # Ordenar por número de nadadores
##esto esta muy guay podemos usarlo pa mas cosas ya que ya esta hecho
resumen_paises

#Crear un gráfico;metemos colores
paleta <- c("Americas" = "#0084ff", "Asia" = "#44bec7", 
            "Europe" = "#ffc300", "Oceania" = "#fa3c4c")

oda_bar <- resumen_paises %>% 
  ggplot(aes(x = reorder(name, num_nadadores), y = num_nadadores, fill = continent)) + 
  geom_flag(y = -10, aes(image = iso2), size = 0.05) +  
  geom_bar(stat = "identity") + 
  labs(title = "Participación de Nadadores por País",
       subtitle = "Datos de nadadores en competiciones",
       x = "País",
       y = "Número de Nadadores") +
  scale_fill_manual(values = paleta) +  # colores personalizados
  expand_limits(y = c(0, max(resumen_paises$num_nadadores) + 10)) +  # Aumentar el límite superior
  coord_flip() +  # Para hacer el gráfico horizontal
  theme_minimal()

# Imprimir el gráfico
print(oda_bar)

##lo de las banderas se me escapa y mira q he metido lo del flag pero creo que hay que crear una columna nueva donde aparezca los url de las banderas



#Como tal se podria reducir y mejorar el gráfico para que sea más interpretable




