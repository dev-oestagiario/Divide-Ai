# ADR 0002 — Participantes de cada despesa e escopo do rateio

**Estado:** Proposta para ratificação, não aprovada. **Data:** 2026-11-23.
**Motivação:** o MVP prevê grupos com duas ou mais pessoas, mas o critério de quem participa de cada despesa precisa ser inequívoco. Sem essa decisão, uma despesa que pertence a duas pessoas poderia ser indevidamente dividida com uma terceira.

## Decisão proposta

1. Todo lançamento de despesa pertence a um período e possui um **conjunto explícito e não vazio de participantes responsáveis**.
2. **Despesa individual:** um único participante, quota de 100% para ele.
3. **Despesa compartilhada:** dois ou mais participantes selecionados. O conjunto pode ser menor que o conjunto de todas as pessoas do grupo.
4. **Rateio proporcional:** usar apenas a soma das rendas líquidas **em dinheiro** dos participantes selecionados e ativos naquele período. Vales não entram no denominador.
5. **Rateio igualitário:** partes iguais entre os selecionados. Distribuir centavos remanescentes por maior resto, com desempate por ID estável.
6. **Rateio manual:** informar quotas em centavos de cada selecionado, não negativas, cuja soma seja exatamente o total da despesa.
7. Participantes **não selecionados** sempre recebem quota zero e não consomem benefícios para aquela despesa.
8. Selecionar alguém com renda monetária zero é permitido; sua quota proporcional será zero quando o denominador dos selecionados for positivo. Se o denominador for zero, não escolher igualdade silenciosamente: oferecer modo igual ou manual com aviso.
9. Caso uma pessoa seja desativada, preservar sua participação e suas quotas nos meses fechados. Remoção no mês aberto exige confirmação e recálculo visível.
10. Após calcular a quota, o pagamento por benefício é uma **fonte de cobertura**, não uma transferência de responsabilidade: somente vale próprio, elegível e disponível do participante pode ser abatido. Vales não são fungíveis nem presumidamente transferíveis.
11. A interface deve mostrar total, quota individual, parcela coberta por vale e parcela prevista em dinheiro, sem confundir previsão com pagamento já efetuado.

## Exemplos completamente fictícios

- Participantes A com R$ 2.700, B com R$ 3.300, C com R$ 4.000 de renda monetária.
- Despesa R$ 1.800 apenas de A e B, rateio proporcional: A paga R$ 810; B paga R$ 990; C paga R$ 0.
- A mesma despesa de R$ 1.800 selecionando A, B e C: A R$ 486; B R$ 594; C R$ 720.
- Despesa compartilhada de R$ 0,01 entre três participantes, modo igual: um recebe quota de R$ 0,01 e dois recebem R$ 0,00, escolhidos pela regra determinística de desempate.
- Para somente A e B com renda zero, rateio proporcional não pode ser calculado; manual ou igual deve ser selecionado explicitamente.

## Consequências e testes de aceite a produzir

- O armazenamento de despesas precisará registrar o conjunto de participantes e a modalidade de rateio usada naquele mês.
- Ao mudar salário no mês aberto, recalcular somente despesas proporcionais para as quais a pessoa participa.
- Validação em alteração de participantes: não permitir conjunto vazio ou manual com quotas que não fecham.
- A soma das quotas deve ser exatamente a despesa original em centavos.
- Reordenação visual da tabela não pode alterar resultados.
- Mês fechado mantém snapshot de participantes, renda e quotas.
- Nenhuma execução de código, teste ou aprovação ocorre por criar esta ADR.

## Alternativas avaliadas

- Dividir sempre entre todos do grupo: simples, mas incorreto quando só algumas pessoas devem participar.
- Exigir grupos separados para cada despesa: complexidade desnecessária.
- Selecionar participantes por despesa: aumenta um controle no cadastro, mantendo cálculo correto e útil para casal/família/colegas.

**Gate:** ratificação expressa junto com Constituição e ADR 0001; ainda **não** autoriza F1, merge ou deploy.
