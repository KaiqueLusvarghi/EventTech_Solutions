import { LightningElement } from 'lwc';
import getEventos from '@salesforce/apex/painelEventosController.getEventos';

export default class painelEventos extends LightningElement {
    eventos = [];

    connectedCallback() {
        this.loadEventos();
    }

    loadEventos() {
        getEventos()
            .then(result => {
                this.eventos = result;
            })
            .catch(error => {
                console.error('Error loading eventos:', error);
            });
    }

    get eventosFiltrados() {        
        return this.eventos.map(evento => ({
            ...evento, // Copia os campos originais do evento
            vagasRestantes: + (evento.Capacidade__c - evento.Total_de_Inscritos__c) // Calcula as vagas restantes
        }));
    }
}