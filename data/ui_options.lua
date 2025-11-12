local M = {}

-- Internal representation: for each kind we keep an ordered id list and an id -> entry map.
-- Entry fields: label (displayed in UI), value (internal value), and kind-specific extras (e.g. items for packs).

local kinds = {
  tag = {
    ids = {
      "none",
      "tag_charm",
      "tag_double",
      "tag_uncommon",
      "tag_rare",
      "tag_holo",
      "tag_foil",
      "tag_polychrome",
      "tag_investment",
      "tag_voucher",
      "tag_boss",
      "tag_juggle",
      "tag_coupon",
      "tag_economy",
      "tag_skip",
      "tag_d_six",
    },
    map = {
      none = { label = "None", value = "" },
      tag_charm = { label = "Charm Tag", value = "tag_charm" },
      tag_double = { label = "Double Tag", value = "tag_double" },
      tag_uncommon = { label = "Uncommon Tag", value = "tag_uncommon" },
      tag_rare = { label = "Rare Tag", value = "tag_rare" },
      tag_holo = { label = "Holographic Tag", value = "tag_holo" },
      tag_foil = { label = "Foil Tag", value = "tag_foil" },
      tag_polychrome = { label = "Polychrome Tag", value = "tag_polychrome" },
      tag_investment = { label = "Investment Tag", value = "tag_investment" },
      tag_voucher = { label = "Voucher Tag", value = "tag_voucher" },
      tag_boss = { label = "Boss Tag", value = "tag_boss" },
      tag_juggle = { label = "Juggle Tag", value = "tag_juggle" },
      tag_coupon = { label = "Coupon Tag", value = "tag_coupon" },
      tag_economy = { label = "Economy Tag", value = "tag_economy" },
      tag_skip = { label = "Skip Tag", value = "tag_skip" },
      tag_d_six = { label = "D6 Tag", value = "tag_d_six" },
    },
  },

  voucher = {
    ids = {
      "none",
      "v_overstock_norm",
      "v_clearance_sale",
      "v_hone",
      "v_reroll_surplus",
      "v_crystal_ball",
      "v_telescope",
      "v_grabber",
      "v_wasteful",
      "v_tarot_merchant",
      "v_planet_merchant",
      "v_seed_money",
      "v_blank",
      "v_magic_trick",
      "v_hieroglyph",
      "v_directors_cut",
      "v_paint_brush",
    },
    map = {
      none = { label = "None", value = "" },
      v_overstock_norm = { label = "Overstock", value = "v_overstock_norm" },
      v_clearance_sale = { label = "Clearance Sale", value = "v_clearance_sale" },
      v_hone = { label = "Hone", value = "v_hone" },
      v_reroll_surplus = { label = "Reroll Surplus", value = "v_reroll_surplus" },
      v_crystal_ball = { label = "Crystal Ball", value = "v_crystal_ball" },
      v_telescope = { label = "Telescope", value = "v_telescope" },
      v_grabber = { label = "Grabber", value = "v_grabber" },
      v_wasteful = { label = "Wasteful", value = "v_wasteful" },
      v_tarot_merchant = { label = "Tarot Merchant", value = "v_tarot_merchant" },
      v_planet_merchant = { label = "Planet Merchant", value = "v_planet_merchant" },
      v_seed_money = { label = "Seed Money", value = "v_seed_money" },
      v_blank = { label = "Blank", value = "v_blank" },
      v_magic_trick = { label = "Magic Trick", value = "v_magic_trick" },
      v_hieroglyph = { label = "Hieroglyph", value = "v_hieroglyph" },
      v_directors_cut = { label = "Director's Cut", value = "v_directors_cut" },
      v_paint_brush = { label = "Paint Brush", value = "v_paint_brush" },
    },
  },

  pack = {
    ids = {
      "none",
      "arcana_normal",
      "arcana_jumbo",
      "arcana_mega",
      "celestial_normal",
      "celestial_jumbo",
      "celestial_mega",
      "standard_normal",
      "standard_jumbo",
      "standard_mega",
      "buffoon_normal",
      "buffoon_jumbo",
      "buffoon_mega",
      "spectral_normal",
      "spectral_jumbo",
      "spectral_mega",
    },
    map = {
      none = { label = "None", items = {} },
      arcana_normal = {
        label = "Normal Arcana",
        items = { "p_arcana_normal_1", "p_arcana_normal_2", "p_arcana_normal_3", "p_arcana_normal_4" },
      },
      arcana_jumbo = { label = "Jumbo Arcana", items = { "p_arcana_jumbo_1", "p_arcana_jumbo_2" } },
      arcana_mega = { label = "Mega Arcana", items = { "p_arcana_mega_1", "p_arcana_mega_2" } },
      celestial_normal = {
        label = "Normal Celestial",
        items = { "p_celestial_normal_1", "p_celestial_normal_2", "p_celestial_normal_3", "p_celestial_normal_4" },
      },
      celestial_jumbo = { label = "Jumbo Celestial", items = { "p_celestial_jumbo_1", "p_celestial_jumbo_2" } },
      celestial_mega = { label = "Mega Celestial", items = { "p_celestial_mega_1", "p_celestial_mega_2" } },
      standard_normal = {
        label = "Normal Standard",
        items = { "p_standard_normal_1", "p_standard_normal_2", "p_standard_normal_3", "p_standard_normal_4" },
      },
      standard_jumbo = { label = "Jumbo Standard", items = { "p_standard_jumbo_1", "p_standard_jumbo_2" } },
      standard_mega = { label = "Mega Standard", items = { "p_standard_mega_1", "p_standard_mega_2" } },
      buffoon_normal = { label = "Normal Buffoon", items = { "p_buffoon_normal_1", "p_buffoon_normal_2" } },
      buffoon_jumbo = { label = "Jumbo Buffoon", items = { "p_buffoon_jumbo_1" } },
      buffoon_mega = { label = "Mega Buffoon", items = { "p_buffoon_mega_1" } },
      spectral_normal = { label = "Normal Spectral", items = { "p_spectral_normal_1", "p_spectral_normal_2" } },
      spectral_jumbo = { label = "Jumbo Spectral", items = { "p_spectral_jumbo_1" } },
      spectral_mega = { label = "Mega Spectral", items = { "p_spectral_mega_1" } },
    },
  },

  spf = {
    ids = { "spf500", "spf750", "spf1000" },
    map = {
      spf500 = { label = "500", value = 500 },
      spf750 = { label = "750", value = 750 },
      spf1000 = { label = "1000", value = 1000 },
    },
  },

  ratio = {
    ids = { "r50", "r60", "r70", "r75", "r80" },
    map = {
      r50 = { label = "50%", value = 0.5 },
      r60 = { label = "60%", value = 0.6 },
      r70 = { label = "70%", value = 0.7 },
      r75 = { label = "75%", value = 0.75 },
      r80 = { label = "80%", value = 0.80 },
    },
  },
}

-- Generic helpers
local function get_kind(kind)
  return kinds[kind]
end

function M.get_labels(kind)
  local k = get_kind(kind)
  if not k then return {} end
  local out = {}
  for i,id in ipairs(k.ids) do
    local e = k.map[id]
    out[i] = (e and e.label) or tostring(id)
  end
  return out
end

function M.id_at(kind, index)
  local k = get_kind(kind)
  if not k then return nil end
  return k.ids[index]
end

function M.index_of_id(kind, id)
  local k = get_kind(kind)
  if not k then return 1 end
  if type(id) == "number" then
    return id
  end
  for i,v in ipairs(k.ids) do
    if v == id then return i end
  end
  return 1
end

function M.value_for_id(kind, id)
  local k = get_kind(kind)
  if not k then return nil end
  local e = k.map[id]
  return e and e.value
end

function M.entry_for_id(kind, id)
  local k = get_kind(kind)
  if not k then return nil end
  return k.map[id]
end

-- Backwards-compatible convenience exports for code that expects *_keys or *_list
M.get_tag_labels = function() return M.get_labels("tag") end
M.get_voucher_labels = function() return M.get_labels("voucher") end
M.get_pack_labels = function() return M.get_labels("pack") end
M.get_spf_labels = function() return M.get_labels("spf") end
M.get_ratio_labels = function() return M.get_labels("ratio") end

-- Expose the kinds table for any advanced use
M._kinds = kinds

return M
