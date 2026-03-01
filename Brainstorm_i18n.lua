Brainstorm.I18N = {
  mod = {
    ['en-us'] = {
      ui = {
        tab_name = 'Brainstorm',
        debug_mode = 'Debug Mode',
        search_tag = 'AutoReroll Search Tag',
        search_pack = 'AutoReroll Search Pack',
        soul_count = 'Charm Tag/Arcana Pack: Number of Souls',
        rerolls_per_frame = 'Rerolls per Frame',
      },
      toast = {
        rerolling = 'Rerolling...',
        saved_slot = 'Saved state to slot [{k}]',
        loaded_slot = 'Loaded save from slot [{k}]',
      },
      option = {
        none = 'None',
        pack = {
          arcana_all = 'Arcana Pack (All)',
          celestial_all = 'Celestial Pack (All)',
          standard_all = 'Standard Pack (All)',
          buffoon_all = 'Buffoon Pack (All)',
          spectral_all = 'Spectral Pack (All)',
        },
      },
    },
    ['zh_CN'] = {
      ui = {
        tab_name = 'Brainstorm',
        debug_mode = '调试模式',
        search_tag = '自动重掷：目标标签',
        search_pack = '自动重掷：目标补充包',
        soul_count = '魅力标签/秘术包：灵魂数量',
        rerolls_per_frame = '每帧重掷次数',
      },
      toast = {
        rerolling = '重掷中…',
        saved_slot = '已保存到槽位 [{k}]',
        loaded_slot = '已读取槽位 [{k}] 存档',
      },
      option = {
        none = '无',
        pack = {
          arcana_all = '秘术包（全部）',
          celestial_all = '天体包（全部）',
          standard_all = '标准包（全部）',
          buffoon_all = '小丑包（全部）',
          spectral_all = '幻灵包（全部）',
        },
      },
    },
  },
}

Brainstorm.SearchTagOptions = {
  { key = 'none', tag_key = '' },
  { key = 'tag_uncommon', tag_key = 'tag_uncommon' },
  { key = 'tag_rare', tag_key = 'tag_rare' },
  { key = 'tag_holo', tag_key = 'tag_holo' },
  { key = 'tag_foil', tag_key = 'tag_foil' },
  { key = 'tag_polychrome', tag_key = 'tag_polychrome' },
  { key = 'tag_investment', tag_key = 'tag_investment' },
  { key = 'tag_voucher', tag_key = 'tag_voucher' },
  { key = 'tag_boss', tag_key = 'tag_boss' },
  { key = 'tag_charm', tag_key = 'tag_charm' },
  { key = 'tag_juggle', tag_key = 'tag_juggle' },
  { key = 'tag_double', tag_key = 'tag_double' },
  { key = 'tag_coupon', tag_key = 'tag_coupon' },
  { key = 'tag_economy', tag_key = 'tag_economy' },
  { key = 'tag_skip', tag_key = 'tag_skip' },
  { key = 'tag_d_six', tag_key = 'tag_d_six' },
}

Brainstorm.SearchPackOptions = {
  { key = 'none', packs = {} },
  {
    key = 'arcana_all',
    packs = { 'p_arcana_normal_1', 'p_arcana_normal_2', 'p_arcana_normal_3', 'p_arcana_normal_4', 'p_arcana_jumbo_1', 'p_arcana_jumbo_2', 'p_arcana_mega_1', 'p_arcana_mega_2' },
    custom_label = 'option.pack.arcana_all',
  },
  {
    key = 'celestial_all',
    packs = { 'p_celestial_normal_1', 'p_celestial_normal_2', 'p_celestial_normal_3', 'p_celestial_normal_4', 'p_celestial_jumbo_1', 'p_celestial_jumbo_2', 'p_celestial_mega_1', 'p_celestial_mega_2' },
    custom_label = 'option.pack.celestial_all',
  },
  {
    key = 'standard_all',
    packs = { 'p_standard_normal_1', 'p_standard_normal_2', 'p_standard_normal_3', 'p_standard_normal_4', 'p_standard_jumbo_1', 'p_standard_jumbo_2', 'p_standard_mega_1', 'p_standard_mega_2' },
    custom_label = 'option.pack.standard_all',
  },
  {
    key = 'buffoon_all',
    packs = { 'p_buffoon_normal_1', 'p_buffoon_normal_2', 'p_buffoon_jumbo_1', 'p_buffoon_mega_1' },
    custom_label = 'option.pack.buffoon_all',
  },
  {
    key = 'spectral_all',
    packs = { 'p_spectral_normal_1', 'p_spectral_normal_2', 'p_spectral_jumbo_1', 'p_spectral_mega_1' },
    custom_label = 'option.pack.spectral_all',
  },
  { key = 'normal_arcana', packs = { 'p_arcana_normal_1', 'p_arcana_normal_2', 'p_arcana_normal_3', 'p_arcana_normal_4' }, booster_key = 'p_arcana_normal_1' },
  { key = 'jumbo_arcana', packs = { 'p_arcana_jumbo_1', 'p_arcana_jumbo_2' }, booster_key = 'p_arcana_jumbo_1' },
  { key = 'mega_arcana', packs = { 'p_arcana_mega_1', 'p_arcana_mega_2' }, booster_key = 'p_arcana_mega_1' },
  { key = 'normal_celestial', packs = { 'p_celestial_normal_1', 'p_celestial_normal_2', 'p_celestial_normal_3', 'p_celestial_normal_4' }, booster_key = 'p_celestial_normal_1' },
  { key = 'jumbo_celestial', packs = { 'p_celestial_jumbo_1', 'p_celestial_jumbo_2' }, booster_key = 'p_celestial_jumbo_1' },
  { key = 'mega_celestial', packs = { 'p_celestial_mega_1', 'p_celestial_mega_2' }, booster_key = 'p_celestial_mega_1' },
  { key = 'normal_standard', packs = { 'p_standard_normal_1', 'p_standard_normal_2', 'p_standard_normal_3', 'p_standard_normal_4' }, booster_key = 'p_standard_normal_1' },
  { key = 'jumbo_standard', packs = { 'p_standard_jumbo_1', 'p_standard_jumbo_2' }, booster_key = 'p_standard_jumbo_1' },
  { key = 'mega_standard', packs = { 'p_standard_mega_1', 'p_standard_mega_2' }, booster_key = 'p_standard_mega_1' },
  { key = 'normal_buffoon', packs = { 'p_buffoon_normal_1', 'p_buffoon_normal_2' }, booster_key = 'p_buffoon_normal_1' },
  { key = 'jumbo_buffoon', packs = { 'p_buffoon_jumbo_1' }, booster_key = 'p_buffoon_jumbo_1' },
  { key = 'mega_buffoon', packs = { 'p_buffoon_mega_1' }, booster_key = 'p_buffoon_mega_1' },
  { key = 'normal_spectral', packs = { 'p_spectral_normal_1', 'p_spectral_normal_2' }, booster_key = 'p_spectral_normal_1' },
  { key = 'jumbo_spectral', packs = { 'p_spectral_jumbo_1' }, booster_key = 'p_spectral_jumbo_1' },
  { key = 'mega_spectral', packs = { 'p_spectral_mega_1' }, booster_key = 'p_spectral_mega_1' },
}

local function get_lang_key()
  if G and G.SETTINGS and G.SETTINGS.language and Brainstorm.I18N.mod[G.SETTINGS.language] then
    return G.SETTINGS.language
  end
  return 'en-us'
end

local function get_by_path(root, path)
  local node = root
  for part in string.gmatch(path, '[^.]+') do
    if type(node) ~= 'table' then return nil end
    node = node[part]
    if node == nil then return nil end
  end
  return node
end

function Brainstorm.t(key, vars)
  local lang = get_lang_key()
  local value = get_by_path(Brainstorm.I18N.mod[lang], key) or get_by_path(Brainstorm.I18N.mod['en-us'], key) or key
  if type(value) ~= 'string' then return key end
  if not vars then return value end

  return (value:gsub('{([%w_]+)}', function(name)
    local replacement = vars[name]
    return replacement ~= nil and tostring(replacement) or '{' .. name .. '}'
  end))
end

local function game_name(set_name, key)
  if not key or key == '' then return nil end
  local ok, result = pcall(function()
    return localize({ type = 'name_text', set = set_name, key = key })
  end)
  if ok and result and result ~= 'ERROR' then return result end
  return nil
end

local function booster_name(key)
  if not key or key == '' then return nil end
  local base_key = string.gsub(key, '_%d+$', '')
  return game_name('Booster', base_key) or game_name('Booster', key)
end

function Brainstorm.search_tag_labels()
  local labels = {}
  for _, option in ipairs(Brainstorm.SearchTagOptions) do
    if option.tag_key == '' then
      labels[#labels + 1] = Brainstorm.t('option.none')
    else
      labels[#labels + 1] = game_name('Tag', option.tag_key) or option.tag_key
    end
  end
  return labels
end

function Brainstorm.search_pack_labels()
  local labels = {}
  for _, option in ipairs(Brainstorm.SearchPackOptions) do
    if option.key == 'none' then
      labels[#labels + 1] = Brainstorm.t('option.none')
    elseif option.custom_label then
      labels[#labels + 1] = Brainstorm.t(option.custom_label)
    elseif option.booster_key then
      labels[#labels + 1] = booster_name(option.booster_key) or option.booster_key
    else
      labels[#labels + 1] = option.key
    end
  end
  return labels
end

function Brainstorm.option_index_by_key(options, key)
  if not key then return nil end
  for i, option in ipairs(options) do
    if option.key == key then return i end
  end
  return nil
end

function Brainstorm.option_index_by_tag_key(tag_key)
  if not tag_key then return nil end
  for i, option in ipairs(Brainstorm.SearchTagOptions) do
    if option.tag_key == tag_key then return i end
  end
  return nil
end

function Brainstorm.option_index_by_packs(pack_list)
  if type(pack_list) ~= 'table' then return nil end
  for i, option in ipairs(Brainstorm.SearchPackOptions) do
    local expected = option.packs
    if #pack_list == #expected then
      local same = true
      for p = 1, #expected do
        if pack_list[p] ~= expected[p] then
          same = false
          break
        end
      end
      if same then return i end
    end
  end
  return nil
end

function Brainstorm.migrate_settings()
  local settings = Brainstorm.SETTINGS
  if not settings then return false end
  settings.autoreroll = settings.autoreroll or {}
  local ar = settings.autoreroll
  local changed = false

  -- Keep legacy behavior stable: old config stored searchTag as semantic key.
  local tag_index = Brainstorm.option_index_by_key(Brainstorm.SearchTagOptions, ar.searchTagKey)
    or Brainstorm.option_index_by_tag_key(ar.searchTag)

  if not tag_index and ar.searchTagID then
    local legacy_tag_order = {
      'none',
      'tag_charm',
      'tag_double',
      'tag_uncommon',
      'tag_rare',
      'tag_holo',
      'tag_foil',
      'tag_polychrome',
      'tag_investment',
      'tag_voucher',
      'tag_boss',
      'tag_juggle',
      'tag_coupon',
      'tag_economy',
      'tag_skip',
      'tag_d_six',
    }
    local legacy_key = legacy_tag_order[tonumber(ar.searchTagID)]
    if legacy_key and legacy_key ~= 'none' then
      tag_index = Brainstorm.option_index_by_tag_key(legacy_key)
    elseif legacy_key == 'none' then
      tag_index = Brainstorm.option_index_by_key(Brainstorm.SearchTagOptions, 'none')
    end
  end

  if not tag_index then
    tag_index = 1
  end

  local selected_tag_key = Brainstorm.SearchTagOptions[tag_index].key
  if ar.searchTagKey ~= selected_tag_key then
    ar.searchTagKey = selected_tag_key
    changed = true
  end

  if ar.searchTagID ~= tag_index then
    ar.searchTagID = tag_index
    changed = true
  end

  local tag_value = Brainstorm.SearchTagOptions[tag_index].tag_key
  if ar.searchTag ~= tag_value then
    ar.searchTag = tag_value
    changed = true
  end

  local pack_index = Brainstorm.option_index_by_key(Brainstorm.SearchPackOptions, ar.searchPackKey)
    or Brainstorm.option_index_by_packs(ar.searchPack)
  if not pack_index then
    pack_index = tonumber(ar.searchPackID) or 1
    if pack_index < 1 or pack_index > #Brainstorm.SearchPackOptions then pack_index = 1 end
    changed = true
  end

  if ar.searchPackKey ~= Brainstorm.SearchPackOptions[pack_index].key then
    ar.searchPackKey = Brainstorm.SearchPackOptions[pack_index].key
    changed = true
  end

  if ar.searchPackID ~= pack_index then
    ar.searchPackID = pack_index
    changed = true
  end

  local expected_packs = Brainstorm.SearchPackOptions[pack_index].packs
  if type(ar.searchPack) ~= 'table' or #ar.searchPack ~= #expected_packs then
    ar.searchPack = expected_packs
    changed = true
  else
    for i = 1, #expected_packs do
      if ar.searchPack[i] ~= expected_packs[i] then
        ar.searchPack = expected_packs
        changed = true
        break
      end
    end
  end

  return changed
end
