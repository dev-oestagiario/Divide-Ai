# F0 — Revisão cruzada da especificação (análise manual)

**Data:** 2026-11-23. **Status:** concluída como revisão manual, não como execução do comando oficial `/speckit.analyze`.
**Base:** spec.md, clarifications.md, plan.md, tasks.md, constitution.md e AGENTS.md.

## Achados

| ID | Prioridade | Problema | Ajuste necessário |
|---|---|---|---|
| A01 | Alta | Especificação promete reabertura offline, mas o plano não prevê cache de recursos. | Documentar cache offline/PWA e cenário de teste após primeira visita. |
| A02 | Alta | RF10 promete comparação com gastos realizados em P1, porém pagamentos estão em RF14/P2. | Limitar MVP a valores previstos e reservados; mostrar realizado somente em P2. |
| A03 | Alta | Consumo de vales pode depender da ordem interna das despesas. | Definir ordem estável (mês, vencimento, ID) e prioridade alterável explicitamente. |
| A04 | Alta | Backup não exige atomicidade, podendo perder dados em importação parcial. | Validar, pré-visualizar, confirmar, aplicar em transação ou restaurar estado anterior. |
| A05 | Média | Reserva planejada pode ser confundida com depósito realizado e descontada duas vezes. | Separar saldo disponível planejado e saldo financeiro efetivo. |
| A06 | Média | Acessibilidade estava concentrada na F4. | Iniciar com componentes acessíveis na F1 e usar F4 para auditoria final. |
| A07 | Bloqueador | `main` e `develop` desprotegidas; GitHub rulesets vazios. | Configurar proteções e comprovar. |
| A08 | Bloqueador | Constituição e regras ainda sem ratificação. | Exigir aceite explícito do responsável antes de F1 ou merge. |
| A09 | Bloqueador | Dispositivos autorizados offline. | Não declarar testes/CLI executados. |

## Rastreabilidade verificada
- RF01–RF03 → T011, T020, T032.
- RF04–RF08 → T021, T022, T023.
- RF09 → T024; RF10–RF11 → T030–T031.
- RF12–RF13 → T012–T013, T032.
- RF14 → T033 (P2); RF15 → T034 (P2).

## Resultado
Os achados são documentais. É necessário corrigi-los antes da ratificação e, posteriormente, repetir a análise usando o Spec Kit instalado quando disponível. Nenhum teste de aplicação foi executado.
**F0 continua não ratificada. PR #1 deve permanecer draft. F1 bloqueada.**