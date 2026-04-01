# Group onboarding via WhatsApp

## Fluxo desejado

### Autorizar grupo
1. No grupo novo, o owner envia `/addGroup`
2. Em conversa permitida com o agente, o owner pede algo como:
   - `/mestre pesquise o jid do grupo`
   - `/mestre libere este grupo`
   - `/mestre autorize este grupo`
3. O agente busca no log a ocorrência recente do marcador `/addGroup`
4. O agente extrai o JID do grupo
5. O agente executa `scripts/add-group-from-log.sh`
6. O grupo é liberado automaticamente

### Revogar grupo
1. O owner pede algo como:
   - `/mestre revoke este grupo`
   - `/mestre remova este grupo`
   - `/mestre retire este grupo`
2. O agente identifica o grupo recente pelo mesmo fluxo de marcação/log
3. O agente executa `scripts/revoke-group-from-log.sh`
4. O grupo é removido da configuração

## Regras

- Esse fluxo é exclusivo do owner
- O grupo deve ser identificado pelo JID real
- Scripts principais:
  - `scripts/add-group-from-log.sh`
  - `scripts/revoke-group-from-log.sh`
