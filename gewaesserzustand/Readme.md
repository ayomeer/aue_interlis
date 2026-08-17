# Produktives Modell Gewässerzustand

Das Modell `prod_gl_gewaesserzustand` soll, analog zum MGDM `Kant_Gewaesserzustand_V1_2`, Messtandorte an den kantonalen Gewässern abbilden.


## Motivation

Grundsätzlich könnte direkt auf dem Datenbankschema welches aus dem MGDM erstellt wurde gearbeitet werden. Aus den folgenden zwei Gründen wurde aber entschieden, dass ein flacheres Produktiv-Modell sinnvoll ist.

**1) Übersicht über Messstandorte intern**: \
Das MGDM zum Thema Gewässerzustand [Kant_Gewaesserzustand_V1_2.ili](model/Kant_Gewaesserzustand_V1_2.ili) favorisiert maximale Flexibilität und minimale Redundanz. Die Objekte der Fachdomäne sind in viele Teil-Objekte unterteilt, welche über Verknüpfungstabellen noch weiter von einander entfernt werden und in der QGIS UI schwer bis unmöglich navigierbar sind.

**2) Datenschnittstelle Externe für Bearbeiter:** \
Als Offerten für Datenaufbereitung eingeholt wurden, war sofort klar, dass externe ihre Daten nicht gemäss dem INTERLIS MGDM abgeben können würden. Es müsste also ohnehin eine flache Struktur vorgegeben werden und ein Prozess (Skript) definiert werden, welche diese Flachen informationen in das MGDM abfüllen kann.

## Grundsätze

Das Produktive Geodatenmodell wurde nach folgenden Grundsätzen erstellt:
- Die Struktur soll vom MGDM abgeleitet werden und möglichst gleich gehalten werden, um den Export möglichst einfach zu gestalten.
  - Es werden keine Attributen aus dem Modell herausgestrichen, sondern ggf. leer gelassen. 
- Die komplexen Beziehungen des MGDM sollen gemäss den simpleren Anforderunengen des Kantonalen Kontexts vereinfacht werden, sodass keine Zwischentabellen nötig sind. Das heisst spezifisch:
  - many-to-many Relationen zu one-to-many Relationen abändern
  - Attributen, welche an Relationen angehängt sind einem Fachobjekt zuweisen.

## Modellbeschreibung

Das MGDM wurde in folgende Struktur vereinfacht:
<figure>
  <img src="doc/img/prod_mermaid_edited.png" alt="A diagram of the system">
  <figcaption> UML Darstellung des Produktivmodells.</figcaption>
</figure>

<span style="color: green;">Grün</span> hinterlegt, sind die Klassen, welche hauptsächlich sind für den internen Gebrauch und eigentlich den gesamten Informationsgehalt abbilden.

<span style="color: violet;">Violett</span> hinterlegt, sind Klassen, welche vor allem für die Kongruenz zum MGDM gehalten werden. Messnetz und Verantwortung ist für alle gehaltenen Messorte gleich. Das heisst, diese Tabellen müssen nur zu Beginn ein Mal mit dem einen Eintrag des Standardwerts populiert werden. Neue `Messgruppierung` und `Werterhebung` Objekte können von da an automatisch mit diesen Einträgen verknüpft werden. Diese Klassen sind also für den produktiven Gebrauch kaum bemerkbar. Sie haben in dieser Hinsicht hier eine ähnliche Rolle wie Kataloge.

## Hinweise zur Benützung des Datenbankmodells

Es wird empfohlen, das Projekt mit Model Baker aufzusetzen.

## Verwandte Themen

Die MGDM Struktur der folgenden Themen ist vergleichbar:
- Grundwasserqualitaet_LV95 (vereinfacht)
- Grundwasserquantitaet_LV95 (vereinfacht)
- Kant_Gewässerzustand_V1_2 (Dieses Thema)
- Hydrologische_Messnetze_V1_1 <> Kant_Hydrologische_Messnetze? (beide wie dieses Thema)

Diese Strukturellen Ähnlichkeiten sollten genutzt werden indem wiederverwendbare Lösungen erstellt werden oder Themen intern zusammengeführt werden.  