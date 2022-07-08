-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/schuyler/snap/alacritty/common/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/schuyler/snap/alacritty/common/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/schuyler/snap/alacritty/common/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/schuyler/snap/alacritty/common/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/schuyler/snap/alacritty/common/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\2\nM\0\0\3\2\4\0\r-\0\0\0009\0\0\0)\2\1\0B\0\2\2\15\0\0\0X\1\2�'\0\1\0X\1\4�-\0\1\0009\0\2\0'\2\3\0B\0\2\2L\0\2\0\1�\0�\n<Tab>\6t\5\tjumpO\0\0\3\2\4\0\r-\0\0\0009\0\0\0)\2��B\0\2\2\15\0\0\0X\1\2�'\0\1\0X\1\4�-\0\1\0009\0\2\0'\2\3\0B\0\2\2L\0\2\0\1�\0�\f<S-Tab>\6t\5\tjump�\2\1\0\t\0\18\0'6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\4\5\0B\2\2\0016\2\0\0'\4\6\0B\2\2\0029\2\a\2B\2\1\0013\2\b\0003\3\t\0009\4\n\0'\6\v\0\18\a\2\0005\b\f\0B\4\4\0019\4\r\0'\6\v\0\18\a\2\0005\b\14\0B\4\4\0019\4\n\0'\6\15\0\18\a\3\0005\b\16\0B\4\4\0019\4\r\0'\6\15\0\18\a\3\0005\b\17\0B\4\4\0012\0\0�K\0\1\0\1\0\1\texpr\2\1\0\1\texpr\2\f<S-Tab>\1\0\1\texpr\2\tsmap\1\0\1\texpr\2\n<Tab>\timap\0\0\tload luasnip/loaders/from_vscode\1\0\2\fhistory\2\17updateevents\29TextChanged,TextChangedI\15set_config\vconfig\fluasnip\24pato.utils.mappings\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip",
    wants = { "friendly-snippets" }
  },
  ["TrueZen.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\6\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\0025\3\15\0005\4\f\0005\5\r\0=\5\14\4=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\tmisc\1\0\3\25ui_elements_commands\1\20on_off_commands\1\19cursor_by_mode\1\17integrations\1\0\3\20nvim_bufferline\2\15galaxyline\2\ttmux\2\nmodes\nfocus\1\0\2\20margin_of_error\3\5\17focus_method\17experimental\rataraxis\1\0\0\29ideal_writing_area_width\1\2\0\0\3\0\1\0\b\16top_padding\3\0\17left_padding\3\30\21bg_configuration\2\22just_do_it_for_me\2\18right_padding\3\30 keep_default_fold_fillchars\2\19bottom_padding\3\0\15custome_bg\5\aui\1\0\0\tleft\1\0\3\15signcolumn\ano\19relativenumber\1\vnumber\1\btop\1\0\1\16showtabline\3\0\vbottom\1\0\0\1\0\5\fshowcmd\1\14cmdheight\3\1\15laststatus\3\0\nruler\1\rshowmode\1\nsetup\rtrue-zen\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/TrueZen.nvim",
    url = "https://github.com/Pocco81/TrueZen.nvim"
  },
  aniseed = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/aniseed",
    url = "https://github.com/Olical/aniseed"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n/\0\1\5\0\4\0\0056\1\0\0009\1\1\1'\3\2\0009\4\3\0D\1\3\0\aid\a%s\vformat\vstringE\0\1\2\0\4\0\t6\1\0\0009\1\1\0018\1\0\0019\1\2\1\6\1\3\0X\1\2�+\1\2\0L\1\2\0K\0\1\0\14dashboard\rfiletype\abo\bvim�\5\1\0\6\0\15\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\4\0003\4\3\0=\4\5\0033\4\6\0=\4\a\0034\4\5\0005\5\b\0>\5\1\0045\5\t\0>\5\2\0045\5\n\0>\5\3\0045\5\v\0>\5\4\4=\4\f\3=\3\14\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\rfiletype\vpacker\15text_align\vcenter\ttext\20Plugins Manager\1\0\3\rfiletype\fOutline\15text_align\vcenter\ttext\fSymbols\1\0\3\rfiletype\nnetrw\15text_align\vcenter\ttext\18File Explorer\1\0\3\rfiletype\rNvimTree\15text_align\vcenter\ttext\18File Explorer\18custom_filter\0\fnumbers\1\0\15\24persist_buffer_sort\2\25enforce_regular_tabs\2\16color_icons\2\28show_buffer_close_icons\2\20show_close_icon\2\22show_buffer_icons\2\16diagnostics\rnvim_lsp\20max_name_length\3\18\22max_prefix_length\3\15\27always_show_bufferline\2\rtab_size\3\18\fsort_by\14directory\24show_tab_indicators\2\20separator_style\nthick\29show_buffer_default_icon\2\0\nsetup\15bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/schuyler/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/schuyler/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/home/schuyler/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/schuyler/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n�\20\0\0\v\0$\0F6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0016\2\0\0'\4\5\0B\2\2\0029\2\6\2'\3\a\0&\2\3\2=\2\4\0016\1\2\0009\1\3\1'\2\t\0=\2\b\0014\1\b\0005\2\v\0>\2\1\0015\2\f\0>\2\2\0015\2\r\0>\2\3\0015\2\14\0>\2\4\0015\2\15\0>\2\5\0015\2\16\0>\2\6\0015\2\17\0>\2\a\1=\1\n\0005\1\19\0'\2\20\0006\3\2\0009\3\21\0039\3\22\3'\5\23\0006\6\2\0009\6\21\0069\6\24\0066\b\2\0009\b\21\b9\b\25\b6\n\2\0009\n\3\n9\n\26\nB\b\2\0A\6\0\0A\3\1\2'\4\27\0&\2\4\2>\2\2\1'\2\28\0006\3\2\0009\3\29\0036\5\30\0B\3\2\2\21\3\3\0'\4\31\0&\2\4\2>\2\3\1=\1\18\0+\1\1\0=\1 \0+\1\1\0=\1!\0005\1#\0=\1\"\0K\0\1\0\1\17\0\0002█▀█ ▄▀█ ▀█▀ █▀█2█▀▀ █▀█ ░█░ █▄█\5_⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿_⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣉⡥⠶⢶⣿⣿⣿⣿⣷⣆⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿_⣿⣿⣿⣿⣿⣿⣿⡿⢡⡞⠁⠀⠀⠤⠈⠿⠿⠿⠿⣿⠀⢻⣦⡈⠻⣿⣿⣿⣿⣿_⣿⣿⣿⣿⣿⣿⣿⡇⠘⡁⠀⢀⣀⣀⣀⣈⣁⣐⡒⠢⢤⡈⠛⢿⡄⠻⣿⣿⣿⣿_⣿⣿⣿⣿⣿⣿⣿⡇⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠉⠐⠄⡈⢀⣿⣿⣿⣿_⣿⣿⣿⣿⣿⣿⣿⠇⢠⣿⣿⣿⣿⡿⢿⣿⣿⣿⠁⢈⣿⡄⠀⢀⣀⠸⣿⣿⣿⣿_⣿⣿⣿⣿⡿⠟⣡⣶⣶⣬⣭⣥⣴⠀⣾⣿⣿⣿⣶⣾⣿⣧⠀⣼⣿⣷⣌⡻⢿⣿_⣿⣿⠟⣋⣴⣾⣿⣿⣿⣿⣿⣿⣿⡇⢿⣿⣿⣿⣿⣿⣿⡿⢸⣿⣿⣿⣿⣷⠄⢻_⡏⠰⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⢂⣭⣿⣿⣿⣿⣿⠇⠘⠛⠛⢉⣉⣠⣴⣾_⣿⣷⣦⣬⣍⣉⣉⣛⣛⣉⠉⣤⣶⣾⣿⣿⣿⣿⣿⣿⡿⢰⣿⣿⣿⣿⣿⣿⣿⣿_⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡘⣿⣿⣿⣿⣿⣿⣿⣿⡇⣼⣿⣿⣿⣿⣿⣿⣿⣿_⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢸⣿⣿⣿⣿⣿⣿⣿⠁⣿⣿⣿⣿⣿⣿⣿⣿⣿\5\18custom_header\20hide_statusline\17hide_tabline\14 plugins.\19packer_plugins\rtbl_keys\17🎉 loaded \14 seconds.\15start_time\freltime\17reltimefloat\t%.3f\vprintf\afn\25Pato Nvim loaded in \1\2\0\0\5\18custom_footer\1\0\4\rshortcut\fSPC d d\tdesc$Open Documentation             \ticon\n  \vaction3lua require('pato.core.functions').open_docs()\1\0\4\rshortcut\fSPC d c\tdesc$Open Private Configuration     \ticon\n  \vaction5lua require('pato.core.functions').edit_config()\1\0\4\rshortcut\fSPC f g\tdesc$Find Word                      \ticon\n  \vaction1lua require('telescope.builtin').live_grep()\1\0\4\rshortcut\fSPC f f\tdesc$Find File                      \ticon\n  \vaction2lua require('telescope.builtin').find_files()\1\0\4\rshortcut\fSPC s m\tdesc$Jump to Bookmark               \ticon\n  \vaction-lua require('telescope.builtin').marks()\1\0\4\rshortcut\fSPC f r\tdesc$Recently Opened Files          \ticon\n  \vaction0lua require('telescope.builtin').oldfiles()\1\0\4\rshortcut\fSPC s r\tdesc$Load Last Session              \ticon\n  \vaction5lua require('persistence').load({ last = true })\18custom_center\14telescope dashboard_default_executive\14/sessions\14pato_root\21pato.core.system dashboard_session_directory\6g\bvim\14dashboard\frequire\0" },
    loaded = true,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n\20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t▊ �\4\0\0\6\1#\0_5\0\1\0-\1\0\0'\3\0\0B\1\2\2=\1\2\0-\1\0\0'\3\3\0B\1\2\2=\1\4\0-\1\0\0'\3\5\0B\1\2\2=\1\6\0-\1\0\0'\3\5\0B\1\2\2=\1\a\0-\1\0\0'\3\5\0B\1\2\2=\1\b\0-\1\0\0'\3\t\0B\1\2\2=\1\n\0-\1\0\0'\3\0\0B\1\2\2=\1\v\0-\1\0\0'\3\f\0B\1\2\2=\1\r\0-\1\0\0'\3\f\0B\1\2\2=\1\14\0-\1\0\0'\3\f\0B\1\2\2=\1\15\0-\1\0\0'\3\16\0B\1\2\2=\1\17\0-\1\0\0'\3\t\0B\1\2\2=\1\18\0-\1\0\0'\3\t\0B\1\2\2=\1\19\0-\1\0\0'\3\0\0B\1\2\2=\1\20\0-\1\0\0'\3\0\0B\1\2\2=\1\21\0-\1\0\0'\3\22\0B\1\2\2=\1\23\0-\1\0\0'\3\22\0B\1\2\2=\1\24\0-\1\0\0'\3\22\0B\1\2\2=\1\25\0-\1\0\0'\3\0\0B\1\2\2=\1\26\0-\1\0\0'\3\0\0B\1\2\2=\1\27\0006\1\28\0009\1\29\0019\1\30\1'\3\31\0006\4\28\0009\4 \0049\4!\4B\4\1\0028\4\4\0B\4\1\2&\3\4\3B\1\2\1'\1\"\0L\1\2\0\2�\n  \tmode\afn\27hi GalaxyViMode guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\aic\vyellow\6\19\6S\6s\vorange\ano\6c\fmagenta\6V\6\22\6v\tblue\6i\ngreen\6n\1\0\0\bred�\4\1\0\15\0\28\1>6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0016\2\0\0'\4\4\0B\2\2\0029\2\5\0026\3\0\0'\5\6\0B\3\2\0026\4\0\0'\6\a\0B\4\2\0026\5\0\0'\a\b\0B\5\2\0026\6\0\0'\b\t\0B\6\2\0029\a\n\0035\b\f\0=\b\v\0039\b\r\a5\t\20\0005\n\15\0003\v\14\0=\v\16\n4\v\3\0\18\f\2\0'\14\17\0B\f\2\2>\f\1\v\18\f\2\0'\14\18\0B\f\2\0?\f\0\0=\v\19\n=\n\21\t>\t\1\b9\b\r\a5\t\26\0005\n\23\0003\v\22\0=\v\16\n5\v\25\0\18\f\2\0'\14\24\0B\f\2\2>\f\1\v\18\f\2\0'\14\18\0B\f\2\2>\f\2\v=\v\19\n=\n\27\t>\t\2\b2\0\0�K\0\1\0\vViMode\1\0\0\1\4\0\0\0\0\tbold\bred\1\0\0\0\16RainbowLeft\1\0\0\14highlight\abg\tblue\rprovider\1\0\0\0\tleft\1\a\0\0\rNvimTree\vpacker\fminimap\fOutline\15toggleterm\nnetrw\20short_line_list\fsection\25galaxyline.condition galaxyline.providers.buffer\29galaxyline.providers.lsp\15galaxyline\14get_color\29galaxyline.themes.colors\vconfig\21pato.core.config\15pato.utils\frequire\5����\4\0" },
    loaded = true,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/NTBBloodbath/galaxyline.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\r\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\a\0009\4\5\0009\4\6\4=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\3B\1\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\6\0\0\thelp\14dashboard\vpacker\tnorg\rPatoInfo\fenabled\1\0\2\tchar\b│\28show_first_indent_level\2\16show_indent\tpato\nsetup\21indent_blankline\vconfig\21pato.core.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\4\0\a\0\f5\0\0\0005\1\1\0=\1\2\0004\1\0\0=\1\3\0006\1\4\0'\3\5\0B\1\2\0029\1\6\1\18\3\0\0B\1\2\1K\0\1\0\nsetup\18lsp_signature\frequire\24extra_trigger_chars\17handler_opts\1\0\1\vborder\vsingle\1\0\17\15max_height\3\f\fpadding\5\vzindex\3�\1\ndebug\1\tbind\2\17shadow_guibg\nBlack\17shadow_blend\3$\rlog_path\24debug_log_file_path\17hi_parameter\vSearch\16hint_scheme\vString\16hint_prefix\t \16hint_enable\2\ffix_pos\1#floating_window_above_cur_line\2\20floating_window\1\14doc_lines\3\n\14max_width\3x\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n�\1\0\0\a\0\a\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\6\0\18\4\0\0'\6\5\0B\4\2\2\15\0\4\0X\5\0�B\1\2\1K\0\1\0\1\0\4\21enable_moveright\2\22enable_afterquote\2\rcheck_ts\2\30enable_check_bracket_line\2\15treesitter\nsetup\19nvim-autopairs\23is_plugin_disabled\15pato.utils\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp_luasnip", "cmp-nvim-lsp", "cmp-buffer", "cmp-path" },
    config = { "\27LJ\2\n\21\0\1\2\1\0\0\3-\1\0\0008\1\0\1L\1\2\0\2�F\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvim�\1\0\0\6\0\b\2\0276\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\17�6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2X\2\3�+\1\1\0X\2\1�+\1\2\0L\1\2\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0�\1\0\2\b\1\n\0\0236\2\1\0009\2\2\2'\4\3\0-\5\0\0009\a\0\1B\5\2\0029\6\0\1B\2\4\2=\2\0\0015\2\5\0009\3\6\0009\3\a\0038\2\3\2=\2\4\0015\2\t\0009\3\6\0009\3\a\0038\2\3\2\14\0\2\0X\3\1�)\2\0\0=\2\b\1L\1\2\0\3�\1\0\3\vbuffer\3\1\rnvim_lsp\3\0\tpath\3\1\bdup\tname\vsource\1\0\5\vbuffer\n[Buf]\rnvim_lsp\n[LSP]\rnvim_lua\n[Lua]\tpath\v[Path]\fluasnip\n[Snp]\tmenu\n%s %s\vformat\vstring\tkind�\2\0\1\6\4\n\0'-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\29�-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\t�6\1\3\0009\1\4\0019\1\5\1-\3\2\0'\5\6\0B\3\2\2'\4\a\0B\1\3\1X\1\15�-\1\3\0B\1\1\2\15\0\1\0X\2\t�6\1\3\0009\1\4\0019\1\5\1-\3\2\0'\5\b\0B\3\2\2'\4\t\0B\1\3\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\1�\4�\5�\6n\n<Tab>\5!<Plug>luasnip-expand-or-jump\rfeedkeys\afn\bvim\23expand_or_jumpable\21select_next_item\fvisible�\1\0\1\6\3\b\0\27-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\17�-\1\1\0009\1\2\1)\3��B\1\2\2\15\0\1\0X\2\t�6\1\3\0009\1\4\0019\1\5\1-\3\2\0'\5\6\0B\3\2\2'\4\a\0B\1\3\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\1�\4�\5\28<Plug>luasnip-jump-prev\rfeedkeys\afn\bvim\rjumpable\21select_prev_item\fvisibleC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire�\b\1\0\14\0002\0S6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\3\0003\3\4\0003\4\5\0003\5\6\0009\6\a\0005\b\t\0005\t\b\0=\t\n\b5\t\f\0003\n\v\0=\n\r\t=\t\14\b5\t\17\0009\n\15\0009\n\16\nB\n\1\2=\n\18\t9\n\15\0009\n\19\nB\n\1\2=\n\20\t9\n\15\0009\n\21\n)\f��B\n\2\2=\n\22\t9\n\15\0009\n\21\n)\f\4\0B\n\2\2=\n\23\t9\n\15\0009\n\24\nB\n\1\2=\n\25\t9\n\15\0009\n\26\nB\n\1\2=\n\27\t9\n\15\0009\n\28\n5\f\31\0009\r\29\0009\r\30\r=\r \fB\n\2\2=\n!\t9\n\15\0003\f\"\0005\r#\0B\n\3\2=\n$\t9\n\15\0003\f%\0005\r&\0B\n\3\2=\n'\t=\t\15\b5\t)\0003\n(\0=\n*\t=\t+\b4\t\6\0005\n,\0>\n\1\t5\n-\0>\n\2\t5\n.\0>\n\3\t5\n/\0>\n\4\t5\n0\0>\n\5\t=\t1\bB\6\2\0012\0\0�K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\1\0\1\tname\rnvim_lua\fsnippet\vexpand\1\0\0\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\15formatting\vformat\1\0\0\0\15completion\1\0\0\1\0\1\16completeopt\"menu,menuone,preview,noinsert\nsetup\0\0\0\1\0\25\14Interface\n ﰮ \nClass\n  \rVariable\n  \nField\n ﴲ \16Constructor\n  \rFunction\n  \vMethod\n  \tText\v   \18TypeParameter\n  \rOperator\n  \nEvent\n  \vStruct\n ﳤ \rConstant\n ﲀ \15EnumMember\n  \vFolder\n  \14Reference\n  \tFile\n  \nColor\n  \fSnippet\n  \fKeyword\n  \tEnum\t 練\nValue\n  \tUnit\n  \rProperty\n ﰠ \vModule\n  \fluasnip\bcmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp",
    wants = { "LuaSnip" }
  },
  ["nvim-dap"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\n)\0\0\4\2\1\0\6-\0\0\0\18\2\0\0009\0\0\0-\3\1\0B\0\3\1K\0\1\0\r�\14�\nsetupS\0\0\5\2\4\0\n-\0\0\0\18\2\0\0009\0\0\0005\3\1\0-\4\1\0=\4\2\0036\4\3\0=\4\3\3B\0\3\1K\0\1\0\r�\4\0\14on_attach\17capabilities\1\0\0\nsetup�\r\1\0\23\0053\0�\0026\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0019\2\4\0014\3\0\0006\4\5\0\18\6\2\0B\4\2\4X\aT�\18\v\b\0009\t\6\b'\f\a\0'\r\b\0B\t\4\2\18\v\t\0009\t\6\t'\f\t\0'\r\b\0B\t\4\2\18\v\t\0009\t\6\t'\f\n\0'\r\b\0B\t\4\2\18\f\b\0009\n\v\b'\r\f\0B\n\3\2\n\n\0\0X\v\a�6\v\r\0009\v\14\v\18\r\n\0'\14\15\0B\v\3\2\14\0\v\0X\f\t�-\v\0\0008\v\t\v\n\v\0\0X\v\4�-\v\0\0008\v\t\v\14\0\v\0X\f\1�+\v\0\0\18\14\b\0009\f\16\b'\15\17\0B\f\3\2\15\0\f\0X\r)�\n\v\0\0X\r\23�6\r\5\0\18\15\v\0B\r\2\4X\16\16�6\18\r\0009\18\18\18\18\20\17\0B\18\2\2-\19\1\0009\19\19\19\18\21\3\0\18\22\18\0B\19\3\2\v\19\1\0X\19\5�6\19\20\0009\19\21\19\18\21\3\0\18\22\18\0B\19\3\1E\16\3\3R\16�\127X\r\16�\18\15\b\0009\r\16\b'\16\22\0B\r\3\2\15\0\r\0X\14\3�+\r\2\0007\r\23\0X\r\a�-\r\2\0009\r\24\r'\15\25\0\18\16\b\0'\17\26\0&\15\17\15B\r\2\1E\a\3\3R\a�\1274\4\0\0006\5\27\0-\a\0\0B\5\2\4H\b\18�6\n\5\0\18\f\t\0B\n\2\4X\r\f�-\15\1\0009\15\19\15\18\17\4\0\18\18\14\0B\15\3\2\14\0\15\0X\15\5�6\15\20\0009\15\21\15\18\17\4\0\18\18\14\0B\15\3\1E\r\3\3R\r�\127F\b\3\3R\b�\1274\5\0\0004\6\0\0006\a\5\0\18\t\4\0B\a\2\4X\nF�9\f\28\0\18\14\v\0B\f\2\3\15\0\f\0X\14@�-\14\1\0009\14\19\14\18\16\3\0\18\17\v\0B\14\3\2\14\0\14\0X\14\21�\18\16\r\0009\14\29\rB\14\2\2\15\0\14\0X\0154�6\14\20\0009\14\21\14\18\16\6\0\18\17\v\0B\14\3\1\18\16\r\0009\14\30\rB\14\2\1-\14\2\0009\14\31\14'\16 \0\18\17\v\0'\18!\0&\16\18\16B\14\2\1X\14$�9\14\"\r\a\14#\0X\14\3�-\14\3\0\14\0\14\0X\15\5�5\14$\0-\15\4\0=\15%\0146\15&\0=\15&\14\18\17\r\0009\15'\r3\18(\0B\15\3\1\18\17\r\0009\15\29\rB\15\2\2\14\0\15\0X\15\15�6\15\20\0009\15\21\15\18\17\5\0\18\18\v\0B\15\3\1\18\17\r\0009\15)\rB\15\2\1-\15\2\0009\15\31\15'\17*\0\18\18\v\0'\19!\0&\17\19\17B\15\2\0012\14\0�2\f\0�E\n\3\3R\n�\1276\a\5\0\18\t\3\0B\a\2\4X\n%�-\f\1\0009\f\19\f\18\14\4\0\18\15\v\0B\f\3\2\14\0\f\0X\f\30�9\f\28\0\18\14\v\0B\f\2\3\15\0\f\0X\14\24�\18\16\r\0009\14'\r3\17+\0B\14\3\1\18\16\r\0009\14\29\rB\14\2\2\14\0\14\0X\14\15�6\14\20\0009\14\21\14\18\16\5\0\18\17\v\0B\14\3\1\18\16\r\0009\14)\rB\14\2\1-\14\2\0009\14\31\14'\16*\0\18\17\v\0'\18!\0&\16\18\16B\14\2\0012\f\0�E\n\3\3R\n�\1276\a,\0\18\t\5\0B\a\2\2\v\a\0\0X\a\5�6\a,\0\18\t\6\0B\a\2\2\n\a\0\0X\a\26�'\a-\0\21\b\5\0)\t\0\0\1\t\b\0X\t\5�\18\t\a\0'\n.\0\18\v\b\0'\f/\0&\a\f\t\21\t\6\0)\n\0\0\1\n\t\0X\n\5�\18\n\a\0'\v0\0\18\f\b\0'\r/\0&\a\r\n\18\n\a\0'\v1\0&\a\v\n6\n\r\0009\n2\n\18\f\a\0B\n\2\1K\0\1\0\3�\1�\0�\5�\4�\vnotify+Use :LspInstallInfo to check status.  \18Uninstalling \r LSPs.  \16Installing \vPato: \tnext\0+pato-lsp-installer: Installing server \finstall\0\ron_ready\14on_attach\17capabilities\1\0\0\16sumneko_lua\tname\6.-pato-lsp-installer: Uninstalling server \tinfo\14uninstall\17is_installed\15get_server\npairs;\" does not have an LSP, please remove the \"+lsp\" flag.\19The language \"\nerror\27should_setup_scala_lsp\nscala\vinsert\ntable\14has_value\ttrim\t+lsp\tfind\6,\nsplit\bvim\17+lsp%((.+)%)\nmatch\15%s+%+debug\r%s+%+lsp\5\22%s+%+lsp(%(%a+%))\tgsub\vipairs\nlangs\fmodules\29pato.core.config.modules\23nvim-lsp-installer\frequire\21\0\0\2\1\0\0\3-\0\0\0B\0\1\1K\0\1\0\6��\6\1\0\r\0007\0G6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\2\0B\2\2\0029\2\3\0025\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0036\4\31\0009\4 \0049\4!\0049\4\"\4B\4\1\0026\5\0\0'\a#\0B\5\2\0029\5$\0055\a2\0005\b.\0005\t,\0005\n&\0005\v%\0=\v'\n5\v)\0005\f(\0=\f*\v=\v+\n=\n-\t=\t/\b=\0040\b6\t1\0=\t1\b=\b3\aB\5\2\0023\0064\0006\a\31\0009\a5\a3\t6\0)\n2\0B\a\3\0012\0\0�K\0\1\0\0\rdefer_fn\0\14lspconfig\1\0\0\14on_attach\17capabilities\rsettings\1\0\0\bLua\1\0\0\16diagnostics\fglobals\1\0\0\1\2\0\0\19packer_plugins\14workspace\1\0\0\1\0\1\20preloadFileSize\3�\1\nsetup\flua-dev\29make_client_capabilities\rprotocol\blsp\bvim\tyaml\1\2\0\0\vyamlls\bxml\1\2\0\0\flemminx\trust\1\2\0\0\18rust_analyzer\vpython\1\2\0\0\fpyright\bphp\1\2\0\0\rphpactor\15javascript\1\2\0\0\rtsserver\tjson\1\2\0\0\vjsonls\thtml\1\2\0\0\thtml\ago\1\2\0\0\ngopls\15dockerfile\1\2\0\0\rdockerls\bcpp\1\2\0\0\vclangd\6c\1\2\0\0\vclangd\blua\1\0\0\1\2\0\0\16sumneko_lua\23is_plugin_disabled\15pato.utils\24pato.extras.logging\frequire\0" },
    loaded = true,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp_signature.nvim" },
    loaded = true,
    only_config = true
  },
  ["nvim-mapper"] = {
    config = { "\27LJ\2\n�\1\0\0\n\0\v\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\1\0B\1\2\0029\1\3\0016\2\0\0'\4\4\0B\2\2\0029\2\5\0025\4\6\0006\5\a\0009\5\b\5'\a\t\0\18\b\0\0\18\t\1\0B\5\4\2=\5\n\4B\2\2\1K\0\1\0\16search_path\f%s%slua\vformat\vstring\1\0\2\20action_on_enter\fexecute\vno_map\2\nsetup\16nvim-mapper\bsep\14pato_root\21pato.core.system\frequire\0" },
    loaded = true,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/start/nvim-mapper",
    url = "https://github.com/lazytanuki/nvim-mapper"
  },
  ["nvim-tree-docs"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/nvim-tree-docs",
    url = "https://github.com/nvim-treesitter/nvim-tree-docs"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeClipboard", "NvimTreeClose", "NvimTreeFindFile", "NvimTreeOpen", "NvimTreeRefresh", "NvimTreeToggle" },
    config = { "\27LJ\2\n�\t\0\0\f\0A\0Y6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0016\2\0\0'\4\5\0B\2\2\0029\2\6\0025\4\a\0004\5\0\0=\5\b\0045\5\t\0004\6\0\0=\6\n\5=\5\v\0045\5\f\0004\6\0\0=\6\r\5=\5\14\0045\5\17\0009\6\15\0009\6\16\6=\6\18\0059\6\15\0009\6\19\6\15\0\6\0X\a\2�'\6\20\0X\a\1�'\6\21\0=\6\22\0055\6\23\0004\a\3\0005\b\25\0005\t\24\0=\t\26\b\18\t\1\0'\v\27\0B\t\2\2=\t\28\b>\b\1\a5\b\30\0005\t\29\0=\t\26\b\18\t\1\0'\v\31\0B\t\2\2=\t\28\b>\b\2\a=\a \6=\6!\5=\5\"\0045\5$\0005\6#\0=\6%\0055\6&\0=\6'\0055\6)\0005\a(\0=\a*\6=\6+\5=\5,\0045\5.\0009\6\15\0009\6-\6=\6/\0055\0060\0=\0061\5=\0052\0045\0053\0=\0054\0045\5>\0005\6<\0005\a:\0005\b6\0005\t5\0=\t7\b5\t8\0=\t9\b=\b;\a=\a=\6=\6?\5=\5@\4B\2\2\1K\0\1\0\factions\14open_file\1\0\0\18window_picker\1\0\0\fexclude\1\0\0\fbuftype\1\2\0\0\rterminal\rfiletype\1\0\0\1\4\0\0\vnotify\vpacker\aqf\bgit\1\0\1\vignore\2\ffilters\vcustom\1\5\0\0\t.git\17node_modules\v.cache\16__pycache__\rdotfiles\1\0\0\16show_hidden\rrenderer\nicons\tshow\1\0\0\1\0\4\17folder_arrow\1\bgit\2\vfolder\2\tfile\2\18special_files\1\0\3\rMakefile\3\1\14README.md\3\1\rMAKEFILE\3\1\19indent_markers\1\0\4\17add_trailing\2\25root_folder_modifier\a:~\18highlight_git\2\16group_empty\2\1\0\1\venable\2\tview\rmappings\tlist\acd\1\0\0\1\4\0\0\t<CR>\19<2-RightMouse>\n<C-]>\acb\tedit\bkey\1\0\0\1\3\0\0\6o\18<2-LeftMouse>\1\0\1\16custom_only\1\tside\tleft\nright\19explorer_right\nwidth\1\0\0\18sidebar_width\tpato\16system_open\targs\1\0\0\24update_focused_file\16ignore_list\1\0\2\venable\2\15update_cwd\2\23ignore_ft_on_setup\1\0\6\15update_cwd\2\18hijack_cursor\2\16open_on_tab\1\18open_on_setup\1\17hijack_netrw\2\18disable_netrw\1\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\vconfig\21pato.core.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-autotag", "nvim-ts-context-commentstring", "nvim-tree-docs" },
    config = { "\27LJ\2\n�\2\0\1\f\0\f\0/4\1\0\0006\2\0\0\18\4\0\0B\2\2\4X\5'�\a\6\1\0X\a\16�6\a\2\0009\a\3\a\18\t\1\0'\n\4\0B\a\3\0016\a\2\0009\a\3\a\18\t\1\0'\n\5\0B\a\3\0016\a\2\0009\a\3\a\18\t\1\0'\n\6\0B\a\3\1X\a\21�\18\t\6\0009\a\a\6'\n\b\0'\v\t\0B\a\4\2\18\t\a\0009\a\a\a'\n\n\0'\v\t\0B\a\4\2\18\t\a\0009\a\a\a'\n\v\0'\v\t\0B\a\4\2\18\6\a\0006\a\2\0009\a\3\a\18\t\1\0\18\n\6\0B\a\3\1E\5\3\3R\5�\127L\1\2\0\15%s+%+debug\r%s+%+lsp\5\22%s+%+lsp(%(%a+%))\tgsub\ttoml\tyaml\tjson\vinsert\ntable\vconfig\vipairs�\3\1\0\n\0\25\00066\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0016\2\0\0'\4\1\0B\2\2\0029\2\5\0023\3\6\0006\4\a\0\15\0\4\0X\5\t�6\4\a\0009\4\b\4\15\0\4\0X\5\5�6\4\t\0009\4\n\0049\6\v\1'\a\f\0B\4\3\0016\4\a\0\15\0\4\0X\5\t�6\4\a\0009\4\r\4\15\0\4\0X\5\5�6\4\t\0009\4\n\0049\6\v\1'\a\14\0B\4\3\0016\4\0\0'\6\15\0B\4\2\0029\4\16\0045\6\17\0\18\a\3\0009\t\v\1B\a\2\2=\a\18\0065\a\19\0=\a\20\0065\a\21\0=\a\22\0065\a\23\0=\a\24\6B\4\2\1K\0\1\0\14tree_docs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\nsetup\28nvim-treesitter.configs\thttp\14rest.nvim\tnorg\nlangs\vinsert\ntable\nneorg\19packer_plugins\0\23is_plugin_disabled\fmodules\29pato.core.config.modules\14has_value\15pato.utils\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["symbols-outline.nvim"] = {
    commands = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    config = { "\27LJ\2\n�\2\0\0\4\0\15\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\3\0009\1\4\0015\2\6\0009\3\a\0009\3\b\3\15\0\3\0X\4\2�'\3\t\0X\4\1�'\3\n\0=\3\v\0025\3\f\0=\3\r\0024\3\0\0=\3\14\2=\2\5\1K\0\1\0\18lsp_blacklist\fkeymaps\1\0\6\nclose\n<Esc>\18rename_symbol\6r\17hover_symbol\14<C-space>\19focus_location\6o\18goto_location\t<CR>\17code_actions\6a\rposition\nright\tleft\19explorer_right\tpato\1\0\2\27highlight_hovered_item\2\16show_guides\2\20symbols_outline\6g\bvim\vconfig\21pato.core.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n�\6\0\0\b\0\27\0*6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\23\0005\4\4\0005\5\3\0=\5\5\0045\5\6\0005\6\a\0=\6\b\0055\6\t\0=\6\n\5=\5\v\0044\5\0\0=\5\f\0045\5\r\0=\5\14\0046\5\0\0'\a\15\0B\5\2\0029\5\16\0059\5\17\5=\5\18\0046\5\0\0'\a\15\0B\5\2\0029\5\19\0059\5\17\5=\5\20\0046\5\0\0'\a\15\0B\5\2\0029\5\21\0059\5\17\5=\5\22\4=\4\24\3B\1\2\0019\1\25\0'\3\26\0B\1\2\1K\0\1\0\vmapper\19load_extension\rdefaults\1\0\0\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\16borderchars\1\t\0\0\b─\b│\b─\b│\b╭\b╮\b╯\b╰\vborder\18layout_config\15horizontal\1\0\2\vmirror\1\18preview_width\4��̙\3���\3\rvertical\1\0\1\vmirror\1\1\0\3\20prompt_position\vbottom\19preview_cutoff\3x\nwidth\4\0����\3\17find_command\1\0\6\17initial_mode\vinsert\20scroll_strategy\ncycle\20layout_strategy\15horizontal\19color_devicons\2\21sorting_strategy\15descending\23selection_strategy\nreset\1\a\0\0\arg\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\nsetup\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n�\n\0\0\a\0E\0X6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\1+\3\0\0=\3\4\0029\2\5\0005\4\t\0005\5\6\0005\6\a\0=\6\b\5=\5\n\0045\5\v\0=\5\3\0045\5\f\0=\5\r\0045\5\15\0005\6\14\0=\6\16\5=\5\17\0045\5\19\0005\6\18\0=\6\20\5=\5\21\0045\5\22\0=\5\23\4B\2\2\0015\2\25\0005\3\24\0=\3\26\0025\3\27\0005\4\28\0=\4\29\0035\4\30\0=\4\31\0035\4 \0=\4!\0035\4\"\0=\4#\3=\3!\0025\3$\0=\3%\0025\3&\0005\4'\0=\4%\0035\4(\0=\4)\0035\4*\0=\4+\0035\4,\0=\4-\0035\4.\0=\4/\3=\3+\0025\0030\0=\3#\0025\0031\0=\0032\0025\0033\0005\0044\0=\0045\0035\0046\0=\0047\0035\0048\0=\4/\3=\0035\0025\0039\0005\4:\0=\4#\0035\4;\0=\4!\0035\4<\0=\4=\0035\4>\0=\4?\0035\4@\0=\4A\3=\3=\0025\3B\0=\0037\0029\3C\0\18\5\2\0005\6D\0B\3\3\1K\0\1\0\1\0\1\vprefix\r<leader>\rregister\1\0\1\tname\f+window\6m\1\2\0\0\17Jump to mark\6h\1\2\0\0\20Command history\6s\1\2\0\0\16Goto symbol\1\2\0\0\vBuffer\1\2\0\0\tGrep\1\0\1\tname\f+search\1\2\0\0%Restore previously saved session\6w\1\2\0\0\18Save and quit\6q\1\2\0\0\tQuit\1\0\1\tname\n+quit\6p\1\0\1\tname\f+plugin\1\0\1\tname\t+git\6r\1\2\0\0\26Recently opened files\6t\1\2\0\0\14Help tags\6f\1\2\0\0\15Find files\6n\1\2\0\0 Create a new unnamed buffer\1\2\0\0\30Edit Neovim configuration\1\0\1\tname\n+file\6c\1\0\1\tname\n+code\6g\1\2\0\0\16Goto buffer\6b\1\2\0\0\27Switch to other buffer\6[\1\2\0\0\20Previous buffer\6]\1\2\0\0\16Next buffer\1\0\1\tname\r+buffers\6`\1\0\0\1\2\0\0\14Find file\vhidden\1\t\0\0\r<silent>\n<Cmd>\n<cmd>\v<Plug>\tcall\blua\a^:\a^ \vlayout\vheight\1\0\2\nalign\tleft\fspacing\3\3\1\0\2\bmax\3\n\bmin\3\1\vwindow\fpadding\1\0\1\vborder\vsingle\1\5\0\0\3\0\3\0\3\0\3\0\15key_labels\1\0\3\f<space>\bSPC\n<tab>\bTAB\t<cr>\bRET\1\0\2\6c\vChange\6d\vDelete\fplugins\1\0\3\14show_help\2\rtriggers\tauto\19ignore_missing\2\fpresets\1\0\a\bnav\2\fwindows\2\6z\2\14operators\1\17text_objects\2\fmotions\2\6g\2\1\0\2\14registers\1\nmarks\1\nsetup\agc\14operators\30which-key.plugins.presets\14which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/schuyler/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^lua%-dev"] = "lua-dev.nvim",
  ["^nvim%-web%-devicons"] = "nvim-web-devicons",
  ["^plenary"] = "plenary.nvim",
  ["^popup"] = "popup.nvim",
  ["^telescope"] = "telescope.nvim",
  ["^true%-zen"] = "TrueZen.nvim",
  aniseed = "aniseed"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n\20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t▊ �\4\0\0\6\1#\0_5\0\1\0-\1\0\0'\3\0\0B\1\2\2=\1\2\0-\1\0\0'\3\3\0B\1\2\2=\1\4\0-\1\0\0'\3\5\0B\1\2\2=\1\6\0-\1\0\0'\3\5\0B\1\2\2=\1\a\0-\1\0\0'\3\5\0B\1\2\2=\1\b\0-\1\0\0'\3\t\0B\1\2\2=\1\n\0-\1\0\0'\3\0\0B\1\2\2=\1\v\0-\1\0\0'\3\f\0B\1\2\2=\1\r\0-\1\0\0'\3\f\0B\1\2\2=\1\14\0-\1\0\0'\3\f\0B\1\2\2=\1\15\0-\1\0\0'\3\16\0B\1\2\2=\1\17\0-\1\0\0'\3\t\0B\1\2\2=\1\18\0-\1\0\0'\3\t\0B\1\2\2=\1\19\0-\1\0\0'\3\0\0B\1\2\2=\1\20\0-\1\0\0'\3\0\0B\1\2\2=\1\21\0-\1\0\0'\3\22\0B\1\2\2=\1\23\0-\1\0\0'\3\22\0B\1\2\2=\1\24\0-\1\0\0'\3\22\0B\1\2\2=\1\25\0-\1\0\0'\3\0\0B\1\2\2=\1\26\0-\1\0\0'\3\0\0B\1\2\2=\1\27\0006\1\28\0009\1\29\0019\1\30\1'\3\31\0006\4\28\0009\4 \0049\4!\4B\4\1\0028\4\4\0B\4\1\2&\3\4\3B\1\2\1'\1\"\0L\1\2\0\2�\n  \tmode\afn\27hi GalaxyViMode guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\aic\vyellow\6\19\6S\6s\vorange\ano\6c\fmagenta\6V\6\22\6v\tblue\6i\ngreen\6n\1\0\0\bred�\4\1\0\15\0\28\1>6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0016\2\0\0'\4\4\0B\2\2\0029\2\5\0026\3\0\0'\5\6\0B\3\2\0026\4\0\0'\6\a\0B\4\2\0026\5\0\0'\a\b\0B\5\2\0026\6\0\0'\b\t\0B\6\2\0029\a\n\0035\b\f\0=\b\v\0039\b\r\a5\t\20\0005\n\15\0003\v\14\0=\v\16\n4\v\3\0\18\f\2\0'\14\17\0B\f\2\2>\f\1\v\18\f\2\0'\14\18\0B\f\2\0?\f\0\0=\v\19\n=\n\21\t>\t\1\b9\b\r\a5\t\26\0005\n\23\0003\v\22\0=\v\16\n5\v\25\0\18\f\2\0'\14\24\0B\f\2\2>\f\1\v\18\f\2\0'\14\18\0B\f\2\2>\f\2\v=\v\19\n=\n\27\t>\t\2\b2\0\0�K\0\1\0\vViMode\1\0\0\1\4\0\0\0\0\tbold\bred\1\0\0\0\16RainbowLeft\1\0\0\14highlight\abg\tblue\rprovider\1\0\0\0\tleft\1\a\0\0\rNvimTree\vpacker\fminimap\fOutline\15toggleterm\nnetrw\20short_line_list\fsection\25galaxyline.condition galaxyline.providers.buffer\29galaxyline.providers.lsp\15galaxyline\14get_color\29galaxyline.themes.colors\vconfig\21pato.core.config\15pato.utils\frequire\5����\4\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\n)\0\0\4\2\1\0\6-\0\0\0\18\2\0\0009\0\0\0-\3\1\0B\0\3\1K\0\1\0\r�\14�\nsetupS\0\0\5\2\4\0\n-\0\0\0\18\2\0\0009\0\0\0005\3\1\0-\4\1\0=\4\2\0036\4\3\0=\4\3\3B\0\3\1K\0\1\0\r�\4\0\14on_attach\17capabilities\1\0\0\nsetup�\r\1\0\23\0053\0�\0026\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0019\2\4\0014\3\0\0006\4\5\0\18\6\2\0B\4\2\4X\aT�\18\v\b\0009\t\6\b'\f\a\0'\r\b\0B\t\4\2\18\v\t\0009\t\6\t'\f\t\0'\r\b\0B\t\4\2\18\v\t\0009\t\6\t'\f\n\0'\r\b\0B\t\4\2\18\f\b\0009\n\v\b'\r\f\0B\n\3\2\n\n\0\0X\v\a�6\v\r\0009\v\14\v\18\r\n\0'\14\15\0B\v\3\2\14\0\v\0X\f\t�-\v\0\0008\v\t\v\n\v\0\0X\v\4�-\v\0\0008\v\t\v\14\0\v\0X\f\1�+\v\0\0\18\14\b\0009\f\16\b'\15\17\0B\f\3\2\15\0\f\0X\r)�\n\v\0\0X\r\23�6\r\5\0\18\15\v\0B\r\2\4X\16\16�6\18\r\0009\18\18\18\18\20\17\0B\18\2\2-\19\1\0009\19\19\19\18\21\3\0\18\22\18\0B\19\3\2\v\19\1\0X\19\5�6\19\20\0009\19\21\19\18\21\3\0\18\22\18\0B\19\3\1E\16\3\3R\16�\127X\r\16�\18\15\b\0009\r\16\b'\16\22\0B\r\3\2\15\0\r\0X\14\3�+\r\2\0007\r\23\0X\r\a�-\r\2\0009\r\24\r'\15\25\0\18\16\b\0'\17\26\0&\15\17\15B\r\2\1E\a\3\3R\a�\1274\4\0\0006\5\27\0-\a\0\0B\5\2\4H\b\18�6\n\5\0\18\f\t\0B\n\2\4X\r\f�-\15\1\0009\15\19\15\18\17\4\0\18\18\14\0B\15\3\2\14\0\15\0X\15\5�6\15\20\0009\15\21\15\18\17\4\0\18\18\14\0B\15\3\1E\r\3\3R\r�\127F\b\3\3R\b�\1274\5\0\0004\6\0\0006\a\5\0\18\t\4\0B\a\2\4X\nF�9\f\28\0\18\14\v\0B\f\2\3\15\0\f\0X\14@�-\14\1\0009\14\19\14\18\16\3\0\18\17\v\0B\14\3\2\14\0\14\0X\14\21�\18\16\r\0009\14\29\rB\14\2\2\15\0\14\0X\0154�6\14\20\0009\14\21\14\18\16\6\0\18\17\v\0B\14\3\1\18\16\r\0009\14\30\rB\14\2\1-\14\2\0009\14\31\14'\16 \0\18\17\v\0'\18!\0&\16\18\16B\14\2\1X\14$�9\14\"\r\a\14#\0X\14\3�-\14\3\0\14\0\14\0X\15\5�5\14$\0-\15\4\0=\15%\0146\15&\0=\15&\14\18\17\r\0009\15'\r3\18(\0B\15\3\1\18\17\r\0009\15\29\rB\15\2\2\14\0\15\0X\15\15�6\15\20\0009\15\21\15\18\17\5\0\18\18\v\0B\15\3\1\18\17\r\0009\15)\rB\15\2\1-\15\2\0009\15\31\15'\17*\0\18\18\v\0'\19!\0&\17\19\17B\15\2\0012\14\0�2\f\0�E\n\3\3R\n�\1276\a\5\0\18\t\3\0B\a\2\4X\n%�-\f\1\0009\f\19\f\18\14\4\0\18\15\v\0B\f\3\2\14\0\f\0X\f\30�9\f\28\0\18\14\v\0B\f\2\3\15\0\f\0X\14\24�\18\16\r\0009\14'\r3\17+\0B\14\3\1\18\16\r\0009\14\29\rB\14\2\2\14\0\14\0X\14\15�6\14\20\0009\14\21\14\18\16\5\0\18\17\v\0B\14\3\1\18\16\r\0009\14)\rB\14\2\1-\14\2\0009\14\31\14'\16*\0\18\17\v\0'\18!\0&\16\18\16B\14\2\0012\f\0�E\n\3\3R\n�\1276\a,\0\18\t\5\0B\a\2\2\v\a\0\0X\a\5�6\a,\0\18\t\6\0B\a\2\2\n\a\0\0X\a\26�'\a-\0\21\b\5\0)\t\0\0\1\t\b\0X\t\5�\18\t\a\0'\n.\0\18\v\b\0'\f/\0&\a\f\t\21\t\6\0)\n\0\0\1\n\t\0X\n\5�\18\n\a\0'\v0\0\18\f\b\0'\r/\0&\a\r\n\18\n\a\0'\v1\0&\a\v\n6\n\r\0009\n2\n\18\f\a\0B\n\2\1K\0\1\0\3�\1�\0�\5�\4�\vnotify+Use :LspInstallInfo to check status.  \18Uninstalling \r LSPs.  \16Installing \vPato: \tnext\0+pato-lsp-installer: Installing server \finstall\0\ron_ready\14on_attach\17capabilities\1\0\0\16sumneko_lua\tname\6.-pato-lsp-installer: Uninstalling server \tinfo\14uninstall\17is_installed\15get_server\npairs;\" does not have an LSP, please remove the \"+lsp\" flag.\19The language \"\nerror\27should_setup_scala_lsp\nscala\vinsert\ntable\14has_value\ttrim\t+lsp\tfind\6,\nsplit\bvim\17+lsp%((.+)%)\nmatch\15%s+%+debug\r%s+%+lsp\5\22%s+%+lsp(%(%a+%))\tgsub\vipairs\nlangs\fmodules\29pato.core.config.modules\23nvim-lsp-installer\frequire\21\0\0\2\1\0\0\3-\0\0\0B\0\1\1K\0\1\0\6��\6\1\0\r\0007\0G6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\2\0B\2\2\0029\2\3\0025\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0036\4\31\0009\4 \0049\4!\0049\4\"\4B\4\1\0026\5\0\0'\a#\0B\5\2\0029\5$\0055\a2\0005\b.\0005\t,\0005\n&\0005\v%\0=\v'\n5\v)\0005\f(\0=\f*\v=\v+\n=\n-\t=\t/\b=\0040\b6\t1\0=\t1\b=\b3\aB\5\2\0023\0064\0006\a\31\0009\a5\a3\t6\0)\n2\0B\a\3\0012\0\0�K\0\1\0\0\rdefer_fn\0\14lspconfig\1\0\0\14on_attach\17capabilities\rsettings\1\0\0\bLua\1\0\0\16diagnostics\fglobals\1\0\0\1\2\0\0\19packer_plugins\14workspace\1\0\0\1\0\1\20preloadFileSize\3�\1\nsetup\flua-dev\29make_client_capabilities\rprotocol\blsp\bvim\tyaml\1\2\0\0\vyamlls\bxml\1\2\0\0\flemminx\trust\1\2\0\0\18rust_analyzer\vpython\1\2\0\0\fpyright\bphp\1\2\0\0\rphpactor\15javascript\1\2\0\0\rtsserver\tjson\1\2\0\0\vjsonls\thtml\1\2\0\0\thtml\ago\1\2\0\0\ngopls\15dockerfile\1\2\0\0\rdockerls\bcpp\1\2\0\0\vclangd\6c\1\2\0\0\vclangd\blua\1\0\0\1\2\0\0\16sumneko_lua\23is_plugin_disabled\15pato.utils\24pato.extras.logging\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n�\20\0\0\v\0$\0F6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0016\2\0\0'\4\5\0B\2\2\0029\2\6\2'\3\a\0&\2\3\2=\2\4\0016\1\2\0009\1\3\1'\2\t\0=\2\b\0014\1\b\0005\2\v\0>\2\1\0015\2\f\0>\2\2\0015\2\r\0>\2\3\0015\2\14\0>\2\4\0015\2\15\0>\2\5\0015\2\16\0>\2\6\0015\2\17\0>\2\a\1=\1\n\0005\1\19\0'\2\20\0006\3\2\0009\3\21\0039\3\22\3'\5\23\0006\6\2\0009\6\21\0069\6\24\0066\b\2\0009\b\21\b9\b\25\b6\n\2\0009\n\3\n9\n\26\nB\b\2\0A\6\0\0A\3\1\2'\4\27\0&\2\4\2>\2\2\1'\2\28\0006\3\2\0009\3\29\0036\5\30\0B\3\2\2\21\3\3\0'\4\31\0&\2\4\2>\2\3\1=\1\18\0+\1\1\0=\1 \0+\1\1\0=\1!\0005\1#\0=\1\"\0K\0\1\0\1\17\0\0002█▀█ ▄▀█ ▀█▀ █▀█2█▀▀ █▀█ ░█░ █▄█\5_⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿_⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣉⡥⠶⢶⣿⣿⣿⣿⣷⣆⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿_⣿⣿⣿⣿⣿⣿⣿⡿⢡⡞⠁⠀⠀⠤⠈⠿⠿⠿⠿⣿⠀⢻⣦⡈⠻⣿⣿⣿⣿⣿_⣿⣿⣿⣿⣿⣿⣿⡇⠘⡁⠀⢀⣀⣀⣀⣈⣁⣐⡒⠢⢤⡈⠛⢿⡄⠻⣿⣿⣿⣿_⣿⣿⣿⣿⣿⣿⣿⡇⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠉⠐⠄⡈⢀⣿⣿⣿⣿_⣿⣿⣿⣿⣿⣿⣿⠇⢠⣿⣿⣿⣿⡿⢿⣿⣿⣿⠁⢈⣿⡄⠀⢀⣀⠸⣿⣿⣿⣿_⣿⣿⣿⣿⡿⠟⣡⣶⣶⣬⣭⣥⣴⠀⣾⣿⣿⣿⣶⣾⣿⣧⠀⣼⣿⣷⣌⡻⢿⣿_⣿⣿⠟⣋⣴⣾⣿⣿⣿⣿⣿⣿⣿⡇⢿⣿⣿⣿⣿⣿⣿⡿⢸⣿⣿⣿⣿⣷⠄⢻_⡏⠰⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⢂⣭⣿⣿⣿⣿⣿⠇⠘⠛⠛⢉⣉⣠⣴⣾_⣿⣷⣦⣬⣍⣉⣉⣛⣛⣉⠉⣤⣶⣾⣿⣿⣿⣿⣿⣿⡿⢰⣿⣿⣿⣿⣿⣿⣿⣿_⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡘⣿⣿⣿⣿⣿⣿⣿⣿⡇⣼⣿⣿⣿⣿⣿⣿⣿⣿_⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢸⣿⣿⣿⣿⣿⣿⣿⠁⣿⣿⣿⣿⣿⣿⣿⣿⣿\5\18custom_header\20hide_statusline\17hide_tabline\14 plugins.\19packer_plugins\rtbl_keys\17🎉 loaded \14 seconds.\15start_time\freltime\17reltimefloat\t%.3f\vprintf\afn\25Pato Nvim loaded in \1\2\0\0\5\18custom_footer\1\0\4\rshortcut\fSPC d d\tdesc$Open Documentation             \ticon\n  \vaction3lua require('pato.core.functions').open_docs()\1\0\4\rshortcut\fSPC d c\tdesc$Open Private Configuration     \ticon\n  \vaction5lua require('pato.core.functions').edit_config()\1\0\4\rshortcut\fSPC f g\tdesc$Find Word                      \ticon\n  \vaction1lua require('telescope.builtin').live_grep()\1\0\4\rshortcut\fSPC f f\tdesc$Find File                      \ticon\n  \vaction2lua require('telescope.builtin').find_files()\1\0\4\rshortcut\fSPC s m\tdesc$Jump to Bookmark               \ticon\n  \vaction-lua require('telescope.builtin').marks()\1\0\4\rshortcut\fSPC f r\tdesc$Recently Opened Files          \ticon\n  \vaction0lua require('telescope.builtin').oldfiles()\1\0\4\rshortcut\fSPC s r\tdesc$Load Last Session              \ticon\n  \vaction5lua require('persistence').load({ last = true })\18custom_center\14telescope dashboard_default_executive\14/sessions\14pato_root\21pato.core.system dashboard_session_directory\6g\bvim\14dashboard\frequire\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: nvim-mapper
time([[Config for nvim-mapper]], true)
try_loadstring("\27LJ\2\n�\1\0\0\n\0\v\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\1\0B\1\2\0029\1\3\0016\2\0\0'\4\4\0B\2\2\0029\2\5\0025\4\6\0006\5\a\0009\5\b\5'\a\t\0\18\b\0\0\18\t\1\0B\5\4\2=\5\n\4B\2\2\1K\0\1\0\16search_path\f%s%slua\vformat\vstring\1\0\2\20action_on_enter\fexecute\vno_map\2\nsetup\16nvim-mapper\bsep\14pato_root\21pato.core.system\frequire\0", "config", "nvim-mapper")
time([[Config for nvim-mapper]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n�\1\0\3\b\0\t\0\30\18\5\0\0009\3\0\0'\6\1\0B\3\3\2\15\0\3\0X\4\1�K\0\1\0006\3\2\0009\3\3\0039\3\4\0039\3\5\3\5\1\3\0X\3\6�6\3\2\0009\3\6\0039\3\a\3\18\5\0\0B\3\2\1X\3\n�6\3\2\0009\3\6\0039\3\b\0034\5\3\0004\6\3\0>\0\1\6>\6\1\5+\6\2\0004\a\0\0B\3\4\1K\0\1\0\14nvim_echo\21nvim_err_writeln\bapi\nERROR\vlevels\blog\bvim\14exit code\nmatch�\6\1\0\15\0*\0U6\0\0\0009\0\1\0006\1\0\0009\1\2\0016\2\3\0'\4\4\0B\2\2\0029\2\5\2,\3\4\0005\5\b\0009\6\6\0029\6\a\6=\6\t\0059\6\6\0029\6\n\6=\6\v\0059\6\6\0029\6\f\6=\6\r\0059\6\6\0029\6\14\6=\6\15\5\18\3\5\0'\4\16\0006\5\17\0\18\a\3\0B\5\2\4H\b\n�\18\n\4\0\18\v\b\0&\n\v\n9\v\18\0\18\r\n\0005\14\19\0=\t\20\14=\n\21\14=\n\22\14B\v\3\1F\b\3\3R\b�\1279\5\23\0019\6\25\0019\b\26\0019\b\27\b5\t \0009\n\6\0029\n\28\n\15\0\n\0X\v\6�5\n\30\0009\v\6\0029\v\29\v=\v\31\n\14\0\n\0X\v\1�+\n\1\0=\n!\tB\6\3\2=\6\24\0059\5\23\0016\6\0\0009\6\2\0069\6\25\0066\b\0\0009\b\2\b9\b\23\b9\b#\b5\t$\0B\6\3\2=\6\"\0059\5\23\0016\6\0\0009\6\2\0069\6\25\0066\b\0\0009\b\2\b9\b\23\b9\b&\b5\t'\0B\6\3\2=\6%\0056\5\0\0003\6)\0=\6(\5K\0\1\0\0\vnotify\1\0\1\vborder\vsingle\19signature_help\31textDocument/signatureHelp\1\0\1\vborder\vsingle\nhover\23textDocument/hover\17virtual_text\1\0\0\vprefix\1\0\0\21lsp_virtual_text\28enable_lsp_virtual_text\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\nnumhl\vtexthl\ttext\1\0\0\16sign_define\npairs\23LspDiagnosticsSign\tHint\rlsp_hint\16Information\rlsp_info\fWarning\rlsp_warn\nError\1\0\0\14lsp_error\tpato\vconfig\21pato.core.config\frequire\blsp\afn\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleClose lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleRefresh lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineOpen lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineClose lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeClipboard lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeClipboard", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeClose lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeOpen lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeRefresh lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'LuaSnip', 'nvim-autopairs'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'lsp_signature.nvim', 'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au ColorScheme * ++once lua require("packer.load")({'indent-blankline.nvim'}, { event = "ColorScheme *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'nvim-dap', 'TrueZen.nvim', 'bufferline.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
