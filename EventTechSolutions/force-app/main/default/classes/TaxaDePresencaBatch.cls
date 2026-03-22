global with sharing class TaxaDePresencaBatch implements Database.Batchable<SObject> {

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Name, Capacidade__c, ' +
            '(SELECT Id FROM Inscricoes__r WHERE Status__c = \'Presente\') ' +
            'FROM Evento__c WHERE Status__c = \'Encerrado\''
        );
    }

    global void execute(Database.BatchableContext bc, List<SObject> scope) {
        List<Evento__c> events = (List<Evento__c>) scope;

        for (Evento__c evento : events) {
            if (evento.Capacidade__c != null) {
                Decimal taxaPresenca = (evento.Inscricoes__r.size() / evento.Capacidade__c) * 100;//evento.Inscricoes__r.size()conta quantos compareceram , evento.Capacidade__c é a capacidade total do evento
                evento.Taxa_de_Presenca__c = taxaPresenca.setScale(2);// Define a taxa de presença com 2 casas decimais
            
            }
        }

        update events;
    }

    global void finish(Database.BatchableContext bc) {
        System.debug('Batch de cálculo da taxa de presença concluído.');
    }
}

//TaxaDePresencaBatch batch = new TaxaDePresencaBatch();
//Database.executeBatch(batch, 200);