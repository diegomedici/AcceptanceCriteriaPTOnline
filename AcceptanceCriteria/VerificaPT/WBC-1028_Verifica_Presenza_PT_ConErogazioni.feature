Feature: WBC-1028_Verifica Presenza PT in presenza di erogazioni
	IN ORDER TO sapere se posso procedere con un ordine di OMALIZUMAB 
	AS farmacia
	I WANT TO verificare la disponibilità di un PT di OMALIZUMAB in presenza di erogazioni


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

Scenario: 1. Erogazione con 1 movimento e residuo insufficiente
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta | CodiceFarmacia |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 05/07/2017  |                |               |                |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore     |
	| true  | 2                     | 1                 | 01/07/2017        | 25/08/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD | 5        | RESIDUO_INSUFFICIENTE |


Scenario: 2. Erogazione con 2 movimenti e residuo 0
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta | CodiceFarmacia |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 05/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 10/07/2017  |                |               |                |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore |
	| true  | 2                     | 0                 | 01/07/2017        | 25/08/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD | ?        | RESIDUO_0         |


Scenario: 2 BIS. Erogazione con 1 movimenti su 2 periodi e residuo 0
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta | CodiceFarmacia |
    | NH6F5J20K2C5TCPD | 2          | 036892053 | 05/07/2017  |                |               |                |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore |
	| true  | 2                     | 0                 | 01/07/2017        | 25/08/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD | ?        | RESIDUO_0         |


Scenario: 3. Erogazione con 2 movimenti e residuo insufficiente
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta | CodiceFarmacia |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 05/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 10/07/2017  |                |               |                |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 30/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore     |
	| true  | 2                     | 1                 | 29/07/2017        | 22/09/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD | 5        | RESIDUO_INSUFFICIENTE |


Scenario: 4. Erogazione con 3 movimenti, 1 dei quali nel passato, e residuo 0
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta | CodiceFarmacia |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 05/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 10/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 29/07/2017  |                |               |                |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 30/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore |
	| true  | 2                     | 0                 | 29/07/2017        | 22/09/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD | 5        | RESIDUO_0         |


Scenario: 5. PT con frequenza di 2w, erogazione con molti movimenti, alcuni nel passato, e disponibilità
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 2 settimane per 6 mesi | 525 mg    | 2 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta | CodiceFarmacia |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 05/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 10/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 29/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 28/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 29/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 05/08/2017  |                |               |                |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892089 | 3          | 11/08/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore |
	| true  | 15                    | 9                 | 29/07/2017        | 06/10/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD |          |                   |


Scenario: 6. PT con frequenza di 2w, erogazione con molti movimenti, alcuni nel passato, e disponibilità
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 2 settimane per 6 mesi | 525 mg    | 2 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta | CodiceFarmacia |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 05/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 10/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 29/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 29/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 05/08/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 05/08/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 05/08/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 10/08/2017  |                |               |                |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892089 | 3          | 22/08/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore |
	| true  | 15                    | 3                 | 12/08/2017        | 20/10/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD | 0        |                   |


Scenario: 7. PT con frequenza di 2w, erogazione con molti movimenti, alcuni nel passato, a fine pt e residuo insufficiente
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 2 settimane per 6 mesi | 525 mg    | 2 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta | CodiceFarmacia |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 05/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 10/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 29/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 29/07/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 05/08/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 05/08/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 10/08/2017  |                |               |                |
    | NH6F5J20K2C5TCPD | 1          | 036892089 | 31/12/2017  |                |               |                |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892089 | 3          | 30/12/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore     |
	| true  | 3                     | 2                 | 30/12/2017        | 31/12/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD | 5        | RESIDUO_INSUFFICIENTE |


