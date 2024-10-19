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
   local _1=gg.prompt({'Enter Gold: '..NR.v.link.teleUZ},{1000000000},{'number'})
   if not _1 then gg.toast('× Canceled!') userM() end
   for _,__ in ipairs(eht.var.dataU.classB) do
      NR.f.setScan(nil, false)
      local __1=NR.f.copyItems(__.address+eht.var.dataU.offset.gold, 4)
      NR.f.copyItems(__.address+eht.var.dataU.offset.gold+0x8, 32, __1[1].value~_1[1],nil,nil,nil,nil,nil,true)
   end
   eht.userM.toggle[1]='[+] '
   NR.f.setScan(nil, false)
   gg.toast('√ Gold has been updated!')
end --uGold
--###################################
function uElemental()
   local _1=gg.prompt({'Enter Elemental: '..NR.v.link.teleUZ},{30000},{'number'})
   if not _1 then gg.toast('× Canceled!') userM() end
   for _,__ in ipairs(eht.var.dataU.classB) do
      NR.f.setScan(nil, false)
      local __1=NR.f.copyItems(__.address+eht.var.dataU.offset.elemental, 4)
      NR.f.copyItems(__.address+eht.var.dataU.offset.elemental+0x4, 4, __1[1].value~_1[1],nil,nil,nil,nil,nil,true)
   end
   eht.userM.toggle[2]='[+] '
   NR.f.setScan(nil, false)
   gg.toast('√ Elemental has been updated!')
end --uElemental
--###################################
--###################################
function hunterB(__)
   if (eht.var.dataH.hasK==false) then
      eht.var.dataH.classK=NR.f.getB16LE(eht.class.dataH)
      eht.var.dataH.hasK=true
   end
   eht.var.dataH.classB={}
   NR.f.setScan(32, false)
   NR.f.scan(eht.var.dataH.classK, 32, nil, 0)
   local _1=NR.f.allResults()
   NR.f.setScan()
   if (#_1<100) then gg.alert('× Base not found.') mainM() end
   for _,___ in ipairs(_1) do
      NR.f.setScan(nil, false)
      local __1=NR.f.copyItems(___.address+eht.var.dataH.offset.job+8, 4)
      if (__1[1].value==1) then
         eht.var.dataH.classB[#eht.var.dataH.classB+1]=___
      end
      eht.mainM.toggle[2]='[>] '
   end
   if (__==1) then hunIdx() end
   if (__==2) then hunRank() end
   if (__==3) then hunCostume() end
   if (__==4) then hunSTech() end
   if (__==5) then hunMaxA() end   
   if (__==6) then hunDSoul() end   
end
--###################################
function hunGetB()
   eht.getDesc(eht.var.dataH)
   local _2=gg.prompt({'Enter Hunter Gold: '..NR.v.link.teleUZ},{eht.var.dataH.goldH},{'number'})
   if not _2 or (_2[1]=='') then gg.toast('× Canceled!') mainM() end
   eht.var.dataH.goldH=tonumber(_2[1])
   for _,___ in ipairs(eht.var.dataH.classB) do
      NR.f.setScan(nil, false)
      local __1=NR.f.copyItems(___.address+eht.var.dataH.offset.money, 4)
      local __2=NR.f.copyItems(___.address+eht.var.dataH.offset.money+8, 32)
      if (__1[1].value~__2[1].value==eht.var.dataH.goldH) then
         eht.var.dataH.hunB[1]=___
         eht.var.dataH.hasB=true
      break end
   end
   if (eht.var.dataH.hasB==false) then gg.alert('× No hunter found with the same amount of gold.') mainM() end
   eht.var.dataH.hasB=false
end
--###################################
function hunIdx()
   hunGetB()
   local _1_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.money, 4)
   local _1_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.money+8, 32)
   local _2_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.job, 4)
   local _2_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.job+4, 4)
   local _3_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.level, 4)
   local _3_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.level+4, 4)
   local _4_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.personality, 4)
   local _4_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.personality+4, 4)
   local _5_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.revive, 4)
   local _5_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.revive+4, 4)
   local _6_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.bodyIndex, 4)
   local _6_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.bodyIndex+4, 4)
   local _1=gg.prompt(
      {eht.var.dataH.descT[1], eht.var.dataH.descT[2]..' [0;3]', eht.var.dataH.descT[3]..' [1;100]', eht.var.dataH.descT[4]..' [0;32]', eht.var.dataH.descT[5]..' [0;5]', eht.var.dataH.descT[6]..' [0;156]', ''},
      {_1_1[1].value~_1_2[1].value, _2_1[1].value~_2_2[1].value, (_3_1[1].value~_3_2[1].value)+1, _4_1[1].value~_4_2[1].value, _5_1[1].value~_5_2[1].value, _6_1[1].value~_6_2[1].value, NR.v.link.teleUZ},
      {'number','number', 'number', 'number', 'number', 'number'}
   )
   if not _1 then gg.toast('× Canceled!') mainM() end
   NR.f.copyItems(_1_2[1].address, 32, _1_1[1].value~_1[1], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_2_2[1].address, 4, _2_1[1].value~_1[2], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_3_2[1].address, 4, _3_1[1].value~(_1[3]-1), nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_4_2[1].address, 4, _4_1[1].value~_1[4], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_5_2[1].address, 4, _5_1[1].value~_1[5], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_6_2[1].address, 4, _6_1[1].value~_1[6], nil,nil,nil,nil,nil,true)
   NR.f.setScan(nil, false)
   eht.hunterM.toggle[1]='[+] ' 
   NR.f.setScan(nil, false)
   gg.toast('√ Hunter Idx Updated!')
end
--###################################
function hunRank()
   hunGetB()
   local _1_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankHp, 4)
   local _1_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankHp+4, 4)
   local _2_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankDamage, 4)
   local _2_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankDamage+4, 4)
   local _3_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankArmor, 4)
   local _3_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankArmor+4, 4)
   local _4_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankCritical, 4)
   local _4_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankCritical+4, 4)
   local _5_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankAttackSpeed, 4)
   local _5_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankAttackSpeed+4, 4)
   local _6_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankDodge, 4)
   local _6_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankDodge+4, 4)
   local _7_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankHungry, 4)
   local _7_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankHungry+4, 4)
   local _8_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankFeel, 4)
   local _8_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankFeel+4, 4)
   local _9_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankTire, 4)
   local _9_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankTire+4, 4)
   local _10_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankTotal, 4)
   local _10_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.rankTotal+4, 4)
   local _1=gg.prompt(
      {eht.var.dataH.descT[7]..' [0;3]', eht.var.dataH.descT[8]..' [0;3]', eht.var.dataH.descT[9]..' [0;3]', eht.var.dataH.descT[10]..' [0;3]', eht.var.dataH.descT[11]..' [0;3]', eht.var.dataH.descT[12]..' [0;3]', eht.var.dataH.descT[13]..' [0;3]', eht.var.dataH.descT[14]..' [0;3]', eht.var.dataH.descT[15]..' [0;3]', ''}, 
      {_1_1[1].value~_1_2[1].value, _2_1[1].value~_2_2[1].value, _3_1[1].value~_3_2[1].value, _4_1[1].value~_4_2[1].value, _5_1[1].value~_5_2[1].value, _6_1[1].value~_6_2[1].value, _7_1[1].value~_7_2[1].value, _8_1[1].value~_8_2[1].value, _9_1[1].value~_9_2[1].value, NR.v.link.teleUZ}, 
      {'number','number', 'number', 'number', 'number', 'number', 'number', 'number', 'number'}
   )
   if not _1 then gg.toast('× Canceled!') mainM() end
   NR.f.copyItems(_1_2[1].address, 4, _1_1[1].value~_1[1], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_2_2[1].address, 4, _2_1[1].value~_1[2], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_3_2[1].address, 4, _3_1[1].value~_1[3], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_4_2[1].address, 4, _4_1[1].value~_1[4], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_5_2[1].address, 4, _5_1[1].value~_1[5], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_6_2[1].address, 4, _6_1[1].value~_1[6], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_7_2[1].address, 4, _7_1[1].value~_1[7], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_8_2[1].address, 4, _8_1[1].value~_1[8], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_9_2[1].address, 4, _9_1[1].value~_1[9], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_10_2[1].address, 4, _10_1[1].value~(_1[1]+_1[2]+_1[3]+_1[4]+_1[5]+_1[6]+_1[7]+_1[8]+_1[9]), nil,nil,nil,nil,nil,true)
   eht.hunterM.toggle[2]='[+] ' 
   NR.f.setScan(nil, false)
   gg.toast('√ Hunter Rank Updated!')
end
--###################################
function hunCostume()
   hunGetB()
   local _1_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.costumeIndex, 4)
   local _1_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.costumeIndex+4, 4)
   local _2_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.fairyIndex, 4)
   local _2_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.fairyIndex+4, 4)
   local _3_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.weaponCostumeIndex, 4)
   local _3_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.weaponCostumeIndex+4, 4)
   local _4_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.wingCostumeIndex, 4)
   local _4_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.wingCostumeIndex+4, 4)
   local _5_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.sealCostumeIndex, 4)
   local _5_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.sealCostumeIndex+4, 4)
   local _6_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.RamblePetIndex, 4)
   local _6_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.RamblePetIndex+4, 4)
   local _1=gg.prompt(
      {'costumeIndex: ', 'fairyIndex: ', 'weaponCostumeIndex: ', 'wingCostumeIndex: ', 'sealCostumeIndex: ', 'RamblePetIndex: ', ''},
      {_1_1[1].value~_1_2[1].value, _2_1[1].value~_2_2[1].value, _3_1[1].value~_3_2[1].value, _4_1[1].value~_4_2[1].value, _5_1[1].value~_5_2[1].value, _6_1[1].value~_6_2[1].value, NR.v.link.teleUZ},
      {'number','number', 'number', 'number', 'number', 'number'}
   )
   if not _1 then gg.toast('× Canceled!') mainM() end
   NR.f.copyItems(_1_2[1].address, 4, _1_1[1].value~_1[1], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_2_2[1].address, 4, _2_1[1].value~_1[2], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_3_2[1].address, 4, _3_1[1].value~_1[3], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_4_2[1].address, 4, _4_1[1].value~_1[4], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_5_2[1].address, 4, _5_1[1].value~_1[5], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_6_2[1].address, 4, _6_1[1].value~_1[6], nil,nil,nil,nil,nil,true)
   NR.f.setScan(nil, false)
   eht.hunterM.toggle[3]='[+] ' 
   NR.f.setScan(nil, false)
   gg.toast('√ Hunter Costume Updated!')
end
--###################################
function hunSTech()
   hunGetB()
   
end
--###################################
function hunMaxA()
   hunGetB()
   
end
--###################################
function hunDSoul()
   hunGetB()
   
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
      gg.editAll('2X4', 4)
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
      NR.f.setScan(nil, false)
      gg.toast('√ Free Shop Enable!')
   else
      NR.f.setScan(nil, false)
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
      NR.f.setScan(nil, false)
      gg.toast('! You need to buy first.')
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
         NR.f.setScan(nil, false)
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
      local __1=gg.prompt({'Enter Quantity: '..NR.v.link.teleUZ},{_2},{'number'})
      if not __1 or (__1[1]=='') then gg.toast('× Canceled!') mainM() end
      _2=tonumber(__1[1])
   end
   gg.toast('loading new values..')
   local _3,_4={},{}
   for _,__ in ipairs(eht.var.dataI.classB) do
      NR.f.setScan(nil, false)
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
   NR.f.setScan(nil, false)
   gg.toast('√ All Materials Updated!')
end
--###################################
--###################################
function extraR(__)
   if (__==1) then NR.f.exitM() end
   if (__==2) then mainM() end
   if (__==3) then mainM() end
   if (__==4) then transToggle() end
   if (__==5) then mainM() end
end
--###################################
function transToggle()
   if (eht.extraM.toggle[4]=='[×] ') then eht.extraM.toggle[4]='[√] ' 
      NR.v.set.autoT=true 
   else eht.extraM.toggle[4]='[×] ' 
      NR.v.set.autoT=false
   end
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
   local _1=gg.prompt({'Speed Game: '..NR.v.link.teleUZ..'[1;'..eht.var.speedG.maxS..']'},{eht.var.speedG.value},{'number'})
   if not _1 then gg.toast('× Canceled!') mainM() end
   eht.var.speedG.value=tonumber(_1[1])
   NR.f.copyItems(eht.var.speedG.addrB[1].address-4, 16, eht.var.speedG.value, nil,nil,nil,nil,nil,true)
   if (eht.var.speedG.value==1) then eht.mainM.toggle[6]='[×] ' 
   else eht.mainM.toggle[6]='[√] ' end
   NR.f.setScan(nil, false)
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
      for _,__ in ipairs(_1) do
         eht.var.oneH.addrB[1]={address=__.address+0, flags=16}
         eht.var.oneH.addrB[2]={address=__.address+4, flags=16}
         eht.var.oneH.addrB[3]={address=__.address+8, flags=16}
         eht.var.oneH.addrB[4]={address=__.address+12, flags=16}
         eht.var.oneH.addrB[5]={address=__.address+16, flags=16}
         local __1=NR.f.copyItems(__.address, 16)
         local __2=NR.f.copyItems(__.address+4, 16)
         local __3=NR.f.copyItems(__.address+8, 16)
         local __4=NR.f.copyItems(__.address+12, 16)
         local __5=NR.f.copyItems(__.address+16, 16)
         eht.var.oneH.value[1]=__1[1].value
         eht.var.oneH.value[2]=__2[1].value
         eht.var.oneH.value[3]=__3[1].value
         eht.var.oneH.value[4]=__4[1].value
         eht.var.oneH.value[5]=__5[1].value
      end
      eht.var.oneH.hasB=true
   end
   if (eht.mainM.toggle[7]=='[×] ') then eht.mainM.toggle[7]='[√] ' 
      NR.f.copyItems(eht.var.oneH.addrB[1].address, 16, eht.var.oneH.mulV, nil,nil,nil,nil,nil,true)
      NR.f.copyItems(eht.var.oneH.addrB[2].address, 16, eht.var.oneH.mulV, nil,nil,nil,nil,nil,true)
      NR.f.copyItems(eht.var.oneH.addrB[3].address, 16, eht.var.oneH.mulV, nil,nil,nil,nil,nil,true)
      NR.f.copyItems(eht.var.oneH.addrB[4].address, 16, eht.var.oneH.mulV, nil,nil,nil,nil,nil,true)
      NR.f.copyItems(eht.var.oneH.addrB[5].address, 16, eht.var.oneH.mulV, nil,nil,nil,nil,nil,true)
      NR.f.setScan(nil, false)
      gg.toast('√ 1Hit Kill Enable!')
   else eht.mainM.toggle[7]='[×] ' 
      NR.f.copyItems(eht.var.oneH.addrB[1].address, 16, eht.var.oneH.value[1], nil,nil,nil,nil,nil,true)
      NR.f.copyItems(eht.var.oneH.addrB[2].address, 16, eht.var.oneH.value[2], nil,nil,nil,nil,nil,true)
      NR.f.copyItems(eht.var.oneH.addrB[3].address, 16, eht.var.oneH.value[3], nil,nil,nil,nil,nil,true)
      NR.f.copyItems(eht.var.oneH.addrB[4].address, 16, eht.var.oneH.value[4], nil,nil,nil,nil,nil,true)
      NR.f.copyItems(eht.var.oneH.addrB[5].address, 16, eht.var.oneH.value[5], nil,nil,nil,nil,nil,true)
      NR.f.setScan(nil, false)
      gg.toast('√ 1Hit Kill Disable!')
   end
end
--###################################
--###################################






