@isTest
public with sharing class OrderTriggerTest 
{
    @isTest
    static void testTrigger()
    {
        Integer nbAccount = 1;
        Integer nbOrder = 1;
        Integer unitPrice = 1;
        Integer quantity = 1;
        List <Account> accountTest = DataFactory.createAccounts(nbAccount);
        List <Order> orderTest= DataFactory.createOrdersForAccounts(accountTest,nbOrder,unitPrice,quantity);
        
        Test.startTest();
        Database.delete(orderTest);
        List<Account> dataAccount = [Select Id, activeNew__c FROM Account];
        List <Order> dataOrder = [Select AccountId FROM Order];
        for (Account account : dataAccount) 
        {
            for (Order order  : dataOrder) 
            {
                if (account.Id == order.AccountId) 
                {
                    System.assertEquals(True, account.activeNew__c);
                }
                else 
                {
                    System.assertEquals(False, account.activeNew__c);
                }

                if (order.Status == 'Activated' && order.OrderItems.isEmpty()) 
                {
                    System.assertEquals(True, order.Status == 'Draft');
                }
                else 
                {
                    System.assertEquals(False, order.Status == 'Activated');
                }
            }
        }
        
        Test.stopTest();

    }

}
