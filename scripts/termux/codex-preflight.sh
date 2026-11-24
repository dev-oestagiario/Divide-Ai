#!/usr/bin/env sh
# Divide Ai — verificação somente de leitura para o Debian/Termux.
# Não instala, autentica, envia dados ou altera o sistema.
set -u

printf '%s\n' '=== Divide Ai | Diagnóstico Debian/Termux ==='
if [ -r /etc/os-release ]; then
  . /etc/os-release
  printf 'Sistema: %s\n' "${PRETTY_NAME:-desconhecido}"
else
  printf '%s\n' 'Sistema: /etc/os-release indisponível'
fi

architecture="$(uname -m 2>/dev/null || printf 'desconhecida')"
printf 'Arquitetura do kernel: %s\n' "$architecture"
if command -v dpkg >/dev/null 2>&1; then
  printf 'Arquitetura do pacote: '
  dpkg --print-architecture 2>/dev/null || printf '%s\n' 'não detectada'
fi

print_version () {
  cmd="$1"
  if command -v "$cmd" >/dev/null 2>&1; then
    printf '%s: ' "$cmd"
    "$cmd" --version 2>&1 | sed -n '1p'
  else
    printf '%s: não encontrado no PATH\n' "$cmd"
  fi
}

for cmd in git python3 node npm chromium playwright specify codex; do
  print_version "$cmd"
done

if command -v node >/dev/null 2>&1; then
  printf 'Node process.platform: '
  node -p 'process.platform' 2>/dev/null || printf '%s\n' 'indisponível'
  printf 'Node process.arch: '
  node -p 'process.arch' 2>/dev/null || printf '%s\n' 'indisponível'
fi

if command -v codex >/dev/null 2>&1; then
  printf '%s\n' 'Codex detectado. Verifique autenticação apenas localmente com: codex login status'
fi

printf '%s\n' 'Nenhuma instalação ou teste de sandbox foi realizado por este script.'
printf '%s\n' 'Não publique tokens, códigos de dispositivo, conteúdo de ~/.codex ou dados pessoais.'
