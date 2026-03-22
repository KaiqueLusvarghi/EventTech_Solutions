# EventTech Solutions – Sistema de Gestão de Eventos Corporativos

[![Salesforce](https://img.shields.io/badge/Platform-Salesforce-blue.svg)](https://www.salesforce.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 📌 Sobre o Projeto
O **EventTech Solutions** é uma solução completa de CRM desenvolvida na plataforma Salesforce para gerenciar o ciclo de vida de eventos corporativos (conferências, workshops e treinamentos). O projeto foi desenhado para substituir processos manuais e planilhas, centralizando dados de palestrantes, sessões, inscrições e avaliações.

Este projeto foi desenvolvido como desafio final de nível **Intermediário/Avançado** no Bootcamp da **SYS4B**.

## 🛠️ Funcionalidades Principais

### 🔹 Gestão de Core Business
*   **Modelagem de Dados:** Arquitetura relacional entre `Evento`, `Sessão`, `Inscrição` e `Palestrante`.
*   **Regras de Negócio:** Validações complexas para evitar inscrições em eventos lotados ou datas retroativas.

### 🔹 Automação e Inteligência
*   **Salesforce Flows:** 
    *   *Screen Flow:* Wizard de inscrição pública para usuários externos.
    *   *Scheduled Flow:* Envio automático de lembretes 48h antes do evento.
    *   *Record-Triggered Flow:* Cálculo automático de prazos e disparo de e-mails com QR Code.
*   **Apex Avançado:**
    *   *Triggers & Handlers:* Lógica de atualização de status baseada na capacidade do evento.
    *   *Batch Apex:* Processamento em massa para cálculo de indicadores de presença pós-evento.

### 🔹 Interface e Experiência (UX)
*   **Lightning Web Components (LWC):**
    *   `eventDashboard`: Painel dinâmico com filtros por data e região.
    *   `sessionsSchedule`: Grade visual de horários das sessões.

### 🔹 Segurança e Governança
*   Configuração de **OWD**, **Sharing Rules** por critério (Região/Tipo) e **Perfis** distintos para Organizadores, Coordenadores e Palestrantes.

## 📊 Analytics
*   Dashboards executivos com KPIs de:
    *   Taxa de cancelamento e presença.
    *   Receita por região.
    *   Ranking de palestrantes melhor avaliados.

## 🚀 Tecnologias Utilizadas
*   **Salesforce Admin:** Custom Objects, Validation Rules, Flows, Reports & Dashboards.
*   **Salesforce Development:** Apex (Classes, Triggers, Batch, Unit Tests), LWC, SOQL/SOSL.
*   **Ferramentas:** VS Code, Salesforce CLI, Git/GitHub.

## 📂 Estrutura do Repositório
```text
├── force-app/main/default
│   ├── classes/              # Lógica Apex (Triggers, Handlers e Batch)
│   ├── lwc/                  # Componentes Lightning Web
│   ├── flows/                # Automações de fluxo exportadas
│   ├── objects/              # Definições de Objetos Customizados e Campos
│   └── permissionsets/       # Configurações de acesso e segurança
└── README.md
