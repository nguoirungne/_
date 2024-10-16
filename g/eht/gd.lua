eht={}

eht.package='com.superplanet.evilhunter'
eht.label='Evil Hunter Tycoon'
eht.version='1.377'
eht.xBit='x64'

eht.request={
   host='https://eh.supermembers.net',
   hostSID='https://raw.githubusercontent.com/nguoirungne/_/lua/g/eht/id/shop.txt',
   pathE='/game/cash/earn',
   pathP='/game/player/info',
   cookie='',
   nCK=32370124832899125,
   bCK=false,
   bName=false,
   bGuild=false,
   pName='',
   pCode='',
   uCode=-1,
   gCode=-1,
   gVersion=''
}

eht.mainM={
   merge={},
   autoT=false,
   toggle={'[×] ','[×] ','[×] ','[×] ','[×] ','[×] ','[×] ','[+] '},
   desc={
      'User Manager',
      'Hunter Manager',
      'Paid Manager',
      'Free Material',
      'Free Shop',
      'Speed Game',
      'One Hit Kill',
      'Extra'
   }
}

eht.userM={
   merge={},
   autoT=false,
   toggle={'[×] ','[×] ','[<] '},
   desc={
      'Unlimited Gold',
      'Unlimited Elemental',
      'Back'
   }
}

eht.hunterM={
   merge={},
   autoT=false,
   toggle={'[×] ','[×] ','[×] ','[×] ','[×] ','[×] ','[<] '},
   desc={
      'Edit Idx',
      'Edit Rank',
      'Edit Costume',
      'Edit Secret Tech',
      'Edit All Max Level',
      'Unlimited Dark Soul',
      'Back'
   }
}

eht.paidM={
   merge={},
   autoT=false,
   toggle={'[$] ','[$] ','[$] ','[<] '},
   desc={
      'Get Shop Pack',
      'Guild Max Level',
      'Unlimited Gems',
      'Back'
   }	
}

eht.extraM={
   merge={},
   autoT=false,
   toggle={'[×] ','[×] ','[×] ','[×] ','[$] ','[<] '},
   desc={
      'Exit Script',
      'Claim Coupon',
      'Claim Free Gems',
      'Auto Menu Translation',
      'Buy VIP Password',
      'Back'
   }		
}

eht.check={
   oDate='20241212',
   sName='NEW_SCRIPT.lua',
   dPW='undeadzone',
   dBool={sn=false,pw=false,ad=false,st=false,sb=false},
   debug=''
}

eht.note={
   ''
}

eht.class={
   dataU={'UserData', 7022344665582367573, '獕牥慄慴', 0},
   dataH={'HunterData', 7008852700165993800, '牥慄慴 ', 4},
   dataAS={'AdminShopData', 8027758069468193857, '卮潨䑰瑡', 4},
   dataI={'ItemData', 7022344665498481737, '瑉浥慄慴', 0},
   dataASCB={'AdminShinyCostumeBoxData', 7595412505240626241, '祮潃瑳浵', 8}
}

eht.var={
   dataU={
      hasK=false,
      hasB=false,
      descB=false,
      classK=-1,
      classB={},
      desc={'Enter Gold: ', 'Enter Elemental: '},
      offset={
         gold=0xd8,
         elemental=0x21c	
      }
   },
   dataH={
      hasK=false,
      hasB=false,
      classK=-1,
      classB={},
      goldH=2000,
      hunB={},
      descB={false},
      desc={
         {'Job', 'Money', 'Level', 'Personality', 'Revive', 'Body Index'}
                  
      },
      offset={
         job=0x24,
         money=0x60,
         level=0x90,
         personality=0xc4,
         revive=0xd8,
         bodyIndex=0x150,
         rankHp=0x4ec,
         rankDamage=0x500,
         rankArmor=0x514,
         rankCritical=0x528,
         rankAttackSpeed=0x53c,
         rankDodge=0x550,
         rankHungry=0x564,
         rankFeel=0x578,
         rankTire=0x58c,
         rankTotal=0x5a0,
         costumeIndex=0x5b4,
         fairyIndex=0x5d4,
         weaponCostumeIndex=0x5f4,
         wingCostumeIndex=0x614,
         sealCostumeIndex=0x634,
         RamblePetIndex=0x654,
         DSoul=0x740,
         GUP_Property_LV=0x7e8        	
      }
   },
   dataAS={
      hasK=false,
      hasB=false,
      hasF=false,
      classK=-1,
      classB={},
      offset={
     	priceIdx=0x88,
         price=0x9c,
         count=0xb0,
         visible=0x128
      }
   },
   dataI={
      hasK=false,
      hasB=false,
      classK=-1,
      classB={},
      maxId=327,
      offset={
         newCheck=0x10,
         index=0x1c,
         count=0x30
      }
   },
   dataASCB={
      hasK=false,
      hasB=false,
      classK=-1,
      classB={},
      maxId=612,
      offset={
         rewardIdx=0x58,
         rewardCnt=0x6c
      }	
   },
   speedG={
      hasB=false,
      addrB={},
      scan=4397992017610320554,
      maxS=50,
      value=1  	
   },
   oneH={
      hasB=false,
      addrB={},
      scan=4579260103036344730,
      mulV=1000000,
      value={}
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
   if (NR.v.set.autoT) and (__.autoT==false) then
      for _=1, #__.desc do
         __.desc[_]=NR.f.translate(__.desc[_])
      end
      __.autoT=true
   end   
   for _,___ in ipairs(__.toggle) do
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
      if (#_1<1) then gg.toast('t.me/undeadzone') mainM() else
         for _,__ in ipairs(_1) do
            local __1=NR.f.copyItems(__.address+4, 2)
            for i=1, 53 do
               if (__1[1].value>31) and (__1[1].value<127) then
                  eht.request.cookie=eht.request.cookie..string.char(__1[1].value)
                  __1=NR.f.copyItems(__1[1].address+2, 2)
               else break end
            end
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
      local _1=gg.makeRequest(eht.request.host..eht.request.pathP, {['cookie']=eht.request.cookie}).content
      if (_1~=nil) then
         eht.request.pName=''
         local __1=string.find(_1, 'NickName')
         for _=(__1+11),#_1 do
            if (string.sub(_1,_,_)=='\"') then break else
               eht.request.pName=eht.request.pName..string.sub(_1,_,_)
            end
         end
         eht.request.bName=true        
      end
   end 
end

eht.getPCode=function()
   if (eht.request.bCK) and (eht.request.bGuild==false) then
      local _1=gg.makeRequest(eht.request.host..eht.request.pathP, {['cookie']=eht.request.cookie}).content
      if (_1~=nil) then
         eht.request.pCode=''
         local __1=string.find(_1, 'CS_ID')
         for _=(__1+8),#_1 do
            if (string.sub(_1,_,_)=='\"') then break else
               eht.request.pCode=eht.request.pCode..string.sub(_1,_,_)
            end
         end
         eht.request.uCode=''
         local __1=string.find(_1, 'UserCode')
         for _=(__1+10),#_1 do
            if (string.sub(_1,_,_)==',') then break else
               eht.request.uCode=eht.request.uCode..string.sub(_1,_,_)
            end
         end
         eht.request.gCode=''
         local __1=string.find(_1, 'GuildCode')
         for _=(__1+11),#_1 do
            if (string.sub(_1,_,_)=='}') then break else
               eht.request.gCode=eht.request.gCode..string.sub(_1,_,_)
            end
         end
         eht.request.gVersion=''
         local __1=string.find(_1, 'Version')
         for _=(__1+10),#_1 do
            if (string.sub(_1,_,_)=='\"') then break else
               eht.request.gVersion=eht.request.gVersion..string.sub(_1,_,_)
            end
         end
         --print(eht.request.pCode)
         --print(eht.request.uCode)
         --print(eht.request.gCode)   
         --print(eht.request.gVersion)   
         eht.request.bGuild=true
      end
   end
end

eht.upName=function() 
   if (eht.request.bCK) then
      if (eht.request.bName) then else eht.getPName() end
      if (eht.request.bGuild) then else eht.getPCode() end
   else
      eht.getCookie()
   end  
   if (eht.check.dBool.ad) then
      eht.check.debug='admin' 
   elseif (eht.check.dBool.st) then
      eht.check.debug='tester'
   elseif (eht.check.dBool.sb) then
      eht.check.debug='buyer'
   elseif (eht.check.dBool.pw) then
      eht.check.debug='user'
   else
      eht.check.debug='guest'
   end 
   return '🎏 Hello '..eht.check.debug..', '..eht.request.uCode..'!\n' 
end --eht.upName

eht.transCheck=function(__)
   if (NR.v.set.autoT) and (__.descB==false) then
      for _=1, #__.desc do
         for _1, _2 in ipairs(__.desc[_]) do
            __.desc[_][_1]=NR.f.translate(_2)
            print(_2)
         end
      end __.descB=true
   end 
end


--'user_none=srDwr7pLdln7gfjuPnPEtg==; session_none=2394'








