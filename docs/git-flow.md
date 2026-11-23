# Git Flow — Divide Ai

- `main`: base aprovada para produção; inicialização mínima excepcional porque o repositório estava vazio.
- `develop`: integração de trabalho de desenvolvimento aprovado.
- `docs/*`, `feature/*`, `fix/*`, `test/*`: nascem de develop e usam PR para develop.
- `release/*`: branch congelada de develop, PR para main com homologação e autorização explícita; sincronizar main em develop após release.
- Não fazer trabalho direto na main, merge sem revisão, força de push ou publicação por pedido genérico de continuidade.
- Verificar branches/rulesets/CI, SHA e aprovação antes do merge.
- Se Actions indisponível por cota, registrar gates pendentes e evidência de execução em ambiente autorizado, sem fingir CI verde.
