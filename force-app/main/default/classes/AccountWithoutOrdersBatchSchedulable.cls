public with sharing class AccountWithoutOrdersBatchSchedulable implements Schedulable
{
    public void execute (SchedulableContext ctx)
    {
        AccountWithoutOrdersBatch accountSchedulable = new AccountWithoutOrdersBatch();
        Database.executeBatch(accountSchedulable);
    }
    
}
