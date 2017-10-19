Feature: WBC-1048_VerificaPT in caso di annullo erogazione
	IN ORDER TO rendere nuovamente disponibili sul PT le confezioni derivanti da erogazioni annullate
	AS farmacia
	I WANT TO considerare anche gli annulli al fine del computo delle confezioni disponibili.

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

Scenario: 1. Erogazione con 1 movimento annullato
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 05/07/2017  |                | 120011000000001 | 1234           | true      |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore |
	| true  | 2                     | 2                 | 01/07/2017        | 25/08/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD |          |                   |


Scenario: 2. Erogazione con 2 movimenti, 1 annullato
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 05/07/2017  |                | 120011000000001 | 1234           | true      |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 10/07/2017  |                | 120012000000002 | 2345           | false     |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore     |
	| true  | 2                     | 1                 | 01/07/2017        | 25/08/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD | 5        | RESIDUO_INSUFFICIENTE |


Scenario: 2 BIS. Erogazione con 1 movimento annullato su 2 periodi
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
    | NH6F5J20K2C5TCPD | 2          | 036892053 | 05/07/2017  |                | 120011000000001 | 1234           | true      |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore |
	| true  | 2                     | 0                 | 01/07/2017        | 25/08/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD |          |                   |


Scenario: 2 TER. Erogazione con 2 movimenti e 1 annullato con residuo insufficiente
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 05/07/2017  |                | 120011000000001 | 1234           | true      |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 29/07/2017  |                | 120012000000002 | 1234           | false     |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore     |
	| true  | 2                     | 1                 | 01/07/2017        | 25/08/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD | 5        | RESIDUO_INSUFFICIENTE |


Scenario: 3. Erogazione con 2 movimenti e 1 annullato
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 1          | 036892053 | 05/07/2017  |                | 120011000000001 | 1234           | true      |
	| NH6F5J20K2C5TCPD | 1          | 036892053 | 10/07/2017  |                | 120012000000002 | 2345           | false     |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 30/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore |
	| true  | 2                     | 2                 | 29/07/2017        | 22/09/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD |          |                   |


Scenario: 4. Erogazione con 3 movimenti, 1 dei quali nel passato e annullato, e residuo insufficiente
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 05/07/2017  |                | 120011000000001 | 1234           | true      |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 10/07/2017  |                | 120012000000002 | 2345           | false     |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 29/07/2017  |                | 120013000000003 | 4566           | false     |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 30/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore     |
	| true  | 2                     | 1                 | 29/07/2017        | 22/09/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD | 5        | RESIDUO_INSUFFICIENTE |

	
Scenario: 4BIS. Erogazione con 3 movimenti, 2 annullati, e residuo insufficiente
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 05/07/2017  |                | 120011000000001 | 1234           | true      |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 10/07/2017  |                | 120012000000002 | 2345           | true      |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 29/07/2017  |                | 120013000000003 | 4566           | false     |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 30/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore     |
	| true  | 2                     | 1                 | 29/07/2017        | 22/09/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD | 5        | RESIDUO_INSUFFICIENTE |


Scenario: 5. PT con frequenza di 2w, erogazione con molti movimenti, 1 annullato
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 2 settimane per 6 mesi | 525 mg    | 2 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 05/07/2017  |                | 120011000000001 | 1234           | false     |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 10/07/2017  |                | 120012000000002 | 2345           | false     |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 29/07/2017  |                | 120013000000003 | 4566           | false     |
    | NH6F5J20K2C5TCPD | 6          | 036892089 | 28/07/2017  |                | 120014000000004 | 1234           | true      |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 05/08/2017  |                | 120015000000005 | 1234           | false     |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892089 | 3          | 11/08/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore |
	| true  | 15                    | 12                | 29/07/2017        | 06/10/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD |          |                   |

#
#Scenario: 5BIS. PT con frequenza di 2w, erogazione con molti movimenti, 1 annullato
#	Given Il seguente piano terapeutico
#	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
#	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 2 settimane per 6 mesi | 525 mg    | 2 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
#	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
#    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
#    | NH6F5J20K2C5TCPD | 1          | 036892053 | 05/07/2017  |                | 120011000000001 | 1234           | false     |
#    | NH6F5J20K2C5TCPD | 1          | 036892053 | 10/07/2017  |                | 120012000000002 | 2345           | false     |
#    | NH6F5J20K2C5TCPD | 1          | 036892053 | 29/07/2017  |                | 120013000000003 | 4566           | false     |
#    | NH6F5J20K2C5TCPD | 6          | 036892089 | 28/07/2017  |                | 120014000000004 | 1234           | true      |
#    | NH6F5J20K2C5TCPD | 6          | 036892089 | 28/07/2017  |                | 120015000000005 | 1234           | false     |
#    | NH6F5J20K2C5TCPD | 6          | 036892089 | 08/08/2017  |                | 120016000000006 | 1234           | false     |
#	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
#	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
#	| 036892089 | 3          | 11/08/2017  | MDGDGI70B12E704B |
#	Then la risposta è la seguente
#	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore |
#	| true  | 15                    | 6                 | 29/07/2017        | 06/10/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD |          |                   |

Scenario: 6. PT con frequenza di 2w, erogazione con molti movimenti, 1 annullato
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 2 settimane per 6 mesi | 525 mg    | 2 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 05/07/2017  |                | 120011000000001 | 1234           | false     |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 10/07/2017  |                | 120012000000002 | 2345           | false     |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 29/07/2017  |                | 120013000000003 | 4566           | false     |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 29/07/2017  |                | 120014000000004 | 1234           | true      |
    | NH6F5J20K2C5TCPD | 6          | 036892089 | 05/08/2017  |                | 120015000000005 | 1234           | false     |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 05/08/2017  |                | 120016000000006 | 1234           | false     |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 10/08/2017  |                | 120017000000007 | 1234           | false     |
    | NH6F5J20K2C5TCPD | 6          | 036892089 | 23/09/2017  |                | 120018000000008 | 1234           | false     |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 23/09/2017  |                | 120010000000011 | 1234           | false     |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892089 | 3          | 23/09/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore |
	| true  | 12                    | 3                 | 23/09/2017        | 17/11/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD |          |                   |


Scenario: 7. PT con frequenza di 2w, erogazione con movimento annullato a fine pt
	Given Il seguente piano terapeutico
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 2 settimane per 6 mesi | 525 mg    | 2 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
    | CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
    | NH6F5J20K2C5TCPD | 1          | 036892053 | 31/12/2017  |                | 120011000000001 | 1234           | false     |
    | NH6F5J20K2C5TCPD | 3          | 036892089 | 31/12/2017  |                | 120010000000011 | 1234           | true      |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892089 | 3          | 30/12/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore |
	| true  | 3                     | 3                 | 30/12/2017        | 31/12/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD |          |                   |


