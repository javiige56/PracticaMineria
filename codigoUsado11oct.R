paleta <- c("Americas" = "#0084ff", 
            "Asia" = "#44bec7", 
            "Europe" = "#ffc300", 
            "Oceania" = "#fa3c4c" 
) 



# Crear una nueva columna que agrupe países con menos de 10 nadadores en "Otros"
resumen_paises4 <- resumen_paises %>%
  filter(num_nadadores >= 10)
resumen_paises4

# Crear el gráfico
oda_bar3 <- resumen_paises4 %>% 
  ggplot(aes(x = reorder(name_group, num_nadadores), 
             y = num_nadadores, 
             fill = continent)) + 
  geom_flag(y = -5, aes(image = iso2), size = 0.05) + 
  geom_bar(stat = "identity") + 
  labs(title = "Participación de Nadadores por País",
       subtitle = "Países con menos de 10 nadadores ocultados",
       x = "País",
       y = "Número de Nadadores") +
  scale_fill_manual(values = paleta) +  # Colores personalizados
  expand_limits(y = c(0, max(resumen_paises4) + 10)) +  # Ajustar el límite superior
  coord_flip() +  # Gráfico horizontal
  theme_minimal()

# Imprimir el gráfico
print(oda_bar3)

