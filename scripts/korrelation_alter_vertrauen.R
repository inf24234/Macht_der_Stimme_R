# 1. Den Datensatz 'ds' der Variable preference_data zuweisen und dann...
analysis_data <- ds %>%
  # Nur Datensätze betrachtet, welche abgeschlossen wurden
  filter(FINISHED == TRUE) %>%
  # 2. Mittelwert, Differenz und Alter berechnen
  # und dann...
  rowwise() %>%
  mutate(
    vertrauen_Stimme_A = mean(c(B004_01, B004_02, B004_03), 
                              na.rm = TRUE),
    vertrauen_Stimme_B = mean(c(B104_01, B104_02, B104_03), 
                              na.rm = TRUE),
    Alter = SD02_01,
    vertrauen_differenz = vertrauen_Stimme_A - vertrauen_Stimme_B
  ) %>%
  
  ungroup() %>%
  
  # 3. Nur die benötigen Spalten auswählen und dann...
  select(CASE, Alter, vertrauen_differenz) %>%
  
  # 4 Zeilen mit fehlenden Werten entfernen
  na.omit()


# 5. Erstelle ein Streudiagramm (Scatter Plot) mit den Daten aus 'analysis_data'
ggplot(analysis_data, aes(x = Alter, y = vertrauen_differenz)) +
  geom_point(alpha = 0.6, color = "darkred") +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  labs(
    title = "Zusammenhang zwischen Alter und Stimmvertrauen",
    subtitle = "Gibt es einen Alterseffekt bei dem Vertrauen für die warme Stimme?",
    x = "Alter der Teilnehmer",
    y = "Vertrauendifferenz (Warm - Neutral)"
  ) +
  theme_minimal() +
  theme(
    axis.text = element_text(size = 8)
  )

# 6. Diagramm im 'output'-Ordner speichern
ggsave("output/korrelation_alter_vertrauen.jpg", width = 8, height = 6)