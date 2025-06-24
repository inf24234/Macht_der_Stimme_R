# 1. Häufigkeitstabelle erstellen und in einen 'Data Frame' umwandeln
age_data <- as.data.frame(table(ds$SD02_01))

# 2. Spalten des 'Data Frame' umbennen
colnames(age_data) <- c("Alter", "Anzahl")

# 3. Säulendiagramm aus dem 'Data Frame' erstellen
ggplot(data = age_data, aes(x = Alter, y = Anzahl)) +
  geom_col(fill = "darkred") +
  labs(title = "Verteilung des Alters",
       y = "Anzahl der Teilnehmer") +
  theme_minimal() +
  theme(
    axis.text = element_text(size = 8)
  )

# 4. Diagramm im 'output'-Ordner speichern
ggsave("output/verteilung_des_alters.jpg", width = 8, height = 6)
