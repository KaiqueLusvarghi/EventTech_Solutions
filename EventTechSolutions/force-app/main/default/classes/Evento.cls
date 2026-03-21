public class Evento {
    public static void verificarCapacidade(List<Evento__c> newEvents, Map<Id, Evento__c> oldMap) {
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        //bjeto que vai dentro da lista. Ele representa um único e-mail individual (com destinatário, assunto e corpo).
        //
        // 1. Buscamos o ID do endereço "EventTech Solutions" que você configurou no Setup
        OrgWideEmailAddress[] owea = [SELECT Id FROM OrgWideEmailAddress WHERE Address = 'eventtechsolutions@yopmail.com'];

        for (Evento__c ev : newEvents) {
			// Verifica se a capacidade foi preenchida
            if (ev.Capacidade__c > 0 && ev.Total_de_Inscritos__c != null) {
                Decimal percentual = (ev.Total_de_Inscritos__c / ev.Capacidade__c) * 100;
					
                // Se atingiu 90% e o status ainda não era 'Quase Lotado'
                if (percentual >= 90 && ev.Status__c != 'Quase Lotado') {
                    ev.Status__c = 'Quase Lotado';
                    
                    // Prepara o e-mail para o organizador
                    if (ev.Email__c != null) {
                        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                        
                        // 2. Definimos o remetente oficial (EventTech)
                        if (owea.size() > 0) {
                            email.setOrgWideEmailAddressId(owea[0].Id); //definindo o remetente
                        }

                        email.setToAddresses(new String[] { ev.Email__c });
                        email.setSubject('Alerta de Capacidade - ' + ev.Name);
                        
                        // 3. Texto personalizado
                        String corpo = 'Olá,\n\n' +
                                       'Aqui é a EventTech Solutions.\n' +
                                       'Estou passando para avisar que o evento ' + ev.Name + 
                                       ' atingiu ' + percentual.setScale(0) + '% da capacidade.'; //setScale(0) arredonda numeros decimais
                        
                        email.setPlainTextBody(corpo);
                        email.setSaveAsActivity(false);
                        emails.add(email);
                    }
                }
            }
        }
        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }
}