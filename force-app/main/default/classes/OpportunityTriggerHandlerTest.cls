@isTest
public class OpportunityTriggerHandlerTest {

    @isTest
    static void testPreventProspectingStage(){

        // Create Account
        Account acc = new Account(Name='Test Account');
        insert acc;

        // Create Opportunity
        Opportunity opp = new Opportunity(
            Name='Test Opportunity',
            StageName='Qualification',
            CloseDate=Date.today().addDays(10),
            AccountId=acc.Id
        );

        insert opp;

        Test.startTest();

        // Try changing stage to Prospecting
        opp.StageName = 'Prospecting';

        try{
            update opp;
            System.assert(false, 'Expected error not thrown');
        }catch(DmlException e){
            System.assert(e.getMessage().contains('Stage cannot be changed back to Prospecting'));
        }

        Test.stopTest();
    }
}