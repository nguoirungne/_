eht={}

eht.package='com.superplanet.evilhunter'

eht.check={
   oDate='241212',
   lName=string.match(gg.getFile(),'[^/]+$'),
   sName='NEW_SCRIPT.lua',
   dPW='NR',
   dBool={sn=false,od=false,pw=false}
}

eht.note={
   '📢 test eht note!\n'
}

eht.class={
   dataAS={'AdminShopData', 8027758069468193857, '卮潨䑰瑡', 4},
   dataI={'ItemData', 7022344665498481737, '瑉浥慄慴', 0}
}
   
eht.checkUpdate=function()
   NR.f.checkLName(eht.check.lName, eht.check.sName)
   NR.f.checkDate(eht.check.oDate)
   return true
end















