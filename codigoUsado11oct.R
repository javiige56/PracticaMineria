paleta <- c("Americas" = "#0084ff", 
            "Asia" = "#44bec7", 
            "Europe" = "#ffc300", 
            "Oceania" = "#fa3c4c", "Africa" = "#ff6347") 
 


resumen_paises4 <- resumen_paises %>%
  filter(num_nadadores >= 10)

resumen_paises4 <- nadadoresParticipantes %>%
  group_by(name, iso2, continent) %>%
  summarise(num_nadadores = n(), .groups = "drop")  %>%
  filter(num_nadadores >= 10)%>%
  arrange(desc(num_nadadores))

summary(resumen_paises4)

oda_bar3 <- resumen_paises4 %>% 
  ggplot(aes(x = reorder(name_group, num_nadadores), 
             y = num_nadadores, 
             fill = continent)) + 
  geom_flag(y = -5, aes(image = iso2), size = 0.1) + 
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

