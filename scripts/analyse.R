# Benötigte Pakete installieren (nur einmal ausführen)
# install.packages("tidyverse")

# Pakete laden
library(tidyverse)

# --- Offizieles Import Skript von SoSci ---
# Im ersten Schritt die .csv einlesen, dann restliches Skript ausführen

# Dieses Script liest eine CSV-Datendatei in GNU R ein.
# Beim Einlesen werden für alle Variablen Beschriftungen (comment) angelegt.
# Die Beschriftungen für Werte wird ebenfalls als Attribute (attr) abgelegt.

ds_file = file.choose()
# setwd("./")
# ds_file = "rdata_Befragung478371_2025-06-24_19-30.csv"

# --- Im ersten Schritt bis hierhin das Skript laufen lassen#
# --- Danach den restlichen Abschnitt ausführen

options(encoding = "UTF-8")
ds = read.delim(
  file=ds_file, encoding="UTF-8", fileEncoding="UTF-8",
  header = FALSE, sep = "\t", quote = "\"",
  dec = ".", row.names = NULL,
  col.names = c(
    "CASE","SERIAL","REF","QUESTNNR","MODE","STARTED","B001_01","B001_02","B001_03",
    "B001_04","B004_01","B004_02","B004_03","B101_01","B101_02","B101_03","B101_04",
    "B104_01","B104_02","B104_03","E001_CP","ZG_Reihenfolge","SD01","SD02_01",
    "TIME001","TIME002","TIME003","TIME004","TIME005","TIME006","TIME007","TIME008",
    "TIME_SUM","MAILSENT","LASTDATA","STATUS","FINISHED","Q_VIEWER","LASTPAGE",
    "MAXPAGE","MISSING","MISSREL","TIME_RSI"
  ),
  as.is = TRUE,
  colClasses = c(
    CASE="numeric", SERIAL="character", REF="character", QUESTNNR="character",
    MODE="factor", STARTED="POSIXct", B001_01="numeric", B001_02="numeric",
    B001_03="numeric", B001_04="numeric", B004_01="numeric", B004_02="numeric",
    B004_03="numeric", B101_01="numeric", B101_02="numeric", B101_03="numeric",
    B101_04="numeric", B104_01="numeric", B104_02="numeric", B104_03="numeric",
    E001_CP="numeric", ZG_Reihenfolge="numeric", SD01="numeric",
    SD02_01="numeric", TIME001="integer", TIME002="integer", TIME003="integer",
    TIME004="integer", TIME005="integer", TIME006="integer", TIME007="integer",
    TIME008="integer", TIME_SUM="integer", MAILSENT="POSIXct",
    LASTDATA="POSIXct", STATUS="character", FINISHED="logical",
    Q_VIEWER="logical", LASTPAGE="numeric", MAXPAGE="numeric",
    MISSING="numeric", MISSREL="numeric", TIME_RSI="numeric"
  ),
  skip = 1,
  check.names = TRUE, fill = TRUE,
  strip.white = FALSE, blank.lines.skip = TRUE,
  comment.char = "",
  na.strings = ""
)

row.names(ds) = ds$CASE

rm(ds_file)

attr(ds, "project") = "Befragung478371"
attr(ds, "description") = "Forschungsprojekt - Die Macht der Stimme"
attr(ds, "date") = "2025-06-24 19:30:09"
attr(ds, "server") = "https://www.soscisurvey.de"

# Variable und Value Labels
ds$SD01 = factor(ds$SD01,
                 levels=c("1","2","3","4","5","-9"),
                 labels=c("weiblich","männlich","nicht-binär / genderqueer","kein Geschlecht","Möglichkeit zur eigenen Angabe:","[NA] nicht beantwortet"),
                 ordered=FALSE)
attr(ds$B001_01,"1") = "Stimme überhaupt nicht zu [1]"
attr(ds$B001_01,"2") = "Stimme nicht zu [2]"
attr(ds$B001_01,"3") = "Neutral / Weder noch [3]"
attr(ds$B001_01,"4") = "Stimme zu [4]"
attr(ds$B001_01,"5") = "Stimme voll und ganz zu [5]"
attr(ds$B001_02,"1") = "Stimme überhaupt nicht zu [1]"
attr(ds$B001_02,"2") = "Stimme nicht zu [2]"
attr(ds$B001_02,"3") = "Neutral / Weder noch [3]"
attr(ds$B001_02,"4") = "Stimme zu [4]"
attr(ds$B001_02,"5") = "Stimme voll und ganz zu [5]"
attr(ds$B001_03,"1") = "Stimme überhaupt nicht zu [1]"
attr(ds$B001_03,"2") = "Stimme nicht zu [2]"
attr(ds$B001_03,"3") = "Neutral / Weder noch [3]"
attr(ds$B001_03,"4") = "Stimme zu [4]"
attr(ds$B001_03,"5") = "Stimme voll und ganz zu [5]"
attr(ds$B001_04,"1") = "Stimme überhaupt nicht zu [1]"
attr(ds$B001_04,"2") = "Stimme nicht zu [2]"
attr(ds$B001_04,"3") = "Neutral / Weder noch [3]"
attr(ds$B001_04,"4") = "Stimme zu [4]"
attr(ds$B001_04,"5") = "Stimme voll und ganz zu [5]"
attr(ds$B004_01,"1") = "Trifft überhaupt nicht zu [1]"
attr(ds$B004_01,"2") = "Trifft eher nicht zu [2]"
attr(ds$B004_01,"3") = "Neutral / Weder noch [3]"
attr(ds$B004_01,"4") = "Trifft eher zu [4]"
attr(ds$B004_01,"5") = "Trifft voll und ganz zu [5]"
attr(ds$B004_02,"1") = "Trifft überhaupt nicht zu [1]"
attr(ds$B004_02,"2") = "Trifft eher nicht zu [2]"
attr(ds$B004_02,"3") = "Neutral / Weder noch [3]"
attr(ds$B004_02,"4") = "Trifft eher zu [4]"
attr(ds$B004_02,"5") = "Trifft voll und ganz zu [5]"
attr(ds$B004_03,"1") = "Trifft überhaupt nicht zu [1]"
attr(ds$B004_03,"2") = "Trifft eher nicht zu [2]"
attr(ds$B004_03,"3") = "Neutral / Weder noch [3]"
attr(ds$B004_03,"4") = "Trifft eher zu [4]"
attr(ds$B004_03,"5") = "Trifft voll und ganz zu [5]"
attr(ds$B101_01,"1") = "Stimme überhaupt nicht zu [1]"
attr(ds$B101_01,"2") = "Stimme nicht zu [2]"
attr(ds$B101_01,"3") = "Neutral / Weder noch [3]"
attr(ds$B101_01,"4") = "Stimme zu [4]"
attr(ds$B101_01,"5") = "Stimme voll und ganz zu [5]"
attr(ds$B101_02,"1") = "Stimme überhaupt nicht zu [1]"
attr(ds$B101_02,"2") = "Stimme nicht zu [2]"
attr(ds$B101_02,"3") = "Neutral / Weder noch [3]"
attr(ds$B101_02,"4") = "Stimme zu [4]"
attr(ds$B101_02,"5") = "Stimme voll und ganz zu [5]"
attr(ds$B101_03,"1") = "Stimme überhaupt nicht zu [1]"
attr(ds$B101_03,"2") = "Stimme nicht zu [2]"
attr(ds$B101_03,"3") = "Neutral / Weder noch [3]"
attr(ds$B101_03,"4") = "Stimme zu [4]"
attr(ds$B101_03,"5") = "Stimme voll und ganz zu [5]"
attr(ds$B101_04,"1") = "Stimme überhaupt nicht zu [1]"
attr(ds$B101_04,"2") = "Stimme nicht zu [2]"
attr(ds$B101_04,"3") = "Neutral / Weder noch [3]"
attr(ds$B101_04,"4") = "Stimme zu [4]"
attr(ds$B101_04,"5") = "Stimme voll und ganz zu [5]"
attr(ds$B104_01,"1") = "Trifft überhaupt nicht zu [1]"
attr(ds$B104_01,"2") = "Trifft eher nicht zu [2]"
attr(ds$B104_01,"3") = "Neutral / Weder noch [3]"
attr(ds$B104_01,"4") = "Trifft eher zu [4]"
attr(ds$B104_01,"5") = "Trifft voll und ganz zu [5]"
attr(ds$B104_02,"1") = "Trifft überhaupt nicht zu [1]"
attr(ds$B104_02,"2") = "Trifft eher nicht zu [2]"
attr(ds$B104_02,"3") = "Neutral / Weder noch [3]"
attr(ds$B104_02,"4") = "Trifft eher zu [4]"
attr(ds$B104_02,"5") = "Trifft voll und ganz zu [5]"
attr(ds$B104_03,"1") = "Trifft überhaupt nicht zu [1]"
attr(ds$B104_03,"2") = "Trifft eher nicht zu [2]"
attr(ds$B104_03,"3") = "Neutral / Weder noch [3]"
attr(ds$B104_03,"4") = "Trifft eher zu [4]"
attr(ds$B104_03,"5") = "Trifft voll und ganz zu [5]"
attr(ds$ZG_Reihenfolge,"1") = "erste_Sequenz"
attr(ds$ZG_Reihenfolge,"2") = "zweite_Sequenz"
attr(ds$ZG_Reihenfolge,"3") = "dritte_Sequenz"
attr(ds$ZG_Reihenfolge,"4") = "vierte_Sequenz"
attr(ds$STATUS,"complete") = "Interview vollständig"
attr(ds$STATUS,"finished") = "Interview abgeschlossen (letzte Seite erreicht)"
attr(ds$STATUS,"quality fail") = "Als ungültiger Datensatz markiert"
attr(ds$STATUS,"quota full") = "Aufgrund eines Quotenstopps abgewiesen"
attr(ds$STATUS,"screenout") = "Aufgrund der Auswahlkritiern abgewiesen"
attr(ds$FINISHED,"F") = "abgebrochen"
attr(ds$FINISHED,"T") = "ausgefüllt"
attr(ds$Q_VIEWER,"F") = "Teilnehmer"
attr(ds$Q_VIEWER,"T") = "Durchklicker"
comment(ds$SERIAL) = "Personenkennung oder Teilnahmecode (sofern verwendet)"
comment(ds$REF) = "Referenz (sofern im Link angegeben)"
comment(ds$QUESTNNR) = "Fragebogen, der im Interview verwendet wurde"
comment(ds$MODE) = "Interview-Modus"
comment(ds$STARTED) = "Zeitpunkt zu dem das Interview begonnen hat (Europe/Berlin)"
comment(ds$B001_01) = "Sympathie und Präferenz: Wie sympathisch finden Sie diese Stimme?"
comment(ds$B001_02) = "Sympathie und Präferenz: Wie angenehm empfinden Sie diese Stimme?"
comment(ds$B001_03) = "Sympathie und Präferenz: Wie freundlich wirkt diese Stimme auf Sie?"
comment(ds$B001_04) = "Sympathie und Präferenz: Mögen Sie diese Stimme?"
comment(ds$B004_01) = "Vertrauenswürdigkeit und Kompetenz: Wie vertrauenswürdig wirkt diese Stimme?"
comment(ds$B004_02) = "Vertrauenswürdigkeit und Kompetenz: Wie kompetent wirkt der Sprecher?"
comment(ds$B004_03) = "Vertrauenswürdigkeit und Kompetenz: Wie glaubwürdig finden Sie diese Stimme?"
comment(ds$B101_01) = "Sympathie und Präferenz: Wie sympathisch finden Sie diese Stimme?"
comment(ds$B101_02) = "Sympathie und Präferenz: Wie angenehm empfinden Sie diese Stimme?"
comment(ds$B101_03) = "Sympathie und Präferenz: Wie freundlich wirkt diese Stimme auf Sie?"
comment(ds$B101_04) = "Sympathie und Präferenz: Mögen Sie diese Stimme?"
comment(ds$B104_01) = "Vertrauenswürdigkeit und Kompetenz: Wie vertrauenswürdig wirkt diese Stimme?"
comment(ds$B104_02) = "Vertrauenswürdigkeit und Kompetenz: Wie kompetent wirkt der Sprecher?"
comment(ds$B104_03) = "Vertrauenswürdigkeit und Kompetenz: Wie glaubwürdig finden Sie diese Stimme?"
comment(ds$E001_CP) = "ZG_Reihenfolge: Vollständige Leerungen der Urne bisher"
comment(ds$ZG_Reihenfolge) = "ZG_Reihenfolge: Gezogener Code"
comment(ds$SD01) = "Geschlecht"
comment(ds$SD02_01) = "Alter (direkt): Ich bin   ... Jahre"
comment(ds$TIME001) = "Verweildauer Seite 1"
comment(ds$TIME002) = "Verweildauer Seite 2"
comment(ds$TIME003) = "Verweildauer Seite 3"
comment(ds$TIME004) = "Verweildauer Seite 4"
comment(ds$TIME005) = "Verweildauer Seite 5"
comment(ds$TIME006) = "Verweildauer Seite 6"
comment(ds$TIME007) = "Verweildauer Seite 7"
comment(ds$TIME008) = "Verweildauer Seite 8"
comment(ds$TIME_SUM) = "Verweildauer gesamt (ohne Ausreißer)"
comment(ds$MAILSENT) = "Versandzeitpunkt der Einladungsmail (nur für nicht-anonyme Adressaten)"
comment(ds$LASTDATA) = "Zeitpunkt als der Datensatz das letzte mal geändert wurde"
comment(ds$STATUS) = "Status des Interviews (Markierung)"
comment(ds$FINISHED) = "Wurde die Befragung abgeschlossen (letzte Seite erreicht)?"
comment(ds$Q_VIEWER) = "Hat der Teilnehmer den Fragebogen nur angesehen, ohne die Pflichtfragen zu beantworten?"
comment(ds$LASTPAGE) = "Seite, die der Teilnehmer zuletzt bearbeitet hat"
comment(ds$MAXPAGE) = "Letzte Seite, die im Fragebogen bearbeitet wurde"
comment(ds$MISSING) = "Anteil fehlender Antworten in Prozent"
comment(ds$MISSREL) = "Anteil fehlender Antworten (gewichtet nach Relevanz)"
comment(ds$TIME_RSI) = "Ausfüll-Geschwindigkeit (relativ)"



# Assure that the comments are retained in subsets
as.data.frame.avector = as.data.frame.vector
`[.avector` <- function(x,i,...) {
  r <- NextMethod("[")
  mostattributes(r) <- attributes(x)
  r
}
ds_tmp = data.frame(
  lapply(ds, function(x) {
    structure( x, class = c("avector", class(x) ) )
  } )
)
mostattributes(ds_tmp) = attributes(ds)
ds = ds_tmp
rm(ds_tmp)