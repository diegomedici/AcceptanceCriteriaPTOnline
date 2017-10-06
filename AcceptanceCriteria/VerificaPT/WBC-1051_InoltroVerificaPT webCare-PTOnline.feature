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

Scenario: 1. Inoltro Chiamata
	Given  Il seguente piano terapeutico su PTOL
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And su WBC non è presente nessun PT che abbia questi dati
	| CodiceFiscale    | Minsan    | Data       |
	| MDGDGI70B12E704B | 036892053 | 13/07/2017 |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore     |
	| true  | 2                     | 1                 | 01/07/2017        | 25/08/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD | 5        | RESIDUO_INSUFFICIENTE |

Scenario: 2. PT presente in WBC e PTOL
	Given  Il seguente piano terapeutico su PTOL
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And Il seguente piano terapeutico su WebCare
	| CodiceFiscale    | Minsan    | DataInizioPiano | DataFinePiano | Prescrizione                        |
	| MDGDGI70B12E704B | 036892053 | 01/07/2017      | 31/07/2017    | 1 FIALA OGNI 2 SETTIMANE PER 1 MESE |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT | KeyError | DescrizioneErrore |
	| true  | 2                     | 2                 | 01/07/2017        | 31/07/2017      | 01/07/2017      | 31/07/2017    |          |          |                   |
	# In questo caso viene preso il PT di WBC

Scenario: 3. PT non presente né in WBC né in PTOL
	Given  Nessun piano terapeutico su PTOL per che abbia questi dati
	| ATC     | FormaFarmaceutica     | Data       |  | GuidCodiceFiscale                    |
	| R03DX05 | SOLUZIONE INIETTABILE | 13/07/2017 |  | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d |
	And su WBC non è presente nessun PT che abbia questi dati
	| CodiceFiscale    | Minsan    | Data       |
	| MDGDGI70B12E704B | 036892053 | 13/07/2017 |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | KeyError | DescrizioneErrore | CodicePT         |
	| true  | 0                     | 0                 |                   |                 |                 |               | 2        | PT_INESISTENTE    |                  |

Scenario: 4. PT scaduto su WBC e presente PTOL
	Given  Il seguente piano terapeutico su PTOL
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And Il seguente piano terapeutico su WebCare
	| CodiceFiscale    | Minsan    | DataInizioPiano | DataFinePiano | Prescrizione                        |
	| MDGDGI70B12E704B | 036892053 | 01/06/2017      | 30/06/2017    | 1 FIALA OGNI 2 SETTIMANE PER 1 MESE |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore     |
	| true  | 2                     | 1                 | 01/07/2017        | 25/08/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD | 5        | RESIDUO_INSUFFICIENTE |
	# In questo caso viene preso il PT di PTOL

Scenario: 5. PT futuro su WBC e presente PTOL
	Given  Il seguente piano terapeutico su PTOL
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And Il seguente piano terapeutico su WebCare
	| CodiceFiscale    | Minsan    | DataInizioPiano | DataFinePiano | Prescrizione                        |
	| MDGDGI70B12E704B | 036892053 | 01/08/2017      | 31/08/2017    | 1 FIALA OGNI 2 SETTIMANE PER 1 MESE |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | CodicePT         | KeyError | DescrizioneErrore     |
	| true  | 2                     | 1                 | 01/07/2017        | 25/08/2017      | 01/07/2017      | 31/12/2017    | NH6F5J20K2C5TCPD | 5        | RESIDUO_INSUFFICIENTE |
	# In questo caso viene preso il PT di PTOL


Scenario: 6. GUID Codice Fiscale non presente su WBC
	Given  Il seguente piano terapeutico su PTOL
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And il codice fiscale ha il seguente guid
	| CodiceFiscale    | Guid |
	| MDGDGI70B12E704B | null |
	And su WBC non è presente nessun PT che abbia questi dati
	| CodiceFiscale    | Minsan    | Data       |
	| MDGDGI70B12E704B | 036892053 | 13/07/2017 |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | KeyError | DescrizioneErrore | CodicePT         |
	| true  | 0                     | 0                 |                   |                 |                 |               | 2        | PT_INESISTENTE    |                  |
	#non effettua nemmeno la chiamata a PTOL in quanto non ha il guid con cui fare la chiamata

Scenario: 7. PT scaduto su WBC e NON presente PTOL
	Given  Nessun piano terapeutico su PTOL per che abbia questi dati
	| ATC     | FormaFarmaceutica     | Data       |  | GuidCodiceFiscale                    |
	| R03DX05 | SOLUZIONE INIETTABILE | 13/07/2017 |  | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d |
	And Il seguente piano terapeutico su WebCare
	| CodiceFiscale    | Minsan    | DataInizioPiano | DataFinePiano | Prescrizione                        |
	| MDGDGI70B12E704B | 036892053 | 01/06/2017      | 30/06/2017    | 1 FIALA OGNI 2 SETTIMANE PER 1 MESE |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | KeyError | DescrizioneErrore | CodicePT         |
	| true  | 0                     | 0                 |                   |                 |                 |               | 2        | PT_INESISTENTE    |                  |
	

Scenario: 8. PT alternativo presente in WBC e PTOL
	Given  Il seguente piano terapeutico su PTOL
	| ATC     | FormaFarmaceutica     | DataInizio | Prescrizione                       | Posologia | Frequenza   | Durata | GuidCodiceFiscale                    | CodicePT         |
	| R03DX05 | SOLUZIONE INIETTABILE | 01/07/2017 | 525 mg ogni 4 settimane per 6 mesi | 525 mg    | 4 settimane | 6 mesi | 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | NH6F5J20K2C5TCPD |
	And Il seguente piano terapeutico su WebCare
	| CodiceFiscale    | Minsan    | DataInizioPiano | DataFinePiano | Prescrizione                        |
	| MDGDGI70B12E704B | 036892089 | 01/07/2017      | 31/07/2017    | 1 FIALA OGNI 2 SETTIMANE PER 1 MESE |
	When viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri
	| Minsan    | Confezioni | DataRicetta | CodiceFiscale    |
	| 036892053 | 2          | 13/07/2017  | MDGDGI70B12E704B |
	Then la risposta è la seguente
	| Esito | ConfezioniAutorizzate | ConfezioniResidue | DataInizioPeriodo | DataFinePeriodo | DataInizioPiano | DataFinePiano | KeyError | DescrizioneErrore | CodicePT         |
	| true  | 0                     | 0                 |                   |                 |                 |               | 2        | PT_INESISTENTE    |                  |
	And vengono indicati i seguenti piani terapeutici alternativi
	| DataInizio | DataFine   | Minsan    |
	| 01/07/2017 | 31/07/2017 | 036892089 |

