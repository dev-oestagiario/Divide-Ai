# Codex CLI no Termux/Debian — preparação F0

**Estado:** documentação e diagnóstico preparados, **sem execução no celular**. Usar o Debian 13 dentro do Termux (`dev-linux`); não instalar no Android nativo sem nova avaliação.

## Por que este caminho

O Codex CLI oficial publica suporte a Linux ARM64; o alvo npm para esta arquitetura é `@openai/codex-linux-arm64` via `@openai/codex`. Porém, Android/PRoot **não é equivalente** a uma distribuição Linux nativa: há relatos de falhas de `prctl(PR_SET_DUMPABLE, 0)` e de `bubblewrap` em Termux/PRoot. O comando de instalação não prova compatibilidade de execução.

**Referências verificadas em 2026-11-23:**
- https://github.com/openai/codex (instruções oficiais)
- https://github.com/openai/codex/blob/main/codex-cli/scripts/build_npm_package.py (pacote `linux-arm64`)
- https://github.com/openai/codex/issues/6757 (falha PR_SET_DUMPABLE no PRoot)
- https://github.com/openai/codex/issues/30153 (falha de sandbox `bwrap` em PRoot)
- https://github.com/openai/codex/issues/47402 (limitações do sandbox dentro do Debian/PRoot)
- https://help.openai.com/pt-br/articles/11369540-using-codex-with-your-chatgpt-plan (autenticação ChatGPT e limites do plano)

## 1. Pré-verificação — somente leitura

No Termux, execute `dev-doctor` e entre no Debian:

```sh
dev-doctor
dev-linux
```

Se o repositório já estiver clonado localmente e **sem sobrescrever ou limpar arquivos**, execute, dentro do Debian, o script desta branch:

```sh
cd ~/projects/Divide-Ai
git status --short
git branch --show-current
sh scripts/termux/codex-preflight.sh
```

O caminho local pode ser diferente. **Não faça `git pull`, `reset`, `clean` ou `checkout` sobre alterações locais desconhecidas.** Se o script ainda não estiver no clone, use os comandos manuais do passo 2 de `docs/ambiente-termux-preflight.md` ou consulte a versão do arquivo no GitHub. O script é apenas diagnóstico e não extrai credenciais.

## 2. Instalação opcional, após diagnóstico e consentimento local

Antes de instalar, confirme que o relatório indicou Debian/ARM64, Node/npm disponíveis e espaço suficiente. Inspecione dependências e não use instaladores de origem desconhecida.

Com o Debian adequado e **após decidir instalar no dispositivo**:

```sh
npm install -g @openai/codex
codex --version
```

Se o npm global falhar por permissão, **não use `sudo npm` automaticamente**; avaliar instalação do Node/npm e prefixo local primeiro.

Para autenticação em uma sessão sem navegador local, o Codex oferece o fluxo oficial:

```sh
codex login --device-auth
```

Conclua a autorização no navegador da conta e **não compartilhe** o código de dispositivo, token, senha, chave API ou conteúdo de `~/.codex`. O fluxo requer que a autorização por código de dispositivo esteja habilitada nas configurações da conta, quando aplicável. Uma alternativa é `codex login` em ambiente com navegador. Usar a conta ChatGPT elegível consome sua cota do Codex; não é uma promessa de uso ilimitado ou um novo plano grátis.

## 3. Verificar funcionamento sem antecipar a F1

```sh
codex --version
codex login status
```

Só após conferir versão e login, testar **interativamente com revisão humana**, em diretório de teste separado que não contenha dados privados nem arquivos de produção. Não aplicar modos de execução sem sandbox ou com permissão irrestrita para contornar erros do PRoot; registrar a falha e usar outro ambiente/fluxo.

O projeto Divide Ai **continua com F0 não ratificada**; teste de inicialização do agente não autoriza mudanças em `main`/`develop`, execução de tarefas F1, CI, release ou deploy.

## 4. Diagnóstico de problemas comuns

| Sintoma | Procedimento seguro |
|---|---|
| `node` ou `npm` indisponível | Registrar versão do Debian e avaliar dependências oficialmente compatíveis antes de instalar |
| Pacote `codex` indisponível | Confirmar Node/npm Linux dentro de `dev-linux`, não npm do Termux Android |
| `prctl`, `bwrap` ou `sandbox` falha | Parar; comparar com issues oficiais; não desativar proteções sem nova análise |
| `codex login --device-auth` falha | Verificar configurações de conta e rede; nunca compartilhar token/código |
| Sem acesso remoto neste chat | Continuar pelo GitHub (documentos/PRs); executar o preflight manualmente no Termux e compartilhar apenas o resumo sanitizado |

## 5. Resultado esperado para encerrar a verificação

Registrar na Issue #2: arquitetura Debian; Node/npm/Git; instalação ou não do Codex; versão, login válido (somente indicação, não credenciais); falhas e limitações; possibilidade ou não de iniciar uma sessão segura. Deixar explicitamente separado **ambiente validado** de **aplicação implementada/testada**.

**Atenção:** instalar o Codex CLI no celular cria outra sessão de agente; não dá a esta conversa controle remoto automático do dispositivo. Para isso seria necessário um conector autorizado compatível, que ainda não está disponível.
