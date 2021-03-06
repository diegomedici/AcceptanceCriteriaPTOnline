﻿Feature: WBC-1002_Verifica_Presenza_PT
	IN ORDER TO sapere se posso procedere con un ordine di OMALIZUMAB 
	AS farmacia
	I WANT TO verificare la presenza di un PT di OMALIZUMAB 

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

Scenario: 525_4w_6m_75mg
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         |
	| true  | 2                     | 2                 | 01/07/2017        | 25/08/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD |

Scenario: 525_4w_6m_150mg
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892089 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         |
	| true  | 6                     | 6                 | 01/07/2017        | 25/08/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD |


Scenario: 525_2w_6m
	Given Il seguente piano terapeutico
    | ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
    | R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 2 settimane per 6 mesi | 525 mg    | 2 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         |
	| true  | 5                     | 5                 | 01/07/2017        | 08/09/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD |


Scenario: 150_4w_5m
	Given Il seguente piano terapeutico
    | ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
    | R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 150 mg ogni 4 settimane per 5 mesi | 150 mg    | 4 settimane | 5 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892089 | 3          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | KeyError | DescrizioneErrore     | CodicePT         |
	| true  | 2                     | 2                 | 01/07/2017        | 25/08/2017      | 01/07/2017      | 30/11/2017    | 5        | RESIDUO_INSUFFICIENTE | NH6F5J20K2C5TCPD |


Scenario: 525_4w_6m_fine_pt
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 20/12/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         |
	| true  | 1                     | 1                 | 16/12/2017        | 31/12/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD |


Scenario: Piano terapeutico Inesistente
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | DLBMRC86B26C618P |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | KeyError | DescrizioneErrore | CodicePT         |
	| true  | 0                     | 0                 |                   |                 |                 |               | 2        | PT_INESISTENTE    |                  |

Scenario: Piano Terapeutico Scaduto 
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 31/01/2018  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | KeyError | DescrizioneErrore | CodicePT         |
	| true  | 0                     | 0                 |                   |                 |                 |               | 2        | PT_INESISTENTE    |                  |



