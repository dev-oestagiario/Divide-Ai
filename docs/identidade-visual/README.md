# Divide Ai — identidade visual / conceito B

**Status:** direção B selecionada pelo responsável; masters SVG registrados neste PR de documentação. Não há implementação de frontend, merge ou release.

## Conceito
Monograma geométrico **D** com abertura horizontal à esquerda e contraforma central. A marca comunica divisão e organização sem recorrer a moedas ou gráficos. Construída como formas vetoriais, sem imagens raster ou dependência de fontes.

## Paleta
| Finalidade | Cor |
|---|---|
| Fundo roxo-profundo | `#1B103D` |
| Violeta primário | `#683CEC` |
| Realce opcional | `#966CFF` |
| Fundo claro | `#FAF9FE` |
| Branco | `#FFFFFF` |

## Mestres SVG
- `icone-app.svg`: ícone principal com detalhe lavanda na curva.
- `icone-app-sem-detalhe.svg`: versão simplificada de alta legibilidade.
- `favicon.svg`: preferível em tamanhos pequenos.
- `icone-fundo-claro.svg` e `icone-fundo-escuro.svg`: variantes para temas.
- `simbolo-roxo.svg`, `simbolo-preto.svg`, `simbolo-branco.svg`: versões transparentes/monocromáticas.

## Uso e acessibilidade
- Preferir `favicon.svg` em 16/32/48 px; `icone-app.svg` a partir de 64 px.
- Preservar proporções e área de respiro mínima de 12,5% da largura.
- Usar símbolo branco sobre fundo profundo, violeta sobre fundo claro.
- Não adicionar sombras/rotações, não distorcer nem usar cores com contraste insuficiente.
- A identidade deverá ser validada visualmente em tema claro/escuro e viewports reais durante a futura F1.
- Nome visual: **Divide Ai**. Referências antigas a “Dividi” nas specs continuam como nome provisório até harmonização ratificada.

## Artefatos locais de entrega
Além dos mestres SVG, foi preparado um pacote na conversa com PNGs de 16–1024px, `favicon.ico`, webmanifest, lockups vetoriais com lettering convertido em paths, previews e guia. Apenas os SVGs de ícone e este guia são versionados aqui neste momento: os assets de runtime e PWA serão integrados somente na F1 autorizada.

## Origem e governança
Processo baseado nas diretrizes de [Logo Design Skill](https://github.com/kaankiziltug/logo-design-skill): escolha entre conceitos, clareza de geometria e verificação de leitura pequena/monocromática. O SVG é original; não foi copiado de marcas de referência. Não há garantia de exclusividade nem pesquisa conclusiva de marca registrada. Não foi necessário instalar a skill nem adicionar dependências à aplicação.

A seleção estética da opção B não ratifica Constituição/ADRs da F0, não libera F1 e não autoriza merge/publicação.
