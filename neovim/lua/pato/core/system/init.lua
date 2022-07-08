local system = {}
local stdpath = vim.fn.stdpath
local config_dir = stdpath("config"):match(".*[/\\]"):sub(1, -2)

system.sep = package.config:sub(1, 1)

-- Root directory, works as a fallback for looking Nvim configurations
system.pato_root = stdpath("config")

-- Configurations root directory
system.pato_configs_root = table.concat({ config_dir, "pato-nvim" }, system.sep)

local testdir = vim.loop.fs_opendir(system.pato_configs_root)
if testdir then
  vim.loop.fs_closedir(testdir)
else
  system.pato_configs_root = stdpath("config")
end

-- Logs file path
system.pato_logs = table.concat({ stdpath("data"), "pato.log" }, system.sep)

-- Bug report file path
system.pato_report = table.concat({ stdpath("data"), "pato_report.md" }, system.sep)

-- Git workspace
system.git_workspace = string.format("git -C %s ", stdpath("config"))

return system