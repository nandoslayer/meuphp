# Meu PHP App no EasyPanel

Este é um exemplo de aplicação PHP com Apache rodando via Docker no EasyPanel.

## Como usar:

1. No EasyPanel, crie um novo app.
2. Aponte para este repositório (ou clone para o seu Git).
3. Configure a porta interna: `80` e externa: `8080` ou outra.
4. Deploy e pronto! 🎉

O Dockerfile já configura:
- PHP com timezone São Paulo
- Apache com VirtualHost apontando para `/app`
