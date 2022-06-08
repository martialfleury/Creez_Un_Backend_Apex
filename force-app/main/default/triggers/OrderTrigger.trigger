trigger OrderTrigger on Order (before update , after delete) 
{
    if (Trigger.isUpdate) 
    {
        AccountWhichVerifyStatus.verifyStatusOrderIsActif(Trigger.new);
    }
    else if (Trigger.isDelete) 
    {
        AccountWhichVerifyStatus.orderRelatedOnAccount(Trigger.old);
    }
}