public class SaveRegistrationDetails {

    @AuraEnabled
    public static id saveDetails(RegistrationForm__c regForm){
        
        insert regForm;
        return regForm.id;
        
    }
    
    @AuraEnabled
    public static id saveEducationDetails(EducationalDetails__c eduDet){
        
        insert eduDet;
        return eduDet.id;
        
    }
}