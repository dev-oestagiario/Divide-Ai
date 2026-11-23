# F0 — Termo de ratificação do MVP local (proposta)

**Produto:** Dividi (nome de trabalho) | **Repositório:** `dev-oestagiario/Divide-Ai`  
**Estado:** aguardando aceite explícito do responsável. Este documento **não** representa aprovação.  
**Referências:** `AGENTS.md`, `.specify/memory/constitution.md`, `spec.md`, `clarifications.md`, `plan.md`, `tasks.md`, `analyze.md`, ADRs 0001/0002 e Issue #2.

## Escopo para aprovação

1. **Operação local:** somente um operador administra grupos de duas ou mais pessoas, sem login, backend ou sincronização no MVP; proteção depende do dispositivo e perfil de navegador.
2. **Rendas:** registrar várias fontes por pessoa, em BRL e centavos; dinheiro e vales separados; proporção calculada sobre **renda líquida monetária** ativa no período.
3. **Despesas:** gastos pessoais inteiramente atribuídos a uma pessoa; compartilhados divididos proporcionalmente por padrão, podendo usar igualdade ou quotas manuais validadas. **Conforme ADR 0002 proposta**, cada despesa compartilhada poderá selecionar somente os participantes responsáveis, e pessoas não selecionadas terão quota zero; o rateio proporcional usará apenas a renda dos selecionados.
4. **Benefícios:** vale-alimentação, vale-refeição ou flexível vinculados ao titular, sem transferência presumida; só elegíveis por modalidade/estabelecimento. Após rateio, aplicar saldo por ordem determinística (mês, data prevista, ID), com prioridade ajustável; insuficiência deve gerar alerta e escolha explícita entre dinheiro e pendência.
5. **Orçamento:** 60% necessidades / 15% lazer / 25% metas, todos editáveis e considerados referências, não obrigação de gastar 100% da renda; valor não comprometido fica livre.
6. **Metas e pagamentos:** reserva, casa, carro e outros objetivos são *compromissos planejados*; não inventar depósitos ou gastos realizados. Registro de pagamentos e saldos efetivos permanece P2.
7. **Meses:** período aberto recalcula ao editar rendas/despesas; mês fechado preserva parâmetros e quotas; reabrir exige confirmação e preservação do histórico anterior.
8. **Dados/backup:** IndexedDB local, formato JSON versionado, validação/prévia/confirmação/atomicidade em importação, exportação e alerta sobre perda ao limpar o navegador. Primeiro carregamento da aplicação pode precisar de internet; reabertura offline após primeiro acesso será testada.
9. **Apresentação:** uma tabela principal com total e colunas por pessoa, com visualização móvel equivalente, acessibilidade desde a F1 e categorias gerais editáveis. Exemplos do repositório público sempre fictícios.

## Itens a validar na ratificação técnica

- [ ] Constituição e 14 regras RN aprovadas expressamente.
- [ ] 15 RF e 8 RNF do MVP/P2 compreendidos e sem conflito.
- [ ] ADR 0001 (local-first), ADR 0002 (rateio entre participantes selecionados), inclusive cenários CT17–CT27 propostos, e stack aprovados.
- [ ] Política de vales insuficientes, fechamento/reabertura e backup aprovada.
- [ ] Matriz legal preliminar aceita como triagem, sem alegar parecer jurídico.
- [ ] Rulesets ativos e verificados em `main` e `develop`.
- [ ] Ambiente autorizado conectado; Spec Kit CLI/skills inspecionados ou decisão registrada sobre validação manual.
- [ ] Checklist atualizado e PR #1 revisado antes de merge para `develop`.

## Formato para registro de decisão

O responsável poderá registrar: **"Ratifico a Constituição, as regras RN01–RN14, o MVP local-first, os ADRs 0001 e 0002 e as decisões 1–9 do termo de ratificação da F0"**, ou registrar ressalvas específicas. Essa declaração autoriza a **ratificação de produto**, não autoriza automaticamente implementação da F1, merge na main, homologação ou publicação.

**Status atual:** nenhuma ratificação expressa recebida. Bloqueadores externos (rulesets e ambiente conectado) continuam pendentes.