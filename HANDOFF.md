# Handoff do projeto — Página (séria) do Renan

Atualizado em 7 de setembro de 2026.

## Visão geral

Este repositório contém a página acadêmica pessoal de Renan Maneli Mezabarba, publicada em:

- Site: https://mezabarbarm.github.io/
- Repositório: https://github.com/mezabarbarm/mezabarbarm.github.io

O propósito do site é reunir, de maneira sóbria, leve e direta:

- perfil institucional e interesses de pesquisa;
- artigos e preprints;
- disciplinas ministradas;
- livros, tese e outros textos;
- materiais de qualificação e concursos;
- minicursos e seminários;
- trabalhos de alunos orientados;
- estampas e imagens matemáticas;
- links úteis e contato.

O público inclui estudantes, pesquisadores, colegas e pessoas que chegam aos materiais por busca ou por links diretos.

## Arquitetura e publicação

O projeto é um site estático, sem framework, pacote, etapa de compilação local ou banco de dados. É composto por HTML, CSS, um pequeno JavaScript e arquivos estáticos.

- Branch de publicação: `main`.
- Hospedagem: GitHub Pages.
- A publicação é acionada automaticamente quando um commit chega ao `main`.
- Não existe `.openai/hosting.json`; não migrar para outro serviço de hospedagem sem solicitação explícita.
- Fluxo usual do usuário: revisar as mudanças locais, fazer commit e sincronizar; depois acompanhar `Actions > pages build and deployment`.
- Se o site não atualizar, comparar o commit em `main` com o workflow do Pages. Em agosto de 2026 houve uma falha externa do GitHub Actions; nesse caso, `Re-run all jobs` foi a solução adequada.

## Arquivos principais

| Arquivo | Função |
| --- | --- |
| `index.html` | Página inicial em português. |
| `en.html` | Página inicial em inglês. |
| `pesquisa.html` | Lista completa de publicações em português. |
| `research.html` | Lista completa de publicações em inglês. |
| `orientacoes.html` | Dissertações e TCCs orientados. |
| `supervised-works.html` | Versão inglesa da página de orientações. |
| `estampas.html` | Página em português para a coleção de imagens matemáticas. |
| `designs.html` | Versão inglesa da página de imagens. |
| `styles.css` | Toda a identidade visual e responsividade. |
| `mobile-menu.js` | Fecha o menu móvel após clique, clique externo ou tecla Esc. |
| `renan-foto.jpg` | Foto usada no cartão de perfil. |
| `README-upload.txt` | Registro resumido dos arquivos e mudanças acumuladas. |

Materiais locais:

- `pdfs/orientacoes/`: quatro trabalhos orientados e autorizados.
- `pdfs/quali-concursos/`: 22 textos de qualificação e concursos.
- `Provisório-Sitge/`: quatro PDFs de minicursos antigos.

## Identidade visual e comportamento

A direção visual é acadêmica, sóbria e calorosa: fundo claro, verde escuro como destaque, serifada nos títulos e sans-serif no corpo. Os tokens principais estão no início de `styles.css`.

O cabeçalho é fixo e contém:

- símbolo `∏` como retorno ao início;
- navegação completa em telas largas;
- botão `Menu` abaixo de `1040px`;
- seletor PT/EN sempre visível.

Ao incluir ou remover uma seção de navegação, atualizar tanto `.nav` quanto `.mobile-nav` em todas as páginas pertinentes. O menu móvel usa `<details>`/`<summary>` para funcionar nativamente e recebe melhorias de interação por `mobile-menu.js`.

Na página inicial, o herói tem duas colunas: título e introdução à esquerda, cartão da foto à direita. A alteração mais recente trocou `align-items: center` por `align-items: start` em `.hero-grid`, alinhando o topo do título ao topo do cartão conforme a referência visual fornecida pelo usuário. Como `index.html` e `en.html` compartilham `styles.css`, o ajuste vale para as duas versões.

## Convenções editoriais

- Manter paridade de conteúdo entre português e inglês.
- Na versão inglesa, indicar textos disponíveis apenas em português com `[in Portuguese]`.
- Na versão portuguesa, não é necessário avisar quando um texto estiver em inglês.
- O nome da seção de produção textual é **Livros e afins** / **Books and related texts**.
- O título principal é **Página (séria) do Renan** / **Renan's (serious) page**.
- Não restaurar o antigo subtítulo “Ensino, pesquisa...” no topo.
- Links para PDFs devem abrir em nova aba com `target="_blank"` e `rel="noopener noreferrer"`.
- Preferir URLs que entreguem o PDF diretamente, sem passar pela tela de arquivo do GitHub.
- Preservar títulos acadêmicos e nomes de autores exatamente como aparecem nos documentos.
- Ao acrescentar um material de aluno, confirmar autorização pública antes de colocar o PDF no GitHub Pages.

## Conteúdo e decisões já implementadas

### Perfil e ensino

- Universidade Estadual de Santa Cruz é link para https://www.uesc.br/.
- Ilhéus-BA é link para uma pesquisa de imagens da cidade.
- A trajetória profissional lista UFMS, UFES e UESC.
- As disciplinas de 2023 a 2026 foram recuperadas do Currículo Lattes/informações fornecidas pelo usuário.

### Pesquisa

- As páginas iniciais exibem trabalhos recentes.
- `pesquisa.html` e `research.html` contêm a lista completa.
- O trabalho mais recente adicionado foi **Menger and Rothberger games on convergence spaces**, de Renan Maneli Mezabarba e Rodrigo Santos Monteiro: https://arxiv.org/abs/2608.22600.
- Também há artigo publicado na Filomat e outros preprints no arXiv.

### Livros e afins

- **Teoria dos Conjuntos: uma Introdução Maliciosa** aponta para a editora e registra a condição de finalista do Prêmio Jabuti Acadêmico 2026.
- **Fundamentos de Topologia Geral** e **As aventuras de Alice no país das convergências** têm PDFs públicos.
- **Um curso fechado e limitado de Análise Real** permanece listado como obra no prelo, mas seu PDF foi deliberadamente retirado e não deve ser restaurado sem pedido explícito.
- A tese de doutorado **Selection principles in hyperspaces** aponta para o PDF oficial da USP.

### Qualificação, concursos e minicursos

- Há 22 PDFs locais de textos para qualificação e concursos.
- Minicursos sem PDF de 2018 e 2021 foram removidos por solicitação do usuário.
- Permanecem cinco materiais de minicursos/seminários, de 2015, 2016, 2016, 2020 e 2026.
- O material de 2026 corresponde à XII Bienal de Matemática, em Natal.

### Trabalhos orientados

Os quatro arquivos estão autorizados, hospedados em `pdfs/orientacoes/` e linkados nas páginas em português e inglês:

1. Samilla Tavares Santana — **Aspectos categóricos dos espaços de convergência** — TCC, UESC, 2026.
2. João Marcos Falcão Perim — **Espaços de convergência e aplicações** — dissertação de mestrado, UFES, 2025.
3. Gabriel França Santos — **Uma pequena introdução aos grandes cardinais** — TCC, UESC, 2024.
4. Rodrigo Santos Monteiro — **Algebraic Topology without open sets: A net approach to homotopy theory in limit spaces** — TCC, UESC, 2024.

Em 7 de setembro de 2026 foi confirmado que:

- `orientacoes.html` público contém o link da dissertação de João;
- o endereço público do PDF responde com HTTP 200 e `Content-Type: application/pdf`;
- o arquivo público tem 1.021.562 bytes.

### Estampas matemáticas

A página antiga no Google Sites apontava para uma pasta pública do Dropbox. As páginas `estampas.html` e `designs.html` preservam esse acesso:

https://www.dropbox.com/sh/jseoao5sw3xsg1g/AACh_lq6Qwbb_pf5bFdsOE8Ja?dl=0

A pasta deve conter apenas material destinado à divulgação pública. O usuário decidiu que o link externo é aceitável por enquanto; uma migração das imagens para o próprio repositório é apenas uma possibilidade futura, não uma pendência obrigatória.

### Links úteis

Manter em bullets separados:

- Quiver;
- Acta Legalicus;
- Seminário de Coisas Legais.

## Estado no momento deste handoff

- Branch local: `main`.
- Último commit sincronizado antes deste ajuste: `df38f56` (`celular interface + outras coisas`).
- `origin/main` estava no mesmo commit antes da alteração de alinhamento.
- O site público já continha o menu móvel, a dissertação do João e o link correto para ela.
- Mudança pendente deste atendimento: `styles.css` com o alinhamento superior do título/cartão.
- Este próprio `HANDOFF.md` também é novo e deve ser incluído no próximo commit se o usuário quiser mantê-lo no repositório.

Antes de encerrar ou publicar mudanças futuras:

1. executar `git diff --check`;
2. conferir se links locais e fragmentos existem;
3. manter equivalência entre menus desktop e móvel;
4. revisar as páginas PT e EN afetadas;
5. após o push, aguardar o workflow do GitHub Pages ficar verde;
6. testar a URL pública com atualização forçada se houver suspeita de cache.

## Preferências de colaboração do usuário

- O usuário gosta de discutir nomes e escolhas editoriais antes de mudanças mais subjetivas.
- Para pedidos objetivos de implementação, prefere que a alteração seja feita diretamente e depois resumida de forma concisa.
- Valoriza links que abrem diretamente o recurso desejado e uma página leve, sem excesso de texto ou elementos visuais.
- Respostas e documentação podem ser em português informal, claro e amistoso.
