# Implementation Plan — 001: Planejamento financeiro local

**Estado:** proposta técnica; nenhum código produzido; implementação bloqueada até ratificação.

## Arquitetura
Web local-first sem backend: `domain` (regras puras) → `application` (casos de uso) → `infrastructure` (IndexedDB, backup) → `ui` (telas). Componentes visuais não implementam fórmulas de rateio.

## Stack proposta
React + TypeScript + Vite; Tailwind para UI; Zod para validação; IndexedDB para persistência; Vitest, Testing Library e Playwright para testes. Sem Supabase, Auth, IA, integrações bancárias ou serviço remoto no MVP. O CLI Spec Kit e skills devem ser confirmados no ambiente, pois a documentação foi produzida manualmente.

## Entidades
- Household: grupo, política orçamentária, moeda BRL.
- Participant: identificação interna, apelido e status.
- IncomeSource: participante, período, natureza cash|benefit, modalidade, valor em centavos.
- Period: YYYY-MM, open|closed, snapshot.
- Expense: período, grupo, valor, personal|shared, responsável, modo de rateio, elegibilidade, previsto/realizado.
- ExpenseShare: despesa, participante, centavos e fonte usada.
- BudgetCategory: nome, envelope needs|leisure|goals.
- Goal: objetivo, meta/compromisso mensal e eventual saldo real.
- Payment (P2): pagador, valor e data.

## Fórmulas
1. Renda monetária total do período = soma de rendas líquidas de dinheiro ativas.
2. Peso proporcional = renda individual / renda monetária total, somente se total > 0.
3. Rateio em centavos: calcular quotas racionais, arredondar para baixo, distribuir centavos residuais aos maiores restos (desempate por ID estável). Invariante: soma das quotas = despesa.
4. Igualitário usa pesos iguais; manual valida soma exata informada.
5. Benefício: somente despesa elegível do titular, limitado ao seu saldo. Falta de saldo vira quota em dinheiro/pendência com alerta, jamais transferência automática.
6. Metas planejadas e pagamentos realizados ficam separados, sem dupla dedução.
7. Em período aberto, recalcular; em fechado, preservar snapshot; reabrir exige ação explícita.

## Jornadas
Resumo: mês e tabela única com grupos, descrição, total, coluna por participante, saldos e avisos. Cadastros: participantes, salário e renda extra. Despesas: pessoais/compartilhadas e rateio. Planejamento: tetos 60/15/25 editáveis, metas casa/reserva/carro. Dados: exportar, validar/importar backup. Mobile: manter todas as quotas legíveis.

## Persistência e recuperação
IndexedDB versionado, JSON com schemaVersion/exportedAt, prévia e confirmação antes de importar. Importação inválida preserva o estado atual. Informar risco de perda ao limpar navegador e acesso por outras pessoas no mesmo perfil.

## Testes, segurança e gates
Unitários (renda zero, arredondamento, vale, metas, fechamento); integração (IndexedDB/backup); E2E (cadastro, recálculo, recarga, exportação/importação, mobile); lint/typecheck/build quando existir código. Sem dados pessoais reais no repositório público. Avaliar LGPD/LBI conforme uso real, dependências e acessibilidade. **Não iniciar implementação antes da ratificação da F0.**
