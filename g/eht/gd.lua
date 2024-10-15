eht={}

eht.package='com.superplanet.evilhunter'
eht.label='Evil Hunter Tycoon'
eht.version='1.377'
eht.xBit='x64'

eht.request={
   hostE='https://eh.supermembers.net/game/cash/earn',
   hostP='https://eh.supermembers.net/game/player/info',
   cookie='',
   nCK=32370124832899125,
   bCK=false,
   pName='',
   bName=false
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
   '🎏 Hello '..eht.check.debug..' '..eht.request.pName..'!\n'
}

eht.class={
   dataU={'UserData', 7022344665582367573, '獕牥慄慴', 0},
   dataH={'HunterData', 7008852700165993800, '牥慄慴 ', 4},
   dataAS={'AdminShopData', 8027758069468193857, '卮潨䑰瑡', 4},
   dataI={'ItemData', 7022344665498481737, '瑉浥慄慴', 0}
}

eht.var={
   dataU={
      hasK=false,
      hasB=false,
      classK=-1,
      classB={},
      offset={
         gold=0xd8,
         elemental=0x21c	
      }
   }	
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

eht.getCookie=function()
   if (eht.request.bCK==false) then
      NR.f.setScan(32, false)
      gg.searchNumber(eht.request.nCK, 32)
      local _1=NR.f.allResults()
      NR.f.setScan()
      if (#_1<1) then gg.toast('× C not found.') mainM() else
         for _,__ in ipairs(_1) do
            local __1=NR.f.copyItems(__.address+4, 2)
            for i=1, 53 do
               if (__1[1].value>31) and (__1[1].value<127) then
                  eht.request.cookie=eht.request.cookie..string.char(__1[1].value)
                  __1=NR.f.copyItems(__1[1].address+2, 2)
               else break end
            end
            print('cookie '.._,eht.request.cookie)
            if (string.sub(eht.request.cookie,1,10)=='user_none=') and (string.sub(eht.request.cookie,37,49)=='session_none=') then
               eht.request.bCK=true break
            else
               eht.request.cookie='' 
            end
         end
      end
   end
end

eht.getPName=function()
   if (eht.request.bCK) and (eht.request.bName==false) then
      local _1=gg.makeRequest(eht.request.hostP, {['cookie']=eht.request.cookie}).content
      if (_1~=nil) then
         local __1=string.find(_1, 'NickName')
         for _=__1+11, #_1 do
            if (string.sub(_1,_,_)=='\"') then break else
               eht.request.pName=eht.request.pName..string.sub(_1,_,_)
            end            
         end
         if (eht.request.pName~='') then eht.request.bName=true end
      else
         gg.toast('nil')
      end
   end
end




--'user_none=srDwr7pLdln7gfjuPnPEtg==; session_none=2394'








