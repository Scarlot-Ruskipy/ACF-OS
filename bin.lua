local bin = {"address", "alias", "cat", "cd", "clear", "components", "date", "df", "dmesg", "du", "echo", "edit",
             "find", "flash", "free", "grep", "head", "hostname", "install", "label", "less", "list", "ln", "ls",
             "lshw", "lua", "man", "mkdir", "mktmp", "mount", "mv", "pastebin", "primary", "ps", "pwd", "rc", "reboot",
             "redstone", "resolution", "rm", "rmdir", "set", "sh", "shutdown", "sleep", "source", "time", "touch",
             "tree", "umount", "unalias", "unset", "uptime", "useradd", "userdel", "wget", "which", "yes"}

do
    for i = 1, #bin do
        print(bin[i])
    end
end
