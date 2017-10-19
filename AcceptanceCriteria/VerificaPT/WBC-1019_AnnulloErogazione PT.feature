Feature: WBC-1019 - Annullo Erogazione PT
	*IN ORDER TO* rendere nuovamente disponibile la qtà precedentemente erogata
	*AS* Farmacia
	*I WANT TO* annullare un'erogazione precedentemente eseguita

Scenario: 1. Annullo Erogazione
	Given risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | false     |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           | false     |
	When ricevo il seguente annullo di erogazione prodotti
	| CodicePT         | NumeroRicetta   | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 120171000000001 | 1234           |
	Then viene restituito 
	| Esito | Errori.Key | Errori.Value |
	| true  |            |              |
	And risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | true      |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           | false     |

Scenario: 2. Annullo Erogazione con 2 prodotti diversi
	Given risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | false     |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           | false     |
	| NH6F5J20K2C5TCPD | 1          | 036892089 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | false     |
	When ricevo il seguente annullo di erogazione prodotti
	| CodicePT         | NumeroRicetta   | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 120171000000001 | 1234           |
	Then viene restituito 
	| Esito | Errori.Key | Errori.Value |
	| true  |            |              |
	And risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | true      |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           | false     |
	| NH6F5J20K2C5TCPD | 1          | 036892089 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | true      |

Scenario: 3. Annullo senza trovare corrispondenza della ricetta
	Given risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | false     |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           | false     |
	When ricevo il seguente annullo di erogazione prodotti
	| CodicePT         | NumeroRicetta   | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 120171000000012 | 1234           |
	Then viene restituito 
	| Esito | Errori.Key | Errori.Value                 |
	| false | 16         | IMPOSSIBILE_RIPRISTINARE_QTA |
	And risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | false     |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           | false     |

Scenario: 4. Annullo senza trovare corrispondenza della farmacia
	Given risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | false     |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           | false     |
	When ricevo il seguente annullo di erogazione prodotti
	| CodicePT         | NumeroRicetta   | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 120171000000001 | 1235           |
	Then viene restituito 
	| Esito | Errori.Key | Errori.Value                 |
	| false | 16         | IMPOSSIBILE_RIPRISTINARE_QTA |
	And risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | false     |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           | false     |

Scenario: 5. Annullo di erogazione già annullata
	Given risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | true      |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           | false     |
	When ricevo il seguente annullo di erogazione prodotti
	| CodicePT         | NumeroRicetta   | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 120171000000001 | 1234           |
	Then viene restituito 
	| Esito | Errori.Key | Errori.Value                 |
	| false | 16         | IMPOSSIBILE_RIPRISTINARE_QTA |
	And risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | true      |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           | false     |

Scenario: 6. Annullo di erogazione non presente
	Given risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	When ricevo il seguente annullo di erogazione prodotti
	| CodicePT         | NumeroRicetta   | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 120171000000001 | 1234           |
	Then viene restituito 
	| Esito | Errori.Key | Errori.Value                 |
	| false | 16         | IMPOSSIBILE_RIPRISTINARE_QTA |
	And risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |

Scenario: 7. Annullo di erogazione in presenza di erogazione senza riferimento ricetta
	Given risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     |                 |                | false     |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           | false     |
	When ricevo il seguente annullo di erogazione prodotti
	| CodicePT         | NumeroRicetta   | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 120171000000001 | 1234           |
	Then viene restituito 
	| Esito | Errori.Key | Errori.Value                 |
	| false | 16         | IMPOSSIBILE_RIPRISTINARE_QTA |
	And risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     |                 |                | false     |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           | false     |


Scenario: 8. Annullo Erogazione con ricetta presente in 2 farmacie
	Given risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | false     |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           | false     |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7777           | false     |
	| NH6F5J20K2C5TCPD | 1          | 036892089 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | false     |
	When ricevo il seguente annullo di erogazione prodotti
	| CodicePT         | NumeroRicetta   | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 120172000000002 | 7777           |
	Then viene restituito 
	| Esito | Errori.Key | Errori.Value |
	| true  |            |              |
	And risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | false     |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           | false     |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7777           | true      |
	| NH6F5J20K2C5TCPD | 1          | 036892089 | 2017-09-06  | 2017-09-07     | 120171000000001 | 1234           | false     |


Scenario: 9. Annullo di erogazione in presenza di erogazione senza riferimento farmacia. (PARLIAMONE!!!!!)
	Given risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 |                | false     |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           | false     |
	When ricevo il seguente annullo di erogazione prodotti
	| CodicePT         | NumeroRicetta   | CodiceFarmacia |
	| NH6F5J20K2C5TCPD | 120171000000001 | 1234           |
	Then viene restituito 
	| Esito | Errori.Key | Errori.Value                 |
	| false | 16         | IMPOSSIBILE_RIPRISTINARE_QTA |
	And risultano seguenti erogazioni di prodotti associate al PT = NH6F5J20K2C5TCPD
	| CodicePT         | Confezioni | Minsan    | DataRicetta | DataErogazione | NumeroRicetta   | CodiceFarmacia | Annullato |
	| NH6F5J20K2C5TCPD | 2          | 036892053 | 2017-09-06  | 2017-09-07     | 120171000000001 |                | false     |
	| NH6F5J20K2C5TCPD | 3          | 036892089 | 2017-09-10  | 2017-09-10     | 120172000000002 | 7890           | false     |
