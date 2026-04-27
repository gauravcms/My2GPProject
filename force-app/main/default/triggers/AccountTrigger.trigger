trigger AccountTrigger on Account (before update) {
  for (Account acc : Trigger.new) {
        
        // Only run when Rating is being set
        String newRating = acc.Rating;
        if (newRating != null && newRating.equalsIgnoreCase('Hot')) {

            // Add error to prevent DML
            acc.addError('Rating cannot be set to Hot.');
        }
    }
}