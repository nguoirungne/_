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
   if (eht.var.dataAS.hasK==false) then
      eht.var.dataAS.classK=NR.f.getB16LE(eht.class.dataAS)
      eht.var.dataAS.hasK=true
   end
   if (eht.var.dataAS.hasB==false) then
      NR.f.setScan(32, false)
      NR.f.scan(eht.var.dataAS.classK, 32, nil, 0)
      local _1=NR.f.allResults()
      NR.f.setScan()
      if (#_1<500) then gg.alert('× Base not found.') mainM() end
      eht.var.dataAS.classB=_1
      eht.var.dataAS.hasB=true
   end
   sFree()
end
--###################################
function sFree()
   if (eht.mainM.toggle[5]~='[√] ') then
      local _0=false
      if (eht.check.dBool.ad) then
         local __1=gg.alert('Get free shop full?', 'ok', 'just normal')
         if (__1==1) then _0=true end
      end
      local _1,_2,_3,_4={},{},{},{}    
      for _,__ in ipairs(eht.var.dataAS.classB) do
         NR.f.setScan(nil, false)
         _1[#_1+1]={address=__.address+eht.var.dataAS.offset.priceIdx+4, flags=4}
         _2[#_2+1]={address=__.address+eht.var.dataAS.offset.price+4, flags=4}
         _3[#_3+1]={address=__.address+eht.var.dataAS.offset.count+4, flags=4}
         _4[#_4+1]={address=__.address+eht.var.dataAS.offset.visible+4, flags=4}
      end
      NR.f.setScan(nil, false)
      gg.loadResults(_1)
      NR.f.allResults()
      gg.editAll('1X4', 4)
      NR.f.setScan()
      NR.f.setScan(nil, false)
      gg.loadResults(_2)
      NR.f.allResults()
      gg.editAll('1X4', 4)
      NR.f.setScan()
      NR.f.setScan(nil, false)
      gg.loadResults(_3)
      NR.f.allResults()
      gg.editAll('0X4', 4)
      NR.f.setScan()
      if (_0) then
         NR.f.setScan(nil, false)
         gg.loadResults(_4)
         NR.f.allResults()
         gg.editAll('0X4', 4)
         NR.f.setScan()
      end
      eht.mainM.toggle[5]='[√] '
      gg.toast('√ Free Shop Enable!')
   else
      gg.toast('! You need re-open the game to restore shop.')
   end
end
--###################################
--###################################
function paidB(__)
   if (__==1) then
      if (eht.var.dataASCB.hasK==false) then
         eht.var.dataASCB.classK=NR.f.getB16LE(eht.class.dataASCB)
         eht.var.dataASCB.hasK=true
      end
      if (eht.var.dataASCB.hasB==false) then
         NR.f.setScan(32, false)
         NR.f.scan(eht.var.dataASCB.classK, 32, nil, 0)
         local _1=NR.f.allResults()
         NR.f.setScan()
         if (#_1<50) then gg.alert('× Base not found.') mainM() end
         eht.var.dataASCB.classB=_1
         eht.var.dataASCB.hasB=true
         eht.mainM.toggle[3]='[>] '
      end
      sBoxPack()
   end --dataASCB
end
--###################################
function sBoxPack()
   if (eht.check.dBool.ad) then
      eht.paidM.toggle[1]='[+] '
      local _0=gg.alert('Get list of IDs?', 'ok', 'skip')
      if (_0==1) then
         local __1=gg.makeRequest(eht.request.hostSID).content
         if (__1~=nil) then gg.alert(__1) end
      end
      local _1=gg.prompt({'Pack ID:', 'Count: [1;1000]', ''},{eht.var.dataASCB.maxId,1, NR.v.link.teleUZ},{'number','number'})
      if not _1 then gg.toast('× Canceled!') paidM() end
      if (tonumber(_1[1])>eht.var.dataASCB.maxId) or (tonumber(_1[1])<0) then
         gg.toast('ID changed to default >'..eht.var.dataASCB.maxId)
         _1[1]=eht.var.dataASCB.maxId
      end
      local _2,_3={},{}
      for _,__ in ipairs(eht.var.dataASCB.classB) do
         NR.f.setScan(nil, false)
         _2[#_2+1]={address=__.address+eht.var.dataASCB.offset.rewardIdx+4, flags=4}
         _3[#_3+1]={address=__.address+eht.var.dataASCB.offset.rewardCnt+4, flags=4}
      end 
      NR.f.setScan(nil, false)
      gg.loadResults(_2)
      NR.f.allResults()
      gg.editAll(_1[1]..'X4', 4)
      NR.f.setScan(nil, false)
      gg.loadResults(_3)
      NR.f.allResults()
      gg.editAll(_1[2]..'X4', 4)
      NR.f.setScan()
      if (eht.var.dataAS.hasF==false) then
         local _4=gg.alert('√ Editing complete! Go to shop and open the shiny box.', 'free shop now', 'confirm')
         if (_4==1) then shopB() end
      else
         gg.alert('√ Editing complete! Go to shop and open the shiny box.')
      end
   else
      gg.alert('You need to buy first.')
   end   
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
   end
   gg.toast('loading new values..')
   local _3,_4={},{}
   for _,__ in ipairs(eht.var.dataI.classB) do
      NR.f.setScan()
      _3[#_3+1]={address=__.address+eht.var.dataI.offset.newCheck+4, flags=4}
      _4[#_4+1]={address=__.address+eht.var.dataI.offset.count+8, flags=32}
   end
   gg.loadResults(_3)
   NR.f.allResults()
   gg.editAll('213X4', 4)
   NR.f.setScan(nil, false)
   gg.loadResults(_4)
   NR.f.allResults()
   gg.editAll(_2..'X8', 32)
   NR.f.setScan(nil, false)
   eht.mainM.toggle[4]='[+] ' 
   gg.toast('√ All Materials Updated!')
end
--###################################
--###################################
function extraR(__)
   if (__==1) then NR.f.exitM() end
   if (__==5) then mainM() end
end
--###################################
--###################################
function speedB()
   if (eht.var.speedG.hasB==false) then
      NR.f.setScan(32, false)
      NR.f.scan(eht.var.speedG.scan, 32)
      local _1=NR.f.allResults()
      NR.f.setScan()
      if (#_1<1) then gg.alert('× Value not found.') mainM() end
      eht.var.speedG.addrB=_1
      eht.var.speedG.hasB=true
   end
   local _1=gg.prompt({'Speed Game: [1;'..eht.var.speedG.maxS..']'},{eht.var.speedG.value},{'number'})
   if not _1 then gg.toast('× Canceled!') mainM() end
   eht.var.speedG.value=tonumber(_1[1])
   NR.f.copyItems(eht.var.speedG.addrB[1].address-4, 16, eht.var.speedG.value, nil,nil,nil,nil,nil,true)
   if (eht.var.speedG.value==1) then eht.mainM.toggle[6]='[×] ' 
   else eht.mainM.toggle[6]='[+] ' end
   gg.toast('√ Game Speed Updated!')
end
--###################################
--###################################
function oneB()
   if (eht.var.oneH.hasB==false) then
      NR.f.setScan(32, false)
      NR.f.scan(eht.var.oneH.scan, 32)
      local _1=NR.f.allResults()
      NR.f.setScan()
      if (#_1<1) then gg.alert('× Value not found.') mainM() end
      eht.var.oneH.addrB=_1
      eht.var.oneH.hasB=true
   end
end
--###################################
--###################################






