function mainM()
   gg.setVisible(''>'')
   while true do
      local _1=gg.choice(eht.mergeM(eht.mainM), nil, 'EHT MENU')
      if not _1 then NR.f.waitM() end
      if _1==#eht.mainM.merge then NR.f.exitM()
      else checkF(_1) end
   end
end

function userM()
   while true do
      local _1=gg.choice(eht.mergeM(eht.userM), nil, 'MENU')
      if not _1 then NR.f.waitM() end
      if _1==#eht.userM.merge then mainM()
      else userB(_1) end      
   end
end

function hunterM()
   while true do
      local _1=gg.choice(eht.mergeM(eht.hunterM), nil, 'MENU')
      if not _1 then NR.f.waitM() end
      if _1==#eht.hunterM.merge then mainM()
      else hunterB(_1) end
   end
end

function shopM()
   while true do
      local _1=gg.choice(eht.mergeM(eht.shopM), nil, 'MENU')
      if not _1 then NR.f.waitM() end
      if _1==#eht.shopM.merge then mainM()
      else shopB(_1) end
   end
end

function extraM()
   NR.f.exitM()
end

















