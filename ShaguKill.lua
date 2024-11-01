local ShaguKill = CreateFrame("Frame")
ShaguKill:RegisterEvent("PLAYER_XP_UPDATE")
ShaguKill:RegisterEvent("UNIT_PET_EXPERIENCE")
ShaguKill:RegisterEvent("PLAYER_ENTERING_WORLD")

ShaguKill:SetScript("OnEvent", function()
  if event == "PLAYER_ENTERING_WORLD" then
    ShaguKill.oldXP =  UnitXP("player")

  elseif event == "PLAYER_XP_UPDATE" then
    ShaguKill.curXP = UnitXP("player")
    ShaguKill.maxXP = UnitXPMax("player")

    if ShaguKill.oldXP ~= nil then
      ShaguKill.difXP = ShaguKill.curXP - ShaguKill.oldXP
      if ShaguKill.difXP > 0 then
        ShaguKill.RemainingKills = ceil((ShaguKill.maxXP - ShaguKill.curXP)/ShaguKill.difXP)
        UIErrorsFrame:AddMessage("Siguiente nivel: |cffffffaa" .. ShaguKill.RemainingKills .. "|r muertes.")
		DEFAULT_CHAT_FRAME:AddMessage("Siguiente nivel: |cffffffaa" .. ShaguKill.RemainingKills .. "|r muertes.")
      end   
    end
    ShaguKill.oldXP = ShaguKill.curXP

  elseif event == "UNIT_PET_EXPERIENCE" then
    ShaguKill.petCurXP, ShaguKill.petMaxXP = GetPetExperience()
    if ShaguKill.petOldXP ~= nil then
      ShaguKill.petDifXP = ShaguKill.petCurXP - ShaguKill.petOldXP
      if ShaguKill.petDifXP > 0 then
        ShaguKill.petRemainingKills = ceil((ShaguKill.petMaxXP - ShaguKill.petCurXP)/ShaguKill.petDifXP)
        UIErrorsFrame:AddMessage("Mascota: |cffffffaa" .. ShaguKill.petRemainingKills .. "|r muertes.")
		DEFAULT_CHAT_FRAME:AddMessage("Mascota: |cffffffaa" .. ShaguKill.petRemainingKills .. "|r muertes.")
      end   
    end
    ShaguKill.petOldXP = ShaguKill.petCurXP
  end
end)