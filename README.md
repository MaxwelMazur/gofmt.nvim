# gofmt.nvim

gofmt.nvim é usada para formatar o código fonte escrito em Go. Ela torna o código mais fácil de ler e manter, além de ajudar a garantir que o código seja consistente com as boas práticas da linguagem.


## Sobre
Este plugin é para formatação automática de arquivos Go no Neovim. Ele verifica se o arquivo atual é do tipo Go antes de executar o comando "gofmt -w" para formatação. Se o arquivo precisar ser salvo antes da formatação, ele será salvo automaticamente. Este plugin é uma abordagem eficiente para manter o código limpo e consistente.

## Instalação
- [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use("MaxwelMazur/gofmt.nvim")
```

## Configuração
```lua
vim.keymap.set("n", "<C-s>", ":lua require('gofmt').format_current_file()<CR>")
```




