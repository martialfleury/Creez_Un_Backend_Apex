@isTest
public class AccountWithoutOrdersBatchTest 
{
    @TestSetup
    static void makeData()
    {
        Integer nbAccount = 1;
        List <Account> accountTest = DataFactory.createAccounts(nbAccount);
    }
    
    @isTest
    Static void test_WhenBatchExecuted()
    {
        Test.startTest();
        AccountWithoutOrdersBatch obj = new AccountWithoutOrdersBatch();
        Id batchId = Database.executeBatch(obj);
        Test.stopTest();



        List<Account> res = [Select Id , (Select AccountId FROM Orders) , (Select WhatId FROM Tasks) FROM Account];
        List<Task> tasks = [Select WhatId FROM Task];
        for (Account account : res)
        {
            System.assertEquals(False, tasks.isEmpty());
        }
    }
}
