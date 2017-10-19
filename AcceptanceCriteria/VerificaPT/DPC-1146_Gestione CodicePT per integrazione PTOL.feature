Feature: DPC-1146_Gestione CodicePT per integrazione PTOL
	IN ORDER TO gestire correttamente i PT sul nuovo PTOL
	AS studiofarma
	I WANT TO inoltrare in fase di erogazione il CodicePT restituito dopo la verifica del PT

Scenario: 1. Memorizzazione e trasmissione del CodicePT 
	Given la seguente risposta al servizio VerificaPT delle ricetta ="120171000000001"
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         |
	| true  | 2                     | 2                 | 01/07/2017        | 25/08/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD |
	When la farmacia effettua la chiusura della ricetta="120171000000001"
	Then viene trasmessa la seguente erogazione di prodotti a WBC
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           |


#Scenario: 1. 
#	Given Il seguente piano terapeutico su PTOL
#	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
#	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
#	And viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
#	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |NumeroRicetta   |
#	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |120171000000001 |
#	And la seguente risposta al servizio VerificaPT 
#	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         |
#	| true  | 2                     | 2                 | 01/07/2017        | 25/08/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD |
#	When la farmacia effettua la chiusura della ricetta="120171000000001"
#	Then viene trasmessa la seguente erogazione di prodotti a WBC
#	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia |
#	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           |
