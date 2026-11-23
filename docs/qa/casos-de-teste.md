# QA — cenários planejados (não executados)

Valores são exemplos sintéticos de especificação, não dados pessoais de produção nem testes de software já realizados.

| ID | Cenário | Esperado |
|---|---|---|
| CT01 | Salários 2200/4000 e aluguel 2000 | Quotas R$ 709,68 / R$ 1.290,32 |
| CT02 | Mercado R$ 1200, vales 700/900 elegíveis | Quotas R$ 425,81 / R$ 774,19; saldo de vales 274,19/125,81 |
| CT03 | Dentista R$ 200 individual A | A paga R$ 200; B paga zero |
| CT04 | Acrescentar R$ 1000 extra a A | Proporções 44,444...% / 55,555...% |
| CT05 | 1 centavo dividido entre 3 igualmente | Quotas somam 1 centavo |
| CT06 | Renda 0/4000, despesa R$ 100 | Rateio 0/100 |
| CT07 | Rendas 0/0, despesa R$ 100 | Avisar impossibilidade do proporcional |
| CT08 | Mercado R$ 1600, vales 700/900 | Quotas 567,74/1032,26; falta R$ 132,26 em B |
| CT09 | Fechar mês e mudar renda no seguinte | Histórico fechado permanece igual |
| CT10 | Exportar, recarregar, reimportar backup | Estado preservado após validação |
| CT11 | Importar JSON malformado | Rejeitar sem substituir dados |
| CT12 | Regra 60/15/25 e renda R$ 6200 | Tetos R$ 3720 / R$ 930 / R$ 1550 |
| CT13 | Vale de modalidade incompatível com despesa | Impedir uso e avisar |
| CT14 | Meta planejada sem depósito efetivo | Não registrar transferência realizada |
| CT15 | Negativos e rateio manual sem soma exata | Rejeitar com erro acessível |
| CT16 | Layout 320px e navegação por teclado | Todos os valores e controles acessíveis |

**Execução:** pendente até implementação, ambiente autorizado e testes efetivos.
