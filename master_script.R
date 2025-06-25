# Master-Skript zur Erstellung aller Diagramme

# -------------------------------------------------------------------
# Hinweis: Dieses Skript setzt voraus dass die Rohdaten 'ds'
# bereits geladen sind.
# Hierfür unter den Ordner 'scripts' das Skript 'analyse.R'
# nach der enthaltene Beschreibung ausführen.
# -------------------------------------------------------------------

print("Starte die Ertellung der Diagramme...")

print("Erstelle Diagramm 1: Verteilung des Alters...")
source("scripts/verteilung_des_alters.R")

print("Erstelle Diagramm 2: Verteilung des Geschelchts...")
source("scripts/verteilung_des_geschlechts.R")

print("Erstelle Diagramm 3: Korrelation zwischen Alter und Präferenz...")
source("scripts/korrelation_alter_praeferenz.R")

print("Erstelle Diagramm 4: Korrelation zwischen Alter und Vertrauen...")
source("scripts/korrelation_alter_vertrauen.R")

print("Erstelle Diagramm 5: Vergleich Nutzerpräferenz...")
source("scripts/vergleich_nutzerpraeferenz.R")

print("Erstelle Diagramm 6: Vergleich Nutzerpräferenz nur mit weiblichen Teilnehmern...")
source("scripts/vergleich_nutzerpraferenz_weiblich.R")

print("Erstelle Diagramm 7: Vergleich Nutzerpräferenz nur mit männlichen Teilnehmern...")
source("scripts/vergleich_nutzerpraferenz_maennlich.R")

print("Erstelle Diagramm 8: Vergleich der Einzelfragen bei Nutzerpräferenz...")
source("scripts/vergleich_einzeln_nutzerpraferenz.R")

print("Erstelle Diagramm 9: Vergleich Vertrauenswürdigkeit...")
source("scripts/vergleich_vertrauenswuerdigkeit.R")

print("Erstelle Diagramm 10: Vergleich Vertrauenswürdigkeit nur mit weiblichen Teilnehmern...")
source("scripts/vergleich_vertrauenswuerdigkeit_weiblich.R")

print("Erstelle Diagramm 11: Vergleich Vertrauenswürdigkeit nur mit männlichen Teilnehmern...")
source("scripts/vergleich_vertrauenswuerdigkeit_maennlich.R")

print("Erstelle Diagramm 12: Vergleich der Einzelfragen bei Vertrauenswürdigkeit...")
source("scripts/vergleich_einzeln_vertrauenswuerdigkeit.R")

print("Alle Diagramme wurden erfolgreich im 'output'-Ordner erstellt.")