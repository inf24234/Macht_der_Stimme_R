# 1. Den Datensatz 'ds' der Variable preference_data zuweisen und dann...
analysis_data <- ds %>%
  # Nur Datensätze betrachtet, welche abgeschlossen wurden
  filter(FINISHED == TRUE) %>%
  # 2. Mittelwert, Differenz und Alter berechnen
  # und dann...
  rowwise() %>%
  mutate(
    praeferenz_Stimme_A = mean(c(B001_01, B001_02, B001_03), 
                               na.rm = TRUE),
    praeferenz_Stimme_B = mean(c(B101_01, B101_02, B101_03), 
                               na.rm = TRUE),
    Alter = SD02_01,
    praeferenz_differenz = praeferenz_Stimme_A - praeferenz_Stimme_B
  ) %>%
  
  ungroup() %>%

  # 3. Nur die benötigen Spalten auswählen und dann...
  select(CASE, Alter, praeferenz_differenz) %>%
  
  # 4 Zeilen mit fehlenden Werten entfernen
  na.omit()
  

# 5. Erstelle ein Streudiagramm (Scatter Plot) mit den Daten aus 'analysis_data'
ggplot(analysis_data, aes(x = Alter, y = praeferenz_differenz)) +
  geom_point(alpha = 0.6, color = "darkred") +
  geom_smooth(method = "lm", se = TRUE, color = "black") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  labs(
    title = "Zusammenhang zwischen Alter und Stimmpräferenz",
    subtitle = "Gibt es einen Alterseffekt bei der Präferenz für die warme Stimme?",
    x = "Alter der Teilnehmer",
    y = "Präferenzdifferenz (Warm - Neutral)"
  ) +
  theme_minimal() +
theme(
  axis.text = element_text(size = 8)
)

# 6. Diagramm im 'output'-Ordner speichern
ggsave("output/korrelation_alter_praeferenz.jpg", width = 8, height = 6)