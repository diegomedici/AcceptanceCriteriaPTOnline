Feature: WBC-1051_InoltroVerificaPT webCare-PTOnline
	IN ORDER TO inoltrare le verifiche PT nel periodo di transizione WebCare-PTOnline
	AS studiofarma
	I WANT TO che WBC inoltri le richieste di verifica di OMALIZUMAB nel caso in cui su WBC non viene trovato il PT e restituisca il CodicePT trovato.

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

Scenario: 1. Inoltro chiamata a PTOL
	Given  Il seguente piano terapeutico su PTOL
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	When viene effettuata seguente erogazione di prodotti
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | CodiceFiscale    |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | MDCDGI70B12E704B |
	Then trasmetto questi dati al PTOL
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           |


Scenario: 2. Memorizzazione movimento su WBC
	Given  Il seguente piano terapeutico su PTOL
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And Il seguente piano terapeutico su WebCare
	| CodiceFiscale    | Minsan    | DataInizioPiano | DataFinePiano | Prescrizione                        |
	| MDGDGI70B12E704B | 036892053 | 01/09/2017      | 30/09/2017    | 1 FIALA OGNI 2 SETTIMANE PER 1 MESE |
	When viene effettuata seguente erogazione di prodotti
	| CodicePT | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | CodiceFiscale    |
	|          | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | MDCDGI70B12E704B |
	Then memorizzo questo movimento in WBC
	| CodiceFiscale    | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia |
	| MDCDGI70B12E704B | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           |

