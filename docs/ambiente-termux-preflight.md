# F0 — Verificação de Termux / Debian 13 (pendente de execução)

**Status:** NÃO EXECUTADO. Dispositivo `localhost` visível como Online, mas chamadas remotas bloqueadas por limite mensal do Desktop Commander em 2026-11-23.

## Critério para retomar
Quando houver acesso remoto disponível, verificar novamente o estado do dispositivo sem exceder a cota. O serviço orientou não repetir chamadas nem reconectar enquanto o bloqueio persistir. Acompanhar pelo painel https://mcp.desktopcommander.app/ .

## Ambiente-alvo e segurança
- Alvo: `localhost` = Termux no Android ARM64, com Debian 13 via PRoot. Não usar host Termux como se fosse Debian.
- Sem instalar dependências, clonar repositórios, alterar autenticação ou editar dados locais como parte deste checklist.
- Nunca imprimir tokens, chaves ou conteúdo de `.env` em logs ou no PR.
- Usar dados fictícios e manter trabalho fora de `main`.
- Em caso de erros, documentar resultados reais e interromper; não presumir disponibilidade.

## Passo 1 — Diagnóstico no Termux (host Android)
Em uma sessão do dispositivo autorizado (não executada nesta etapa):

```sh
pwd
uname -m
command -v dev-linux
command -v dev-doctor
dev-doctor
```

Conferir se o sistema é ARM64 e se `dev-linux` e `dev-doctor` existem e funcionam. Se não, registrar a discrepância antes de prosseguir.

## Passo 2 — Entrar no Debian
Após confirmação das ferramentas de host:

```sh
dev-linux
```

O shell deve indicar o Debian 13/Trixie. Já dentro do Debian, apenas inspecionar versões:

```sh
cat /etc/os-release
uname -m
command -v git; git --version
command -v python3; python3 --version
command -v node; node --version
command -v npm; npm --version
command -v chromium; chromium --version
command -v playwright
command -v specify
```

Observação: `command -v` vazio sinaliza ausência ou PATH incorreto; `node`/`chromium` não devem ser presumidos. Não rodar `npx` sem antes avaliar potencial instalação/download.

## Passo 3 — Repositório e Spec Kit
- Inspecionar `~/projects` **sem sobrescrever arquivos**.
- Se houver clone pré-existente de Divide Ai, verificar branch, `git status` e alterações pendentes; não fazer `git reset`, `git clean`, pull ou checkout destrutivos.
- Confirmar se Spec Kit está realmente instalado e como seus comandos foram disponibilizados no ambiente; nunca relatar `/speckit.analyze` como executado sem evidência.
- Antes de instalar ou baixar dependências, conferir licenças, compatibilidade Debian/ARM64 e autorização, conforme `AGENTS.md`.

## Evidências exigidas
| Item | Esperado | Estado |
|---|---|---|
| `dev-doctor` no Termux | Relatório e saída/erro | Pendente |
| Debian/Trixie em ARM64 | `/etc/os-release` e `uname -m` | Pendente |
| Git/Python/Node/npm | Versões ou indisponibilidade real | Pendente |
| Chromium / Playwright | Versões/instalação confirmada | Pendente |
| Spec Kit | CLI/skills e versão ou ausência | Pendente |
| Estado do clone | Branch, status e alterações preservadas | Pendente |
| Execução de testes | Somente quando existir código e autorização da F1 | Não aplicável na F0 |

**Gate:** PR #1 da F0 em rascunho, Constituição e ADRs ainda não ratificados. Esta verificação de ambiente não autoriza F1, merge ou publicação.
