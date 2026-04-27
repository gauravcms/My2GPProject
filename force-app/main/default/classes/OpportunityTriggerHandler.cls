public class OpportunityTriggerHandler {

    public static void preventProspectingStage(List<Opportunity> newList, Map<Id, Opportunity> oldMap){

        for(Opportunity opp : newList){

            Opportunity oldOpp = oldMap.get(opp.Id);

            // Check if stage is changed
            if(opp.StageName != oldOpp.StageName){

                // Prevent changing to Prospecting
                if(opp.StageName == 'Prospecting'){
                    opp.addError('Stage cannot be changed back to Prospecting.');
                }

            }
        }

    }

}