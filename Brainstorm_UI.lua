local lovely = require("lovely")
local nativefs = require("nativefs")

Brainstorm.seedsPerFrame = {
    ["500"] = 500,
    ["750"] = 750,
    ["1000"] = 1000,
}

local seedsPerFrame = {"500", "750", "1000"}

Brainstorm.G_FUNCS_options_ref = G.FUNCS.options
G.FUNCS.options = function(e)
	Brainstorm.G_FUNCS_options_ref(e)
end
local ct = create_tabs
function create_tabs(args)
	if args and args.tab_h == 7.05 then
		local searchTagLabels = Brainstorm.search_tag_labels()
		local searchPackLabels = Brainstorm.search_pack_labels()
		local currentTagOption = Brainstorm.option_index_by_key(Brainstorm.SearchTagOptions, Brainstorm.SETTINGS.autoreroll.searchTagKey)
			or tonumber(Brainstorm.SETTINGS.autoreroll.searchTagID)
			or 1
		local currentPackOption = Brainstorm.option_index_by_key(Brainstorm.SearchPackOptions, Brainstorm.SETTINGS.autoreroll.searchPackKey)
			or tonumber(Brainstorm.SETTINGS.autoreroll.searchPackID)
			or 1
		if currentTagOption < 1 or currentTagOption > #Brainstorm.SearchTagOptions then currentTagOption = 1 end
		if currentPackOption < 1 or currentPackOption > #Brainstorm.SearchPackOptions then currentPackOption = 1 end

		args.tabs[#args.tabs + 1] = {
			label = Brainstorm.t('ui.tab_name'),
			tab_definition_function = function()
				return {
					n = G.UIT.ROOT,
					config = {
						align = "cm",
						padding = 0.05,
						colour = G.C.CLEAR,
					},
						nodes = {
							create_toggle({
								label = Brainstorm.t('ui.debug_mode'),
								ref_table = Brainstorm.SETTINGS,
								ref_value = "debug_mode",
							callback = function(_set_toggle)
								_RELEASE_MODE = not Brainstorm.SETTINGS.debug_mode
								G.F_NO_ACHIEVEMENTS = Brainstorm.SETTINGS.debug_mode
							end,
							}),
							create_option_cycle({
								label = Brainstorm.t('ui.search_tag'),
								scale = 0.8,
								w = 4,
								options = searchTagLabels,
								opt_callback = "change_search_tag",
								current_option = currentTagOption,
							}),
							create_option_cycle({
								label = Brainstorm.t('ui.search_pack'),
								scale = 0.8,
								w = 4,
								options = searchPackLabels,
								opt_callback = "change_search_pack",
								current_option = currentPackOption,
							}),
							create_option_cycle({
								label = Brainstorm.t('ui.soul_count'),
								scale = 0.8,
								w = 4,
								options = {0,1,2},
								opt_callback = "change_search_soul_count",
								current_option = (Brainstorm.SETTINGS.autoreroll.searchForSoul or 0) + 1,
							}),
                        create_option_cycle({
							label = Brainstorm.t('ui.rerolls_per_frame'),
							scale = 0.8,
							w = 4,
							options = seedsPerFrame,
							opt_callback = "change_seeds_per_frame",
							current_option = Brainstorm.SETTINGS.autoreroll.seedsPerFrameID or 1,
						}),
					},
				}
			end,
			tab_definition_function_args = "Brainstorm",
		}
	end
	return ct(args)
end
function saveManagerAlert(text)
	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0.4,
		func = function()
			attention_text({
				text = text,
				scale = 0.7,
				hold = 3,
				major = G.STAGE == G.STAGES.RUN and G.play or G.title_top,
				backdrop_colour = G.C.SECONDARY_SET.Tarot,
				align = "cm",
				offset = {
					x = 0,
					y = -3.5,
				},
				silent = true,
			})
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.06 * G.SETTINGS.GAMESPEED,
				blockable = false,
				blocking = false,
				func = function()
					play_sound("other1", 0.76, 0.4)
					return true
				end,
			}))
			return true
		end,
	}))
end
