# Tasks — 001: Planejamento financeiro local

**Status global:** planejado, **não autorizado para implementação**.  
Os blocos seguem dependências e são tarefas futuras; nenhum `[ ]` representa execução.

## F0 — Documentação e ratificação
- [ ] T001 [P0] Revisar Constituição, decisões e aceite do MVP com o responsável; registrar ratificação. Dependência: nenhuma. **Critério:** aprovação explícita.
- [ ] T002 [P0] Validar triagem legal em fontes oficiais e registrar conclusão do uso exclusivamente local. Dependência: T001. **Critério:** matriz atualizada, dúvidas sem extrapolação.
- [ ] T003 [P0] Definir repositório e ambiente autorizado; confirmar Spec Kit/skills, Git Flow e verificações existentes. Dependência: T001. **Critério:** estado real e permissões registrados.

## F1 — Fundação e persistência local (somente após autorização)
- [ ] T010 [P1] Iniciar React+TS+Vite, lint/typecheck/testes, base acessível e responsiva, e cache offline dos recursos essenciais. Dependência: T003 e autorização da F1. **Critério:** build reproduzível e reabertura offline após primeira visita.
- [ ] T011 [P1] Criar domínio em centavos e contratos de participantes, rendas, vales e períodos. Dependência: T010. **Critério:** testes unitários de contratos.
- [ ] T012 [P1] Implementar repositório IndexedDB versionado e mecanismo de recuperação. Dependência: T011. **Critério:** testes de persistência, falhas e compatibilidade.
- [ ] T013 [P1] Implementar backup JSON com validação/prévia/confirmação e substituição atômica. Dependência: T012. **Critério:** roundtrip e rollback seguro para erros e arquivos inválidos.

## F2 — Fluxos essenciais e rateio
- [ ] T020 [P1] Cadastros de pessoas e múltiplas rendas por mês. Dependência: T011-T012. **Critério:** edição atualiza renda monetária e benefícios separadamente.
- [ ] T021 [P1] Cadastro de despesas pessoais e compartilhadas com categorias genéricas. Dependência: T011-T012. **Critério:** despesas pessoais sem quota alheia.
- [ ] T022 [P1] Motor de rateio proporcional/igual/manual em centavos. Dependência: T020-T021. **Critério:** soma exata e casos renda zero.
- [ ] T023 [P1] Motor de vales por titular, consumo em ordem estável/prioridade explícita e saldo restante. Dependência: T022. **Critério:** sem uso acima do saldo, sem transferência, resultado idêntico mesmo se a tabela for reordenada.
- [ ] T024 [P1] Tabela-resumo, subtotais e saldos por pessoa. Dependência: T020-T023. **Critério:** recálculo imediato e nenhuma mistura dinheiro/vale.

## F3 — Orçamento, metas e histórico
- [ ] T030 [P1] Regra 60/15/25 editável, limites versus **compromissos previstos**, sem fingir pagamentos. Dependência: T024. **Critério:** saldo não usado preservado e sem dupla dedução.
- [ ] T031 [P1] Metas de casa, reserva e carro, sem dupla contagem. Dependência: T030. **Critério:** previsto e efetivo distintos.
- [ ] T032 [P1] Mês aberto/fechado, recorrências mensais e snapshots. Dependência: T024. **Critério:** alteração de renda futura não modifica mês fechado.
- [ ] T033 [P2] Registro de pagamento/pessoa pagadora e saldos efetivamente realizados. Dependência: T032. **Critério:** quotas, pagamentos e aportes não confundidos.
- [ ] T034 [P2] Impressão e exportação do resumo mensal. Dependência: T024. **Critério:** layout imprimível e exportação sem dados ocultos indevidos.

## F4 — Experiência, homologação e revisão
- [ ] T040 [P1] Auditoria final de responsividade e acessibilidade iniciadas desde T010, incluindo viewports e teclado. Dependência: T024. **Critério:** evidências visuais e acessíveis registradas.
- [ ] T041 [P1] Suíte de unidade, integração e E2E (Playwright) com evidências. Dependência: T013, T032, T040. **Critério:** regressões calculadas e fluxos completos aprovados.
- [ ] T042 [P1] Revisão de conformidade, privacidade e plano de recuperação. Dependência: T041. **Critério:** riscos residuais documentados.
- [ ] T043 [P1] Ratificação/homologação e, somente após autorização, release controlada. Dependência: T042. **Critério:** gates de AGENTS.md, PR e SHA sem pendências obrigatórias.

## F5 — Apenas se houver demanda futura
- [ ] T050 [P3] Reavaliar modo multiusuário e sincronização; novo ADR, LGPD, autenticação/autorização, modelo remoto, testes RLS e migrações. **Bloqueado por nova autorização e nova especificação.**

## Matriz de rastreio resumida
- RF01–RF03 → T011, T020, T032.
- RF04–RF07 → T021, T022, T024.
- RF08 → T023; RF09 → T024.
- RF10–RF11 → T030, T031.
- RF12–RF13 → T012, T013, T032.
- RF14 → T033 (P2); RF15 → T034 (P2); RNF01–RNF08 → T010–T013, T040–T042.

**Nota:** revisão manual em `analyze.md` (F0) documenta 9 achados. Quando houver ferramenta instalada, reavaliar sequência com `/speckit.analyze` antes de abrir tarefas de implementação. Todos os itens F0 de ratificação permanecem pendentes de aprovação expressa.