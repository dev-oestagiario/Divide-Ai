# Roadmap — Divide Ai local-first

**Situação em 2026-11-23:** projeto em especificação; repositório dev-oestagiario/Divide-Ai inicializado com branches main/develop/docs-f0; sem aplicação implementada.

| Fase | Objetivo e escopo | Entrega verificável | Gate de saída | Estado |
|---|---|---|---|---|
| F0 | Constituição, especificação, decisões, triagem legal, plano e tarefas | Markdown Spec Kit + riscos + critérios de aceite | Ratificação pelo responsável e ambiente/repositório definidos | Documentos propostos; aguardando ratificação |
| F1 | Fundação técnica e persistência local | Projeto configurado, domínio monetário, IndexedDB, backup versionado | Build, testes unidade/integridade, revisão | Backlog preparado em #3–#6; implementação não iniciada |
| F2 | MVP básico de contribuição | Participantes, renda, despesas, rateios e tabela por pessoa | E2E de cálculo e recarga + QA | Não iniciada |
| F3 | Orçamento e histórico | Percentuais editáveis, metas, meses e fechamento | Testes de histórico, sem duplicação, aceites | Não iniciada |
| F4 | UX, acessibilidade e validação | Layout responsivo, testes amplos, docs e checklist de release | Ratificação, homologação, conformidade, autorização de release | Não iniciada |
| F5 (opcional) | Evolução multiusuário / sincronização | Novo escopo, ADR e stack remota se aprovado | Nova rodada Spec Kit + privacidade/Auth/RLS | Fora do MVP |

## Critérios de prioridade
- **P0:** especificação consistente, regras monetárias seguras, salvamento/restauração e privacidade local.
- **P1:** operação mensal direta, cadastro e rateio, benefícios, metas, visão acessível.
- **P2:** registro de pagamentos e relatórios.
- **P3:** contas online, sincronização, integração bancária e recursos avançados (fora do MVP).

## Riscos por fase
- F0: ambiguidades de regras de benefício/fechamento não ratificadas.
- F1: perda de dados locais, formatos incompatíveis e dependências desnecessárias.
- F2: centavos residuais, renda zero, saldo de vale insuficiente.
- F3: retroatividade e dupla contabilização de metas.
- F4: responsividade, privacidade e recuperação inadequadas.
- F5: acesso indevido, arquitetura remota e mudança de obrigações legais.

## Procedimento quando houver repositório
Inspecionar `git status`, branches/PRs e README; executar especificação aprovada. Feature branches partem de `develop`, PR para `develop`, release branch congelada para `main` **somente com autorização e evidências**, seguida de sincronização. Não utilizar GitHub Actions como requisito de execução se o ambiente não tiver cota: documentar quais gates foram validados em ambiente local e quais continuam bloqueados.
## Bloqueadores antes da F1

- Ratificação expressa da Constituição e ADRs 0001/0002: acompanhar [Issue #2](https://github.com/dev-oestagiario/Divide-Ai/issues/2) e [termo da F0](../specs/001-planejamento-local/ratificacao-f0.md).
- Proteção verificada de `main`/`develop` com rulesets ativos; não contornar o Git Flow.
- Ambiente de execução validado: Debian/Termux ainda sem acesso remoto por cota do Desktop Commander; uso do Codex CLI local é opção documentada, não uma execução confirmada.
- Verificação de Spec Kit/skills e gates de revisão conforme AGENTS.md.

As issues #3–#6 foram abertas como backlog técnico condicionado, e não como autorização de implementação.
