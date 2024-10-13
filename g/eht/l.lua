eht={}

eht.package='com.superplanet.evilhunter'

eht.menu={
   merge={},
   tongle={'× ','× ', '× '},
   desc={
      'Hack 1',
      'Hack 2',
      'Exit'
   }
}

eht.check={
   oDate='20241212',
   sName='NEW_SCRIPT.lua',
   dPW='undeadzone',
   dBool={sn=false,od=false,pw=false,ad=false},
   debug='User'
}

eht.note={
   '📢 test eht note!\n'
}

eht.class={
   dataAS={'AdminShopData', 8027758069468193857, '卮潨䑰瑡', 4},
   dataI={'ItemData', 7022344665498481737, '瑉浥慄慴', 0}
}
   
eht.checkUpdate=function()
   NR.f.checkLName(eht.check.sName)
   NR.f.checkDate(eht.check)   
   NR.f.checkPW(eht.check)
   eht.check.debug=eht.check.dBool.ad==true and 'Admin' or 'User'
   return true
end

eht.mergeM=function()
   for _,__ in ipairs(eht.menu.tongle) do
      eht.menu.merge[_]=__..eht.menu.desc[_]
   end
end














