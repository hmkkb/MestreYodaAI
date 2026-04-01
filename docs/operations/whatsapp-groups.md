# WhatsApp Groups

## Processo atual

1. Descobrir o JID do grupo pelo log
2. Adicionar o JID em `channels.whatsapp.groups`
3. Reiniciar o gateway
4. Validar em produção

## Observações

- O JID tem formato `120...@g.us`
- `groups` controla grupos permitidos
- `groupAllowFrom` controla remetentes permitidos dentro dos grupos
