local E, L, V, P, G = unpack(ElvUI)
local JiberishUI = E:GetModule('|cff00b3ffJiberish UI|r')
local valuecolors = E:ClassColor(E.myclass, true)

function JiberishUI:General()
	if not E.db.movers then E.db.movers = {} end

	E.global["general"]["UIScale"] = 0.59 --replace with the scale you use
	if (not IsAddOnLoaded("ElvUI_SLE")) then
		SetCVar('uiScale', 0.59)
	end

	--private profile
	E.private.ElvUI_EltreumUI.install_version = GetAddOnMetadata("ElvUI_EltreumUI", "Version") -- this is so eltruism doesn't popup after
	--E.db.mui.core.installed = true -- this is so merathilis doesn't popup after
	--E.private.mui.general.install_complete = GetAddOnMetadata("ElvUI_MerathilisUI", "Version") -- this is so merathilis doesn't popup after
	--E.private["bags"]["enable"] = false

	E.private["ElvUI_EltreumUI"]["isInstalled"]["projectazilroka"] = true
	E.private["ElvUI_EltreumUI"]["isInstalled"]["sle"] = true
	E.private["ElvUI_EltreumUI"]["isInstalled"]["windtools"] = true
	E.private["ElvUI_EltreumUI"]["nameplatepower"]["adjust"] = true
	E.private["actionbar"]["hideCooldownBling"] = true
	E.private["general"]["chatBubbleFont"] = "KMT-GothamXN_Ultra"
	E.private["general"]["chatBubbleFontOutline"] = "OUTLINE"
	E.private["general"]["chatBubbleFontSize"] = 10
	E.private["general"]["chatBubbleName"] = true
	E.private["general"]["chatBubbles"] = "nobackdrop"
	E.private["general"]["dmgfont"] = "KMT-GothamXN_Ultra"
	E.private["general"]["glossTex"] = "Asphyxia-Norm"
	E.private["general"]["minimap"]["hideTracking"] = true
	E.private["general"]["namefont"] = "KMT-GothamXN_Ultra"
	E.private["general"]["nameplateFont"] = "KMT-GothamXN_Ultra"
	E.private["general"]["nameplateFontSize"] = 10
	E.private["general"]["nameplateLargeFont"] = "KMT-GothamXN_Ultra"
	E.private["general"]["nameplateLargeFontSize"] = 10
	E.private["general"]["normTex"] = "Asphyxia-Norm"
	E.private["general"]["raidUtility"] = false
	E.private["general"]["replaceCombatText"] = true
	E.private["general"]["totemTracker"] = false
	E.private["skins"]["parchmentRemoverEnable"] = true
	E.private["theme"] = "class"

	--global
	E.global["datatexts"]["settings"]["Combat"]["TimeFull"] = false
	E.global["datatexts"]["settings"]["Durability"]["percThreshold"] = 40
	E.global["datatexts"]["settings"]["Experience"]["textFormat"] = "PERCENT"
	E.global["datatexts"]["settings"]["Friends"]["hideAFK"] = true
	E.global["datatexts"]["settings"]["Friends"]["hideApp"] = true
	E.global["datatexts"]["settings"]["Friends"]["hideBSAp"] = true
	E.global["datatexts"]["settings"]["Gold"]["goldCoins"] = false
	E.global["general"]["WorldMapCoordinates"]["position"] = "TOPLEFT"
	E.global["general"]["fadeMapDuration"] = 0.1
	E.global["general"]["mapAlphaWhenMoving"] = 0.35
	E.global["general"]["smallerWorldMap"] = false
	E.global["general"]["smallerWorldMapScale"] = 1
	if not E.Classic then
		E.global["unitframe"]["AuraBarColors"][2825]["color"]["b"] = 0.33333334326744
		E.global["unitframe"]["AuraBarColors"][2825]["color"]["g"] = 0.37647062540054
		E.global["unitframe"]["AuraBarColors"][2825]["color"]["r"] = 0.98039221763611
	end
	if E.Retail then
		E.global["unitframe"]["AuraBarColors"][80353]["color"]["b"] = 0.91372555494308
		E.global["unitframe"]["AuraBarColors"][80353]["color"]["g"] = 0.98039221763611
		E.global["unitframe"]["AuraBarColors"][80353]["color"]["r"] = 0.38431376218796
	end

	--nameplate filters (even though its disabled it needs to appear to prevent errors)
	--[[E.private["nameplates"]["enable"] = true --keep this in mind, you'll need to comment out the nameplate sections of the profiles
	E.db["nameplates"]["filters"] = E.db["nameplates"]["filters"] or {}
	for _, filterName in pairs({'EltreumTarget', 'EltreumInterrupt', 'EltreumRare', 'Neutral', 'm-2nd-Priority', 'm-High-HP','m-Priority-Target','m-Priority-Target-oof','m-Special', 'Explosives', 'm-3nd-Priority'}) do
		E.global["nameplates"]["filters"][filterName] = {}
		E.NamePlates:StyleFilterCopyDefaults(E.global["nameplates"]["filters"][filterName])
		E.db["nameplates"]["filters"][filterName] = E.global["nameplates"]["filters"][filterName]
	end]]

	--start the datatexts
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["enable"] = false
	E.db["datatexts"]["panels"]["RightChatDataPanel"]["enable"] = false

	E.DataTexts:BuildPanelFrame('EltruismDataText')
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["backdrop"] = false
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["panelTransparency"] = false
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["border"] = false
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["frameLevel"] = 1
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["frameStrata"] = "LOW"
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["growth"] = "HORIZONTAL"
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["mouseover"] = false
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["name"] = "Eltruism"
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["numPoints"] = 9
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["textJustify"] = "CENTER"
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["tooltipAnchor"] = "ANCHOR_TOPLEFT"
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["tooltipXOffset"] = -17
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["tooltipYOffset"] = 4
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["visibility"] = "[petbattle] hide;show"
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["height"] = 23
	E.db["movers"]["DTPanelEltruismDataTextMover"] = "BOTTOM,UIParent,BOTTOM,0,4"

	local buttonwidth = _G.RightChatToggleButton:GetWidth()
	local width = ceil(E.screenWidth)
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["width"] = 2 + math.ceil(width - (buttonwidth * 2))
	E.db["datatexts"]["panels"]["EltruismDataText"][1] = "mGameMenu"
	E.db["datatexts"]["panels"]["EltruismDataText"][2] = "Currencies"
	E.db["datatexts"]["panels"]["EltruismDataText"][3] = "Eltruism Stats 1"
	E.db["datatexts"]["panels"]["EltruismDataText"][4] = "Eltruism Stats 2"
	E.db["datatexts"]["panels"]["EltruismDataText"][5] = "Time"
	E.db["datatexts"]["panels"]["EltruismDataText"][6] = "Durability"
	E.db["datatexts"]["panels"]["EltruismDataText"][7] = "Item Level"
	E.db["datatexts"]["panels"]["EltruismDataText"][8] = "System"
	E.db["datatexts"]["panels"]["EltruismDataText"][9] = "Combat"
	E.db["datatexts"]["panels"]["EltruismDataText"]["battleground"] = false
	E.db["datatexts"]["panels"]["EltruismDataText"]["enable"] = true
	E.db["movers"]["DTPanelEltruismDataTextMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,0"
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["panelTransparency"] = true
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["backdrop"] = false
	E.db["datatexts"]["panels"]["RightChatDataPanel"]["panelTransparency"] = true
	E.db["datatexts"]["panels"]["RightChatDataPanel"]["backdrop"] = false

	--start the custom texts

	--party
	E.db["unitframe"]["units"]["party"]["customTexts"] = E.db["unitframe"]["units"]["party"]["customTexts"] or {}
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyHealth"] = {}
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyPower"] = {}
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyName"] = {}
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyIcon"] = {}
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyName"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyName"]["enable"] = false
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyName"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyName"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyName"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyName"]["size"] = 14
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyName"]["text_format"] = "[name:eltruism:abbreviate]"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyName"]["xOffset"] = 0
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyName"]["yOffset"] = 0
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyIcon"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyIcon"]["enable"] = false
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyIcon"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyIcon"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyIcon"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyIcon"]["size"] = 35
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyIcon"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyIcon"]["xOffset"] = -74
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyIcon"]["yOffset"] = 29
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyPower"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyPower"]["enable"] = false
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyPower"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyPower"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyPower"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyPower"]["size"] = 17
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyPower"]["text_format"] = "[powercolor][power:current:shortvalue]"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyPower"]["xOffset"] = 0
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyPower"]["yOffset"] = -1
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyHealth"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyHealth"]["enable"] = false
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyHealth"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyHealth"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyHealth"]["justifyH"] = "LEFT"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyHealth"]["size"] = 10
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyHealth"]["text_format"] = "[health:current:shortvalue]"
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyHealth"]["xOffset"] = 0
	E.db["unitframe"]["units"]["party"]["customTexts"]["JiberishPartyHealth"]["yOffset"] = 0

	--player
	E.db["unitframe"]["units"]["player"]["customTexts"] = E.db["unitframe"]["units"]["player"]["customTexts"] or {}
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerName"] = {}
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerHealth"] = {}
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerPower"] = {}
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerIcon"] = {}
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerIcon"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerIcon"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerIcon"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerIcon"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerIcon"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerIcon"]["size"] = 21
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerIcon"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerIcon"]["xOffset"] = -64
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerIcon"]["yOffset"] = 0
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerHealth"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerHealth"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerHealth"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerHealth"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerHealth"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerHealth"]["size"] = 15
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerHealth"]["text_format"] = "[health:current-percent:shortvalue]"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerHealth"]["xOffset"] = 0
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerHealth"]["yOffset"] = 0
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerPower"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerPower"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerPower"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerPower"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerPower"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerPower"]["size"] = 15
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerPower"]["text_format"] = "[powercolor][power:current:shortvalue]"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerPower"]["xOffset"] = 0
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerPower"]["yOffset"] = -1
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerName"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerName"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerName"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerName"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerName"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerName"]["size"] = 15
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerName"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerName"]["xOffset"] = 0
	E.db["unitframe"]["units"]["player"]["customTexts"]["JiberishPlayerName"]["yOffset"] = -1

	--raid1
	E.db["unitframe"]["units"]["raid1"]["customTexts"] = E.db["unitframe"]["units"]["raid1"]["customTexts"] or {}
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Health"] = {}
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Name"] = {}
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Icon"] = {}
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Power"] = {}
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Icon"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Icon"]["enable"] = false
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Icon"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Icon"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Icon"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Icon"]["size"] = 18
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Icon"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Icon"]["xOffset"] = -50
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Icon"]["yOffset"] = -1
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Health"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Health"]["enable"] = false
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Health"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Health"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Health"]["justifyH"] = "RIGHT"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Health"]["size"] = 8
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Health"]["text_format"] = "[health:current:shortvalue]"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Health"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Health"]["yOffset"] = 0
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Name"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Name"]["enable"] = false
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Name"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Name"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Name"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Name"]["size"] = 9
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Name"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Name"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Name"]["yOffset"] = -1
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Power"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Power"]["enable"] = false
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Power"]["font"] = "KMT-MonsterGoth-Black"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Power"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Power"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Power"]["size"] = 12
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Power"]["text_format"] = "[power:current:shortvalue]"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Power"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["JiberishRaid1Power"]["yOffset"] = 0

	--raid2
	E.db["unitframe"]["units"]["raid2"]["customTexts"] = E.db["unitframe"]["units"]["raid2"]["customTexts"] or {}
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Health"] = {}
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Name"] = {}
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Icon"] = {}
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Power"] = {}
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Icon"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Icon"]["enable"] = false
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Icon"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Icon"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Icon"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Icon"]["size"] = 18
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Icon"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Icon"]["xOffset"] = -50
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Icon"]["yOffset"] = -1
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Health"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Health"]["enable"] = false
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Health"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Health"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Health"]["justifyH"] = "RIGHT"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Health"]["size"] = 8
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Health"]["text_format"] = "[health:current:shortvalue]"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Health"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Health"]["yOffset"] = 0
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Name"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Name"]["enable"] = false
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Name"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Name"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Name"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Name"]["size"] = 9
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Name"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Name"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Name"]["yOffset"] = -1
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Power"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Power"]["enable"] = false
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Power"]["font"] = "KMT-MonsterGoth-Black"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Power"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Power"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Power"]["size"] = 12
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Power"]["text_format"] = "[power:current:shortvalue]"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Power"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["JiberishRaid2Power"]["yOffset"] = 0

	--raid3
	E.db["unitframe"]["units"]["raid3"]["customTexts"] = E.db["unitframe"]["units"]["raid3"]["customTexts"] or {}
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Health"] = {}
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Name"] = {}
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Icon"] = {}
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Power"] = {}
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Icon"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Icon"]["enable"] = false
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Icon"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Icon"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Icon"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Icon"]["size"] = 18
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Icon"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Icon"]["xOffset"] = -50
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Icon"]["yOffset"] = -1
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Health"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Health"]["enable"] = false
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Health"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Health"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Health"]["justifyH"] = "RIGHT"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Health"]["size"] = 8
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Health"]["text_format"] = "[health:current:shortvalue]"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Health"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Health"]["yOffset"] = 0
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Name"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Name"]["enable"] = false
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Name"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Name"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Name"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Name"]["size"] = 9
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Name"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Name"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Name"]["yOffset"] = -1
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Power"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Power"]["enable"] = false
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Power"]["font"] = "KMT-MonsterGoth-Black"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Power"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Power"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Power"]["size"] = 12
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Power"]["text_format"] = "[power:current:shortvalue]"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Power"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["JiberishRaid3Power"]["yOffset"] = 0

	--target
	E.db["unitframe"]["units"]["target"]["customTexts"] = E.db["unitframe"]["units"]["target"]["customTexts"] or {}
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetName"] = {}
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetHealth"] = {}
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetPower"] = {}
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetIcon"] = {}
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetIcon"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetIcon"]["enable"] = false
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetIcon"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetIcon"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetIcon"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetIcon"]["size"] = 21
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetIcon"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetIcon"]["xOffset"] = -64
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetIcon"]["yOffset"] = 0
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetHealth"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetHealth"]["enable"] = false
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetHealth"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetHealth"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetHealth"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetHealth"]["size"] = 15
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetHealth"]["text_format"] = "[health:current-percent:shortvalue]"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetHealth"]["xOffset"] = 0
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetHealth"]["yOffset"] = 0
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetPower"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetPower"]["enable"] = false
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetPower"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetPower"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetPower"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetPower"]["size"] = 15
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetPower"]["text_format"] = "[powercolor][power:current:shortvalue]"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetPower"]["xOffset"] = 0
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetPower"]["yOffset"] = -1
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetName"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetName"]["enable"] = false
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetName"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetName"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetName"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetName"]["size"] = 15
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetName"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetName"]["xOffset"] = 0
	E.db["unitframe"]["units"]["target"]["customTexts"]["JiberishTargetName"]["yOffset"] = -1

	--target of target
	E.db["unitframe"]["units"]["targettarget"]["customTexts"] = E.db["unitframe"]["units"]["targettarget"]["customTexts"] or {}
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetName"] = {}
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetHealth"] = {}
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetPower"] = {}
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetIcon"] = {}
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetIcon"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetIcon"]["enable"] = false
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetIcon"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetIcon"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetIcon"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetIcon"]["size"] = 21
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetIcon"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetIcon"]["xOffset"] = -64
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetIcon"]["yOffset"] = 0
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetHealth"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetHealth"]["enable"] = false
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetHealth"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetHealth"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetHealth"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetHealth"]["size"] = 15
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetHealth"]["text_format"] = "[health:current-percent:shortvalue]"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetHealth"]["xOffset"] = 0
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetHealth"]["yOffset"] = 0
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetPower"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetPower"]["enable"] = false
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetPower"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetPower"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetPower"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetPower"]["size"] = 15
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetPower"]["text_format"] = "[powercolor][power:current:shortvalue]"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetPower"]["xOffset"] = 0
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetPower"]["yOffset"] = -1
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetName"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetName"]["enable"] = false
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetName"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetName"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetName"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetName"]["size"] = 15
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetName"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetName"]["xOffset"] = 0
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["JiberishTargetTargetName"]["yOffset"] = -1

	--focus
	E.db["unitframe"]["units"]["focus"]["customTexts"] = E.db["unitframe"]["units"]["focus"]["customTexts"] or {}
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusName"] = {}
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusHealth"] = {}
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusPower"] = {}
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusIcon"] = {}
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusIcon"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusIcon"]["enable"] = false
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusIcon"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusIcon"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusIcon"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusIcon"]["size"] = 21
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusIcon"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusIcon"]["xOffset"] = -64
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusIcon"]["yOffset"] = 0
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusHealth"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusHealth"]["enable"] = false
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusHealth"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusHealth"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusHealth"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusHealth"]["size"] = 15
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusHealth"]["text_format"] = "[health:current-percent:shortvalue]"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusHealth"]["xOffset"] = 0
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusHealth"]["yOffset"] = 0
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusPower"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusPower"]["enable"] = false
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusPower"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusPower"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusPower"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusPower"]["size"] = 15
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusPower"]["text_format"] = "[powercolor][power:current:shortvalue]"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusPower"]["xOffset"] = 0
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusPower"]["yOffset"] = -1
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusName"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusName"]["enable"] = false
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusName"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusName"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusName"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusName"]["size"] = 15
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusName"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusName"]["xOffset"] = 0
	E.db["unitframe"]["units"]["focus"]["customTexts"]["JiberishFocusName"]["yOffset"] = -1

	--arena
	E.db["unitframe"]["units"]["arena"]["customTexts"] = E.db["unitframe"]["units"]["arena"]["customTexts"] or {}
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaName"] = {}
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaHealth"] = {}
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaPower"] = {}
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaIcon"] = {}
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaIcon"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaIcon"]["enable"] = false
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaIcon"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaIcon"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaIcon"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaIcon"]["size"] = 21
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaIcon"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaIcon"]["xOffset"] = -64
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaIcon"]["yOffset"] = 0
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaHealth"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaHealth"]["enable"] = false
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaHealth"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaHealth"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaHealth"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaHealth"]["size"] = 15
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaHealth"]["text_format"] = "[health:current-percent:shortvalue]"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaHealth"]["xOffset"] = 0
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaHealth"]["yOffset"] = 0
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaPower"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaPower"]["enable"] = false
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaPower"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaPower"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaPower"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaPower"]["size"] = 15
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaPower"]["text_format"] = "[powercolor][power:current:shortvalue]"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaPower"]["xOffset"] = 0
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaPower"]["yOffset"] = -1
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaName"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaName"]["enable"] = false
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaName"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaName"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaName"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaName"]["size"] = 15
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaName"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaName"]["xOffset"] = 0
	E.db["unitframe"]["units"]["arena"]["customTexts"]["JiberishArenaName"]["yOffset"] = -1

	--boss
	E.db["unitframe"]["units"]["boss"]["customTexts"] = E.db["unitframe"]["units"]["boss"]["customTexts"] or {}
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossName"] = {}
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossHealth"] = {}
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossPower"] = {}
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossIcon"] = {}
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossIcon"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossIcon"]["enable"] = false
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossIcon"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossIcon"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossIcon"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossIcon"]["size"] = 21
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossIcon"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossIcon"]["xOffset"] = -64
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossIcon"]["yOffset"] = 0
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossHealth"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossHealth"]["enable"] = false
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossHealth"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossHealth"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossHealth"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossHealth"]["size"] = 15
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossHealth"]["text_format"] = "[health:current-percent:shortvalue]"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossHealth"]["xOffset"] = 0
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossHealth"]["yOffset"] = 0
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossPower"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossPower"]["enable"] = false
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossPower"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossPower"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossPower"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossPower"]["size"] = 15
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossPower"]["text_format"] = "[powercolor][power:current:shortvalue]"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossPower"]["xOffset"] = 0
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossPower"]["yOffset"] = -1
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossName"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossName"]["enable"] = false
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossName"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossName"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossName"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossName"]["size"] = 15
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossName"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossName"]["xOffset"] = 0
	E.db["unitframe"]["units"]["boss"]["customTexts"]["JiberishBossName"]["yOffset"] = -1

	--pet
	E.db["unitframe"]["units"]["pet"]["customTexts"] = E.db["unitframe"]["units"]["pet"]["customTexts"] or {}
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetName"] = {}
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetHealth"] = {}
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetPower"] = {}
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetIcon"] = {}
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetIcon"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetIcon"]["enable"] = false
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetIcon"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetIcon"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetIcon"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetIcon"]["size"] = 21
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetIcon"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetIcon"]["xOffset"] = -64
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetIcon"]["yOffset"] = 0
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetHealth"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetHealth"]["enable"] = false
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetHealth"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetHealth"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetHealth"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetHealth"]["size"] = 15
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetHealth"]["text_format"] = "[health:current-percent:shortvalue]"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetHealth"]["xOffset"] = 0
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetHealth"]["yOffset"] = 0
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetPower"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetPower"]["enable"] = false
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetPower"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetPower"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetPower"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetPower"]["size"] = 15
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetPower"]["text_format"] = "[powercolor][power:current:shortvalue]"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetPower"]["xOffset"] = 0
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetPower"]["yOffset"] = -1
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetName"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetName"]["enable"] = false
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetName"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetName"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetName"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetName"]["size"] = 15
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetName"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetName"]["xOffset"] = 0
	E.db["unitframe"]["units"]["pet"]["customTexts"]["JiberishPetName"]["yOffset"] = -1

end

--fix colors afterwards so jiberish doesn't need to manually fix each new profile
function JiberishUI:FixClassColors()
	E.db["chat"]["tabSelectorColor"]["r"] = valuecolors.r
	E.db["chat"]["tabSelectorColor"]["g"] = valuecolors.g
	E.db["chat"]["tabSelectorColor"]["b"] = valuecolors.b
	E.db["general"]["customGlow"]["color"]["r"] = valuecolors.r
	E.db["general"]["customGlow"]["color"]["g"] = valuecolors.g
	E.db["general"]["customGlow"]["color"]["b"] = valuecolors.b
	E.db["chat"]["tabSelectedTextColor"]["r"] = valuecolors.r
	E.db["chat"]["tabSelectedTextColor"]["g"] = valuecolors.g
	E.db["chat"]["tabSelectedTextColor"]["b"] = valuecolors.b
	E.db["general"]["valuecolor"]["r"] = valuecolors.r
	E.db["general"]["valuecolor"]["g"] = valuecolors.g
	E.db["general"]["valuecolor"]["b"] = valuecolors.b
end


--setup eltruism nameplates/settings
function JiberishUI:EltruismNPSettings()
	ElvUI_EltreumUI:SetupNamePlates('ElvUI')
	E.db.ElvUI_EltreumUI.nameplates.nameplatepower.autoadjustposition = true
	E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.ClassColorGlow = true
	E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.ClassBorderNameplate = false
	if not E.db.ElvUI_EltreumUI.unitframes.gradientmode.npenable then
		E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.nameplatetexture = true
	end
	E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.classbarautohide = true
	E.db.ElvUI_EltreumUI.nameplates.nameplatepower.texture = "ElvUI Norm1"
	E.db.ElvUI_EltreumUI.nameplates.nameplatepower.modeleffect = true
	E.db.ElvUI_EltreumUI.nameplates.classification.enable = false
	E.db.ElvUI_EltreumUI.nameplates.nameplatepower.gradient = true

	--power bar scaling issues
	E.db.ElvUI_EltreumUI.nameplates.nameplatepower.sizex = 110.5

	--nameplate shadows (requires main shadows)
	E.db.ElvUI_EltreumUI.skins.shadow.enable = true
	E.db.ElvUI_EltreumUI.skins.shadow.nameplates = true
	E.db.ElvUI_EltreumUI.skins.shadow.nppower = true
	E.db.ElvUI_EltreumUI.skins.shadow.npcastbar = true
	E.db.ElvUI_EltreumUI.skins.shadow.npportraits = true

	E.db.ElvUI_EltreumUI.skins.shadow.raid = false
	E.db.ElvUI_EltreumUI.skins.shadow.aura = false
	E.db.ElvUI_EltreumUI.skins.shadow.ufaura = false
	E.db.ElvUI_EltreumUI.skins.shadow.actionbars = false
	E.db.ElvUI_EltreumUI.skins.shadow.minimap = false
	E.db.ElvUI_EltreumUI.skins.shadow.chat = false
	E.db.ElvUI_EltreumUI.skins.shadow.unitframes = false

	E.db.ElvUI_EltreumUI.nameplates.nameplatepower.a = 1
	E.db.ElvUI_EltreumUI.nameplates.nameplatelevel = true
	E.db.ElvUI_EltreumUI.nameplates.friendlynameplatetoggle.friendlynames = false -- turns out blizzard fakes the nameplates and alphas the helthbar, causing huge performance costs
	E.db.ElvUI_EltreumUI.nameplates.friendlynameplatetoggle.hidefriendly = false -- and this one is the same but with health so make this one off as well
	E.db.ElvUI_EltreumUI.nameplates.friendlynameplatetoggle.disablefriendly = true --so hide it instead
	E.db.ElvUI_EltreumUI.nameplates.nptextureversion = "V2"
	E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.enableHealthHeight = true
	E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.useelvuinpheight = true
	E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.targetmodel = true
	E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.restedoverlap = true
	E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.npglow = true
	E.db.ElvUI_EltreumUI.nameplates.auras.enable = true
	E.db.ElvUI_EltreumUI.unitframes.gradientmode.nporientation = "VERTICAL"
	E.private.ElvUI_EltreumUI.nameplatepower.enable = true
	E.private.ElvUI_EltreumUI.nameplatepower.adjust = true
	if E.Retail then
		E.db.ElvUI_EltreumUI.cvars.autohidenpcname = true
	end
end
