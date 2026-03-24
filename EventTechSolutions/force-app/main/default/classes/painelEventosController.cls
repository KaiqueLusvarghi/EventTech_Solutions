public with sharing class painelEventosController {
    @AuraEnabled(cacheable=true)

    public static List<Evento__c> getEventos() {
        return [SELECT Id, Name, Regiao__c,Data_do_Evento__c,Capacidade__c, Total_de_Inscritos__c
                FROM Evento__c
                WHERE Status__c != 'Encerrado'
                AND Data_do_Evento__c >= TODAY
                 ];
                
    }
}