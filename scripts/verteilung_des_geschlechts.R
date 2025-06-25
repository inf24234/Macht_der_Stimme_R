# 1. Den Datensatz 'ds' der Variable 'gender_data' zuweisen und dann...
gender_data <- ds%>%
  # 2. Die N/A aus den Datensatz rausfiltern und dann...
  filter(!is.na(SD01)) %>%
  # 3. Zählt die einzelne Werte beim Geschlecht (1, 2, 3, 4, 5 oder -9)
  # und speichert diese in das Argument 'Anzahl' und dann..
  count(SD01, name = "Anzahl") %>%
  # 4. Erstelle eine neue Spalte mit den Namen 'Geschlecht'
  # und bennent die Zeilen je nach bestimmten Wert um.
  # Zum Schluss wird die Daten nach größe Sortiert
  mutate(
    Geschlecht = case_when(
      SD01 == 1 ~ "Männlich",
      SD01 == 2 ~ "Weiblich",
      SD01 == 3 ~ "nicht-binär / genderqueer",
      SD01 == 4 ~ "kein Geschlecht",
      TRUE ~ as.character(SD01)
    ),
    Geschlecht = fct_reorder(Geschlecht, Anzahl)
  )

#5. Säulendiagramm aus den 'gender_data' erstellen
ggplot(gender_data, aes(y = Geschlecht, x = Anzahl, fill = Geschlecht)) +
  geom_col() +
  labs(title = "Verteilung des Geschlechts",
       y = "Geschlecht",
       x = "Anzahl der Teilnehmer") +
  theme_minimal() +
  theme(
    axis.text = element_text(size = 8)
  )

# 6. Diagramm im 'output'-Ordner speichern
ggsave("output/verteilung_des_geschlechts.jpg", width = 10, height = 6)