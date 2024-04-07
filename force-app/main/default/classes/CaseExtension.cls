public class CaseExtension {
    public List<Case> caseList { get; set; }
    public Attachment fileAttachment { get; set; }

    public CaseExtension(ApexPages.StandardController controller) {
        Id recordId = controller.getId();
        caseList = [SELECT Priority, Status, CaseNumber FROM Case WHERE Id = :recordId];
        
        if (caseList != null && !caseList.isEmpty()) {
            if (!Test.isRunningTest() && ApexPages.currentPage().getParameters().get('doNotSavePDF') == null) {
                PageReference myPage = ApexPages.currentPage();
                myPage.getParameters().put('doNotSavePDF', 'true');
                Id woId = ApexPages.currentPage().getParameters().get('Id');
                myPage.getParameters().put('Id', woId);
                Blob certificatePdf = myPage.getContent();
                fileAttachment = new Attachment(parentId = controller.getId(), Name='test.pdf', body=certificatePdf);
                
            }
        }
    }

    // Method to be executed on page load
    public PageReference file() {
       return null;
}
}