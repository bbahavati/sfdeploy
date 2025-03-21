public class AccountCalculator {
	@future
    public static void countContacts(List<Id> accIds){
        List<Account> accList = [Select Id, Count_Number_of_Contacts__c,
                                 (Select Id From Contacts)
                                 From Account
                                 WHERE Id IN :accIds];
        for(Account acc : accList){
            acc.Count_Number_of_Contacts__c = acc.Contacts.size();
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}
