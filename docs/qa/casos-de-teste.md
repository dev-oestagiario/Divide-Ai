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

## Cenários propostos — ADR 0002 (dependem de ratificação)

Estes casos **não substituem as regras atualmente documentadas no spec.md**. A ADR 0002 ainda é uma proposta; só incorporar ao conjunto obrigatório do MVP após sua ratificação. Todas as pessoas e rendas abaixo são fictícias.

| ID | Cenário proposto | Resultado esperado se ADR 0002 aprovada |
|---|---|---|
| CT17 | Rendas A=R$ 2.700, B=R$ 3.300, C=R$ 4.000; despesa de R$ 1.800 compartilhada **apenas por A e B** | Quotas A=R$ 810, B=R$ 990, C=R$ 0; C não contribui |
| CT18 | Mesma despesa, agora com **A, B e C** selecionados | Quotas A=R$ 486, B=R$ 594, C=R$ 720 |
| CT19 | R$ 0,01 dividido igualmente por três participantes selecionados | Soma exata R$ 0,01; primeiro ID estável recebe 1 centavo |
| CT20 | Rateio proporcional de R$ 1,01 com pesos A=200, B=300, C=500 | Quotas A=R$ 0,20, B=R$ 0,30, C=R$ 0,51, pelo método maior resto |
| CT21 | Despesa R$ 75,00 com duas pessoas selecionadas e ambas com renda zero | Bloquear somente rateio proporcional; oferecer igual/manual |
| CT22 | Selecionar **nenhuma** pessoa numa despesa compartilhada | Impedir salvamento; mensagem acessível; manter dados anteriores |
| CT23 | Terceira pessoa C não selecionada; alterar renda de C num mês aberto | Não alterar quotas da despesa rateada apenas entre A e B |
| CT24 | Alterar lista de pessoas de uma despesa em mês fechado | Preservar snapshot; solicitar reabertura explícita conforme política ratificada |
| CT25 | Selecionar A e B; informar quotas manuais que não somam o valor da despesa | Bloquear confirmação e indicar a diferença em centavos |
| CT26 | Reordenar linhas da tabela sem alterar dados | Quotas e uso previsto de vales permanecem iguais |
| CT27 | A selecionado com vale elegível insuficiente, C não selecionado com vale sobrando | Não usar vale de C nem redistribuir obrigação; alertar falta de vale de A |

**Conferência independente de exemplos:** CT17–CT21 tiveram os resultados aritméticos conferidos por algoritmo temporário de inteiros em centavos, fora da aplicação. CT22–CT27 são expectativas especificadas, não executadas.

**Execução real:** pendente de implementação, testes e evidências.