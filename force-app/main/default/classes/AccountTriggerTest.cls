@isTest
private class AccountTriggerTest {

    @isTest
    static void testPreventRatingHot() {
        // Step 1: Create test account
        Account acc = new Account(
            Name = 'Test Account',
            Rating = 'Warm'
        );
        insert acc;

        // Step 2: Try to update Rating to 'Hot' (should fail)
        Test.startTest();
        acc.Rating = 'Hot';
        
        try {
            update acc;
            System.assert(false, 'Expected error when setting Rating to Hot');
        } catch (DmlException e) {
            System.assert(
                e.getMessage().contains('Rating cannot be set to Hot'),
                'Error message mismatch'
            );
        }
        Test.stopTest();
    }

    @isTest
    static void testAllowOtherRatings() {
        // Step 1: Create test account
        Account acc = new Account(
            Name = 'Test Account 2',
            Rating = 'Warm'
        );
        insert acc;

        // Step 2: Update to a valid rating
        Test.startTest();
        acc.Rating = 'Cold';
        update acc;
        Test.stopTest();

        // Step 3: Verify update succeeded
        Account updatedAcc = [SELECT Rating FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Cold', updatedAcc.Rating);
    }
}