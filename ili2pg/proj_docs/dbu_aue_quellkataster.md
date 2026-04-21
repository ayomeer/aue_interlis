# dbu_aue_quellkataster

Für die interne Haltung von Quellendaten wird ein neues Produktiv-Modell erstellt. Dieses soll das Objekt _Quelle_ des MGDM-141.1 Grundwasseraustritte_V2_0 erweitern.


## Datenquellen

### Lokale Access Datenbank

#### Objektdaten
**Folgende Spalten werden _nicht_ in das neue Produktivmodell übernommen:**
- `Foto`: leer
- `Foto-Negativ-Nr 1`: tote Verlinkung (?)
- `Foto-Negativ-Nr 2`: tote Verlinkung (?)
- `Foto-Negativ-Nr 3`: tote Verlinkung (?)
- `Alte Ordnungsnummer`: kein Bezug mehr

**Folgende Spalten werden umbenannt:**
- `OK Terrain` -> `Hoehe` (Zusammenführung benennung Alpquellen)
- `Gemeinde` -> `Ortschaft` (Zusammenführung Gemeinden)


**Folgende Spalten werden direkt in MGDM-Spalten überführt:**


#### Messdaten

**Folgende Spalten werden _nicht_ in das neue Produktivmodell übernommen:**
- `Entnahme`: 