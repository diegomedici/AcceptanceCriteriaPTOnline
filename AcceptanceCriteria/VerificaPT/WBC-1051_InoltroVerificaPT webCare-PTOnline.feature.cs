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
        "rovato.", SourceFile="VerificaPT\\WBC-1051_InoltroVerificaPT webCare-PTOnline.feature", SourceLine=0)]
    public partial class WBC_1051_InoltroVerificaPTWebCare_PTOnlineFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "WBC-1051_InoltroVerificaPT webCare-PTOnline.feature"
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
        
        [TechTalk.SpecRun.ScenarioAttribute("1. Inoltro Chiamata", SourceLine=24)]
        public virtual void _1_InoltroChiamata()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("1. Inoltro Chiamata", ((string[])(null)));
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
                        "CodiceFiscale",
                        "Minsan",
                        "Data"});
            table5.AddRow(new string[] {
                        "MDGDGI70B12E704B",
                        "036892053",
                        "13/07/2017"});
#line 29
 testRunner.And("su WBC non è presente nessun PT che abbia questi dati", ((string)(null)), table5, "And ");
#line hidden
            TechTalk.SpecFlow.Table table6 = new TechTalk.SpecFlow.Table(new string[] {
                        "Minsan",
                        "Confezioni",
                        "DataRicetta",
                        "CodiceFiscale"});
            table6.AddRow(new string[] {
                        "036892053",
                        "2",
                        "13/07/2017",
                        "MDGDGI70B12E704B"});
#line 32
 testRunner.When("viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri", ((string)(null)), table6, "When ");
#line hidden
            TechTalk.SpecFlow.Table table7 = new TechTalk.SpecFlow.Table(new string[] {
                        "Esito",
                        "ConfezioniAutorizzate",
                        "ConfezioniResidue",
                        "DataInizioPeriodo",
                        "DataFinePeriodo",
                        "DataInizioPiano",
                        "DataFinePiano",
                        "CodicePT",
                        "KeyError",
                        "DescrizioneErrore"});
            table7.AddRow(new string[] {
                        "true",
                        "2",
                        "2",
                        "01/07/2017",
                        "25/08/2017",
                        "01/07/2017",
                        "31/12/2017",
                        "NH6F5J20K2C5TCPD",
                        "",
                        ""});
#line 35
 testRunner.Then("la risposta è la seguente", ((string)(null)), table7, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [TechTalk.SpecRun.ScenarioAttribute("2. PT presente in WBC e PTOL", SourceLine=38)]
        public virtual void _2_PTPresenteInWBCEPTOL()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("2. PT presente in WBC e PTOL", ((string[])(null)));
#line 39
this.ScenarioSetup(scenarioInfo);
#line 6
this.FeatureBackground();
#line hidden
            TechTalk.SpecFlow.Table table8 = new TechTalk.SpecFlow.Table(new string[] {
                        "ATC",
                        "FormaFarmaceutica",
                        "DataInizio",
                        "Prescrizione",
                        "Posologia",
                        "Frequenza",
                        "Durata",
                        "GuidCodiceFiscale",
                        "CodicePT"});
            table8.AddRow(new string[] {
                        "R03DX05",
                        "SOLUZIONE INIETTABILE",
                        "01/07/2017",
                        "525 mg ogni 4 settimane per 6 mesi",
                        "525 mg",
                        "4 settimane",
                        "6 mesi",
                        "7a2c3353-12b6-47b1-b566-3f2779f6fc9d",
                        "NH6F5J20K2C5TCPD"});
#line 40
 testRunner.Given("Il seguente piano terapeutico su PTOL", ((string)(null)), table8, "Given ");
#line hidden
            TechTalk.SpecFlow.Table table9 = new TechTalk.SpecFlow.Table(new string[] {
                        "CodiceFiscale",
                        "Minsan",
                        "DataInizioPiano",
                        "DataFinePiano",
                        "Prescrizione"});
            table9.AddRow(new string[] {
                        "MDGDGI70B12E704B",
                        "036892053",
                        "01/07/2017",
                        "31/07/2017",
                        "1 FIALA OGNI 2 SETTIMANE PER 1 MESE"});
#line 43
 testRunner.And("Il seguente piano terapeutico su WebCare", ((string)(null)), table9, "And ");
#line hidden
            TechTalk.SpecFlow.Table table10 = new TechTalk.SpecFlow.Table(new string[] {
                        "Minsan",
                        "Confezioni",
                        "DataRicetta",
                        "CodiceFiscale"});
            table10.AddRow(new string[] {
                        "036892053",
                        "2",
                        "13/07/2017",
                        "MDGDGI70B12E704B"});
#line 46
 testRunner.When("viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri", ((string)(null)), table10, "When ");
#line hidden
            TechTalk.SpecFlow.Table table11 = new TechTalk.SpecFlow.Table(new string[] {
                        "Esito",
                        "ConfezioniAutorizzate",
                        "ConfezioniResidue",
                        "DataInizioPeriodo",
                        "DataFinePeriodo",
                        "DataInizioPiano",
                        "DataFinePiano",
                        "CodicePT",
                        "KeyError",
                        "DescrizioneErrore"});
            table11.AddRow(new string[] {
                        "true",
                        "2",
                        "2",
                        "01/07/2017",
                        "31/07/2017",
                        "01/07/2017",
                        "31/07/2017",
                        "",
                        "",
                        ""});
#line 49
 testRunner.Then("la risposta è la seguente", ((string)(null)), table11, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [TechTalk.SpecRun.ScenarioAttribute("3. PT non presente né in WBC né in PTOL", SourceLine=53)]
        public virtual void _3_PTNonPresenteNeInWBCNeInPTOL()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("3. PT non presente né in WBC né in PTOL", ((string[])(null)));
#line 54
this.ScenarioSetup(scenarioInfo);
#line 6
this.FeatureBackground();
#line hidden
            TechTalk.SpecFlow.Table table12 = new TechTalk.SpecFlow.Table(new string[] {
                        "ATC",
                        "FormaFarmaceutica",
                        "Data",
                        "",
                        "GuidCodiceFiscale"});
            table12.AddRow(new string[] {
                        "R03DX05",
                        "SOLUZIONE INIETTABILE",
                        "13/07/2017",
                        "",
                        "7a2c3353-12b6-47b1-b566-3f2779f6fc9d"});
#line 55
 testRunner.Given("Nessun piano terapeutico su PTOL per che abbia questi dati", ((string)(null)), table12, "Given ");
#line hidden
            TechTalk.SpecFlow.Table table13 = new TechTalk.SpecFlow.Table(new string[] {
                        "CodiceFiscale",
                        "Minsan",
                        "Data"});
            table13.AddRow(new string[] {
                        "MDGDGI70B12E704B",
                        "036892053",
                        "13/07/2017"});
#line 58
 testRunner.And("su WBC non è presente nessun PT che abbia questi dati", ((string)(null)), table13, "And ");
#line hidden
            TechTalk.SpecFlow.Table table14 = new TechTalk.SpecFlow.Table(new string[] {
                        "Minsan",
                        "Confezioni",
                        "DataRicetta",
                        "CodiceFiscale"});
            table14.AddRow(new string[] {
                        "036892053",
                        "2",
                        "13/07/2017",
                        "MDGDGI70B12E704B"});
#line 61
 testRunner.When("viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri", ((string)(null)), table14, "When ");
#line hidden
            TechTalk.SpecFlow.Table table15 = new TechTalk.SpecFlow.Table(new string[] {
                        "Esito",
                        "ConfezioniAutorizzate",
                        "ConfezioniResidue",
                        "DataInizioPeriodo",
                        "DataFinePeriodo",
                        "DataInizioPiano",
                        "DataFinePiano",
                        "KeyError",
                        "DescrizioneErrore",
                        "CodicePT"});
            table15.AddRow(new string[] {
                        "true",
                        "0",
                        "0",
                        "",
                        "",
                        "",
                        "",
                        "2",
                        "PT_INESISTENTE",
                        ""});
#line 64
 testRunner.Then("la risposta è la seguente", ((string)(null)), table15, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [TechTalk.SpecRun.ScenarioAttribute("4. PT scaduto su WBC e presente PTOL", SourceLine=67)]
        public virtual void _4_PTScadutoSuWBCEPresentePTOL()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("4. PT scaduto su WBC e presente PTOL", ((string[])(null)));
#line 68
this.ScenarioSetup(scenarioInfo);
#line 6
this.FeatureBackground();
#line hidden
            TechTalk.SpecFlow.Table table16 = new TechTalk.SpecFlow.Table(new string[] {
                        "ATC",
                        "FormaFarmaceutica",
                        "DataInizio",
                        "Prescrizione",
                        "Posologia",
                        "Frequenza",
                        "Durata",
                        "GuidCodiceFiscale",
                        "CodicePT"});
            table16.AddRow(new string[] {
                        "R03DX05",
                        "SOLUZIONE INIETTABILE",
                        "01/07/2017",
                        "525 mg ogni 4 settimane per 6 mesi",
                        "525 mg",
                        "4 settimane",
                        "6 mesi",
                        "7a2c3353-12b6-47b1-b566-3f2779f6fc9d",
                        "NH6F5J20K2C5TCPD"});
#line 69
 testRunner.Given("Il seguente piano terapeutico su PTOL", ((string)(null)), table16, "Given ");
#line hidden
            TechTalk.SpecFlow.Table table17 = new TechTalk.SpecFlow.Table(new string[] {
                        "CodiceFiscale",
                        "Minsan",
                        "DataInizioPiano",
                        "DataFinePiano",
                        "Prescrizione"});
            table17.AddRow(new string[] {
                        "MDGDGI70B12E704B",
                        "036892053",
                        "01/06/2017",
                        "30/06/2017",
                        "1 FIALA OGNI 2 SETTIMANE PER 1 MESE"});
#line 72
 testRunner.And("Il seguente piano terapeutico su WebCare", ((string)(null)), table17, "And ");
#line hidden
            TechTalk.SpecFlow.Table table18 = new TechTalk.SpecFlow.Table(new string[] {
                        "Minsan",
                        "Confezioni",
                        "DataRicetta",
                        "CodiceFiscale"});
            table18.AddRow(new string[] {
                        "036892053",
                        "2",
                        "13/07/2017",
                        "MDGDGI70B12E704B"});
#line 75
 testRunner.When("viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri", ((string)(null)), table18, "When ");
#line hidden
            TechTalk.SpecFlow.Table table19 = new TechTalk.SpecFlow.Table(new string[] {
                        "Esito",
                        "ConfezioniAutorizzate",
                        "ConfezioniResidue",
                        "DataInizioPeriodo",
                        "DataFinePeriodo",
                        "DataInizioPiano",
                        "DataFinePiano",
                        "CodicePT",
                        "KeyError",
                        "DescrizioneErrore"});
            table19.AddRow(new string[] {
                        "true",
                        "2",
                        "2",
                        "01/07/2017",
                        "25/08/2017",
                        "01/07/2017",
                        "31/12/2017",
                        "NH6F5J20K2C5TCPD",
                        "",
                        ""});
#line 78
 testRunner.Then("la risposta è la seguente", ((string)(null)), table19, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [TechTalk.SpecRun.ScenarioAttribute("5. PT futuro su WBC e presente PTOL", SourceLine=82)]
        public virtual void _5_PTFuturoSuWBCEPresentePTOL()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("5. PT futuro su WBC e presente PTOL", ((string[])(null)));
#line 83
this.ScenarioSetup(scenarioInfo);
#line 6
this.FeatureBackground();
#line hidden
            TechTalk.SpecFlow.Table table20 = new TechTalk.SpecFlow.Table(new string[] {
                        "ATC",
                        "FormaFarmaceutica",
                        "DataInizio",
                        "Prescrizione",
                        "Posologia",
                        "Frequenza",
                        "Durata",
                        "GuidCodiceFiscale",
                        "CodicePT"});
            table20.AddRow(new string[] {
                        "R03DX05",
                        "SOLUZIONE INIETTABILE",
                        "01/07/2017",
                        "525 mg ogni 4 settimane per 6 mesi",
                        "525 mg",
                        "4 settimane",
                        "6 mesi",
                        "7a2c3353-12b6-47b1-b566-3f2779f6fc9d",
                        "NH6F5J20K2C5TCPD"});
#line 84
 testRunner.Given("Il seguente piano terapeutico su PTOL", ((string)(null)), table20, "Given ");
#line hidden
            TechTalk.SpecFlow.Table table21 = new TechTalk.SpecFlow.Table(new string[] {
                        "CodiceFiscale",
                        "Minsan",
                        "DataInizioPiano",
                        "DataFinePiano",
                        "Prescrizione"});
            table21.AddRow(new string[] {
                        "MDGDGI70B12E704B",
                        "036892053",
                        "01/08/2017",
                        "31/08/2017",
                        "1 FIALA OGNI 2 SETTIMANE PER 1 MESE"});
#line 87
 testRunner.And("Il seguente piano terapeutico su WebCare", ((string)(null)), table21, "And ");
#line hidden
            TechTalk.SpecFlow.Table table22 = new TechTalk.SpecFlow.Table(new string[] {
                        "Minsan",
                        "Confezioni",
                        "DataRicetta",
                        "CodiceFiscale"});
            table22.AddRow(new string[] {
                        "036892053",
                        "2",
                        "13/07/2017",
                        "MDGDGI70B12E704B"});
#line 90
 testRunner.When("viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri", ((string)(null)), table22, "When ");
#line hidden
            TechTalk.SpecFlow.Table table23 = new TechTalk.SpecFlow.Table(new string[] {
                        "Esito",
                        "ConfezioniAutorizzate",
                        "ConfezioniResidue",
                        "DataInizioPeriodo",
                        "DataFinePeriodo",
                        "DataInizioPiano",
                        "DataFinePiano",
                        "CodicePT",
                        "KeyError",
                        "DescrizioneErrore"});
            table23.AddRow(new string[] {
                        "true",
                        "2",
                        "2",
                        "01/07/2017",
                        "25/08/2017",
                        "01/07/2017",
                        "31/12/2017",
                        "NH6F5J20K2C5TCPD",
                        "",
                        ""});
#line 93
 testRunner.Then("la risposta è la seguente", ((string)(null)), table23, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [TechTalk.SpecRun.ScenarioAttribute("6. GUID Codice Fiscale non presente su WBC", SourceLine=98)]
        public virtual void _6_GUIDCodiceFiscaleNonPresenteSuWBC()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("6. GUID Codice Fiscale non presente su WBC", ((string[])(null)));
#line 99
this.ScenarioSetup(scenarioInfo);
#line 6
this.FeatureBackground();
#line hidden
            TechTalk.SpecFlow.Table table24 = new TechTalk.SpecFlow.Table(new string[] {
                        "ATC",
                        "FormaFarmaceutica",
                        "DataInizio",
                        "Prescrizione",
                        "Posologia",
                        "Frequenza",
                        "Durata",
                        "GuidCodiceFiscale",
                        "CodicePT"});
            table24.AddRow(new string[] {
                        "R03DX05",
                        "SOLUZIONE INIETTABILE",
                        "01/07/2017",
                        "525 mg ogni 4 settimane per 6 mesi",
                        "525 mg",
                        "4 settimane",
                        "6 mesi",
                        "7a2c3353-12b6-47b1-b566-3f2779f6fc9d",
                        "NH6F5J20K2C5TCPD"});
#line 100
 testRunner.Given("Il seguente piano terapeutico su PTOL", ((string)(null)), table24, "Given ");
#line hidden
            TechTalk.SpecFlow.Table table25 = new TechTalk.SpecFlow.Table(new string[] {
                        "CodiceFiscale",
                        "Guid"});
            table25.AddRow(new string[] {
                        "MDGDGI70B12E704B",
                        "null"});
#line 103
 testRunner.And("il codice fiscale ha il seguente guid", ((string)(null)), table25, "And ");
#line hidden
            TechTalk.SpecFlow.Table table26 = new TechTalk.SpecFlow.Table(new string[] {
                        "CodiceFiscale",
                        "Minsan",
                        "Data"});
            table26.AddRow(new string[] {
                        "MDGDGI70B12E704B",
                        "036892053",
                        "13/07/2017"});
#line 106
 testRunner.And("su WBC non è presente nessun PT che abbia questi dati", ((string)(null)), table26, "And ");
#line hidden
            TechTalk.SpecFlow.Table table27 = new TechTalk.SpecFlow.Table(new string[] {
                        "Minsan",
                        "Confezioni",
                        "DataRicetta",
                        "CodiceFiscale"});
            table27.AddRow(new string[] {
                        "036892053",
                        "2",
                        "13/07/2017",
                        "MDGDGI70B12E704B"});
#line 109
 testRunner.When("viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri", ((string)(null)), table27, "When ");
#line hidden
            TechTalk.SpecFlow.Table table28 = new TechTalk.SpecFlow.Table(new string[] {
                        "Esito",
                        "ConfezioniAutorizzate",
                        "ConfezioniResidue",
                        "DataInizioPeriodo",
                        "DataFinePeriodo",
                        "DataInizioPiano",
                        "DataFinePiano",
                        "KeyError",
                        "DescrizioneErrore",
                        "CodicePT"});
            table28.AddRow(new string[] {
                        "true",
                        "0",
                        "0",
                        "",
                        "",
                        "",
                        "",
                        "2",
                        "PT_INESISTENTE",
                        ""});
#line 112
 testRunner.Then("la risposta è la seguente", ((string)(null)), table28, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [TechTalk.SpecRun.ScenarioAttribute("7. PT scaduto su WBC e NON presente PTOL", SourceLine=116)]
        public virtual void _7_PTScadutoSuWBCENONPresentePTOL()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("7. PT scaduto su WBC e NON presente PTOL", ((string[])(null)));
#line 117
this.ScenarioSetup(scenarioInfo);
#line 6
this.FeatureBackground();
#line hidden
            TechTalk.SpecFlow.Table table29 = new TechTalk.SpecFlow.Table(new string[] {
                        "ATC",
                        "FormaFarmaceutica",
                        "Data",
                        "",
                        "GuidCodiceFiscale"});
            table29.AddRow(new string[] {
                        "R03DX05",
                        "SOLUZIONE INIETTABILE",
                        "13/07/2017",
                        "",
                        "7a2c3353-12b6-47b1-b566-3f2779f6fc9d"});
#line 118
 testRunner.Given("Nessun piano terapeutico su PTOL per che abbia questi dati", ((string)(null)), table29, "Given ");
#line hidden
            TechTalk.SpecFlow.Table table30 = new TechTalk.SpecFlow.Table(new string[] {
                        "CodiceFiscale",
                        "Minsan",
                        "DataInizioPiano",
                        "DataFinePiano",
                        "Prescrizione"});
            table30.AddRow(new string[] {
                        "MDGDGI70B12E704B",
                        "036892053",
                        "01/06/2017",
                        "30/06/2017",
                        "1 FIALA OGNI 2 SETTIMANE PER 1 MESE"});
#line 121
 testRunner.And("Il seguente piano terapeutico su WebCare", ((string)(null)), table30, "And ");
#line hidden
            TechTalk.SpecFlow.Table table31 = new TechTalk.SpecFlow.Table(new string[] {
                        "Minsan",
                        "Confezioni",
                        "DataRicetta",
                        "CodiceFiscale"});
            table31.AddRow(new string[] {
                        "036892053",
                        "2",
                        "13/07/2017",
                        "MDGDGI70B12E704B"});
#line 124
 testRunner.When("viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri", ((string)(null)), table31, "When ");
#line hidden
            TechTalk.SpecFlow.Table table32 = new TechTalk.SpecFlow.Table(new string[] {
                        "Esito",
                        "ConfezioniAutorizzate",
                        "ConfezioniResidue",
                        "DataInizioPeriodo",
                        "DataFinePeriodo",
                        "DataInizioPiano",
                        "DataFinePiano",
                        "KeyError",
                        "DescrizioneErrore",
                        "CodicePT"});
            table32.AddRow(new string[] {
                        "true",
                        "0",
                        "0",
                        "",
                        "",
                        "",
                        "",
                        "3",
                        "PT_SCADUTO",
                        ""});
#line 127
 testRunner.Then("la risposta è la seguente", ((string)(null)), table32, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [TechTalk.SpecRun.ScenarioAttribute("8. PT alternativo presente in WBC e PTOL", SourceLine=131)]
        public virtual void _8_PTAlternativoPresenteInWBCEPTOL()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("8. PT alternativo presente in WBC e PTOL", ((string[])(null)));
#line 132
this.ScenarioSetup(scenarioInfo);
#line 6
this.FeatureBackground();
#line hidden
            TechTalk.SpecFlow.Table table33 = new TechTalk.SpecFlow.Table(new string[] {
                        "ATC",
                        "FormaFarmaceutica",
                        "DataInizio",
                        "Prescrizione",
                        "Posologia",
                        "Frequenza",
                        "Durata",
                        "GuidCodiceFiscale",
                        "CodicePT"});
            table33.AddRow(new string[] {
                        "R03DX05",
                        "SOLUZIONE INIETTABILE",
                        "01/07/2017",
                        "525 mg ogni 4 settimane per 6 mesi",
                        "525 mg",
                        "4 settimane",
                        "6 mesi",
                        "7a2c3353-12b6-47b1-b566-3f2779f6fc9d",
                        "NH6F5J20K2C5TCPD"});
#line 133
 testRunner.Given("Il seguente piano terapeutico su PTOL", ((string)(null)), table33, "Given ");
#line hidden
            TechTalk.SpecFlow.Table table34 = new TechTalk.SpecFlow.Table(new string[] {
                        "CodiceFiscale",
                        "Minsan",
                        "DataInizioPiano",
                        "DataFinePiano",
                        "Prescrizione"});
            table34.AddRow(new string[] {
                        "MDGDGI70B12E704B",
                        "036892089",
                        "01/07/2017",
                        "31/07/2017",
                        "1 FIALA OGNI 2 SETTIMANE PER 1 MESE"});
#line 136
 testRunner.And("Il seguente piano terapeutico su WebCare", ((string)(null)), table34, "And ");
#line hidden
            TechTalk.SpecFlow.Table table35 = new TechTalk.SpecFlow.Table(new string[] {
                        "Minsan",
                        "Confezioni",
                        "DataRicetta",
                        "CodiceFiscale"});
            table35.AddRow(new string[] {
                        "036892053",
                        "2",
                        "13/07/2017",
                        "MDGDGI70B12E704B"});
#line 139
 testRunner.When("viene effettuata la chiamata al servizio VerificaPT con i seguenti parametri", ((string)(null)), table35, "When ");
#line hidden
            TechTalk.SpecFlow.Table table36 = new TechTalk.SpecFlow.Table(new string[] {
                        "Esito",
                        "ConfezioniAutorizzate",
                        "ConfezioniResidue",
                        "DataInizioPeriodo",
                        "DataFinePeriodo",
                        "DataInizioPiano",
                        "DataFinePiano",
                        "KeyError",
                        "DescrizioneErrore",
                        "CodicePT"});
            table36.AddRow(new string[] {
                        "true",
                        "0",
                        "0",
                        "",
                        "",
                        "",
                        "",
                        "2",
                        "PT_INESISTENTE",
                        ""});
#line 142
 testRunner.Then("la risposta è la seguente", ((string)(null)), table36, "Then ");
#line hidden
            TechTalk.SpecFlow.Table table37 = new TechTalk.SpecFlow.Table(new string[] {
                        "DataInizio",
                        "DataFine",
                        "Minsan"});
            table37.AddRow(new string[] {
                        "01/07/2017",
                        "31/07/2017",
                        "036892089"});
#line 145
 testRunner.And("vengono indicati i seguenti piani terapeutici alternativi", ((string)(null)), table37, "And ");
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
