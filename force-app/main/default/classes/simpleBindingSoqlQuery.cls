public class simpleBindingSoqlQuery {
    
    public static List<Account> dynamicSoqlQuery(Map<String, Object> bindParams){
        String query ='SELECT Id,Name' + 'FROM Account' +'WHERE name=: name';
        return Database.queryWithBinds(query,bindParams, AccessLevel.USER_MODE);
            
    }

}