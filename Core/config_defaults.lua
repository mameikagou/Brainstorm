-- Configuration defaults for Brainstorm mod
-- Keep this file minimal and return a plain table; other code will merge user config into these defaults.
return {
  enable = true,
  autoroll_key = "r",
  keybinds = {
    options_key = "t",
    modifier_key = "lctrl",
    force_reroll_key = "r",
    toggle_autoroll_key = "a",
  },
  autoroll_filters = {
    pack = {},
    pack_id = 1,
    voucher_name = "",
    voucher_id = 1,
    tag_name = "tag_charm",
    tag_id = 2,
    souls_to_skip = 1,
    inst_observatory = false,
    inst_perkeo = false,
  },
  autoroll_prefs = {
    seeds_per_frame_id = 3,
    seeds_per_frame = 1000,
    face_card_minimum = 0,
    suit_ratio_percent = "50%",
    suit_ratio_decimal = 0.5,
  },
}
