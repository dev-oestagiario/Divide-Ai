# QA — cenários planejados (não executados)

Todos os valores abaixo são **inteiramente fictícios** e independentes de finanças reais de usuários.

| ID | Cenário | Resultado esperado |
|---|---|---|
| CT01 | Renda A=R$ 2700, B=R$ 3300; aluguel compartilhado R$ 1800 | A=R$ 810, B=R$ 990 |
| CT02 | Mercado R$ 1100, benefícios A=R$ 550, B=R$ 750, ambos elegíveis | Quotas A=R$ 495, B=R$ 605; sobras A=R$ 55, B=R$ 145 |
| CT03 | Consulta particular R$ 150 individual de A | A paga R$ 150 e B R$ 0 |
| CT04 | Renda extra A +R$ 900 | Proporção A=3600/6900 (52,1739%), B=3300/6900 (47,8261%) |
| CT05 | Dividir R$ 0,01 igualmente entre 3 pessoas | Soma das quotas = R$ 0,01, com desempate determinístico |
| CT06 | Rendas A=R$ 0, B=R$ 3300 e despesa R$ 100 | A=R$ 0; B=R$ 100 |
| CT07 | Rendas A=R$ 0, B=R$ 0 e despesa R$ 100 | Proporcional bloqueado; oferecer igual/manual |
| CT08 | Mercado R$ 1400; vales A=R$ 550 e B=R$ 750 | Quotas A=R$ 630, B=R$ 770; faltam R$ 80 e R$ 20, sem transferir vale entre titulares |
| CT09 | Fechar um mês e alterar a renda no mês posterior | Quotas do mês fechado preservadas |
| CT10 | Exportar, recarregar e importar backup válido | Dados recuperados com schema validado |
| CT11 | Importar JSON malformado | Erro e dados existentes preservados |
| CT12 | Política 60/15/25 com renda R$ 6000 | Referências R$ 3600, R$ 900, R$ 1500; sem forçar gastos |
| CT13 | Benefício de refeição inelegível para determinada compra | Não usar benefício; apresentar alerta |
| CT14 | Meta prevista sem depósito efetivo | Não contabilizar como pagamento realizado |
| CT15 | Valor negativo ou rateio manual que não fecha | Rejeitar entrada e preservar valores anteriores |
| CT16 | Navegação por teclado e viewport de 320 px | Controles operáveis e valores legíveis |

**Execução real:** pendente de implementação, testes e evidências.