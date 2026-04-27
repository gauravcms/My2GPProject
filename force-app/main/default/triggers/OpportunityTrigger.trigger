trigger OpportunityTrigger on Opportunity (before update) {
    if(Trigger.isBefore && Trigger.isUpdate){
        OpportunityTriggerHandler.preventProspectingStage(Trigger.new, Trigger.oldMap);
    }
}