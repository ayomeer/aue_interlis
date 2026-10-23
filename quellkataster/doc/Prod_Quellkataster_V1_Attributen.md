# Prod_Quellkataster_V1
## Grundwasseraustritte
### Quelle
| Attribute name | Cardinality | Type |
| --- | --- | --- |
| Identifikator | 1 | IdentifikatorTyp |
| Name | 0..1 | Text [255] |
| Grundwasserleiter_Typ | 1 | (Lockergestein, Kluft, Karst, gemischt, unbestimmt) |
| Quelltyp | 0..1 | Text [255] |
| Fassungsart | 1 | (ungefasst, gefasst (direkt, Fassungsstrang, Fassungsstollen, unbestimmt)) |
| Nutzungszustand | 0..1 | Nutzungszustand |
| Trinkwasser | 0..1 | JaNeinUnbestimmt |
| Zweck | 0..1 | Text [255] |
| Oeffentliches_Interesse | 0..1 | JaNeinUnbestimmt |
| Schuettung_minimal | 0..1 | LiterMinute |
| Schuettung_mittel | 0..1 | LiterMinute |
| Schuettung_maximal | 0..1 | LiterMinute |
| Zustroembereich_erforderlich | 0..1 | JaNeinUnbestimmt |
| Geometrie | 1 | Coord2 |
| Name_WV | 0..1 | Text [255] |
| Ordnungs_Nr | 0..1 | Text [255] |
| Ortschaft | 0..1 | Text [255] |
| Postleitzahl | 0..1 | Text [255] |
| Parz_Nr | 0..1 | Text [255] |
| Hoehe | 0..1 | 0..2999 |
| Lagegenauigkeit | 0..1 | Text [255] |
| Schachtueberstand | 0..1 | 0..1000 |
| Fassungsart_beschreibung | 0..1 | Text [255] |
| Fassungsabdeckung | 0..1 | Text [255] |
| Fassungszustand | 0..1 | Text [255] |
| Schachttyp | 0..1 | Text [255] |
| Anzahl_Zuleitungen | 0..1 | 0..99 |
| Schloss | 0..1 | Boolean |
| Fassungseigentuemer | 0..1 | Text [255] |
| Verwendungsart | 0..1 | Text [255] |
| Verwendungszweck_beschreibung | 0..1 | Text [255] |
| Notwasserversorgung | 0..1 | (ja, nein, unbestimmt) |
| WVA_Nutzung | 0..1 | Boolean |
| WVA_Nutzung_ergaenzen | 0..1 | Boolean |
| WVA_Nutzung_streichen | 0..1 | Boolean |
| WVA_Nutzung_lage_neu | 0..1 | Boolean |
| Datenherkunft | 0..1 | Text [255] |
| Aufgenommen_durch | 0..1 | Text [255] |
| Erhebungsdatum | 0..1 | XMLDate |
| Feldbegehung | 0..1 | XMLDate |
| Objektbereinigung | 0..1 | XMLDate |
| Schutzzone | 0..1 | Text [255] |
| Kontaktperson | 0..1 | Text [255] |
| Bemerkungen | 0..1 | Text [1023] |
| hat_messung | 0..* | Messdaten |

### Messdaten
| Attribute name | Cardinality | Type |
| --- | --- | --- |
| Entnahmedatum | 0..1 | XMLDate |
| Entnahmezeit | 0..1 | XMLTime |
| Witterung | 0..1 | Text [255] |
| Schuettungsmenge | 0..1 | LiterMinute |
| Wassertemperatur | 0..1 | -100..100 |
| pH_Wert | 0..1 | Text [255] |
| Sauerstoff | 0..1 | Text [255] |
| Sauerstoffsaettigung | 0..1 | Text [255] |
| Chemische_Analysen | 0..1 | Text [255] |
| Bemerkungen | 0..1 | Text [255] |
| von_quelle | 1 | Quelle |

