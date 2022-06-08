global with sharing class AccountWhichVerifyStatus 
{ 
 // On verifie que le changement du status de l'order en actif contient des ordersItemms
   global static void verifyStatusOrderIsActif (List<Order> orderItems)
   {
     for (Order od : orderItems)
     {
         if (od.Status=='Activated' && od.OrderItems.isEmpty())
         {
             od.addError('vous devez inserer des orderItems pour que le statut passe a activated');
         }
     }
   }


   global static void orderRelatedOnAccount (List<Order> deletedOrders)
   {
       List<Account> accountToDeactivate = new List<Account>();
       Set<Id> accountIds = new Set<Id>();
       
       
       for (Order deletedOrder : deletedOrders)
       {
        if (deletedOrder.accountId != null) 
        {
            accountIds.add(deletedOrder.accountId);
        }

       }

       for (Order accountOrder: [Select accountId from Order WHERE accountId in :accountIds]) 
       {
         accountIds.remove(accountOrder.accountId);
       }

       for (Id accountId : accountIds) 
       {
           accountToDeactivate.add(new Account(Id=accountId,activeNew__c = false));
       }

       if (accountToDeactivate.size() > 0)
        {
           update accountToDeactivate;
        }
    
        }
}
