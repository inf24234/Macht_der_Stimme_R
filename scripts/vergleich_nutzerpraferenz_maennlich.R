# 1. Den Datensatz 'ds' der Variable preference_data zuweisen und dann...
preference_data_male <- ds %>%
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
  # und von weiblichen Teilnehmer sind
  filter(FINISHED == TRUE, SD01 == "männlich") %>%
  # 2. Die gesammelten Fragen für Präferenz in einen Mittelwert speichern
  # und dann...
  rowwise() %>%
    mutate(
      praeferenz_Stimme_A = mean(c(B001_01, B001_02, B001_03), 
                                 na.rm = TRUE),
      praeferenz_Stimme_B = mean(c(B101_01, B101_02, B101_03), 
                                 na.rm = TRUE)
    ) %>%
    ungroup() %>%
    
    # 3. Nur die benötigen Spalten auswählen und dann...
    select(teilnehmer_id = CASE, praeferenz_Stimme_A, praeferenz_Stimme_B) %>%
    
    # 4. Daten in das pivotieren Format umwandeln
    pivot_longer(
      cols = c(praeferenz_Stimme_A, praeferenz_Stimme_B),
      names_to = "stimmtyp",
      values_to = "praeferenz"
    ) %>%
    
    # 5. Ersetzte 'praeferenz_' durch '' in den einzelnen Spalten
    mutate(stimmtyp = sub("praeferenz_", "", stimmtyp))

# 6. Erstelle ein Boxplot mit den Daten aus 'preference_data'
ggplot(preference_data_male, aes(x = stimmtyp, y = praeferenz, fill = stimmtyp)) +
  geom_boxplot(width = 0.5) +
  labs(
    title = "Bevorzugung von warmer vs. neutraler KI-Stimme bei männlichen Teilnehmern",
    subtitle = "Vergleich der Nutzerpräferenzen",
    x = "Typ der KI-Stimme",
    y = "Durchschnittliche Präferenz-Bewertung (Skala 1-5)"
  ) +
  scale_x_discrete(labels = c("Stimme_A" = "Warme Stimme", 
                              "Stimme_B" = "Neutrale Stimme")) +
  theme_minimal() +
  theme(legend.position = "none") +
  theme(
    axis.text = element_text(size = 8)
  )

# 7. Diagramm im 'output'-Ordner speichern
ggsave("output/vergleich_nutzerpraeferenz_männlich.jpg", width = 8, height = 6)