eht={}

eht.package='com.superplanet.evilhunter'
eht.label='Evil Hunter Tycoon'
eht.version='1.377'
eht.xBit='x64'

eht.request={
   host='eh.supermembers.net',
   cEarn='/game/cash/earn',
   pInfo='/game/player/info',
   cookie='',
   name='',
   gem=-1,
   nCK=32370124832899125,
   bCK=false
}

eht.mainM={
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

eht.getStart=function()
   if (eht.request.bCK==false) then
      gg.clearResults()
      gg.setVisible(''>'')
      gg.setRanges(32)
      gg.searchNumber(eht.request.nCK, 32)
      local _1=gg.getResults(gg.getResultsCount())
      gg.clearResults()
      if #_1>0 then
         for _,__ in ipairs(_1) do
            local __1={{address=__.address+4+(35*2), flags=1}}
            local __2=gg.getValues(__1)[1].value
            if (string.char(__2)==';') then
               __1={{address=__.address+4, flags=1}}
               for i=1, 53 do
                  __2=gg.getValues(__1)[1].value
                  eht.request.cookie=eht.request.cookie..string.char(__2)
                  __1[1].address=__1[1].address+2
               end
            break end
         end
         print(eht.request.cookie)
      end
   end
end



--'user_none=srDwr7pLdln7gfjuPnPEtg==; session_none=2394'








