# 1. Den Datensatz 'ds' der Variable 'trust_data_male' zuweisen und dann...
trust_data_male <- ds %>%
  # 1.1. Erstelle eine neue Spalte mit den Namen 'Geschlecht'
  # und bennent die Zeilen je nach bestimmten Wert um.
  mutate(
    Geschlecht = case_when(
      SD01 == 1 ~ "Männlich",
      SD01 == 2 ~ "Weiblich",
      SD01 == 3 ~ "nicht-binär / genderqueer",
      SD01 == 4 ~ "kein Geschlecht",
      TRUE ~ as.character(SD01)
    ),
  ) %>%
  # Nur Datensätze betrachtet, welche abgeschlossen wurden
  filter(FINISHED == TRUE, SD01 == "männlich") %>%
  # 2. Die gesammelten Fragen für Präferenz in einen Mittelwert speichern
  # und dann...
  rowwise() %>%
  mutate(
    vertrauen_Stimme_A = mean(c(B004_01, B004_02, B004_03), 
                              na.rm = TRUE),
    vertrauen_Stimme_B = mean(c(B104_01, B104_02, B104_03), 
                              na.rm = TRUE)
  ) %>%
  ungroup() %>%
  
  # 3. Nur die benötigen Spalten auswählen und dann...
  select(teilnehmer_id = CASE, vertrauen_Stimme_A, vertrauen_Stimme_B) %>%
  
  # 4. Daten in das pivotieren Format umwandeln
  pivot_longer(
    cols = c(vertrauen_Stimme_A, vertrauen_Stimme_B),
    names_to = "stimmtyp",
    values_to = "vertrauen"
  ) %>%
  
  # 5. Ersetzte 'praeferenz_' durch '' in den einzelnen Spalten
  mutate(stimmtyp = sub("vertrauen_", "", stimmtyp))

# 6. Erstelle ein Boxplot mit den Daten aus 'trust_data_male'
ggplot(trust_data_male, aes(x = stimmtyp, y = vertrauen, fill = stimmtyp)) +
  geom_boxplot(width = 0.5) +
  labs(
    title = "Bevorzugung von warmer vs. neutraler KI-Stimme bei männlichen Teilnehmern",
    subtitle = "Vergleich der Vertrauenswürdigkeit",
    x = "Typ der KI-Stimme",
    y = "Durchschnittliche Vertrauen-Bewertung (Skala 1-5)"
  ) +
  scale_x_discrete(labels = c("Stimme_A" = "Warme Stimme", 
                              "Stimme_B" = "Neutrale Stimme")) +
  theme_minimal() +
  theme(legend.position = "none")
theme(
  axis.text = element_text(size = 8)
)

# 7. Diagramm im 'output'-Ordner speichern
ggsave("output/vergleich_vertrauenswuerdigkeit_männlich.jpg", width = 8, height = 6)