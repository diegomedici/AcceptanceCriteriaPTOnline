Feature: VerificaPTOmalizumab
	In order to avoid silly mistakes
	As a math idiot
	I want to be told the sum of two numbers

Background: 
	Given i seguenti dati dalla BD 
	| Minsan    | Descrizione       | ATC     | FormaFarmaceutica     | UnitàPosologiche | Grammatura |
	| 036892053 | XOLAIR 1SIR 75MG  | R03DX05 | SOLUZIONE INIETTABILE | 1                | 75 mg      |
	| 036892089 | XOLAIR 1SIR 150MG | R03DX05 | SOLUZIONE INIETTABILE | 1                | 150 mg     |
	And le seguenti combinazioni di unità posologiche di somministrazioni dell'OMALIZIMAB
	| Posologia | Grammatura 75mg | Grammatura 150mg |
	| 75        | 1               | 0                |
	| 150       | 0               | 1                |
	| 225       | 1               | 1                |
	| 300       | 0               | 2                |
	| 375       | 1               | 2                |
	| 450       | 0               | 3                |
	| 525       | 1               | 3                |
	| 600       | 0               | 4                |
	And il codice fiscale ha il seguente guid
	| CodiceFiscale    | Guid                                 |
	| MDGDGI70B12E704B | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d |

Scenario: Codice fiscale sconosciuto
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | DLBMRC86B26C618P |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | KeyError | DescrizioneErrore          |
	| true  | 0                     | 0                 |                   |                 |                 |               | 1        | CODICE_FISCALE_SCONOSCIUTO |


Scenario: Piano terapeutico Inesistente
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 35f04343-77e8-4c4b-bc57-af38d04ef132 |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | KeyError | DescrizioneErrore |
	| false | 0                     | 0                 |                   |                 |                 |               | 2        | PT_INESISTENTE    |

Scenario: Piano Terapeutico Scaduto da più di 30 gg
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 31/01/2018  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | KeyError | DescrizioneErrore |
	| false | 0                     | 0                 |                   |                 |                 |               | 3        | PT_SCADUTO        |

