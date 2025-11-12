-- Tests for migration logic: ensure legacy indices/labels/values map to canonical IDs
local function run()
  local ui_mod = dofile("data/ui_options.lua")

  -- simulate legacy config values
  local legacy = {
    autoroll_filters = {
      voucher_id = 2, -- numeric index -> should map to v_overstock_norm
      tag_name = "Charm Tag", -- label -> tag_charm
      pack_id = 3, -- numeric index -> arcana_jumbo (index 3)
    },
    autoroll_prefs = {
      seeds_per_frame = 750, -- numeric value -> spf750
      suit_ratio_decimal = 0.75, -- decimal -> r75
    },
  }

  -- replicate normalize_index_or_id from Brainstorm.migrate_ui_config but use ui_mod directly
  local function normalize_index_or_id(kind, v)
    if v == nil then return ui_mod.id_at(kind, 1) end
    if type(v) == "number" then
      local by_index = ui_mod.id_at(kind, v)
      if by_index then return by_index end
      local kinds_tbl = ui_mod._kinds and ui_mod._kinds[kind]
      if kinds_tbl and kinds_tbl.map then
        for id,entry in pairs(kinds_tbl.map) do
          if entry.value == v then return id end
        end
      end
      return ui_mod.id_at(kind, 1)
    end
    if type(v) == "string" then
      if ui_mod.entry_for_id(kind, v) then return v end
      local labels = ui_mod.get_labels(kind)
      for i,lab in ipairs(labels) do
        if lab == v then return ui_mod.id_at(kind, i) end
      end
      local kinds = ui_mod._kinds and ui_mod._kinds[kind]
      if kinds and kinds.map then
        for id,entry in pairs(kinds.map) do
          if entry.value == v or tostring(entry.value) == tostring(v) then return id end
        end
      end
    end
    return ui_mod.id_at(kind, 1)
  end

  -- voucher
  local vid = normalize_index_or_id("voucher", legacy.autoroll_filters.voucher_id)
  assert(vid == "v_overstock_norm", "voucher_id migration failed; got: " .. tostring(vid))

  -- tag
  local tid = normalize_index_or_id("tag", legacy.autoroll_filters.tag_name)
  assert(tid == "tag_charm", "tag migration failed; got: " .. tostring(tid))

  -- pack
  local pid = normalize_index_or_id("pack", legacy.autoroll_filters.pack_id)
  assert(pid == "arcana_jumbo", "pack migration failed; got: " .. tostring(pid))

  -- spf
  local spfid = normalize_index_or_id("spf", legacy.autoroll_prefs.seeds_per_frame)
  assert(spfid == "spf750", "spf migration failed; got: " .. tostring(spfid))

  -- ratio
  local rid = normalize_index_or_id("ratio", legacy.autoroll_prefs.suit_ratio_decimal)
  assert(rid == "r75", "ratio migration failed; got: " .. tostring(rid))

  print("test_migration: PASS")
  return true
end

local ok, err = pcall(run)
if not ok then
  io.stderr:write("test_migration: FAIL - " .. tostring(err) .. "\n")
  os.exit(2)
end
