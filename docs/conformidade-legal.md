# Divide Ai — matriz inicial de conformidade

**Jurisdição:** Brasil. **Data da consulta:** 2026-11-23. **Status:** revisão documental preliminar, não parecer jurídico nem homologação.

## Finalidade, público e fluxo de dados
MVP de orçamento pessoal doméstico: um operador único cadastra apelidos, rendas, vales, despesas e metas em armazenamento local do navegador. Sem login, backend, IA, integração bancária ou telemetria no escopo. O público inicial é quem administra as próprias finanças; a disponibilização futura como serviço terá análise própria.

| Norma/tema | Fonte oficial ou acervo | Aplicabilidade e requisito rastreável | Evidência e estado |
|---|---|---|---|
| LGPD — Lei 13.709/2018, art. 4º, I | https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709compilado.htm | Exclui tratamento por pessoa natural para fins exclusivamente particulares e não econômicos. Não presumir que a exceção alcança um futuro serviço público/comercial. RNF01/RNF06: não enviar dados financeiros e minimizar coleta. | Texto oficial consultado; enquadramento de uso real depende de ratificação e revisão em expansão. |
| LGPD — arts. 6º e 46, se aplicáveis | Mesma fonte oficial | Reavaliar base legal, finalidade, informação, retenção, segurança e direitos se houver serviço com tratamento de dados de terceiros. RNF01/RNF07, ADR futuro para nuvem. | Condicional; não considerada obrigação automaticamente aplicável a todo uso doméstico. |
| LBI — Lei 13.146/2015, art. 63 | https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2015/lei/l13146.htm | Obrigação de acessibilidade a sítios mantidos por empresas com sede/representação comercial no Brasil ou órgãos públicos. Para o MVP doméstico, manter acessibilidade por qualidade sem pressupor enquadramento automático. RNF03/04 e tarefas T010/T040. | Texto oficial consultado; testes de acessibilidade ainda não executados. |
| Direito autoral e licenças de software | Avaliação por dependência, em F1 | Antes de instalar React/Vite/Tailwind/ícones, avaliar licença e origem da versão efetivamente adotada. | Pendente. |
| Banco, pagamento e crédito | Escopo do MVP documentado | O aplicativo calcula divisão de gastos; não transaciona recursos, presta crédito nem transfere vale. Qualquer mudança requer triagem própria. | Fora do escopo atual. |

## Acervo obrigatório da Constituição de Engenharia
O acervo https://github.com/ctresb/leis foi consultado por sua descrição e cobertura geral. Não foi localizada e verificada nesta etapa uma cópia específica de cada lei com seus metadados de vigência; **não** tratar esse acervo como validação textual substituta das fontes oficiais.

## Controle de riscos
- Dados fictícios nos exemplos do repositório público; não publicar salários reais, credenciais ou exportações de usuários.
- Não usar recursos de CDN nem telemetria que revelem despesas ou vales durante o uso padrão.
- Backup: validação antes da importação, confirmação explícita, rollback/atomicidade e orientação sobre perda de dados locais.
- O acesso ao mesmo perfil de navegador pode expor dados: incluir aviso de dispositivo compartilhado e opção de apagar dados locais.
- Reavaliar conformidade na implementação, em mudanças funcionais e antes de release.

**Responsável pela ratificação:** mantenedor do projeto. **Estado:** pendente. Nenhum teste, auditoria formal ou aprovação jurídica foi executado.