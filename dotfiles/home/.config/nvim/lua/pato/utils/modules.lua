local modules = {}

-- Check if a Lua module exists
modules.is_module_available = function(mod)
    if package.loaded[mod] then
        return true
    else
        for _, searcher in ipairs(package.searchers or package.loaders) do
            local loader = searcher(mod)
            if type(loader) == "function" then
                package.preload[mod] = loader
                return true
            end
        end
        return false
    end
end

-- Load the specified Lua modules
modules.load_modules = function(module_path, mods)
    for i = 1, #mods, 1 do
        local ok, err = xpcall(require, debug.traceback,string.format("%s.%s", module_path, mods[i]))
        if not ok then
            require("pato.extras.logging").error(
                string.format(
                    "There was an error loading the module '%s.%s'. Traceback:\n%s",
                    module_path,
                    mods[i],
                    err
                )
            )
        else
            require("pato.extras.logging").debug(
                string.format("Successfully loaded '%s.%s' module", module_path, mods[i])
            )
        end
    end
end

return modules