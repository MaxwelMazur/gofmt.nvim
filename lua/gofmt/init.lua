local M = {}

function M.format_current_file()
  local extension = vim.fn.expand("%:e")
  if extension == "go" then
    local fileName = vim.api.nvim_buf_get_name(0)
    local command = "gofmt -w " .. fileName
    os.execute(command)
    vim.api.nvim_command("write")
    vim.api.nvim_command("edit")
  end
end

return M
