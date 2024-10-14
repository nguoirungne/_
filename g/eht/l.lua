eht={}

eht.package='com.superplanet.evilhunter'

eht.menu={
   merge={},
   tongle={'[×] ','[×] ','[×] ','[×] ','[?] '},
   desc={
      'User Manager',
      'Hunter Manager',
      'Shop Manager',
      'Free Material',
      'Extra'
   }
}

eht.userM={
   merge={},
   tongle={'[×] ','[×] ','[<] '},
   desc={
      'Unlimited Gold',
      'Unlimited Elemental',
      'Back'
   }
}

eht.hunterM={
   merge={},
   tongle={'[×] ','[×] ','[×] ','[<] '},
   desc={
      'All Max Level',
      'Rank Edit',
      'Secret Tech Edit',
      'Back'
   }
}

eht.shopM={
   merge={},
   tongle={'[×] ','[$] ','[$] ','[<] '},
   desc={
      'Free Shop',
      'Free Shop Full',
      'Get Shop Pack',
      'Back'
   }
}

eht.check={
   oDate='20241212',
   sName='NEW_SCRIPT.lua',
   dPW='undeadzone',
   dBool={sn=false,pw=false,ad=false},
   debug='User'
}

eht.note={
   '📢 test eht note!\n'
}

eht.class={
   dataAS={'AdminShopData', 8027758069468193857, '卮潨䑰瑡', 4},
   dataI={'ItemData', 7022344665498481737, '瑉浥慄慴', 0},
   dataH={'HunterData', 7022344665498481737, '瑉浥慄慴', 0}
}
   
eht.checkUpdate=function()
   NR.f.checkLName(eht.check.sName)
   NR.f.checkPW(eht.check)
   NR.f.checkDate(eht.check)
   eht.check.debug=eht.check.dBool.ad==true and 'Admin' or 'User'
   return true
end

eht.mergeM=function(__)
   for _,___ in ipairs(__.tongle) do
      __.merge[_]=___..__.desc[_]
   end
   return __.merge
end














