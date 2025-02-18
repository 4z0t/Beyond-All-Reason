--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    utils.lua
--  brief:   utility routines
--  author:  Dave Rodgers
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (UtilsGuard) then
  return
end
UtilsGuard = true


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function Say(msg)
  Spring.SendCommands({ 'say ' .. msg })
end

function SendCommand(msg)
  Spring.SendCommands({ msg })
end

--------------------------------------------------------------------------------
--
--  returns:  basename, dirname
--

function Basename(fullpath)
  local _, _, base = string.find(fullpath, "([^\\/:]*)$")
  local _, _, path = string.find(fullpath, "(.*[\\/:])[^\\/:]*$")
  if (path == nil) then path = "" end
  return base, path
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function include(filename, envTable)
  if (string.find(filename, '.h.lua', 1, true)) then
    filename = 'Headers/' .. filename
  end
  return VFS.Include(LUAUI_DIRNAME .. filename, envTable)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function table.find(t, value)
  for k, v in pairs(t) do
    if v == value then
      return k
    end
  end
  return nil
end

function table.findi(t, value)
  for i, v in ipairs(t) do
    if v == value then
      return i
    end
  end
  return nil
end


function table.arrayToSet(t)
  local s = {}
  for _, v in ipairs(t) do
    s[v] = true
  end
  return s
end
