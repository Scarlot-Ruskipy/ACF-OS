local component = require "component"
local term = require "term"
local event = require "event"
local string = require "string"
local computer = require "computer"
local thread = require "thread"
local fs = require "filesystem"

local result = ""

local bin = {"address", "alias", "cat", "cd", "clear", "components", "date", "df", "dmesg", "du", "echo", "edit",
             "find", "flash", "free", "grep", "head", "hostname", "install", "label", "less", "list", "ln", "ls",
             "lshw", "lua", "man", "mkdir", "mktmp", "mount", "mv", "pastebin", "primary", "ps", "pwd", "rc", "reboot",
             "redstone", "resolution", "rm", "rmdir", "set", "sh", "shutdown", "sleep", "source", "time", "touch",
             "tree", "umount", "unalias", "unset", "uptime", "useradd", "userdel", "wget", "which", "yes"}

do
    for i = 1, #bin do
        local binPath = "/bin/" .. bin[i] .. ".lua"
        local handle, chunk = component.proxy(component.list("internet")() or
                                                  error("Required internet component is missing")).request(
            "https://raw.githubusercontent.com/Scarlot-Ruskipy/ACF-OS/main/bin/" .. bin[i] .. ".lua")

        while true do
            chunk = handle.read(math.huge)

            if chunk then
                result = result .. chunk
            else
                break
            end
        end

        io.write("Installing " .. bin[i] .. ".lua\n")
        local file = io.open(binPath, "wb")
        file:write(result)
        file:close()

        result = ""

        os.sleep(0.95)
    end
end

-- rm bin.lua && edit bin.lua && ./bin.lua

-- Reboot after installing all bins
computer.shutdown(true)
