local status_ok, jdtls = pcall(require, 'jdtls')
if not status_ok then
  return
end

-- Find workspace dir (so multiple projects don't clash)
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath 'data' .. '/jdtls-workspace/' .. project_name

-- Paths (these come from Mason installs)
local jdtls_path = vim.fn.stdpath 'data' .. '/mason/packages/jdtls'
local config_path = jdtls_path .. '/config_mac' -- change to config_linux / config_win if needed
local launcher_jar = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')

local config = {
  cmd = {
    vim.fn.expand '$JAVA_HOME/bin/java', -- must be Java 17+ (e.g., Java 21 works)
    '-jar',
    launcher_jar,
    '-configuration',
    config_path,
    '-data',
    workspace_dir,
  },
  root_dir = vim.fs.root(0, { 'mvnw', 'gradlew', '.git' }), -- project root markers
}

jdtls.start_or_attach(config)
