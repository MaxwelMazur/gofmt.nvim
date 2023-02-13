local M = {}

local function list_to_set(list)
  local set = {}

  for _, item in ipairs(list) do
    set[item] = true
  end

  return set
end

local function is_excluded_ft(opts)
  local ft = vim.api.nvim_buf_get_option(0, "filetype")
  local ft_set = list_to_set(opts.filetype_exclude)

  return ft_set[ft]
end

local function reset_cursor_pos(pos)
  local num_rows = vim.api.nvim_buf_line_count(0)

  --[[
        if the row value in the original cursor
        position tuple is greater than the
        line count after empty line deletion
        (meaning that the cursor was inside of
        the group of empty lines at the end of
        the file when they were deleted), set
        the cursor row to the last line.
    ]]
  if pos[1] > num_rows then
    pos[1] = num_rows
  end

  vim.api.nvim_win_set_cursor(0, pos)
end

function M.setup(opts)
  print("escrevendo....")
  -- local defaults = {
  --   filetype_exclude = {},
  -- }

  -- opts = vim.tbl_extend("force", defaults, opts or {})

  -- local tidy_grp = vim.api.nvim_create_augroup("tidy", { clear = true })

  -- vim.api.nvim_create_autocmd("BufWritePre", {
  --   group = tidy_grp,
  --   callback = function()
  --     if is_excluded_ft(opts) then
  --       return false
  --     end

  --     local cursor_pos = vim.api.nvim_win_get_cursor(0)

  --     -- delete trailing whitespace
  --     vim.cmd([[:keepjumps keeppatterns %s/\s\+$//e]])

  --     -- delete lines @ eof
  --     vim.cmd([[:keepjumps keeppatterns silent! 0;/^\%(\n*.\)\@!/,$d_]])

  --     reset_cursor_pos(cursor_pos)
  --   end,
  -- })
end

function M.format_current_file(opts)
  local extension = vim.fn.expand("%:e")
  if extension == "go" then
    local fileName = vim.api.nvim_buf_get_name(0)
    local command = "gofmt -w " .. fileName
    os.execute(command)
  end
end

function M.escreve()
  print("escrevendo....")
end

-- "MaxwelMazur/gofmt.nvim",
-- config = function()
--   require("gofmt").setup({
--     filetype_exclude = { "markdown", "diff" },
--   })
-- end,

return M
