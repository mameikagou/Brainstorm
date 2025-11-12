-- Simple tests for analyze_deck and is_valid_deck
-- We'll create a fake G.playing_cards table and invoke analyze_deck(), is_valid_deck()
local function run()
  -- load the Core file to get analyze_deck/is_valid_deck in scope
  -- load Core/Brainstorm partially: only extract the functions we need.
  -- Use a safe loader that works on Lua 5.1/5.2+
  -- Prefer loading a small deck helper module for tests
  local ok, mod = pcall(dofile, "Core/lib_deck.lua")
  if ok and type(mod) == "table" then
    analyze_deck = mod.analyze_deck
    is_valid_deck = mod.is_valid_deck
  else
    error("failed to load Core/lib_deck.lua for tests")
  end

  -- fake playing cards
  G = G or {}
  G.playing_cards = {
    { base = { value = "Ace", suit = "Hearts" } },
    { base = { value = "King", suit = "Hearts" } },
    { base = { value = "7", suit = "Clubs" } },
  }

  local deck = analyze_deck()
  assert(deck.face_card_count == 1, "expected 1 face card")
  assert(deck.ace_count == 1, "expected 1 ace")
  assert(deck.suit_count.Hearts == 2, "expected 2 hearts")

  local ok = is_valid_deck(deck, 1, 1, 0.5)
  assert(ok == true or ok == false, "is_valid_deck returns boolean")

  print("test_deck: PASS")
  return true
end

local ok, err = pcall(run)
if not ok then
  io.stderr:write("test_deck: FAIL - " .. tostring(err) .. "\n")
  os.exit(2)
end
