@isTest

public with sharing class AccountWhichVerifyStatusTest 
{
    @isTest
    Static void verifyAccountTest()
    {
        
        Integer nbAccount = 1;
        Integer nbOrder = 1;
        Integer unitPrice = 1;
        Integer quantity = 1;
        List <Account> accountTest = DataFactory.createAccounts(nbAccount);
        List <Order> orderTest= DataFactory.createOrdersForAccounts(accountTest,nbOrder,unitPrice,quantity);

        Test.startTest();
        for (Account account : accountTest) 
        {
            if (account.Orders.isEmpty()) 
            {
                System.assertEquals(False, account.activeNew__c);
            }
            else 
            {
                System.assertEquals(True, account.activeNew__c);
            }
        }
        Test.stopTest();
    }
}
