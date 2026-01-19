#!/usr/bin/env bash

# the directory where the configs will end up...
lsp_configs_dest="${XDG_CONFIG_HOME:-"${HOME}/.config"}/nvim/lsp"
# and create it if it doesn't exist yet
if [[ ! -d "${lsp_configs_dest}" ]]; then
  mkdir -p "${lsp_configs_dest}"
fi

# remote repo we're getting the configs from
lsp_config_repo="https://raw.githubusercontent.com/neovim/nvim-lspconfig/master"

# the list of LSP configs you want locally
lsp_list=(
  "bashls"
  "clangd"
  "denols"
  "html"
  "lua_ls"
  "nil_ls"
  "rust_analyzer"
  "taplo"
  "tinymist"
)

# for a little summary at the end :) (see the last 3 lines)
results=("LSP:Exit Code\n")

# get each lsp in $lsp_list from the remote repo
for lsp in "${lsp_list[@]}"; do
  curl -fsSL -o "${lsp_configs_dest}/${lsp}.lua" -- "${lsp_config_repo}/lsp/${lsp}.lua"
  results+="${lsp}:$?\n"
done

# show all of the exit codes of the curl calls in a nice way :)
echo
echo -e "${results[@]}" | column -t -s':'
