# Architecture

## Visão geral

O projeto consiste em um bot de WhatsApp operado pelo OpenClaw em um servidor Ubuntu.

## Componentes principais

- OpenClaw Gateway
- Canal WhatsApp
- Agente principal
- Cron jobs operacionais
- Configuração de grupos allowlisted por JID
- Memória local do workspace

## Regras importantes

- Grupos são permitidos por `channels.whatsapp.groups`
- A política de remetentes em grupos é controlada por `groupAllowFrom`
- O owner controla operações sensíveis
- Configurações vivas e segredos não devem ir para o GitHub
