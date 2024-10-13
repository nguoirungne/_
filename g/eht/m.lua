function mainM()
   gg.setVisible(''>'')
   while true do
      local _1=gg.choice(eht.mergeM(eht.menu), nil, 'EHT MENU')
      if not _1 then NR.f.waitM() end
      if _1==#eht.menu.merge then NR.f.exitM() end
      _0_(_1)
   end
end

function userM()
   while true do
      local _1=gg.choice(eht.mergeM(eht.userM), nil, 'MENU')
      if not _1 then NR.f.waitM() end
      if _1==#eht.menu.merge then mainM() end
      gg.alert('userM')
   end
end

function hunterM()
   while true do
      local _1=gg.choice(eht.mergeM(eht.hunterM), nil, 'MENU')
      if not _1 then NR.f.waitM() end
      if _1==#eht.menu.merge then mainM() end
      gg.alert('hunterM')
   end
end

function shopM()
   while true do
      local _1=gg.choice(eht.mergeM(eht.shopM), nil, 'MENU')
      if not _1 then NR.f.waitM() end
      if _1==#eht.menu.merge then mainM() end
      gg.alert('shopM')
   end
end

function extraM()

end

















