@isTest
public with sharing class NonConformanceOnCaseTest {
        @isTest
        static void testOnAfterInsert() {

            Test.startTest();
    
    
            List<Case> testCases = new List<Case>();
            for (Integer i = 0; i < 5; i++) {
                Case c = new Case(Type = 'Problem', Subject = 'Test Subject ' + i, Description = 'Test Description ' + i);
                testCases.add(c);
            }

            CaseTriggerHandler handler = new CaseTriggerHandler();
            handler.onAfterInsert(testCases);
    
            List<SQX_Nonconformance__c> nonConList = [SELECT Id FROM SQX_Nonconformance__c];
            System.assertEquals(0, nonConList.size());
    
            Test.stopTest();
        }





    @isTest
    static void testOnBeforeUpdate() {
        Test.startTest();

    
        List<Case> testCases = new List<Case>();
        for (Integer i = 0; i < 5; i++) {
            Case oldCase = new Case(Type = 'Incident', Subject = 'Old Subject ' + i, Description = 'Old Description ' + i);
            Case newCase = new Case(Type = 'Problem', Subject = 'New Subject ' + i, Description = 'New Description ' + i);
            testCases.add(oldCase);
            testCases.add(newCase);
        }
        insert testCases;


        Map<Id, Case> oldMapCases = new Map<Id, Case>();
        for (Case c : testCases) {
            oldMapCases.put(c.Id, c);
        }

    
        CaseTriggerHandler handler = new CaseTriggerHandler();
        handler.onBeforeUpdate(testCases, oldMapCases);

        List<SQX_Nonconformance__c> nonConList = [SELECT Id FROM SQX_Nonconformance__c];
        System.assertEquals(5, nonConList.size());

        Test.stopTest();
    }
    
}