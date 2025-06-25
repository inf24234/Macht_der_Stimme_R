# 1. Den Datensatz 'ds' der Variable 'preference_single_data' zuweisen und dann...
preference_single_data <- ds %>%
  # Nur Datensätze betrachtet, welche abgeschlossen wurden
  filter(FINISHED == TRUE) %>%

  
  # 3. Nur die benötigen Spalten auswählen und dann...
  select(teilnehmer_id = CASE,
         B001_01, B001_02, B001_03,
         B101_01, B101_02, B101_03
         ) %>%
  
  mutate(across(starts_with("B"), as.numeric)) %>%
  
  # 4. Daten in das pivotieren Format umwandeln
  pivot_longer(
    cols = -teilnehmer_id,
    names_to = "frage_code",
    values_to = "praeferenz"
  ) %>%
  
  # 5. Neue Spalten für Stimmtyp und Frage erstellen
  # und dann...
  mutate(
    stimmtyp = case_when(
      grepl("B001", frage_code) ~ "Warme Stimme (A)",
      grepl("B101", frage_code) ~ "Neutrale Stimme (B)"
    ),
    frage = case_when(
      grepl("_01$", frage_code) ~ "Wie sympathisch finden Sie diese Stimme?",
      grepl("_02$", frage_code) ~ "Wie angenehm empfinden Sie diese Stimme?",
      grepl("_03$", frage_code) ~ "Wie freundlich wirkt diese Stimme auf Sie?"
    ),
    stimmtyp = factor(stimmtyp, levels = c("Warme Stimme (A)", "Neutrale Stimme (B)"))
  ) %>%

  
  # 6. Zeilen mit fehlenden Werten entfernen
  na.omit()

# 7. Erstelle ein Boxplot mit den Daten aus 'preference_single_data'
ggplot(preference_single_data, aes(x = frage, y = praeferenz, fill = stimmtyp)) +
  geom_boxplot(width = 0.7) +
  labs(
    title = "Nutzerpräferenz",
    subtitle = "Vergleich der warmen vs. neutralen KI-Stimme",
    x = "Frage",
    y = "Präferenz-Bewertung (Skala 1-5)",
    fill = "Stimmtyp"
  ) +
  theme_minimal() +
  theme(legend.position = "none") +
  theme(
    axis.text = element_text(size = 8),
    legend.position = "top"
  )

# 8. Diagramm im 'output'-Ordner speichern
ggsave("output/vergleich_einzelne_nutzerpraeferenz.jpg", width = 8, height = 6)