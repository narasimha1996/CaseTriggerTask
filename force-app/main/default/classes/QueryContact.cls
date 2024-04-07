public class QueryContact {
  public static Id getContactID(String lastName, String title) {
    try {
      Contact myContact = Database.query(
        'SELECT ID FROM Contact WHERE lastName = :lastName AND title = :title LIMIT 1'
      );
      return myContact.Id;
    } catch (Exception ex) {
      return null;
    }
  }
  public static Id getContactIDWithBinds(Map<String, Object> bindVars) {
      //implement the logic that will use bindVars to retrieve the contact's ID 
      try{
           String query ='SELECT id'+ 'FROM Contact'+ 'WHERE lastName = :lName' + 'AND title=:title Limit 1';
          return Database.queryWithBinds(query,bindVars,AccessLevel.USER_MODE).Id;
      }catch(Exception ex){
           return null;
      }
    
   
    }
}