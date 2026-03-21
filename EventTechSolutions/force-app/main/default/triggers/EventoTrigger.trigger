trigger EventoTrigger on Evento__c (before update) {
    // A única função da Trigger agora é chamar o Dispatcher
    EventoDispatcher dispatcher = new EventoDispatcher();
    dispatcher.run();
}