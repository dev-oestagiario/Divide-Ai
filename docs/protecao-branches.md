# F0 — Proteger main e develop no GitHub

**Estado verificado em 23/11/2026:** ambas as branches sem proteção, lista de rulesets vazia. **Este documento não configura regras**, apenas descreve a ação necessária.

## Passos na interface
1. Abrir https://github.com/dev-oestagiario/Divide-Ai/settings/rules com conta administradora.
2. Em Rulesets, selecionar New branch ruleset e nomear "protected-main-develop".
3. Definir Enforcement: Active; selecionar as branches main e develop como alvos.
4. Habilitar Require a pull request before merging, Restrict deletions e Block force pushes; exigir resolução de conversas quando disponível.
5. Para repositório mantido por uma pessoa só, configurar 0 revisões obrigatórias enquanto não houver revisor diferente do autor. Isso não dispensa revisão, registro no PR nem ratificação.
6. Habilitar checks obrigatórios apenas quando existir check confiável. Não usar check fictício nem criar um gate impossível por indisponibilidade de GitHub Actions.
7. Salvar e conferir a regra ativa em Settings > Rules e na API do GitHub; registrar evidência na Issue #2.

## Cuidados
- Não conceder bypass permanente ou desabilitar regras para integrar PR.
- Nenhuma release ou merge de PR deve ser apresentado como autorizado sem resolver os bloqueios do AGENTS.md.
- Não foi possível executar esta configuração diretamente: a conexão GitHub oferece leitura de rulesets, não escrita; dispositivos remotos estão offline.

Fonte: https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/creating-rulesets-for-a-repository