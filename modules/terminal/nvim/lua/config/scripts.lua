_G.short_path = function()
  local path = vim.fn.expand("%:p")
  local home = vim.fn.expand("~")

  -- Replace home dir prefix with ~
  path = path:gsub("^" .. home, "~")

  -- Split into parts
  local parts = {}
  for part in path:gmatch("[^/]+") do
    table.insert(parts, part)
  end

  -- If 3 or fewer parts (e.g. ~, folder, file.md), just return as-is
  if #parts <= 3 then
    return table.concat(parts, "/")
  end

  -- Otherwise return ../parent/file.md
  return ".../" .. parts[#parts - 2] .. "/" ..  parts[#parts - 1] .. "/" .. parts[#parts]
end

