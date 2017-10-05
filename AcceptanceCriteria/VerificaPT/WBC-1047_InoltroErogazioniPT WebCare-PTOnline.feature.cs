﻿// ------------------------------------------------------------------------------
//  <auto-generated>
//      This code was generated by SpecFlow (http://www.specflow.org/).
//      SpecFlow Version:2.2.0.0
//      SpecFlow Generator Version:2.2.0.0
// 
//      Changes to this file may cause incorrect behavior and will be lost if
//      the code is regenerated.
//  </auto-generated>
// ------------------------------------------------------------------------------
#region Designer generated code
#pragma warning disable
namespace AcceptanceCriteria.VerificaPT
{
    using TechTalk.SpecFlow;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "2.2.0.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [TechTalk.SpecRun.FeatureAttribute("WBC-1051_InoltroVerificaPT webCare-PTOnline", Description="\tIN ORDER TO inoltrare le verifiche PT nel periodo di transizione WebCare-PTOnlin" +
        "e\r\n\tAS studiofarma\r\n\tI WANT TO che WBC inoltri le richieste di verifica di OMALI" +
        "ZUMAB nel caso in cui su WBC non viene trovato il PT e restituisca il CodicePT t" +
        "rovato.", SourceFile="VerificaPT\\WBC-1047_InoltroErogazioniPT WebCare-PTOnline.feature", SourceLine=0)]
    public partial class WBC_1051_InoltroVerificaPTWebCare_PTOnlineFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "WBC-1047_InoltroErogazioniPT WebCare-PTOnline.feature"
#line hidden
        
        [TechTalk.SpecRun.FeatureInitialize()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "WBC-1051_InoltroVerificaPT webCare-PTOnline", "\tIN ORDER TO inoltrare le verifiche PT nel periodo di transizione WebCare-PTOnlin" +
                    "e\r\n\tAS studiofarma\r\n\tI WANT TO che WBC inoltri le richieste di verifica di OMALI" +
                    "ZUMAB nel caso in cui su WBC non viene trovato il PT e restituisca il CodicePT t" +
                    "rovato.", ProgrammingLanguage.CSharp, ((string[])(null)));
            testRunner.OnFeatureStart(featureInfo);
        }
        
        [TechTalk.SpecRun.FeatureCleanup()]
        public virtual void FeatureTearDown()
        {
            testRunner.OnFeatureEnd();
            testRunner = null;
        }
        
        public virtual void TestInitialize()
        {
        }
        
        [TechTalk.SpecRun.ScenarioCleanup()]
        public virtual void ScenarioTearDown()
        {
            testRunner.OnScenarioEnd();
        }
        
        public virtual void ScenarioSetup(TechTalk.SpecFlow.ScenarioInfo scenarioInfo)
        {
            testRunner.OnScenarioStart(scenarioInfo);
        }
        
        public virtual void ScenarioCleanup()
        {
            testRunner.CollectScenarioErrors();
        }
        
        public virtual void FeatureBackground()
        {
#line 6
#line hidden
            TechTalk.SpecFlow.Table table1 = new TechTalk.SpecFlow.Table(new string[] {
                        "Minsan",
                        "Descrizione",
                        "ATC",
                        "FormaFarmaceutica",
                        "UnitàPosologiche",
                        "Grammatura"});
            table1.AddRow(new string[] {
                        "036892053",
                        "XOLAIR 1SIR 75MG",
                        "R03DX05",
                        "SOLUZIONE INIETTABILE",
                        "1",
                        "75 mg"});
            table1.AddRow(new string[] {
                        "036892089",
                        "XOLAIR 1SIR 150MG",
                        "R03DX05",
                        "SOLUZIONE INIETTABILE",
                        "1",
                        "150 mg"});
#line 7
 testRunner.Given("i seguenti dati dalla BD", ((string)(null)), table1, "Given ");
#line hidden
            TechTalk.SpecFlow.Table table2 = new TechTalk.SpecFlow.Table(new string[] {
                        "Posologia",
                        "Grammatura 75mg",
                        "Grammatura 150mg"});
            table2.AddRow(new string[] {
                        "75",
                        "1",
                        "0"});
            table2.AddRow(new string[] {
                        "150",
                        "0",
                        "1"});
            table2.AddRow(new string[] {
                        "225",
                        "1",
                        "1"});
            table2.AddRow(new string[] {
                        "300",
                        "0",
                        "2"});
            table2.AddRow(new string[] {
                        "375",
                        "1",
                        "2"});
            table2.AddRow(new string[] {
                        "450",
                        "0",
                        "3"});
            table2.AddRow(new string[] {
                        "525",
                        "1",
                        "3"});
            table2.AddRow(new string[] {
                        "600",
                        "0",
                        "4"});
#line 11
 testRunner.And("le seguenti combinazioni di unità posologiche di somministrazioni dell\'OMALIZIMAB" +
                    "", ((string)(null)), table2, "And ");
#line hidden
            TechTalk.SpecFlow.Table table3 = new TechTalk.SpecFlow.Table(new string[] {
                        "CodiceFiscale",
                        "Guid"});
            table3.AddRow(new string[] {
                        "MDGDGI70B12E704B",
                        "7a2c3353-12b6-47b1-b566-3f2779f6fc9d"});
#line 21
 testRunner.And("il codice fiscale ha il seguente guid", ((string)(null)), table3, "And ");
#line hidden
        }
        
        [TechTalk.SpecRun.ScenarioAttribute("1. Inoltro chiamata a PTOL", SourceLine=24)]
        public virtual void _1_InoltroChiamataAPTOL()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("1. Inoltro chiamata a PTOL", ((string[])(null)));
#line 25
this.ScenarioSetup(scenarioInfo);
#line 6
this.FeatureBackground();
#line hidden
            TechTalk.SpecFlow.Table table4 = new TechTalk.SpecFlow.Table(new string[] {
                        "ATC",
                        "FormaFarmaceutica",
                        "DataInizio",
                        "Prescrizione",
                        "Posologia",
                        "Frequenza",
                        "Durata",
                        "GuidCodiceFiscale",
                        "CodicePT"});
            table4.AddRow(new string[] {
                        "R03DX05",
                        "SOLUZIONE INIETTABILE",
                        "01/07/2017",
                        "525 mg ogni 4 settimane per 6 mesi",
                        "525 mg",
                        "4 settimane",
                        "6 mesi",
                        "7a2c3353-12b6-47b1-b566-3f2779f6fc9d",
                        "NH6F5J20K2C5TCPD"});
#line 26
 testRunner.Given("Il seguente piano terapeutico su PTOL", ((string)(null)), table4, "Given ");
#line hidden
            TechTalk.SpecFlow.Table table5 = new TechTalk.SpecFlow.Table(new string[] {
                        "CodicePT",
                        "Confezioni",
                        "Minsan",
                        "DataRicetta",
                        "DataErogazione",
                        "NumeroRicetta",
                        "CodiceFarmacia",
                        "CodiceFiscale"});
            table5.AddRow(new string[] {
                        "NH6F5J20K2C5TCPD",
                        "2",
                        "036892053",
                        "2017-09-06",
                        "2017-09-07",
                        "120171000000001",
                        "1234",
                        "MDCDGI70B12E704B"});
#line 29
 testRunner.When("viene effettuata seguente erogazione di prodotti", ((string)(null)), table5, "When ");
#line hidden
            TechTalk.SpecFlow.Table table6 = new TechTalk.SpecFlow.Table(new string[] {
                        "CodicePT",
                        "Confezioni",
                        "Minsan",
                        "DataRicetta",
                        "DataErogazione",
                        "NumeroRicetta",
                        "CodiceFarmacia"});
            table6.AddRow(new string[] {
                        "NH6F5J20K2C5TCPD",
                        "2",
                        "036892053",
                        "2017-09-06",
                        "2017-09-07",
                        "120171000000001",
                        "1234"});
#line 32
 testRunner.Then("trasmetto questi dati al PTOL", ((string)(null)), table6, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [TechTalk.SpecRun.ScenarioAttribute("2. Memorizzazione movimento su WBC", SourceLine=36)]
        public virtual void _2_MemorizzazioneMovimentoSuWBC()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("2. Memorizzazione movimento su WBC", ((string[])(null)));
#line 37
this.ScenarioSetup(scenarioInfo);
#line 6
this.FeatureBackground();
#line hidden
            TechTalk.SpecFlow.Table table7 = new TechTalk.SpecFlow.Table(new string[] {
                        "ATC",
                        "FormaFarmaceutica",
                        "DataInizio",
                        "Prescrizione",
                        "Posologia",
                        "Frequenza",
                        "Durata",
                        "GuidCodiceFiscale",
                        "CodicePT"});
            table7.AddRow(new string[] {
                        "R03DX05",
                        "SOLUZIONE INIETTABILE",
                        "01/07/2017",
                        "525 mg ogni 4 settimane per 6 mesi",
                        "525 mg",
                        "4 settimane",
                        "6 mesi",
                        "7a2c3353-12b6-47b1-b566-3f2779f6fc9d",
                        "NH6F5J20K2C5TCPD"});
#line 38
 testRunner.Given("Il seguente piano terapeutico su PTOL", ((string)(null)), table7, "Given ");
#line hidden
            TechTalk.SpecFlow.Table table8 = new TechTalk.SpecFlow.Table(new string[] {
                        "CodiceFiscale",
                        "Minsan",
                        "DataInizioPiano",
                        "DataFinePiano",
                        "Prescrizione"});
            table8.AddRow(new string[] {
                        "MDGDGI70B12E704B",
                        "036892053",
                        "01/09/2017",
                        "30/09/2017",
                        "1 FIALA OGNI 2 SETTIMANE PER 1 MESE"});
#line 41
 testRunner.And("Il seguente piano terapeutico su WebCare", ((string)(null)), table8, "And ");
#line hidden
            TechTalk.SpecFlow.Table table9 = new TechTalk.SpecFlow.Table(new string[] {
                        "CodicePT",
                        "Confezioni",
                        "Minsan",
                        "DataRicetta",
                        "DataErogazione",
                        "NumeroRicetta",
                        "CodiceFarmacia",
                        "CodiceFiscale"});
            table9.AddRow(new string[] {
                        "",
                        "2",
                        "036892053",
                        "2017-09-06",
                        "2017-09-07",
                        "120171000000001",
                        "1234",
                        "MDCDGI70B12E704B"});
#line 44
 testRunner.When("viene effettuata seguente erogazione di prodotti", ((string)(null)), table9, "When ");
#line hidden
            TechTalk.SpecFlow.Table table10 = new TechTalk.SpecFlow.Table(new string[] {
                        "CodiceFiscale",
                        "Confezioni",
                        "Minsan",
                        "DataRicetta",
                        "DataErogazione",
                        "NumeroRicetta",
                        "CodiceFarmacia"});
            table10.AddRow(new string[] {
                        "MDCDGI70B12E704B",
                        "2",
                        "036892053",
                        "2017-09-06",
                        "2017-09-07",
                        "120171000000001",
                        "1234"});
#line 47
 testRunner.Then("memorizzo questo movimento in WBC", ((string)(null)), table10, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [TechTalk.SpecRun.TestRunCleanup()]
        public virtual void TestRunCleanup()
        {
            TechTalk.SpecFlow.TestRunnerManager.GetTestRunner().OnTestRunEnd();
        }
    }
}
#pragma warning restore
#endregion