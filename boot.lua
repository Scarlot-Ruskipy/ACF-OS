
local component = require "component"
local term = require "term"
local event = require "event"
local string = require "string"
local computer = require "computer"
local thread = require "thread"
local fs = require "filesystem"

local result = ""

local boot = {"00_base", "01_process", "02_os", "03_io", "04_component", "10_devfs", "89_rc", "90_filesystem", "91_gpu",
             "92_keyboard", "93_term", "94_shell"}

do
    for i = 1, #boot do
        local bootPath = "/boot/" .. boot[i] .. ".lua"
        local handle, chunk = component.proxy(component.list("internet")() or
                                                  error("Required internet component is missing")).request(
            "https://raw.githubusercontent.com/Scarlot-Ruskipy/ACF-OS/main/bin/" .. boot[i] .. ".lua")

        while true do
            chunk = handle.read(math.huge)

            if chunk then
                result = result .. chunk
            else
                break
            end
        end

        io.write("Installing " .. boot[i] .. ".lua\n")
        local file = io.open(bootPath, "wb")
        file:write(result)
        file:close()

        result = ""

        os.sleep(0.95)
    end
end

-- rm bin.lua && edit bin.lua && ./bin.lua

-- Reboot after installing all bins
computer.shutdown(true)
