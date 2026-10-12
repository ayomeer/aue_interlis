# dbu_aue_quellkataster

Für die interne Haltung von Quellendaten wird ein neues Produktiv-Modell erstellt. Dieses erweitert das Objekt `Quelle` des MGDM-141.1 Grundwasseraustritte_V2_0* und fügt die weitere Klasse `Messdaten` hinzu. 

<!-- TODO: UML Diagramm einfügen -->

*nicht im Sinn einer INTERLIS Vererbung, sondern dass ein Subset der Spaltendefinitionen aus der MGDM-Klasse in das Modell des Produktiv-Schemas kopiert werden

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





#### Messdaten

**Folgende Spalten werden _nicht_ in das neue Produktivmodell übernommen:**
- `Entnahme`: 


## ToDo

- [ ] ToDos aus Obsidian Pendenz überführen