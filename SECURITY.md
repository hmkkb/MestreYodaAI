# Security

## Nunca versionar

- tokens
- sessões do WhatsApp
- `.env` real
- `auth-profiles.json`
- logs com dados pessoais
- mídia recebida/enviada
- config viva com segredos

## Versionar apenas exemplos

- `.env.example`
- `openclaw.example.json`
- docs sanitizadas

## Boas práticas

- usar `.gitignore` forte
- evitar dados sensíveis no repositório
- separar config viva de config de exemplo
