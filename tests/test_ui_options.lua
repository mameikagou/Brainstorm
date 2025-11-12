-- Lightweight tests for data/ui_options.lua
local function run()
  local path = "data/ui_options.lua"
  local f = assert(io.open(path, "r"), "failed to open ui_options.lua")
  local raw = f:read("*a")
  f:close()
  -- Execute the file directly (dofile) which returns the module table
  local ui_mod = dofile(path)

  -- Basic API smoke tests
  local ratio_labels = ui_mod.get_labels("ratio")
  assert(type(ratio_labels) == "table", "ratio labels should be a table")
  assert(ratio_labels[1] == "50%", "first ratio label expected '50%'")

  local id = ui_mod.id_at("ratio", 1)
  assert(id == "r50", "expected id 'r50' for first ratio")

  local idx = ui_mod.index_of_id("ratio", id)
  assert(idx == 1, "index_of_id should return 1 for 'r50'")

  local val = ui_mod.value_for_id("ratio", id)
  assert(val == 0.5, "value_for_id should return 0.5 for 'r50'")

  -- pack entry
  local pack_id = ui_mod.id_at("pack", 2) -- arcana_normal
  local pack_entry = ui_mod.entry_for_id("pack", pack_id)
  assert(pack_entry and type(pack_entry.items) == "table", "pack entry should have items table")

  print("test_ui_options: PASS")
  return true
end

local ok, err = pcall(run)
if not ok then
  io.stderr:write("test_ui_options: FAIL - " .. tostring(err) .. "\n")
  os.exit(2)
end
