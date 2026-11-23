# Divide Ai — especificação de produto

**Estado:** documentação preliminar para validação, sem implementação.  
**Data-base:** 2026-11-23.  
**Modo aprovado:** um operador local administra os dados de todos os participantes, sem login, nuvem ou sincronização na primeira versão.  
**Repositório definido:** https://github.com/dev-oestagiario/Divide-Ai (conexão GitHub Dev).  
**Instruções:** seguir o `AGENTS.md` deste pacote; usar Spec Kit como método, não presumir sua instalação.

**Marca selecionada:** ícone geométrico B; SVGs e orientações em `docs/identidade-visual/` (não integrado ao aplicativo).

## Propósito
Facilitar a divisão de despesas conforme a renda líquida das pessoas, mantendo gastos pessoais, benefícios e objetivos separados. O usuário cadastra dados e obtém uma tabela clara com **total**, **minha parte**, **parte de cada participante** e **saldo livre**, sem precisar editar HTML ou fórmulas.

## Documentos e sequência

1. `AGENTS.md`: normas fornecidas pelo usuário, somente parte pertinente à norma; não inclui material extra de colagem.
2. `.specify/memory/constitution.md`: princípios do produto (`/speckit.constitution`, redigido manualmente).
3. `specs/001-planejamento-local/spec.md`: requisitos e histórias (`/speckit.specify`).
4. `specs/001-planejamento-local/clarifications.md`: decisões, hipóteses e dúvidas (`/speckit.clarify`).
5. `specs/001-planejamento-local/plan.md`: arquitetura proposta (`/speckit.plan`); **não** significa decisão de implementação aprovada.
6. `specs/001-planejamento-local/checklists/requirements.md`: checklist de qualidade (`/speckit.checklist`).
7. `specs/001-planejamento-local/tasks.md`: decomposição futura (`/speckit.tasks`).
8. `docs/roadmap.md`: fases e gates.
   - `docs/ambiente-termux-preflight.md`: passos de validação do Debian/Termux, aguardando execução.
   - `docs/identidade-visual/`: ícone B aprovado visualmente e variantes SVG.
9. `docs/adr/0001-local-first.md` e `docs/adr/0002-participantes-e-rateio.md`: decisões arquiteturais propostas, sujeitas à ratificação.
10. `docs/conformidade-legal.md`: triagem preliminar e condições de reavaliação.
11. `docs/qa/casos-de-teste.md`: casos de teste e resultados matemáticos esperados.
12. `GLOSSARY.md`: termos do domínio.

## Delimitação
- **Incluído no MVP:** cadastro local de participantes e rendas, benefícios, despesas, tipos de rateio, envelopes 60/15/25 editáveis, metas, visão mensal, backup/importação e saldos.
- **Não incluído:** autenticação, sincronização, banco remoto, integração bancária, transferências de dinheiro, pagamentos, aconselhamento financeiro automatizado, IA, notificações push e aplicações nativas.
- **Repositório:** `dev-oestagiario/Divide-Ai` é público. A inicialização mínima ocorreu na `main`; `develop` e `docs/f0-spec-kit` foram criadas para propor a documentação da F0. Nenhum código da aplicação, homologação ou deploy foi criado. Veja `docs/estado-repositorio.md`.

## Próximo gate
Revisar `spec.md`, `clarifications.md` e `ratificacao-f0.md`; configurar proteção de `main`/`develop`, conferir o PR documental, ratificar regras fundamentais e autorizar explicitamente a F1 antes de qualquer implementação. O Termux foi visto online via Desktop Commander, mas a cota mensal do serviço impediu executar comandos; conferir `docs/ambiente-termux-preflight.md`. Nenhum código de aplicação foi gerado.

## Fontes externas consultadas na elaboração
- Spec Kit: https://github.com/github/spec-kit e https://github.github.io/spec-kit/quickstart.html
- Repositório de apoio legal: https://github.com/ctresb/leis
- LGPD (texto oficial): https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709compilado.htm
- LBI (texto oficial): https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2015/lei/l13146.htm