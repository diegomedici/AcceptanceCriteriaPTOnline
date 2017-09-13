Feature: WBC-994_Anonimizzazione_Dati_Paziente
	IN ORDER TO sapere a chi sto prescrivendo 
	AS Medico Prescrittore
	I WANT TO poter visualizzare i dati del paziente sulla pagina del PT

@mytag
#Scenario: Restituzione Scheda Assistito passando il Codice Fiscale
#	Given la seguente scheda assistito su WebCare
#	| GUIDAssistito                        | Codice Fiscale   | Nome  | Cognome | Data Nascita | Luogo Nascita | Sesso | Indirizzo        | Comune | Cap   | Provincia | Telefono    | Regione   | ASL         |
#	| 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | MDCDGI70B12E704B | Diego | Medici  | 12-02-1970   | Lovere (BG)   | M     | Via Presolana, 6 | Rogno  | 24060 | BG        | 555-345-665 | Lombardia | ATS Bergamo |
#	When da PTOnline chiamo il servizio di interrogazione degli assistiti passando il CodiceFiscale="MDCDGI70B12E704B"
#	Then il servizio di interrogazione degli assistiti restituisce 
#	| GUIDAssistito                        | Codice Fiscale   | Nome  | Cognome | Data Nascita | Luogo Nascita | Sesso | Indirizzo        | Comune | Cap   | Provincia | Telefono    | Regione   | ASL         |
#	| 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | MDCDGI70B12E704B | Diego | Medici  | 12-02-1970   | Lovere (BG)   | M     | Via Presolana, 6 | Rogno  | 24060 | BG        | 555-345-665 | Lombardia | ATS Bergamo |

Scenario: Restituzione Scheda Assistito passando il GuidAssistito
	Given la seguente scheda assistito su WebCare
	| GUIDAssistito                        | Codice Fiscale   | Nome  | Cognome | Data Nascita | Luogo Nascita | Sesso | Indirizzo        | Comune | Cap   | Provincia | Telefono    | Regione   | ASL         |
	| 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | MDCDGI70B12E704B | Diego | Medici  | 12-02-1970   | Lovere (BG)   | M     | Via Presolana, 6 | Rogno  | 24060 | BG        | 555-345-665 | Lombardia | ATS Bergamo |
	When da PTOnline chiamo il servizio di interrogazione degli assistiti passando il GuidAssistito="7a2c3353-12b6-47b1-b566-3f2779f6fc9d"
	Then il servizio di interrogazione degli assistiti restituisce 
	| GUIDAssistito                        | Codice Fiscale   | Nome  | Cognome | Data Nascita | Luogo Nascita | Sesso | Indirizzo        | Comune | Cap   | Provincia | Telefono    | Regione   | ASL         |
	| 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | MDCDGI70B12E704B | Diego | Medici  | 12-02-1970   | Lovere (BG)   | M     | Via Presolana, 6 | Rogno  | 24060 | BG        | 555-345-665 | Lombardia | ATS Bergamo |
#
#Scenario: Restituzione Scheda Assistito passando il Codice Fiscale e creazione GuidAssistito
#	Given la seguente scheda assistito su WebCare
#	| GUIDAssistito | Codice Fiscale   | Nome  | Cognome | Data Nascita | Luogo Nascita | Sesso | Indirizzo        | Comune | Cap   | Provincia | Telefono    | Regione   | ASL         |
#	| null          | MDCDGI70B12E704B | Diego | Medici  | 12-02-1970   | Lovere (BG)   | M     | Via Presolana, 6 | Rogno  | 24060 | BG        | 555-345-665 | Lombardia | ATS Bergamo |
#	When da PTOnline chiamo il servizio di interrogazione degli assistiti passando il CodiceFiscale="MDCDGI70B12E704B"
#	Then WebCare crea il nuovo GuidAssistito="7a2c3353-12b6-47b1-b566-3f2779f6fc9d"
#	And lo associa all'assistito "MDCDGI70B12E704B"
#	And salva la seguente scheda assistito
#	| GUIDAssistito                        | Codice Fiscale   | Nome  | Cognome | Data Nascita | Luogo Nascita | Sesso | Indirizzo        | Comune | Cap   | Provincia | Telefono    | Regione   | ASL         |
#	| 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | MDCDGI70B12E704B | Diego | Medici  | 12-02-1970   | Lovere (BG)   | M     | Via Presolana, 6 | Rogno  | 24060 | BG        | 555-345-665 | Lombardia | ATS Bergamo |
#	And il servizio di interrogazione degli assistiti restituisce 
#	| GUIDAssistito                        | Codice Fiscale   | Nome  | Cognome | Data Nascita | Luogo Nascita | Sesso | Indirizzo        | Comune | Cap   | Provincia | Telefono    | Regione   | ASL         |
#	| 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | MDCDGI70B12E704B | Diego | Medici  | 12-02-1970   | Lovere (BG)   | M     | Via Presolana, 6 | Rogno  | 24060 | BG        | 555-345-665 | Lombardia | ATS Bergamo |
#
#Scenario: CodiceFiscale Assistito non presente
#	Given non è presente sulla scheda assistito su WebCare il CodiceFiscale="MDCDGI70B12E704B"
#	When da PTOnline chiamo il servizio di interrogazione degli assistiti passando il CodiceFiscale="MDCDGI70B12E704B"
#	Then il servizio di interrogazione degli assistiti restituisce l'errore "Assistito non Censito"

Scenario: GuidAssistito Assistito non presente
	Given non è presente sulla scheda assistito su WebCare il GUIDAssistito="7a2c3353-12b6-47b1-b566-3f2779f6fc9d"
	When da PTOnline chiamo il servizio di interrogazione degli assistiti passando il GuidAssistito="7a2c3353-12b6-47b1-b566-3f2779f6fc9d"
	Then il servizio di interrogazione degli assistiti restituisce l'errore "Assistito non Censito"

	
Scenario: Restituzione Scheda Assistito passando il GuidAssistito
	Given la seguente scheda assistito su WebCare
	| GUIDAssistito                        | Codice Fiscale   | Nome  | Cognome | Data Nascita | Luogo Nascita | Sesso | Indirizzo        | Comune | Cap   | Provincia | Telefono    | Regione   | ASL         |
	| 7a2c3353-12b6-47b1-b566-3f2779f6fc9d | MDCDGI70B12E704B | Diego | Medici  | 12-02-1970   | Lovere (BG)   | M     | Via Presolana, 6 | Rogno  | 24060 | BG        | 555-345-665 | Lombardia | ATS Bergamo |
	When da PTOnline visualizzo la pagina di inserimento PT relativa all'assitito 7a2c3353-12b6-47b1-b566-3f2779f6fc9d
	Then nel riquadro dei dati del paziente vedo i seguenti dati
	| Codice Fiscale   | Nome  | Cognome | Data Nascita | Luogo Nascita | Sesso | ASL         |
	| MDCDGI70B12E704B | Diego | Medici  | 12-02-1970   | Lovere (BG)   | M     | ATS Bergamo |
