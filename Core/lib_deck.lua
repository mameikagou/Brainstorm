-- Extracted deck analysis helpers for testing and reuse

local M = {}

function M.analyze_deck()
  local deck_summary = {}
  local suit_count = {Hearts = 0, Diamonds = 0, Clubs = 0, Spades = 0}
  local face_card_count = 0
  local numeric_card_count = 0
  local ace_count = 0
  local unique_card_count = 0

  for _, card in ipairs(G.playing_cards) do
      if card.base then
          local card_name = card.base.value .. " of " .. card.base.suit
          deck_summary[card_name] = (deck_summary[card_name] or 0) + 1
          suit_count[card.base.suit] = (suit_count[card.base.suit] or 0) + 1

          -- Categorizing cards
          if card.base.value == "Ace" then
              ace_count = ace_count + 1
          elseif card.base.value == "Jack" or card.base.value == "Queen" or card.base.value == "King" then
              face_card_count = face_card_count + 1
          else
              numeric_card_count = numeric_card_count + 1
          end
      end
  end

  -- Count unique cards
  for _ in pairs(deck_summary) do
      unique_card_count = unique_card_count + 1
  end

  return {
      deck_summary = deck_summary,
      suit_count = suit_count,
      face_card_count = face_card_count,
      numeric_card_count = numeric_card_count,
      ace_count = ace_count,
      unique_card_count = unique_card_count
  }
end

function M.is_valid_deck(deck_data, min_face_cards, min_aces, dominant_suit_ratio)
  min_face_cards = min_face_cards or 0
  min_aces = min_aces or 0
  dominant_suit_ratio = dominant_suit_ratio or 0

  local total_cards = (#G.playing_cards) or 0
  if total_cards == 0 then
    return false
  end

  local face_card_count = (deck_data and deck_data.face_card_count) or 0
  local ace_count = (deck_data and deck_data.ace_count) or 0
  local suit_count = (deck_data and deck_data.suit_count) or {}

  if face_card_count < min_face_cards then
    return false
  end
  if ace_count < min_aces then
    return false
  end

  local sorted_suits = {}
  for suit, count in pairs(suit_count) do
    table.insert(sorted_suits, {suit = suit, count = count})
  end
  table.sort(sorted_suits, function(a, b) return a.count > b.count end)

  local top1 = (sorted_suits[1] and sorted_suits[1].count) or 0
  local top2 = (sorted_suits[2] and sorted_suits[2].count) or 0
  local top_2_suit_count = top1 + top2
  local top_2_suit_percentage = top_2_suit_count / total_cards

  if top_2_suit_percentage < dominant_suit_ratio then
    return false
  end

  return true
end

return M
-- Extracted deck analysis helpers for testing and reuse

function analyze_deck()
  local deck_summary = {}
  local suit_count = {Hearts = 0, Diamonds = 0, Clubs = 0, Spades = 0}
  local face_card_count = 0
  local numeric_card_count = 0
  local ace_count = 0
  local unique_card_count = 0

  for _, card in ipairs(G.playing_cards) do
      if card.base then
          local card_name = card.base.value .. " of " .. card.base.suit
          deck_summary[card_name] = (deck_summary[card_name] or 0) + 1
          suit_count[card.base.suit] = (suit_count[card.base.suit] or 0) + 1

          -- Categorizing cards
          if card.base.value == "Ace" then
              ace_count = ace_count + 1
          elseif card.base.value == "Jack" or card.base.value == "Queen" or card.base.value == "King" then
              face_card_count = face_card_count + 1
          else
              numeric_card_count = numeric_card_count + 1
          end
      end
  end

  -- Count unique cards
  for _ in pairs(deck_summary) do
      unique_card_count = unique_card_count + 1
  end

  -- Return the analysis result
  return {
      deck_summary = deck_summary,
      suit_count = suit_count,
      face_card_count = face_card_count,
      numeric_card_count = numeric_card_count,
      ace_count = ace_count,
      unique_card_count = unique_card_count
  }
end

function is_valid_deck(deck_data, min_face_cards, min_aces, dominant_suit_ratio)
  min_face_cards = min_face_cards or 0
  min_aces = min_aces or 0
  dominant_suit_ratio = dominant_suit_ratio or 0

  local total_cards = (#G.playing_cards) or 0
  if total_cards == 0 then
    return false
  end

  local face_card_count = (deck_data and deck_data.face_card_count) or 0
  local ace_count = (deck_data and deck_data.ace_count) or 0
  local suit_count = (deck_data and deck_data.suit_count) or {}

  if face_card_count < min_face_cards then
    return false
  end
  if ace_count < min_aces then
    return false
  end

  local sorted_suits = {}
  for suit, count in pairs(suit_count) do
    table.insert(sorted_suits, {suit = suit, count = count})
  end
  table.sort(sorted_suits, function(a, b) return a.count > b.count end)

  local top1 = (sorted_suits[1] and sorted_suits[1].count) or 0
  local top2 = (sorted_suits[2] and sorted_suits[2].count) or 0
  local top_2_suit_count = top1 + top2
  local top_2_suit_percentage = top_2_suit_count / total_cards

  if top_2_suit_percentage < dominant_suit_ratio then
    return false
  end

  return true
end

return {
  analyze_deck = analyze_deck,
  is_valid_deck = is_valid_deck,
}
