public class EmployeeData {
    Private Long Id;
    private String name;
    Private Integer yearJoined;
    
    public EmployeeData(Long i,String n,Integer yJ){
        Id =i;
        name=n;
        yearJoined=yJ;
    }
    
    Public String getName(){ return name;}
   	Public Integer getYear(){ return yearJoined;}
    

}