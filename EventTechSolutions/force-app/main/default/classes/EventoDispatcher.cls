public class EventoDispatcher {

    public void run() {
        // O "IF" que você pediu agora fica aqui dentro
        if (Trigger.isBefore && Trigger.isUpdate) {
            
            // Chamada da sua classe de lógica (Handler/Helper)
            Evento.verificarCapacidade(Trigger.new, (Map<Id, Evento__c>)Trigger.oldMap);
            
        }
        
        /* Você pode adicionar outros contextos facilmente no futuro:
           if (Trigger.isAfter && Trigger.isInsert) { ... }
        */
    }
}