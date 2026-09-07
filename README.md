# mezabarbarm.github.io

Página acadêmica estática de Renan Maneli Mezabarba, em português e inglês.
Hospedagem: GitHub Pages. Contexto e decisões editoriais: [HANDOFF.md](HANDOFF.md).

## Conferência de links

No PowerShell, executar `./scripts/check-links.ps1` para verificar arquivos e
âncoras locais, ou `./scripts/check-links.ps1 -External` para consultar também
os endereços externos, sem baixar os PDFs inteiros.

Após o envio ao GitHub, o workflow **Conferir links** verifica referências
locais em pushes ao `main` e pull requests. Às segundas-feiras e pelo botão
**Run workflow**, verifica também links externos. Arquivos/âncoras ausentes e
respostas HTTP 404/410 fazem a verificação falhar; bloqueios de robôs, limites
de acesso e falhas temporárias aparecem como avisos para conferência manual.
O workflow não altera arquivos nem publica o site.
