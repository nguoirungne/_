function checkF(__)
   if NR.f.checkPW(eht.check) then
      if __==1 then userM() end
      if __==2 then hunterM() end
      if __==3 then shopM() end
      if __==4 then matB() end
   else mainM() end
end

function userB(__)
   if (eht.var.dataU.hasK==false) then
      eht.var.dataU.classK=NR.f.getB16LE(eht.class.dataU)
      eht.var.dataU.hasK=true
   end
   if (eht.var.dataU.hasB==false) then
      NR.f.setScan(32, false)
      NR.f.scan(eht.var.dataU.classK, 32, nil, 0)
      local _1=NR.f.allResults()
      NR.f.setScan()
      if (#_1<400) then gg.alert('× Base not found.') mainM() end
      for _,___ in ipairs(_1) do
         local __1=NR.f.copyItems(___.address+eht.var.dataU.offset.gold+0x10, 4)
         if (__1[1].value==1) then
            eht.var.dataU.classB[#eht.var.dataU.classB+1]=___
         end
      end
      eht.var.dataU.hasB=true
      eht.mainM.tongle[1]='[>] '
   end
   if (#eht.var.dataU.classB>1) then
      local _2={}
      for _,___ in ipairs(eht.var.dataU.classB) do
         local __1=NR.f.copyItems(___.address+eht.var.dataU.offset.gold+0x10, 4)
         if (__1[1].value==1) then
            _2[#_2+1]=___
         end
      end
      eht.var.dataU.classB=_2
   end
   if (__==1) then uGold() end
   if (__==2) then uElemental() end
end --userB

function uGold()
   local _1=gg.prompt({'Enter Gold:'},{1000000000},{'number'})
   if not _1 then gg.toast('× Canceled!') mainM() end
   for _,__ in ipairs(eht.var.dataU.classB) do
      local __1=NR.f.copyItems(__.address+eht.var.dataU.offset.gold, 4)
      NR.f.copyItems(__.address+eht.var.dataU.offset.gold+0x8, 32, __1[1].value~_1[1],nil,nil,nil,nil,nil,true)
   end
   eht.userM.tongle[1]='[√] '
   gg.toast('√ Gold has been updated!')
end --uGold

function uElemental()
   local _1=gg.prompt({'Enter Elemental:'},{30000},{'number'})
   if not _1 then gg.toast('× Canceled!') mainM() end
   for _,__ in ipairs(eht.var.dataU.classB) do
      local __1=NR.f.copyItems(__.address+eht.var.dataU.offset.elemental, 4)
      NR.f.copyItems(__.address+eht.var.dataU.offset.elemental+0x4, 4, __1[1].value~_1[1],nil,nil,nil,nil,nil,true)
   end
   eht.userM.tongle[2]='[√] '
   gg.toast('√ Elemental has been updated!')
end --uElemental

function hunterB(__)
   gg.alert('hunter base')
end

function shopB(__)
   gg.alert('shop base')
end

function matB()
   fullMat()
end

function fullMat()
   eht.getCookie()
end












