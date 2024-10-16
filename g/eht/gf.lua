--###################################
--###################################
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
      eht.mainM.toggle[1]='[>] '
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
--###################################
function uGold()
   local _1=gg.prompt({'Enter Gold:'},{1000000000},{'number'})
   if not _1 then gg.toast('× Canceled!') userM() end
   for _,__ in ipairs(eht.var.dataU.classB) do
      local __1=NR.f.copyItems(__.address+eht.var.dataU.offset.gold, 4)
      NR.f.copyItems(__.address+eht.var.dataU.offset.gold+0x8, 32, __1[1].value~_1[1],nil,nil,nil,nil,nil,true)
   end
   eht.userM.toggle[1]='[+] '
   gg.toast('√ Gold has been updated!')
end --uGold
--###################################
function uElemental()
   local _1=gg.prompt({'Enter Elemental:'},{30000},{'number'})
   if not _1 then gg.toast('× Canceled!') userM() end
   for _,__ in ipairs(eht.var.dataU.classB) do
      local __1=NR.f.copyItems(__.address+eht.var.dataU.offset.elemental, 4)
      NR.f.copyItems(__.address+eht.var.dataU.offset.elemental+0x4, 4, __1[1].value~_1[1],nil,nil,nil,nil,nil,true)
   end
   eht.userM.toggle[2]='[+] '
   gg.toast('√ Elemental has been updated!')
end --uElemental
--###################################
--###################################
function hunterB(__)
   gg.alert('hunter base')
end
--###################################
--###################################
function shopB(__)
   gg.alert('shop base')
end
--###################################
--###################################
function paidB(__)
   gg.alert('paid base')
end
--###################################
--###################################
function itemB()
   if (eht.var.dataI.hasK==false) then
      eht.var.dataI.classK=NR.f.getB16LE(eht.class.dataI)
      eht.var.dataI.hasK=true
   end
   if (eht.var.dataI.hasB==false) then
      NR.f.setScan(32, false)
      NR.f.scan(eht.var.dataI.classK, 32, nil, 0)
      local _1=NR.f.allResults()
      NR.f.setScan()
      if (#_1<300) then gg.alert('× Base not found.') mainM() end
      for _,__ in ipairs(_1) do
         NR.f.setScan()
         local __1=NR.f.copyItems(__.address+eht.var.dataI.offset.index, 4)
         local __2=NR.f.copyItems(__.address+eht.var.dataI.offset.index+4, 4)
         local __3=__1[1].value~__2[1].value
         if (__3>=1 and __3<=131) or (__3>=137 and __3<=eht.var.dataI.maxId) then
            eht.var.dataI.classB[#eht.var.dataI.classB+1]=__
         end
      end
      eht.var.dataI.hasB=true
   end
   fullMat()
end
--###################################
function fullMat()
   local _1=gg.alert('Do you want to enter quantity?', 'input', 'random')
   if not _1 then gg.toast('× Canceled!') mainM() end
   local _2=math.random(800000,1000000)
   if (_1==1) then
      local __1=gg.prompt({'Enter Quantity:'},{_2},{'number'})
      if not __1 or (__1[1]=='') then gg.toast('× Canceled!') mainM() end
      _2=tonumber(__1[1])
   else
      for _,__ in ipairs(eht.var.dataI.classB) do
         local __1=NR.f.copyItems(__.address+eht.var.dataI.offset.newCheck, 4)
         local __2=NR.f.copyItems(__.address+eht.var.dataI.offset.count, 4)
         NR.f.copyItems(__.address+eht.var.dataI.offset.newCheck+4, 4, __1[1].value~213, nil,nil,nil,nil,nil,true)
         NR.f.copyItems(__.address+eht.var.dataI.offset.count+8, 32, __2[1].value~_2, nil,nil,nil,nil,nil,true)
      end   
   end
   eht.mainM.toggle[5]='[+] '
   gg.toast('√ All materials updated!')
end
--###################################
--###################################
function extraR(__)
   if (__==1) then NR.f.exitM() end
end
--###################################
--###################################








