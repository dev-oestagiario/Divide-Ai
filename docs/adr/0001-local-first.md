# ADR 0001 — Persistência local e operador único

**Estado:** proposta; ratificação pendente. **Data:** 2026-11-23.

## Contexto
Um único operador quer cadastrar rendas, dividir despesas e planejar metas sem exigir login nem alterar HTML.

## Decisão proposta
Aplicação web local-first com IndexedDB, separando domínio de persistência, sem servidor, autenticação ou sincronização. Exportação/importação JSON versionado com prévia e confirmação.

## Alternativas
- Local-first: menor custo e complexidade, mas há risco de perda por limpeza do navegador.
- Supabase desde a F1: adicionaria autenticação, RLS e dependências remotas sem necessidade atual.
- HTML estático sem persistência estruturada: inadequado para histórico e dados relacionais.

## Consequências
Nenhum tráfego de dados financeiros por padrão; backup manual essencial; acesso por outras pessoas no mesmo perfil de navegador; evolução para nuvem exige nova especificação/ADR e análise de privacidade.

**Gate:** ratificação antes de implementar.
