# F0 — Ativação e verificação de proteção de branches
**Status:** somente configuração proposta. Nenhuma regra aplicada remotamente até que a API/UI a confirme.

## Aplicabilidade
O repositório `dev-oestagiario/Divide-Ai` é público. Rulesets de branches são suportados no GitHub Free para repositórios públicos. Criar ou alterar rulesets requer autorização administrativa no repositório (permissão Administration/write); a conexão GitHub desta conversa não oferece escrita administrativa.

## Política preparada
Arquivo: `.github/rulesets/protected-main-develop.json`.

- Alvos **exatos**: `refs/heads/main` e `refs/heads/develop`.
- Enforcement: `active` (não apenas avaliação).
- Require pull request before merging.
- Require conversation resolution.
- Prevent branch deletion.
- Prevent force push / non-fast-forward.
- 0 aprovações externas obrigatórias enquanto o mantenedor for individual. Revisão registrada e ratificação humana continuam exigidas pelo `AGENTS.md`.
- Sem bypass administrativo configurado. Sem status checks obrigatórios inexistentes: GitHub Actions indisponível por cota; registrar testes locais na revisão, não fingir CI verde.

## Opção A — interface do GitHub (mais simples)
1. Abra https://github.com/dev-oestagiario/Divide-Ai/settings/rules .
2. New branch ruleset, nome `protected-main-develop`, Enforcement **Active**.
3. Target branches: inclua `main` e `develop` explicitamente; não use All branches.
4. Ative **Require a pull request**, **Require conversation resolution**, **Restrict deletions** e **Block force pushes**.
5. Defina `required approvals = 0` se não houver outro revisor; não habilite checks ainda inexistentes nem bypass.
6. Salve, inspecione as regras aplicadas a cada branch e anexe evidência à Issue #2.

## Opção B — GitHub CLI (para terminal autenticado de administrador)

Pré-requisitos: `gh` oficial instalado e autenticado **na sua conta administradora**. Não use a conexão do Desktop Commander enquanto estiver bloqueada por cota. Não cole tokens no chat, nos arquivos, nem em logs.

Antes de qualquer escrita:

```sh
gh auth status
gh api repos/dev-oestagiario/Divide-Ai/rulesets --jq '.[] | {name,id,enforcement}'
```

Verifique se já existe regra equivalente. Se existir, **não crie duplicata**: faça revisão do ruleset existente pela UI.

Num clone que contém o arquivo e depois de conferir manualmente seu conteúdo:

```sh
gh api -X POST repos/dev-oestagiario/Divide-Ai/rulesets \
  --input .github/rulesets/protected-main-develop.json \
  --jq '{id,name,enforcement}'
```

Este comando altera as políticas do repositório. Só o execute após confirmar os alvos e as permissões. Em caso de erro 403/404/422, não tente contornar a proteção: use a UI ou valide permissões e payload.

### Confirmar resultado
```sh
gh api repos/dev-oestagiario/Divide-Ai/rulesets \
  --jq '.[] | {name,id,enforcement,target}'
gh api repos/dev-oestagiario/Divide-Ai/rules/branches/main \
  --jq '[.[].type]'
gh api repos/dev-oestagiario/Divide-Ai/rules/branches/develop \
  --jq '[.[].type]'
```

Revisar se `pull_request`, `deletion` e `non_fast_forward` estão efetivamente ativos para **ambas** as branches e se a regra não permite bypass. Proteger apenas a `main` não satisfaz o gate.

## Gates posteriores
- Aprovar explicitamente a Constituição e ADRs 0001/0002 no termo F0; pedido genérico “siga” não equivale a ratificação.
- Confirmar ambiente de testes do Termux/Debian ou alternativa autorizada e registrar limitações.
- Só então fazer revisão do PR #1 para `develop` e autorizar F1 de forma separada.

**Referências oficiais:**
- https://docs.github.com/en/rest/repos/rules?apiVersion=2026-03-10
- https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/creating-rulesets-for-a-repository
