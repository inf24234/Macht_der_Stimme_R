# 1. Den Datensatz 'ds' der Variable 'trust_single_data' zuweisen und dann...
trust_single_data <- ds %>%
  # Nur Datensätze betrachtet, welche abgeschlossen wurden
  filter(FINISHED == TRUE) %>%
  
  
  # 3. Nur die benötigen Spalten auswählen und dann...
  select(teilnehmer_id = CASE,
         B004_01, B004_02, B004_03,
         B104_01, B104_02, B104_03
  ) %>%
  
  mutate(across(starts_with("B"), as.numeric)) %>%
  
  # 4. Daten in das pivotieren Format umwandeln
  pivot_longer(
    cols = -teilnehmer_id,
    names_to = "frage_code",
    values_to = "vertrauen"
  ) %>%
  
  # 5. Neue Spalten für Stimmtyp und Frage erstellen
  # und dann...
  mutate(
    stimmtyp = case_when(
      grepl("B004", frage_code) ~ "Warme Stimme (A)",
      grepl("B104", frage_code) ~ "neutrale Stimme (B)"
    ),
    frage = case_when(
      grepl("_01$", frage_code) ~ "Wie vertrauenswürdig wirkt diese Stimme?",
      grepl("_02$", frage_code) ~ "Wie kompetent wirkt der Sprecher?",
      grepl("_03$", frage_code) ~ "Wie glaubwürdig finden Sie diese Stimme?"
    )
  ) %>%
  
  # 6. Zeilen mit fehlenden Werten entfernen
  na.omit()

# 6. Erstelle ein Boxplot mit den Daten aus 'trust_single_data'
ggplot(trust_single_data, aes(x = frage, y = vertrauen, fill = stimmtyp)) +
  geom_boxplot(width = 0.7) +
  labs(
    title = "Vertrauenswürdigkeit",
    subtitle = "Vergleich der warmen vs. neutralen KI-Stimme",
    x = "Frage",
    y = "Vertrauen-Bewertung (Skala 1-5)",
    fill = "Stimmtyp"
  ) +
  theme_minimal() +
  theme(legend.position = "none") +
  theme(
    axis.text = element_text(size = 8),
    legend.position = "top"
  )

# 7. Diagramm im 'output'-Ordner speichern
ggsave("output/vergleich_einzelne_vertrauenswuerdigkeit.jpg", width = 8, height = 6)