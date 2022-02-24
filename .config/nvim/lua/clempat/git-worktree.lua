local Worktree = require("git-worktree")

local function has_yarn(path)
  -- local found = path:find(vim.env["PORTAL"])
  -- return type(found) == "number" and found > 0
  return false
end

local M = {}
function M.execute(path, just_build)
  if is_portal(path) then
    --vim.cmd(string.format("!cp .env.exampe .env"))
    vim.cmd(string.format(":silent !yarn install"))
  end
end

Worktree.on_tree_change(function(_ --[[op]], path, _ --[[upstream]])
  M.execute(path.path)
end)

return M
