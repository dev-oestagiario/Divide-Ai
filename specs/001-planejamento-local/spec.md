# Feature Specification — 001: Planejamento financeiro local

**Status:** Draft / aguardando ratificação  
**Escopo:** MVP local de despesas compartilhadas e individuais  
**Origem:** conversas de levantamento + `AGENTS.md` fornecido

## 1. Problema e objetivo
Planilhas estáticas exigem alterar código ou fórmulas ao variar salários, rendas adicionais ou despesas. O usuário deseja atualizar valores pela interface e ver automaticamente **quanto cada pessoa deve contribuir**, sem perder de vista gastos pessoais, vales e dinheiro disponível.

**Resultado desejado:** em menos de alguns passos, a pessoa operadora cadastra participantes, atualiza renda, registra uma conta e vê a tabela com quotas corretas. O aplicativo não movimenta dinheiro.

## 2. Usuários, premissas e limites
- **Operador único:** administra tudo a partir do dispositivo/navegador; não existem contas e permissões individuais na primeira versão.
- **Participantes financeiros:** pessoas cujas rendas e despesas são registradas; não precisam entrar no aplicativo.
- **Moeda:** BRL; valores monetários representados em centavos.
- **Períodos:** meses civis; idioma português do Brasil; fuso do dispositivo apenas para apresentação.
- **Offline:** após a primeira visita online, os recursos essenciais devem permitir reabrir o aplicativo e editar dados sem conexão, por cache controlado (PWA/service worker ou equivalente), sem instalação obrigatória. Primeiro acesso e atualizações podem exigir internet.
- **Privacidade:** dados permanecem no armazenamento local do navegador; exportar/importar JSON manualmente, com aviso de riscos.

## 3. Histórias de usuário priorizadas

### US01 — Cadastrar fontes de renda (P1)
Como operador, quero incluir salários líquidos, rendas extras e vales por participante, para recalcular automaticamente a participação do grupo.

**Aceite:** adicionar, editar, excluir; recorrente ou pontual; dinheiro/vale separados; alteração de renda no mês aberto muda a proporção sem alterar meses fechados.

### US02 — Cadastrar e ratear despesas (P1)
Como operador, quero registrar aluguel, mercado, contas e gastos individuais, para enxergar a quota de cada pessoa.

**Aceite:** cadastrar nome, valor, categoria, mês, responsabilidade (compartilhada ou participante), método proporcional/igual/personalizado e meio de pagamento; mostrar quotas exatas.

### US03 — Consultar tabela e saldos (P1)
Como operador, quero ver em uma tabela o total, a quota de cada pessoa, o total comprometido e o saldo disponível em dinheiro e benefício.

**Aceite:** atualização imediata após editar; subtotal por grupo; nunca apresentar previsões como pagamentos realizados; nenhum saldo de vale somado a saldo em dinheiro.

### US04 — Planejar percentuais e metas (P1)
Como operador, quero usar 60% necessidades / 15% lazer / 25% objetivos como referências editáveis, sem obrigar gasto integral.

**Aceite:** percentuais e limites visíveis; as compras de móveis são uma meta de poupança/compra, não necessariamente aplicação financeira; saldo não alocado exibido.

### US05 — Preservar dados e histórico (P1)
Como operador, quero rever meses anteriores e exportar/importar backup para não perder o orçamento ao trocar de navegador.

**Aceite:** fechamento mensal imutável, salvo reabertura explícita; exportar JSON com versão; pré-visualizar importação e confirmar substituição; não perder dados ao recarregar a página.

### US06 — Registrar quem pagou (P2)
Como operador, quero indicar quando a despesa foi paga e por quem, para diferenciar *quota de responsabilidade* e *adiantamento realizado*.

**Aceite:** estado previsto/pago, data opcional, pagador, saldo a acertar; nunca confundir total pago e total orçado.

## 4. Requisitos funcionais (RF)

| ID | Requisito verificável | Prioridade |
|---|---|---|
| RF01 | Criar, editar e desativar participantes preservando histórico | P1 |
| RF02 | Registrar múltiplas fontes de renda por pessoa (dinheiro/benefício, recorrente/pontual) | P1 |
| RF03 | Escolher mês; renda e despesas pontuais pertencem a período explícito | P1 |
| RF04 | Cadastrar, editar, excluir e categorizar despesas | P1 |
| RF05 | Marcar despesa como individual ou compartilhada | P1 |
| RF06 | Ratear despesas compartilhadas proporcionalmente à renda líquida de dinheiro do mês | P1 |
| RF07 | Permitir rateio igualitário ou manual validado | P1 |
| RF08 | Separar fontes de pagamento e tipos de benefício, com validação de elegibilidade/saldo | P1 |
| RF09 | Mostrar tabela com total, quotas de cada participante, subtotais e saldo individual | P1 |
| RF10 | Mostrar limites 60/15/25 editáveis versus **compromissos planejados**; pagamentos efetivamente realizados entram apenas em RF14/P2 | P1 |
| RF11 | Manter metas individuais ou compartilhadas (casa, reserva, carro etc.) | P1 |
| RF12 | Persistir dados localmente e permitir backup versionado, validado integralmente, com prévia, confirmação e importação atômica sem perda do estado anterior em erro | P1 |
| RF13 | Fechar e consultar meses sem alteração retroativa silenciosa | P1 |
| RF14 | Registrar pagamento, pagador e eventual ajuste de saldos (acerto) | P2 |
| RF15 | Fornecer impressão/exportação simples do resumo mensal, sem expor dados desnecessários | P2 |

## 5. Regras de negócio (RN)

| ID | Invariante |
|---|---|
| RN01 | Proporção = renda líquida **em dinheiro** da pessoa / soma de rendas líquidas **em dinheiro** dos participantes ativos e elegíveis no mês. Benefícios não entram nesse denominador. |
| RN02 | O rateio é calculado por despesa e expresso em centavos; a soma das quotas deve ser igual ao valor da despesa. A alocação dos centavos residuais usa maior resto e desempate por ID estável. |
| RN03 | Despesas individuais são 100% atribuídas à pessoa escolhida; outras pessoas não contribuem automaticamente. |
| RN04 | Quando a soma das rendas em dinheiro é zero, bloquear *somente* o cálculo proporcional e oferecer alternativas explícitas; não dividir por zero nem presumir igualdade. |
| RN05 | Participante com renda em dinheiro zero pode permanecer no grupo; sua quota proporcional é zero se houver outros com renda positiva. |
| RN06 | Benefícios são vinculados aos respectivos titulares, com modalidade (alimentação, refeição ou flexível) e uso apenas em despesas elegíveis. Nunca transferir saldo de vale entre pessoas por inferência. |
| RN07 | Primeiro determinar a quota por pessoa, depois abater somente benefício próprio elegível. O consumo do vale é determinístico por mês, data prevista e ID da despesa, com prioridade ajustável pelo operador. Falta de saldo aparece como quota em dinheiro ou pendente, mediante escolha explícita, sem redistribuir obrigação. |
| RN08 | O orçamento 60/15/25 é **referência** de destinação do dinheiro; não é ordem para gastar 100% da renda. Percentuais editáveis e validados conforme modo escolhido. |
| RN09 | Objetivos financeiros são apropriações planejadas; não devem ser lançados como pagamentos efetivos até haver registro de transferência/compra correspondente. |
| RN10 | **Disponível planejado** = renda em dinheiro − compromissos previstos em dinheiro − metas previstas (sem dupla dedução). **Saldo efetivo** só existe com registro de pagamentos/aportes realizados (RF14/P2). Saldo em vale é separado. |
| RN11 | Alterar uma renda recalcula o mês aberto e não altera meses fechados, que preservam uma cópia dos parâmetros e quotas. |
| RN12 | Nenhum valor negativo é aceito em despesas ou rendas; estornos/correções usam operações identificadas, a definir quando introduzir realizado. |
| RN13 | Em rateio manual, quotas não negativas devem somar exatamente 100% em termos de valor monetário alocado (centavos), sob pena de erro de validação. |
| RN14 | O período permanece estável até o usuário mudar de mês; novo mês copia apenas itens recorrentes e modelos, não marca pagamentos como realizados. |

## 6. Requisitos não funcionais (RNF)

| ID | Critério |
|---|---|
| RNF01 | Nenhum dado financeiro enviado a servidor/terceiros por funcionamento padrão da versão local. |
| RNF02 | Dados persistidos no mesmo perfil de navegador após recarga, com exportação legível por máquina e aviso explícito de perda possível se apagar dados do navegador. |
| RNF03 | Layout utilizável em 320, 360, 390, 768, 1024 e 1280px, sem corte de controles essenciais. |
| RNF04 | Controles operáveis por teclado, foco visível, labels, mensagens acessíveis, compatibilidade com zoom e redução de movimento. |
| RNF05 | Cálculos executados com centavos inteiros e resultados determinísticos; formato `pt-BR` somente na apresentação. |
| RNF06 | Sem contas, senha, integração bancária ou dependência de serviços pagos no MVP. |
| RNF07 | Importação de backup deve rejeitar estrutura inválida, preservar dados até confirmação e fornecer erros úteis. |
| RNF08 | Resumo do mês com até 200 despesas e 10 participantes deve atualizar sem atraso perceptível em hardware comum; medir no teste real antes de ratificar. |

## 7. Fluxo principal
1. Abrir o sistema → selecionar/criar orçamento local.
2. Cadastrar participantes e fontes de renda/benefícios.
3. Selecionar mês → adicionar despesas recorrentes e pontuais.
4. Escolher responsável e rateio; confirmar meio de pagamento elegível.
5. Visualizar tabela total | por participante, saldos e percentuais.
6. Ajustar valores pela interface; recálculo imediato.
7. Exportar backup; fechar mês apenas quando apropriado.

## 8. Estados e exceções
- Estado inicial vazio com convite para cadastrar participantes e rendas.
- Erro em valores, duplicação/confusão de importação, renda total zero, vale insuficiente/inelegível, histórico fechado, ausência de espaço local e conflitos de versão.
- Deleção: solicitar confirmação; participantes referenciados em meses fechados não podem ser apagados de forma a corromper histórico, mas podem ser desativados.

## 9. Fora de escopo
Login, acesso compartilhado entre dispositivos, banco de dados remoto, pagamentos ou cobranças, projeção inteligente, IA, integração com empregadores/bancos, transferências de vales, apps nativos, telemetria/marketing.

## 10. Dados fictícios para exemplificar (não representam usuários reais)
- Pessoas fictícias: A recebe R$ 2.700 em dinheiro e R$ 550 de benefício; B recebe R$ 3.300 em dinheiro e R$ 750 de benefício.
- Exemplo de aluguel R$ 1.800 (compartilhado); consulta particular de A R$ 150 (individual).
- Despesas de mercado, transporte, lazer, contas e metas são configuráveis; nenhum exemplo constitui valor confirmado de usuário.

## 11. Definição de pronto da especificação (antes do código)
Histórias rastreáveis a RF/RN/RNF, cálculos exemplificados, exceções descritas, requisitos revisados, dúvidas registradas, análise de conformidade inicial e autorização explícita para começar o desenvolvimento. Status atual: **não ratificada**.