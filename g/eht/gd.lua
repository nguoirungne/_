eht={}

eht.package='com.superplanet.evilhunter'
eht.label='Evil Hunter Tycoon'
eht.scriptVersion='1.377'
eht.xBit='x64'

eht.note={
   ''
} 

eht.request={
   host='https://eh.supermembers.net',
   host2='https://eh-chat.supermembers.net', 
   host3='http://gift.supermembers.net/coupon/?code=', 
   pathGift={'&scode=evilhunter&name=', '&ok=1'},   --http://gift.supermembers.net/coupon/?code=YOURETHEBEST&scode=evilhunter&name=UC70VA8&ok=1 / setFailPopUp(getLanguage(), "coupon_already_used");
   hostSID='https://raw.githubusercontent.com/nguoirungne/_/lua/g/eht/id/shop.txt',
   pathCE='/game/cash/earn', --amount=4800
   pathME='/game/medal/earn', --reason=Achieve_Reward&amount=3&key=ACH_REWARD_0_0 BANNED
   pathPI='/game/player/info',
   pathPM='game/player/modify', --InApp=0&StartCount=73&PlayTime=18218&language=English
   pathCS='/game/chat/send', --id=guildid&msg=chat
   pathCL='/game/chat/list', --id=guildid (noncookie) 
   pathGC='/game/guild/create', --GuildName=NR&GuildContents=ok&GuildJoinType=1
   pathGM='/game/guild/modify', --Exp=304500
   pathGR='/game/guild/req', --GuildCode=12345
   pathGG='/game/guild/get', --GuildCode=12345
   pathGGD='/game/guild/get_detail', --GuildCode=12345
   pathGM2='//game/guild/modify', --Buf0=5&Buf1=5&Buf2=5&Buf3=5&Buf4=5&Level=30
   pathGML='//game/guild/member_list', --GuildCode=12345
   pathGS='//game/guild/search', --GuildName=ABCDE
   pathAS='/game/arena/save_junior', --Hunter1={}&Hunter2={}&Hunter3={}&Hunter4={}&Hunter5={}&Fomation=0&ItemLevel=70&Buff=0,0,0,0,0&AceInfo={}
   pathDSN='/game/dump/save_new', 
   pathUR='/game/union/register', --AceHunter={}&LookInfo={}
   cookie='', 
   nCK=32370124832899125,
   bCK=false,
   bName=false,
   bGuild=false,
   pName='',
   pCode='',
   uCode=0,
   gCode=0,
   gVersion='',
   gem=0
}

eht.mainM={
   merge={},
   toggle={'[×] ','[×] ','[×] ','[×] ','[×] ','[×] ','[×] ','[+] '},
   descB=false,
   descO={
      'User Management',
      'Hunter Management',
      'Paid Management',
      'Free Material',
      'Free Shop',
      'Game Speed',
      'One Hit Kill',
      'Extra'
   },
   desc={} 
}

eht.userM={
   merge={},
   toggle={'[×] ','[×] ','[<] '},
   descB=false,
   descO={
      'Unlimited Gold',
      'Unlimited Elemental',
      'Back'
   },
   desc={}
}

eht.hunterM={
   merge={},
   toggle={'[×] ','[×] ','[×] ','[×] ','[×] ','[×] ','[<] '},
   descB=false,
   descO={
      'Change Index',
      'Change Rank',
      'Change Costume',
      'Edit Secret Tech',
      'All Reach Max Level',
      'Unlimited Dark Soul',
      'Back'
   },
   desc={}
}

eht.paidM={
   merge={},
   toggle={'[$] ','[$] ','[$] ','[<] '},
   descB=false,
   descO={
      'Get Shop Pack',
      'Guild Reach Level 30',
      'Gear Management',
      'Back'
   },
   desc={}
}

eht.extraM={
   merge={},
   toggle={'[×] ','[×] ','[×] ','[×] ','[$] ','[<] '},
   descB=false,
   descO={
      'Exit Script',
      'Auto Get Coupon',
      'Claim Free Gems',
      'Auto Menu Translation',
      'Buy VIP Password',
      'Back'
   }, 
   desc={} 		
}

eht.check={
   oDate='20241212',
   sName='NEW_SCRIPT.lua',
   dPW='uz123456',
   dBool={sn=false,pw=false,ad=false,st=false,sb=false},
   debug=''
}

eht.class={
   dataU={'UserData', 7022344665582367573, '獕牥慄慴', 0},
   dataH={'HunterData', 7008852700165993800, '牥慄慴 ', 4},
   dataAS={'AdminShopData', 8027758069468193857, '卮潨䑰瑡', 4},
   dataI={'ItemData', 7022344665498481737, '瑉浥慄慴', 0},
   dataASCB={'AdminShinyCostumeBoxData', 7595412505240626241, '祮潃瑳浵', 8},
   dataG={'GearData', 7022344665582101831, '敇牡慄慴', 0} 
}

eht.var={
   dataU={
      hasK=false,
      hasB=false,
      classK=-1,
      classB={},
      descB=false,
      descT={}, 
      descO={'Edit Gold Amount','Edit Elemental Amount'}, 
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
      descB=false, 
      descT={}, 
      descO={'Gold','Job','Level','Personality','Revive','Body Index','Health','Attack','Defense','Critical Damage','Attack Speed','Dodge','Satiety','Mood','Endurance','Rank Total','Costume','Fairy','Weapon Costume','Wing Costume','Medal Costume','Pet','Edit Dark Soul Amount','Property Level','Increase Health','Increase Mood','Increase Satiety','Increase Endurance','Increase Attack','Increase Defense','Increase Critical Rate','Increase Attack Speed','Increase Evasion Rate','Increase Movement Speed','Decrease Skill Cooltime 1','Decrease Skill Cooltime 2','Decrease Mood Consumption','Decrease Satiety Consumption','Decrease Endurance Consumption','Enter Hunter Gold','No hunters with this gold could be found. Be sure not to let hunters use or pick up the gold while you are checking.','Hunter Index Updated!','Hunter Rank Updated!','Hunter Costume Updated!','Hunter Property Updated!','All hunters have reached max level!','Hunter Dark Soul Updated!'}, 
      offset={ --1~20-28~18-20-24-28-2C Obf String name
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
         gearInventory=0x6a0,
         DSoul=0x740,
         GUP_Property_LV=0x7e8        	
      }, 
      offsetGPL={
         head=0x18, --15
         offset={0x20,0x34,0x48,0x5c,0x70,0x84,0x98,0xac,0xc0,0xd4,0xe8,0xfc,0x110,0x124,0x138}
      },
      ptrH2G={
         ptr1=0x18,
         ptr2={0x20,0x28,0x30,0x38,0x40,0x48,0x50,0x58,0x60,0x68,0x70,0x78,0x80,0x88,0x90,0x98,0xa0,0xa8,0xb0,0xb8,0xc0,0xc8} 
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
   },
   dataG={
      hasK=false,
      hasB=false,
      classK=-1,
      maxOptionType=92, 
      classB={},
      descB=false,
      descT={},
      descO={'Equipment Type','Equipment ID','Quality','Level','Rating','Group','Option Type','Option Value','Potential','Weapon','Necklace','Ring','Hat','Armor','Glove','Shoe','Belt','Poor Quality','Common Quality','Uncommon Quality','Advanced Quality','Ultimate Quality','Runes Index','Runes Value','Skill Runes Index','Skill Runes Value','Select the correct equipment stats to filter out which ones need editing.','Start find','Enter Equipment Level','from 0 to 25','Enter the value of the first blue option','Could not filter out a single address. Try upgrading your equipment and trying again.',' not found.'}, 
      offset={
         Index=0x10, --0~7
         gearIndex=0x24,
         quality=0x4c,
         level=0x6c,
         rating=0x80,
         group=0x94,
         plusType=0xa8,
         plusValue=0xb0,
         minusType=0xb8,
         minusValue=0xc0, --18,20,24,28
         m_addPlusType=0xc8, --10, 18, 20, 24
         m_addPlusValue=0xd0,
         m_addMinusType=0xd8,
         m_addMinusValue=0xe0,
         qCount=0x130,
         oCount=0x144,
         Potential=0x16c,
         RunesIndex=0x180,
         RunesValue=0x194,
         SkillRunesIndex=0x1a8,
         SKillRunesValue=0x1bc
      },
      offsetPlus={
         head1=0x10,
         head2=0x18,
         offset={0x20,0x34,0x48} 
      } 
   }
}
   
eht.checkUpdate=function()
   NR.f.checkLName(eht.check.sName)
   NR.f.checkPW(eht.check)
   NR.f.checkDate(eht.check)
   return true
end --eht.checkUpdate

eht.var.dataG.gearMRun=true
eht.var.dataG.gearChoice={' > ',' > ',' > ',' > ',' > '}
eht.var.dataG.gearDone={}
eht.var.dataG.gearBase={}
eht.var.dataG.gearM=function()
   while eht.var.dataG.gearMRun do
         local __0={eht.var.dataG.descT[1]..eht.var.dataG.gearChoice[1], eht.var.dataG.descT[3]..eht.var.dataG.gearChoice[2], eht.var.dataG.descT[4]..eht.var.dataG.gearChoice[3], eht.var.dataG.descT[6]..eht.var.dataG.gearChoice[4], eht.var.dataG.descT[8]..' #1'..eht.var.dataG.gearChoice[5], eht.var.dataG.descT[28], eht.paidM.desc[#eht.paidM.desc]}
         local __1=gg.choice(__0, nil, eht.var.dataG.descT[27])
         if not __1 then gearOptions(0) end
         if (__1==#__0) then paidM()
         else gearOptions(__1) end         
   end
end

eht.mergeM=function(__) 
   if (eht.request.bName==false) then eht.getPName() end
   if (eht.request.bGuild==false) then eht.getPCode() end
   if (NR.v.set.autoT) and (__.descB==false) then
      local _1='' 
      for _,___ in ipairs(__.descO) do
         _1=_1..'_'..___..'*' 
      end
      __.desc=NR.f.extractText(NR.f.translate(_1))
      __.descB=true 
   else
      if (NR.v.set.autoT==false) then
         for _,___ in ipairs(__.descO) do
            __.desc[_]=___ 
         end
         __.descB=false 
      end
   end
   for _,___ in ipairs(__.toggle) do
      __.merge[_]=___..__.desc[_]
   end
   return __.merge
end --eht.mergeM

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
end --eht.getCookie

eht.getPName=function()
   if (eht.request.bCK) and (eht.request.bName==false) then
      local _1=gg.makeRequest(eht.request.host..eht.request.pathPI, {['cookie']=eht.request.cookie}).content
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
end --eht.getPName

eht.getPCode=function()
   if (eht.request.bCK) and (eht.request.bGuild==false) then
      local _1=gg.makeRequest(eht.request.host..eht.request.pathPI, {['cookie']=eht.request.cookie}).content
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
         eht.request.gem=''
         local __1=string.find(_1, 'Gem')
         for _=(__1+5),#_1 do
            if (string.sub(_1,_,_)==',') then break else
               eht.request.gem=eht.request.gem..string.sub(_1,_,_)
            end
         end
         --print(eht.request.pCode)
         --print(eht.request.uCode)
         --print(eht.request.gCode)   
         --print(eht.request.gVersion)   
         eht.request.bGuild=true
      end
   end
end --eht.getPCode

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

eht.getDesc=function(__)
   if (NR.v.set.autoT) and (__.descB==false) then
      local _1='' 
      for _,___ in ipairs(__.descO) do
         _1=_1..'_'..___..'*' 
      end
      __.descT=NR.f.extractText(NR.f.translate(_1))
      __.descB=true 
   else
      if (NR.v.set.autoT==false) then      
         for _,___ in ipairs(__.descO) do
            __.descT[_]=___
         end
         __.descB=false 
      end
   end
end --eht.getDesc



