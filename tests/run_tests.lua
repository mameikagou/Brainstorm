local tests = {
  "tests/test_ui_options.lua",
  "tests/test_deck.lua",
  "tests/test_migration.lua",
}

local passed = 0
local failed = 0

for _, t in ipairs(tests) do
  io.write("Running: " .. t .. " ... ")
  local ok, err = pcall(function() dofile(t) end)
  if ok then
    print("OK")
    passed = passed + 1
  else
    print("FAIL - " .. tostring(err))
    failed = failed + 1
  end
end

print(string.format("\nSummary: %d passed, %d failed", passed, failed))
if failed > 0 then os.exit(2) end
