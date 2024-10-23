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
   eht.getDesc(eht.var.dataU)
   if (__==1) then uGold() end
   if (__==2) then uElemental() end
end --userB
--###################################
function uGold()
   local _1=gg.prompt({eht.var.dataU.descT[1]..' '..NR.v.link.teleUZ},{1000000000},{'number'})
   if not _1 then gg.toast(NR.v.link.teleUZ) userM() end
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
   local _1=gg.prompt({eht.var.dataU.descT[2]..' '..NR.v.link.teleUZ},{30000},{'number'})
   if not _1 then gg.toast(NR.v.link.teleUZ) userM() end
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
   local _2=gg.prompt({eht.var.dataH.descT[40]..' '..NR.v.link.teleUZ},{eht.var.dataH.goldH},{'number'})
   if not _2 or (_2[1]=='') then gg.toast(NR.v.link.teleUZ) mainM() end
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
   if (eht.var.dataH.hasB==false) then gg.alert('× '..eht.var.dataH.descT[41]) mainM() end
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
   if not _1 then gg.toast(NR.v.link.teleUZ) mainM() end
   NR.f.copyItems(_1_2[1].address, 32, _1_1[1].value~_1[1], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_2_2[1].address, 4, _2_1[1].value~_1[2], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_3_2[1].address, 4, _3_1[1].value~(_1[3]-1), nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_4_2[1].address, 4, _4_1[1].value~_1[4], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_5_2[1].address, 4, _5_1[1].value~_1[5], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_6_2[1].address, 4, _6_1[1].value~_1[6], nil,nil,nil,nil,nil,true)
   NR.f.setScan(nil, false)
   eht.hunterM.toggle[1]='[+] ' 
   gg.toast('√ '..eht.var.dataH.descT[42])
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
   if not _1 then gg.toast(NR.v.link.teleUZ) mainM() end
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
   gg.toast('√ '..eht.var.dataH.descT[43])
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
      {eht.var.dataH.descT[17], eht.var.dataH.descT[18], eht.var.dataH.descT[19], eht.var.dataH.descT[20], eht.var.dataH.descT[21], eht.var.dataH.descT[22], ''},
      {_1_1[1].value~_1_2[1].value, _2_1[1].value~_2_2[1].value, _3_1[1].value~_3_2[1].value, _4_1[1].value~_4_2[1].value, _5_1[1].value~_5_2[1].value, _6_1[1].value~_6_2[1].value, NR.v.link.teleUZ},
      {'number','number', 'number', 'number', 'number', 'number'}
   )
   if not _1 then gg.toast(NR.v.link.teleUZ) mainM() end
   NR.f.copyItems(_1_2[1].address, 4, _1_1[1].value~_1[1], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_2_2[1].address, 4, _2_1[1].value~_1[2], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_3_2[1].address, 4, _3_1[1].value~_1[3], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_4_2[1].address, 4, _4_1[1].value~_1[4], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_5_2[1].address, 4, _5_1[1].value~_1[5], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_6_2[1].address, 4, _6_1[1].value~_1[6], nil,nil,nil,nil,nil,true)
   NR.f.setScan(nil, false)
   eht.hunterM.toggle[3]='[+] ' 
   gg.toast('√ '..eht.var.dataH.descT[44])
end
--###################################
function hunSTech()
   hunGetB()
   local _1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.GUP_Property_LV, 32)
   local _2=NR.f.copyItems(_1[1].value, 32)
   local _1_1=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[1], 4)
   local _1_2=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[1]+4, 4)
   local _2_1=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[2], 4)
   local _2_2=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[2]+4, 4)
   local _3_1=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[3], 4)
   local _3_2=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[3]+4, 4)
   local _4_1=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[4], 4)
   local _4_2=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[4]+4, 4)
   local _5_1=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[5], 4)
   local _5_2=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[5]+4, 4) 
   local _6_1=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[6], 4)
   local _6_2=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[6]+4, 4)
   local _7_1=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[7], 4)
   local _7_2=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[7]+4, 4)
   local _8_1=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[8], 4)
   local _8_2=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[8]+4, 4)
   local _9_1=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[9], 4)
   local _9_2=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[9]+4, 4)
   local _10_1=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[10], 4)
   local _10_2=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[10]+4, 4)
   local _11_1=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[11], 4)
   local _11_2=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[11]+4, 4)
   local _12_1=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[12], 4)
   local _12_2=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[12]+4, 4)
   local _13_1=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[13], 4)
   local _13_2=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[13]+4, 4)
   local _14_1=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[14], 4)
   local _14_2=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[14]+4, 4)
   local _15_1=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[15], 4)
   local _15_2=NR.f.copyItems(_2[1].address+eht.var.dataH.offsetGPL.offset[15]+4, 4)
   local _3=gg.prompt(
      {eht.var.dataH.descT[25]..' [0;100]', eht.var.dataH.descT[26]..' [0;100]', eht.var.dataH.descT[27]..' [0;100]', eht.var.dataH.descT[28]..' [0;100]', eht.var.dataH.descT[29]..' [0;100]', eht.var.dataH.descT[30]..' [0;100]', eht.var.dataH.descT[31]..' [0;100]', eht.var.dataH.descT[32]..' [0;100]', eht.var.dataH.descT[33]..' [0;100]', eht.var.dataH.descT[34]..' [0;100]', eht.var.dataH.descT[35]..' [0;100]', eht.var.dataH.descT[36]..' [0;100]', eht.var.dataH.descT[37]..' [0;100]', eht.var.dataH.descT[38]..' [0;100]', eht.var.dataH.descT[39]..' [0;100]', ''},
      {_1_1[1].value~_1_2[1].value, _2_1[1].value~_2_2[1].value, _3_1[1].value~_3_2[1].value, _4_1[1].value~_4_2[1].value, _5_1[1].value~_5_2[1].value, _6_1[1].value~_6_2[1].value, _7_1[1].value~_7_2[1].value, _8_1[1].value~_8_2[1].value, _9_1[1].value~_9_2[1].value, _10_1[1].value~_10_2[1].value, _11_1[1].value~_11_2[1].value, _12_1[1].value~_12_2[1].value, _13_1[1].value~_13_2[1].value, _14_1[1].value~_14_2[1].value, _15_1[1].value~_15_2[1].value, NR.v.link.teleUZ},
      {'number','number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number'}
   )
   if not _3 then gg.toast(NR.v.link.teleUZ) mainM() end
   NR.f.copyItems(_1_2[1].address, 4, _1_1[1].value~_3[1], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_2_2[1].address, 4, _2_1[1].value~_3[2], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_3_2[1].address, 4, _3_1[1].value~_3[3], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_4_2[1].address, 4, _4_1[1].value~_3[4], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_5_2[1].address, 4, _5_1[1].value~_3[5], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_6_2[1].address, 4, _6_1[1].value~_3[6], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_7_2[1].address, 4, _7_1[1].value~_3[7], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_8_2[1].address, 4, _8_1[1].value~_3[8], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_9_2[1].address, 4, _9_1[1].value~_3[9], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_10_2[1].address, 4, _10_1[1].value~_3[10], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_11_2[1].address, 4, _11_1[1].value~_3[11], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_12_2[1].address, 4, _12_1[1].value~_3[12], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_13_2[1].address, 4, _13_1[1].value~_3[13], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_14_2[1].address, 4, _14_1[1].value~_3[14], nil,nil,nil,nil,nil,true)
   NR.f.copyItems(_15_2[1].address, 4, _15_1[1].value~_3[15], nil,nil,nil,nil,nil,true)
   NR.f.setScan(nil, false)
   eht.hunterM.toggle[4]='[+] ' 
   gg.toast('√ '..eht.var.dataH.descT[45])
end
--###################################
function hunMaxA()
   eht.getDesc(eht.var.dataH)
   for _,__ in ipairs(eht.var.dataH.classB) do
      local __1=NR.f.copyItems(__.address+eht.var.dataH.offset.level, 4)
      NR.f.copyItems(__.address+eht.var.dataH.offset.level+4, 4, __1[1].value~99, nil,nil,nil,nil,nil,true)
   end  
   NR.f.setScan(nil, false)
   eht.hunterM.toggle[5]='[+] ' 
   gg.toast('√ '..eht.var.dataH.descT[46]) 
end
--###################################
function hunDSoul()
   hunGetB()
   local _1_1=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.DSoul, 4)
   local _1_2=NR.f.copyItems(eht.var.dataH.hunB[1].address+eht.var.dataH.offset.DSoul+8, 32)
   local _1=gg.prompt(
      {eht.var.dataH.descT[23]..' '..NR.v.link.teleUZ},
      {_1_1[1].value~_1_2[1].value},
      {'number'}
   )
   if not _1 then gg.toast(NR.v.link.teleUZ) mainM() end
   NR.f.copyItems(_1_2[1].address, 32, _1_1[1].value~_1[1], nil,nil,nil,nil,nil,true)
   NR.f.setScan(nil, false)
   eht.hunterM.toggle[6]='[+] ' 
   gg.toast('√ '..eht.var.dataH.descT[47])
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
   if (__==2) then postGLevel() end
   if (__==3) then
      if (eht.var.dataG.hasK==false) then
         eht.var.dataG.classK=NR.f.getB16LE(eht.class.dataG)
         eht.var.dataG.hasK=true
      end
      eht.var.dataG.classB={}
      NR.f.setScan(32, false)
      NR.f.scan(eht.var.dataG.classK, 32, nil, 0)
      local _1=NR.f.allResults()
      NR.f.setScan()
      if (#_1<10) then gg.alert('× Base not found.') mainM() end
      eht.getDesc(eht.var.dataG)
      print(eht.var.dataG.descT)
      gearOptions()
   end --dataG
end
--###################################
function sBoxPack()
   if (eht.check.dBool.ad) or (eht.check.dBool.st) or (eht.check.dBool.sb) then
      eht.paidM.toggle[1]='[+] '
      local _0=gg.alert('Get list of IDs?', 'ok', 'skip')
      if (_0==1) then
         local __1=gg.makeRequest(eht.request.hostSID).content
         if (__1~=nil) then gg.alert(__1) end
      end
      local _1=gg.prompt({'Pack ID:', 'Count: [1;1000]', ''},{eht.var.dataASCB.maxId,1, NR.v.link.teleUZ},{'number','number'})
      if not _1 then gg.toast(NR.v.link.teleUZ) paidM() end
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
      eht.paidM.toggle[1]='[+] ' 
   else
      gg.toast('! You need to buy first.')
      return
   end   
end
--###################################
function postGLevel()
   if (eht.check.dBool.ad) or (eht.check.dBool.st) or (eht.check.dBool.sb) then
      eht.request.bGuild=false
      eht.request.gCode=0 
      eht.getPCode()
      if(tonumber(eht.request.gCode)~=0) then
         local _1=gg.makeRequest(eht.request.host..eht.request.pathGM, {['cookie']=eht.request.cookie}, 'Exp=304500').code
         if (_1==200) then
            eht.paidM.toggle[2]='[√] ' 
            gg.toast('√ Guild Level Updated.!') 
         else
            eht.paidM.toggle[2]='[!!] ' 
            gg.toast('× Error '.._1)
         end
         gg.sleep(200)
         _1=gg.makeRequest(eht.request.host..eht.request.pathGM2, {['cookie']=eht.request.cookie}, 'Buf0=5&Buf1=5&Buf2=5&Buf3=5&Buf4=5&Buf5=5&Level=30')
      else
         eht.paidM.toggle[2]='[×] ' 
         gg.alert('× No guild found.')
      end
   else
      gg.toast('! You need to buy first.')
      return
   end
end
--###################################
function gearOptions()
   gg.alert('gearOptions Updated 1')
   
   local _1={eht.var.dataG.descT[10],eht.var.dataG.descT[11], eht.var.dataG.descT[12], eht.var.dataG.descT[13], eht.var.dataG.descT[14], eht.var.dataG.descT[15], eht.var.dataG.descT[16], eht.var.dataG.descT[17]}
   local _2={eht.var.dataG.descT[18],eht.var.dataG.descT[19],eht.var.dataG.descT[20],eht.var.dataG.descT[21],eht.var.dataG.descT[22]}
   local _3={'B','A','S','SS','SSS','UNIQ'}
   ::startsetup::
   local _4_2={' > ',' > ',' > ',' > ',' > '}
   local _4__={}
   local _4={eht.var.dataG.descT[1].._4_2[1], eht.var.dataG.descT[3].._4_2[2], eht.var.dataG.descT[4].._4_2[3], eht.var.dataG.descT[6].._4_2[4], eht.var.dataG.descT[8]..' #1'.._4_2[5], eht.paidM.desc[#eht.paidM.desc]}
   local _5=gg.choice(_4, nil, eht.var.dataG.descT[27])
      if not _5 then goto waituser end
      if (_5==1) then goto setgeartype end
      if (_5==2) then goto setquality end
      if (_5==3) then goto setlevel end
      if (_5==4) then goto setoptionvalue end
      if (_5==5) then goto donesetup end
      if (_5==6) then gg.toast(NR.v.link.teleUZ) mainM() end
   ::setgeartype::
   local _6=gg.choice(_1, nil, eht.var.dataG.descT[1])
      if not _6 then goto startsetup end
      if (_6==1) then _4_2[1]=' > '.._1[1] _4__[1]=0 goto startsetup end
      if (_6==2) then _4_2[1]=' > '.._1[2] _4__[1]=1 goto startsetup end
      if (_6==3) then _4_2[1]=' > '.._1[3] _4__[1]=2 goto startsetup end
      if (_6==4) then _4_2[1]=' > '.._1[4] _4__[1]=3 goto startsetup end
      if (_6==5) then _4_2[1]=' > '.._1[5] _4__[1]=4 goto startsetup end
      if (_6==6) then _4_2[1]=' > '.._1[6] _4__[1]=5 goto startsetup end
      if (_6==7) then _4_2[1]=' > '.._1[7] _4__[1]=6 goto startsetup end
      if (_6==8) then _4_2[1]=' > '.._1[8] _4__[1]=7 goto startsetup end
   ::setquality::
   local _7=gg.choice(_2, nil, eht.var.dataG.descT[3])
      if not _7 then goto startsetup end
      if (_7==1) then _4_2[2]=' > '.._2[1] _4__[2]=0 goto startsetup end
      if (_7==2) then _4_2[2]=' > '.._2[2] _4__[2]=1 goto startsetup end
      if (_7==3) then _4_2[2]=' > '.._2[3] _4__[2]=2 goto startsetup end
      if (_7==4) then _4_2[2]=' > '.._2[4] _4__[2]=3 goto startsetup end
      if (_7==5) then _4_2[2]=' > '.._2[5] _4__[2]=4 goto startsetup end
   ::setlevel::
   ::setoptionvalue::
   ::waituser::
   while (gg.isVisible()==false) do
      gg.setVisible(false)
   end
   goto startsetup
   ::donesetup::
   
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
   if not _1 then gg.toast(NR.v.link.teleUZ) mainM() end
   local _2=math.random(800000,1000000)
   if (_1==1) then
      local __1=gg.prompt({'Enter Quantity: '..NR.v.link.teleUZ},{_2},{'number'})
      if not __1 or (__1[1]=='') then gg.toast(NR.v.link.teleUZ) mainM() end
      _2=tonumber(__1[1])
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
   else gg.toast(NR.v.link.teleUZ) mainM() end
end
--###################################
--###################################
function extraR(__)
   if (__==1) then NR.f.exitM() end
   if (__==2) then claimCoupon() end
   if (__==3) then postAddGems() end
   if (__==4) then transToggle() end
   if (__==5) then buyVIP() end
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
function postAddGems()
   local _0=eht.check.dBool.ad and '20' or '2'
   eht.request.gem=''
   local _2=gg.makeRequest(eht.request.host..eht.request.pathCE, {['cookie']=eht.request.cookie}).content
   eht.request.gem=NR.f.findText(_2, 'Gem', 5, ',', 0)
   if (string.sub(eht.request.gem,#eht.request.gem,#eht.request.gem)=='}') then
      eht.request.gem=string.sub(eht.request.gem,1,#eht.request.gem-1)
   end
   local _1=gg.prompt({'Enter Gem Amount [1;4800]', 'Repeat [1;'.._0..']'},{500,1},{'number','number'})
   if not _1 then gg.toast(NR.v.link.teleUZ) return end
   if (eht.check.dBool.ad) then else 
      if (tonumber(_1[1])*tonumber(_1[2])+tonumber(eht.request.gem)>10000) then
         gg.toast('× Cannot get more gems!') return
      end
   end
   for _=1, tonumber(_1[2]) do
      local __1=gg.makeRequest(eht.request.host..eht.request.pathCE, {['cookie']=eht.request.cookie}, 'amount='.._1[1]).code
      if (__1~=200) then 
         gg.toast('× Failed! '.._)
      else
         gg.toast('√ Successfully! '.._)
      end
      gg.sleep(1000)
   end
   eht.extraM.toggle[3]='[+] ' 
end
--###################################
function claimCoupon()
   if (pCode=='') then
      eht.request.bGuild=false
      eht.getPCode()
   end
   local _1={'MINERPUBLI', 'EVILCONQUEROR', 'ATTACKDARKLORD', 'YOURETHEBEST'}
   local _2=gg.alert('Enter coupon code:', 'auto', 'input')
   if not _2 then gg.toast(NR.v.link.teleUZ) return end
   if (_2==1) then 
      gg.makeRequest(eht.request.host3.._1[#_1]..eht.request.pathGift[1]..eht.request.pCode)
      gg.sleep(500)
      for _,__ in ipairs(_1) do
         local __1=gg.makeRequest(eht.request.host3..__..eht.request.pathGift[1]..eht.request.pCode..eht.request.pathGift[2]).content
         if (__1~=nil) then
            if (string.find(__1, 'setFailPopUp')==nil) then
               gg.toast(_1[_]..'\n√ successfully!')
            else
               gg.toast(_1[_]..'\n× '..NR.f.findText(__1, 'setFailPopUp', 29, '\"', 0))
            end
         end
         gg.sleep(1000)
      end
   end
   if (_2==2) then 
      local __1=gg.prompt({'Coupon Code', 'Player Code'},{_1[#_1], eht.request.pCode},{'text','text'})
      if not __1 then gg.toast(NR.v.link.teleUZ) return end
      gg.makeRequest(eht.request.host3..__1[1]..eht.request.pathGift[1]..__1[2])
      gg.sleep(500)
      local __2=gg.makeRequest(eht.request.host3..__1[1]..eht.request.pathGift[1]..__1[2]..eht.request.pathGift[2]).content
      if (__2~=nil) then
         if (string.find(__2, 'setFailPopUp')==nil) then
            gg.toast(__1[1]..'\n√ successfully!')
         else
            gg.toast(__1[1]..'\n× '..NR.f.findText(__2, 'setFailPopUp', 29, '\"', 0))
         end
      end
   end  
   eht.extraM.toggle[2]='[+] '   
end
--###################################
function buyVIP()
   local _1=gg.alert('To buy VIP key please contact '..NR.v.link.teleNR, 'enter key', 'copy link')
   if (_1==1) then
      if (eht.check.dBool.ad) or (eht.check.dBool.st) or (eht.check.dBool.sb) then
         gg.toast('√ You are using VIP key!')
      else
         local __1=gg.prompt({'Enter Key '..NR.v.link.teleUZ},nil,{'text'})
         if not __1 then gg.toast(NR.v.link.teleNR) extraM() end
         NR.f.showUserPrompt()
         --@@@@@@@@@@@@
      end
   elseif (_1==2) then
      gg.copyText(NR.v.link.teleNR)
      gg.toast('√ Link has copied!')
   else
      gg.toast(NR.v.link.teleNR)
      extraM()
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
   if not _1 then gg.toast(NR.v.link.teleUZ) mainM() end
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






