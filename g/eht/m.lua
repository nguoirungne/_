function mainM()
   gg.setVisible(''>'')
   while true do
      local _1=gg.choice(eht.mergeM(eht.menu), nil, 'EHT MENU')
      if not _1 then NR.f.waitM() end
      if _1==#eht.menu.merge then NR.f.exitM() end
      checkF(_1)
   end
end

function userM()
   while true do
      local _1=gg.choice(eht.mergeM(eht.userM), nil, 'MENU')
      if not _1 then NR.f.waitM() end
      if _1==#eht.menu.merge then mainM() end
      userB(_1)
   end
end

function hunterM()
   while true do
      local _1=gg.choice(eht.mergeM(eht.hunterM), nil, 'MENU')
      if not _1 then NR.f.waitM() end
      if _1==#eht.menu.merge then mainM() end
      hunterB(_1)
   end
end

function shopM()
   while true do
      local _1=gg.choice(eht.mergeM(eht.shopM), nil, 'MENU')
      if not _1 then NR.f.waitM() end
      if _1==#eht.menu.merge then mainM() end
      shopB(_1)
   end
end

function extraM()
   NR.f.exitM()
end

















