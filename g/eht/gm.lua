--###################################
function mainM()
   gg.setVisible(''>'')
   eht.getCookie()
   eht.getPCode()
   while true do
      eht.getPName()
      local _1=gg.choice(eht.mergeM(eht.mainM), nil, NR.v.note[1]..eht.upName()..'[EHT MENU]')
      if not _1 then NR.f.waitM() end      
      checkF(_1)
   end
end
--###################################
function checkF(__)
   if NR.f.checkPW(eht.check) then
      if __==1 then userM() end
      if __==2 then hunterM() end
      if __==3 then shopM() end
      if __==4 then paidM() end
      if __==5 then itemB() end
      if __==6 then extraM() end
   else mainM() end
end
--###################################
function userM()
   while true do
      local _1=gg.choice(eht.mergeM(eht.userM), nil, '[USER MANAGER]')
      if not _1 then NR.f.waitM() end
      if _1==#eht.userM.merge then mainM()
      else userB(_1) end      
   end
end
--###################################
function hunterM()
   while true do
      local _1=gg.choice(eht.mergeM(eht.hunterM), nil, '[HUNTER MANAGER]')
      if not _1 then NR.f.waitM() end
      if _1==#eht.hunterM.merge then mainM()
      else hunterB(_1) end
   end
end
--###################################
function shopM()
   while true do
      local _1=gg.choice(eht.mergeM(eht.shopM), nil, '[SHOP MANAGER]')
      if not _1 then NR.f.waitM() end
      if _1==#eht.shopM.merge then mainM()
      else shopB(_1) end
   end
end
--###################################
function paidM()
   while true do
      local _1=gg.choice(eht.mergeM(eht.paidM), nil, '[PAID MANAGER]')
      if not _1 then NR.f.waitM() end
      if _1==#eht.paidM.merge then mainM()
      else paidB(_1) end
   end
end
--###################################
function extraM()
   while true do
      local _1=gg.choice(eht.mergeM(eht.extraM), nil, '[EXTRA MENU]')
      if not _1 then NR.f.waitM() end
      if _1==#eht.extraM.merge then mainM()
      else extraR(_1) end
   end
end
--###################################
















