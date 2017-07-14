using System;
using TechTalk.SpecFlow;

namespace AcceptanceCriteria
{
    [Binding]
    public class VerificaPTOmalizumabSteps
    {
        [Given(@"i seguenti dati dalla BD")]
        public void GivenISeguentiDatiDallaBD(Table table)
        {
            ScenarioContext.Current.Pending();
        }
        
        [Given(@"le seguenti combinazioni di unità posologiche di somministrazioni dell'OMALIZIMAB")]
        public void GivenLeSeguentiCombinazioniDiUnitaPosologicheDiSomministrazioniDellOMALIZIMAB(Table table)
        {
            ScenarioContext.Current.Pending();
        }
        
        [Given(@"il codice fiscale ha il seguente guid")]
        public void GivenIlCodiceFiscaleHaIlSeguenteGuid(Table table)
        {
            ScenarioContext.Current.Pending();
        }
        
        [Given(@"Il seguente piano terapeutico")]
        public void GivenIlSeguentePianoTerapeutico(Table table)
        {
            ScenarioContext.Current.Pending();
        }
        
        [When(@"viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri")]
        public void WhenVieneEffettuataLaChiamataAlServizioVerificaPTConISeguentiParametri(Table table)
        {
            ScenarioContext.Current.Pending();
        }
        
        [Then(@"la risposta è la seguente")]
        public void ThenLaRispostaELaSeguente(Table table)
        {
            ScenarioContext.Current.Pending();
        }
    }
}
