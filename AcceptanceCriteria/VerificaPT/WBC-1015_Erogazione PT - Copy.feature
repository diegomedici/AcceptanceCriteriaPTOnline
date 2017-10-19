Feature: WBC-1015 - Erogazione PT
	*IN ORDER TO* vedere quali erogazioni di prodotto sono state effettuate.
	*AS* Medico Prescrittore
	*I WANT TO* che le erogazioni di prodotti con PT siano presenti sul nuovo PTOnline.


Background: 
	Given i seguenti dati dalla BD 
	| Minsan    | Descrizione       | ATC     | FormaFarmaceutica     | UnitàPosologiche | Grammatura |
	| 036892053 | XOLAIR 1SIR 75MG  | R03DX05 | SOLUZIONE INIETTABILE | 1                | 75 mg      |
	| 036892089 | XOLAIR 1SIR 150MG | R03DX05 | SOLUZIONE INIETTABILE | 1                | 150 mg     |

Scenario: Descrizione Servizio
	Given la seguente erogazione di prodotti
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           |
	When la ricevo
	Then memorizzo questi dati nel PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           |

Scenario: Visualizzazione Erogazioni
	Given le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           |
	When premo il pulsante "Erogazioni" sul PT = NH6F5J20K2C5TCPD
	Then visualizzo i seguenti dati (vedi mockup)
	| DataRicetta | DataErogazione | Confezioni | Minsan    | Descrizione       | NumeroRicetta   |
	| 2017-09-06  | 2017-09-07     | 2          | 036892053 | XOLAIR 1SIR 75MG  | 120171000000001 |
	| 2017-09-10  | 2017-09-10     | 3          | 036892089 | XOLAIR 1SIR 150MG | 120172000000002 |

Scenario: Descrizione Servizio senza i dati facoltativi. 
	Given la seguente erogazione di prodotti
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     |               |                |
	When la ricevo
	Then memorizzo questi dati nel PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     |               |                |

Scenario: Visualizzazione Erogazioni minsan non trovato
	Given le seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           |
	| NH6F5J20K2C5TCPD | 3          | 111111111 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           |
	When premo il pulsante "Erogazioni" sul PT = NH6F5J20K2C5TCPD
	Then visualizzo i seguenti dati (vedi mockup)
	| DataRicetta | DataErogazione | Confezioni | Minsan    | Descrizione      | NumeroRicetta   |
	| 2017-09-06  | 2017-09-07     | 2          | 036892053 | XOLAIR 1SIR 75MG | 120171000000001 |
	| 2017-09-10  | 2017-09-10     | 3          | 111111111 |                  | 120172000000002 |
