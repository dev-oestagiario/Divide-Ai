# F0 — Verificação documental automatizada

**Execução:** 2026-11-23 | **Fonte:** arquivos da branch `docs/f0-spec-kit` recuperados pelo GitHub conectado.
**Tipo:** verificações estáticas de Markdown e exemplos aritméticos executadas em JavaScript durante a análise. Não são testes do aplicativo, não constituem comando `/speckit.analyze` e não são uma auditoria de segurança.

## Escopo realmente verificado
- 19 arquivos de documentação lidos do GitHub (antes de acrescentar este relatório).
- Requisitos em `spec.md`: 15 RF, 14 RN e 8 RNF.
- `tasks.md`: 22 IDs de tarefas planejadas.
- `docs/qa/casos-de-teste.md`: 16 cenários planejados.
- IDs duplicados nos cinco grupos: **0**.
- RF sem linha explícita na matriz de rastreabilidade de tasks.md: **0**.
- RNF sem linha explícita na matriz de rastreabilidade de tasks.md: **0**.
- Busca heurística por formatos de email, tokens comuns, dados pessoais do histórico e valores privados exemplificativos em 19 arquivos: **nenhuma ocorrência**. Isso não garante ausência de segredos não cobertos pelo padrão; revisão humana ainda necessária.

## Exemplos matemáticos avaliados fora da aplicação
| Teste de referência | Verificação aritmética |
|---|---|
| CT01 | 1800 dividido na proporção 2700/3300 resulta em 810/990: correto |
| CT02 | 1100 dividido em 495/605, saldos de benefícios 55/145: correto |
| CT04 | Renda extra 900 → participações 3600/6900 e 3300/6900: correto |
| CT06 | Renda zero de A com B positivo → quota proporcional de A zero: correto |
| CT08 | 1400 dividido em 630/770, falta 80/20 nos vales: correto |
| CT12 | 60/15/25 da renda hipotética 6000 → 3600/900/1500: correto |

**Limite:** os cálculos foram reproduzidos independentemente; não houve execução de motor de rateio implementado, persistência, navegador ou testes E2E.

## Gates pendentes
1. Ratificação expressa de Constituição, regras e termo `ratificacao-f0.md`.
2. Proteger `main` e `develop` (última consulta GitHub: protected=false, rulesets=[]).
3. Validar Termux/Debian ou outro ambiente conectado e a versão do GitHub Spec Kit CLI antes de instalar/executar. Nenhuma skill Spec Kit foi encontrada no catálogo de skills conectadas do chat, o que não atesta ausência nos computadores.
4. Testes reais, licenças de dependências, acessibilidade e conformidade antes de release quando houver código.
5. Review do PR #1 e, após ratificação e gates, merge controlado em `develop`.

**Conclusão:** inspeção documental bem-sucedida nos critérios listados, mas F0 **não ratificada** e F1 **não autorizada**.