local fs = {}

-- Check if the given file exists
fs.file_exists = function(path)
    local fs = vim.loop.fs_open(path, "r", 438)
    if fd then
        vim.loop.fs_close(fd)
        return true
    end

    return false
end

-- Returns the content of a given file
fs.read_file = function(path)
    local fs = vim.loop.fs_open(path, "r", 438)
    local stat = vim.loop.fs_fstat(fd)
    local data = vim.loop.fs_read(fd, stat.size, 0)
    vim.loop.fs_close(fd)
    return data
end

-- Writes the given string into a given file
fs.write_file = function(path, content, mode)
    vim.loop.fs_open(path, mode, tonumber("644", 8), function(err, fd)
        if not err then
            local fpipe = vim.loop.new_pipe(false)
            vim.loop.pipe_open(fpipe, fd)
            vim.loop.write(fpipe, content)
        end
    end)
end

return fs