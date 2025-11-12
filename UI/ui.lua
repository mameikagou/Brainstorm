local lovely = require("lovely")
local nativefs = require("nativefs")

local ui_options = Brainstorm.loadFile("/data/ui_options.lua")

-- Use ui_options helpers. The UI expects ordered label arrays for option cycles and
-- uses numeric indices for the current_option. Config will store IDs (strings).

G.FUNCS.change_target_voucher = function(x)
  local id = ui_options.id_at("voucher", x.to_key)
  Brainstorm.config.autoroll_filters.voucher_id = id
  Brainstorm.config.autoroll_filters.voucher_name = ui_options.value_for_id("voucher", id) or x.to_val
  Brainstorm.writeConfig()
end

G.FUNCS.change_target_pack = function(x)
  local id = ui_options.id_at("pack", x.to_key)
  Brainstorm.config.autoroll_filters.pack_id = id
  local entry = ui_options.entry_for_id("pack", id)
  Brainstorm.config.autoroll_filters.pack = entry and entry.items or {}
  Brainstorm.writeConfig()
end

G.FUNCS.change_target_tag = function(x)
  local id = ui_options.id_at("tag", x.to_key)
  Brainstorm.config.autoroll_filters.tag_id = id
  Brainstorm.config.autoroll_filters.tag_name = ui_options.value_for_id("tag", id) or x.to_val
  Brainstorm.writeConfig()
end

G.FUNCS.change_soul_count = function(x)
  Brainstorm.config.autoroll_filters.souls_to_skip = x.to_val
  Brainstorm.writeConfig()
end

G.FUNCS.change_spf = function(x)
  local id = ui_options.id_at("spf", x.to_key)
  Brainstorm.config.autoroll_prefs.seeds_per_frame_id = id
  Brainstorm.config.autoroll_prefs.seeds_per_frame = ui_options.value_for_id("spf", id) or x.to_val
  Brainstorm.writeConfig()
end

G.FUNCS.change_face_count = function(x)
	Brainstorm.config.autoroll_prefs.face_card_minimum = x.to_val
	Brainstorm.writeConfig()
end

G.FUNCS.change_suit_ratio = function(x)
  local id = ui_options.id_at("ratio", x.to_key)
  Brainstorm.config.autoroll_prefs.suit_ratio_id = id
  Brainstorm.config.autoroll_prefs.suit_ratio_percent = ui_options.entry_for_id("ratio", id) and ui_options.entry_for_id("ratio", id).label or x.to_val
  Brainstorm.config.autoroll_prefs.suit_ratio_decimal = ui_options.value_for_id("ratio", id)
  Brainstorm.writeConfig()
end

Brainstorm.opt_ref = G.FUNCS.options
G.FUNCS.options = function(e)
  Brainstorm.opt_ref(e)
end

local ct = create_tabs
function create_tabs(args)
  if args and args.tab_h == 7.05 then
    args.tabs[#args.tabs + 1] = {
      label = "Brainstorm",
      tab_definition_function = function()
        return {
          n = G.UIT.ROOT,
          config = {
            align = "cm",
            padding = 0.05,
            colour = G.C.CLEAR,
          },
          nodes = {
            {
              n = G.UIT.C,
              config = {
                align = "cm",
                padding = 0.05,
                r = 0.1,
                colour = darken(G.C.UI.TRANSPARENT_DARK, 0.25),
              },
              nodes = {
                create_option_cycle({
                  label = "AR: TAG SEARCH",
                  scale = 0.8,
                  w = 4,
                  options = ui_options.get_labels("tag"),
                  opt_callback = "change_target_tag",
                  current_option = ui_options.index_of_id("tag", Brainstorm.config.autoroll_filters.tag_id) or 1,
                }),
                create_option_cycle({
                  label = "AR: VOUCHER SEARCH",
                  scale = 0.8,
                  w = 4,
                  options = ui_options.get_labels("voucher"),
                  opt_callback = "change_target_voucher",
                  current_option = ui_options.index_of_id("voucher", Brainstorm.config.autoroll_filters.voucher_id) or 1,
                }),
                create_option_cycle({
                  label = "AR: PACK SEARCH",
                  scale = 0.8,
                  w = 4,
                  options = ui_options.get_labels("pack"),
                  opt_callback = "change_target_pack",
                  current_option = ui_options.index_of_id("pack", Brainstorm.config.autoroll_filters.pack_id) or 1,
                }),
                create_option_cycle({
                  label = "AR: N. SOULS",
                  scale = 0.8,
                  w = 4,
                  options = { 0, 1 },
                  opt_callback = "change_soul_count",
                  current_option = Brainstorm.config.autoroll_filters.souls_to_skip + 1
                    or 1,
                }),
              },
            },
            {
              n = G.UIT.C,
              config = {
                align = "cm",
                padding = 0.05,
                r = 0.1,
                colour = darken(G.C.UI.TRANSPARENT_DARK, 0.25),
              },
              nodes = {
                create_option_cycle({
                  label = "AP: Seeds per frame",
                  scale = 0.8,
                  w = 4,
                  options = ui_options.get_labels("spf"),
                  opt_callback = "change_spf",
                  current_option = ui_options.index_of_id("spf", Brainstorm.config.autoroll_prefs.seeds_per_frame_id) or 1,
                }),
                create_toggle({
                  label = "AR: INST OBSERVATORY",
                  scale = 0.8,
                  ref_table = Brainstorm.config.autoroll_filters,
                  ref_value = "inst_observatory",
                  callback = function(_set_toggle) end,
                }),
                create_toggle({
                  label = "AR: INST PERKEO",
                  scale = 0.8,
                  ref_table = Brainstorm.config.autoroll_filters,
                  ref_value = "inst_perkeo",
                  callback = function(_set_toggle) end,
                }),
                create_option_cycle({
                  label = "ED: Min. # of Face Cards",
                  scale = 0.8,
                  w = 4,
                  options = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25},
                  opt_callback = "change_face_count",
                  current_option = Brainstorm.config.autoroll_prefs.face_card_minimum + 1 or 1,
                }),
                create_option_cycle({
                  label = "ED: Suit Ratio ",
                  scale = 0.8,
                  w = 4,
                  options = ui_options.get_labels("ratio"),
                  opt_callback = "change_suit_ratio",
                  current_option = ui_options.index_of_id("ratio", Brainstorm.config.autoroll_prefs.suit_ratio_id or Brainstorm.config.autoroll_prefs.suit_ratio_percent) or 1,
                }),
              },
            },
          },
        }
      end,
      tab_definition_function_args = "Brainstorm",
    }
  end
  return ct(args)
end
