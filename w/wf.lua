--###################################
--###################################
NR.v.link={
   teleUZ='https://t.me/undeadzone',
   teleNR='https://t.me/nguoirungne',
   loginUrl='https://nguoirungne.x10.mx/Login', 
   alertUrl='https://nguoirungne.x10.mx/Info', 
   filePath='/sdcard/NR.cfg', 
   xorKey="PQRSTU3456789&*CDEFGHIJKLMNOPQRSTUVdefgh',<GHIJKLMNOPQRSTUVWjklmnopqrstuvwxy3456,<>?/`~JKLMNOPQRSTUVFGHIJKLMNOlmn2345^&*()-CDEFGHIJKLMNOPQRSTUVWXefghijklmnopqrst7KLMNOPQRSTU45678[]{}|;:',<>tu2)-_=+[]ij23456IJKLMNQRSTUVWbcdefghijklmnopqrstGHIJKLMNhijklmnopqrstuvwxy01234STUVWXYdefghijklmnopqrstuvw=+[]{}|;:',<>?/CDEFGHI|;:',<>?", 
   headers={['Content-Type']='application/x-www-form-urlencoded'}, 
   googleT='https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=',
   userA={['User-Agent'] = 'GoogleTranslate/6.3.0.RC06.277163268 Linux; U; Android 14; A201SO Build/64.2.E.2.140'}
}
NR.v.translate={ --https://translate.google.so/translate_a/t?client=any_client_id_works&sl=auto&tl=ru&q=wrapper&tbb=1&ie=UTF-8&oe=UTF-8
   host={'https://translate.googleapis.com/','https://clients1.google.com/', 'https://clients2.google.com/','https://clients3.google.com/', 'https://clients4.google.com/', 'https://clients5.google.com/'}, 
   path={'translate_a/'},
   client={'t?client=', 'single?client='},
   clientP={'gtx', 'dict-chrome-ex'},
   param={'&sl=auto', '&tl=', '&dt=t', '&q='},
   targetL='vi_VN',
   userA={['User-Agent']='GoogleTranslate/6.3.0.RC06.277163268 Linux; U; Android 14; A201SO Build/64.2.E.2.140'}
}
NR.v.note={
   '📢 Https://t.me/undeadzone!\n'	
}
NR.v.blockC={
   server={'https://cdn.now.gg', 'https://404.playrix.com'},
   cSuite={'TLS_AES_256_GCM_SHA384'}
}
NR.v.set={
   autoT=false   
}
--###################################
--###################################
NR.f.saveKeyToFile=function(__)
    local file = io.open(NR.v.link.filePath, "w")
    if file then
        file:write(__)
        file:close()
    end
end

NR.f.loadKeyFromFile=function()
    local file = io.open(NR.v.link.filePath, "r")
    if file then
        local key = file:read("*all")
        file:close()
        return key
    end
    return nil
end

NR.f.xorEncryptDecrypt=function(data, baseKey)
    local result = {}
    for i = 1, #data do
        local dataChar = data:byte(i)
        local keyChar = baseKey:byte((i - 1) % #baseKey + 1)
        result[i] = string.char(dataChar ~ keyChar)
    end
    return table.concat(result)
end

NR.f.handleUserData=function(inputKey)
    local EncryptAcess = NR.f.xorEncryptDecrypt(inputKey, NR.v.link.xorKey)
    local EncryptAlert = NR.f.xorEncryptDecrypt(inputKey, NR.v.link.xorKey)
   
    local accessResponse = gg.makeRequest(NR.v.link.loginUrl, NR.v.link.headers, EncryptAcess)
    local alertResponse = gg.makeRequest(NR.v.link.alertUrl, NR.v.link.headers, EncryptAlert)
    if not accessResponse or not alertResponse then 
        gg.alert("× Error : Connection Failed") 
        return 
    end
    
    local accessContent = accessResponse.content  
    local alertContent = alertResponse.content 
    local decryptedAlert = NR.f.xorEncryptDecrypt(alertContent, NR.v.link.xorKey)
    gg.alert(decryptedAlert..'   decryptedAlert ' , "", "", "")

    if accessContent then 
        local decryptedScript = NR.f.xorEncryptDecrypt(accessContent, NR.v.link.xorKey)        
        local success, loadedFunction = pcall(load(decryptedScript))
    else 
        gg.alert("× Error : Decryption Failed")
    end
end

NR.f.showUserPrompt=function()
    gg.clearResults()
    local savedKey = NR.f.loadKeyFromFile()
    local userInput = gg.prompt(
        {"Enter Your Key :", "Save Key", "Delete Key", "Exit"}, 
        {savedKey, false}, 
        {"text", "checkbox", "checkbox", "checkbox"}
    )
    
    if userInput and userInput[1] then
        local enteredKey = userInput[1]
        if userInput[2] then
            NR.f.saveKeyToFile(enteredKey)
        end
        if userInput[3] then
            os.remove(filePath)
            NR.f.showUserPrompt()
        end
        if userInput[4] then
            gg.setVisible(true)
            gg.clearResults()
            os.exit()
            return
        end
        NR.f.handleUserData(enteredKey)
    else
        NR.f.showUserPrompt()
    end
end

--###################################
--###################################
NR.f.findText=function(...) --(text,textFind,offset,charEnd,sub from i to i+?)
   local _0={...}
   local _1='' 
   local _2=string.find(_0[1], _0[2])
   if (_2==nil) then gg.toast('× Text not found.') return else
      for _=_2+_0[3], #_0[1] do
         if (string.sub(_0[1],_,_+_0[5])==_0[4]) then break else
            _1=_1..string.sub(_0[1],_,_)
         end
      end return _1
   end
end
--###################################
NR.f.extractText=function(__)
    local _1={}
    local _2=false
    local _3=''
    for _ in __:gmatch("(.)") do
        if (_=='_') then
           _2=true
        elseif (_2) and (_=='*') then
            _2=false
            table.insert(_1, _3)
            _3=''
        elseif (_2) then
            _3=_3.._
        end
    end return _1
end --NR.f.extractText
--###################################
NR.f.transCut=function(__)
   local __1=''
   for _=4, #__ do
      if (string.sub(__,_,_+2)=='\",\"') then break else 
         __1=__1..string.sub(__,_,_)
      end
   end 
   return __1   
end --NR.f.transCut
--###################################
NR.f.translate=function(__)
   if (__==nil) then return NR.v.link.teleUZ else     
      gg.sleep(math.random(100,150))
      local _1=gg.getLocale()
      local _2=gg.makeRequest(NR.v.translate.host[math.random(#NR.v.translate.host)]..NR.v.translate.path[1]..NR.v.translate.client[1]..NR.v.translate.clientP[1]..NR.v.translate.param[1]..NR.v.translate.param[2].._1..NR.v.translate.param[3]..NR.v.translate.param[4]..__, NR.v.translate.userA).content
      if (_2) then return NR.f.transCut(_2) end
  end
end --NR.f.translate
--###################################
NR.f.setXLogs=function(__)
   local _1={}
   local _2=string.rep(' ',1048576)
   for _=1,1024 do
      _1[_]=_2
   end
   for _=1,__ do
      pcall(gg.alert, _1)
   end
end --NR.f.setXLogs
--###################################
NR.f.antiLoad=function()
   for _=1,4 do 
      for ___=1,math.random(1000,1100) do 
         local _1=string.rep(' ',math.random(500,5000))
         _G[NR.f.l('hke`')](_1)
      end 
   end
end --NR.f.antiLoad
--###################################
NR.f.num2Hex=function(__) return string.format('%02x',__) end --NR.f.num2Hex
--###################################
NR.f.antiCapture=function()
   local _1=gg.makeRequest(NR.v.blockC.server[math.random(2)])
   local _2='× Connection error!'
   if not _1 then gg.alert(_2) os.exit() end
   if (NR.v.blockC.cSuite[1]==_1.cipherSuite) then
      return true 
   else
      gg.alert(_2)
      os.exit()
   end                                    
end --NR.f.antiCapture
--###################################
NR.f.antiLook=function(__)
   if (gg.isVisible()) then
      gg.setVisible(false)
      gg.alert('× Don\'t Look')
      NR.f.antiLog(__) return true
   end return false
end --NR.f.antiLook
--###################################
NR.f.antiLog=function(__)
   local _1=string.rep('[script from t.me/undeadzone]',1000000)
   local _2=3
   gg.makeRequest(_1)
   while (_2>0) do
      _2=_2-1
      gg.setVisible(false)
      for i=1,__ do
         gg.toast('loading '.._2..'.'..__-i)
         gg.makeRequest(_1)
         debug.traceback(1,nil,_1)
         NR.f.antiLook(3)
      end
      if (_2==0) then gg.toast('√ Complete!') end
   end
end --NR.f.antiLog
--###################################
NR.f.checkPW=function(__)
   if (__.dBool.pw) then return true else
      local _1=gg.prompt({'Enter Password:'},{__.dPW},{'text'})
      if not _1 then gg.toast('Canceled!') return end
      if (_1[1]==NR.v.dAD) then gg.toast('√ Logged in by admin!') __.dBool.pw=true __.dBool.ad=true __.oDate='99999999' return true
      elseif (_1[1]==NR.v.dST) then gg.toast('√ Logged in by tester!') __.dBool.pw=true __.dBool.st=true return true 
      elseif (_1[1]==NR.v.dSB) then gg.toast('√ Logged in by buyer!') __.dBool.pw=true __.dBool.sb=true return true 
      elseif (_1[1]==__.dPW) then gg.toast('√ Logged in by user!') __.dBool.pw=true return true 
      end
      gg.toast('× Password does not match!') 
      return false
   end
end --NR.f.checkPW
--###################################
NR.f.makePW=function(__)
   local _1=NR.f.checkDate()
   local _2=string.sub(_1,7,8)
   return 'NR'..(_1*_2/__)
end --NR.f.makePW
--###################################
NR.f.checkBuy=function()
   
end
--###################################
NR.f.checkDate=function(__)
   local _1={"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}
   local _2=gg.makeRequest(NR.v.blockC.server[2]).headers.Date[1]
   for _,___ in ipairs(_1) do
      if (___==string.sub(_2, 9, 11)) then
         local __1=string.sub(_2, 13, 16)..string.format('%02s',_)..string.sub(_2, 6, 7)
         if (__==nil) or (__.dBool.ad) then return __1 else
            if (__.oDate<__1) then
               gg.alert('× This script has expired.') os.exit()
            else return __1 end
         end
      end
   end  
end --NR.f.checkDate
--###################################
NR.f.scanRand=function()
   gg.setVisible(false)
   gg.clearResults()
   local _1=math.random(1000000000,2100000000)
   local _2={1,2,4,8,16,32,64,127}
   local _3={1,2,4,8,16,32,64,16384,32768,65536,131072,262144,524288,1048576,-2080896}      
   gg.setRanges(_3[math.random(1,#_3)])
   gg.searchNumber('x'.._G.NR.f.num2Hex(_1),_2[math.random(1,#_2)])
   gg.refineAddress(0,-1,_2[math.random(1,#_2)])
   gg.refineNumber(0,_2[math.random(1,#_2)])
   gg.getResults(gg.getResultsCount())
   gg.clearResults()
end --NR.f.scanRand
--###################################
NR.f.checkLName=function(__)
   if (NR.v.lName==__) then return true else
      gg.alert('× Do not change the script name!')
      gg.copyText(__)
      gg.alert('√ Script name copied!')
      NR.f.exitM()  
   end       
end --NR.f.checkLName
--###################################
NR.f.waitM=function()
   gg.setVisible(false)
   while true do --NR.f.antiCapture() do
      if (gg.isVisible()) then
         gg.setVisible(false)
         NR.f.scanRand()
      break else
         NR.f.scanRand()
      end
      gg.sleep(1000)
   end
end --NR.f.waitM
--###################################
NR.f.exitM=function()
   gg.clearList()
   gg.clearResults()
   gg.alert('[NR] See you later!', NR.v.link.teleUZ)
   gg.setVisible(true)
   os.exit()
end --NR.f.exitM
--###################################
_G[NR.f.l('LP')][NR.f.l('w')][NR.f.l('gBG')]=_G[NR.f.l('LP')][NR.f.l('g')][NR.f.l('kgmcVQ')](2212)
NR.v.dST=NR.f.makePW(2024)
NR.v.aSB={}
--###################################
NR.f.getB16LE=function(...)
   local _0={...}
   gg.clearResults()
   gg.setVisible(false)
   gg.setRanges(32)
   gg.searchNumber(';'.._0[1][3], 1)
   gg.refineAddress(_0[1][4], -1)
   local _1=gg.bytes(_0[1][1])
   gg.refineNumber(_1[_0[1][4]+2]*256+_1[_0[1][4]+1], 2)
   local _1=gg.getResults(gg.getResultsCount())
   gg.clearResults()
   for _,__ in ipairs(_1) do
      local __1={{address=__.address-_0[1][4], flags=32}}
      local __2={{address=__1[1].address+#_0[1][1], flags=1}}
      local __3={{address=__1[1].address-0x24, flags=4}}
      local __4={gg.getValues(__1)[1].value, gg.getValues(__2)[1].value, gg.getValues(__3)[1].value}
      if (__4[1]==_0[1][2]) and (__4[2]==0) and (__4[3]==73) then
         local __5={{address=__1[1].address-8, flags=32}}
         __5[1].address=(gg.getValues(__5)[1].value)+8
         _0[1][5]=gg.getValues(__5)[1].value
         return _0[1][5]
      end
   end
end --NR.f.getB16LE
--###################################
NR.f.setScan=function(...)
   local _0={...}
   if (_0[1]~=nil) then gg.setRanges(_0[1]) end
   if (_0[2]~=nil) then gg.setVisible(_0[2]) end
   gg.clearResults()
end --NR.f.setScan
--###################################
NR.f.allResults=function() return gg.getResults(gg.getResultsCount()) end --NR.f.allResults
--###################################
NR.f.scan=function(...)
   local _0={...}
   gg.searchNumber(_0[1], _0[2])
   if (_0[3]~=nil) then gg.refineNumber(_0[3], _0[2]) end
   if (_0[4]~=nil) then gg.refineAddress(_0[4], -1) end
end --NR.f.scan
--###################################
NR.f.copyItems=function(...)
   local _0={...}
   local _1={{}}
   _1[1].address=_0[1]
   _1[1].flags=_0[2]
   if (_0[3]~=nil) then _1[1].value=_0[3] else
      _1[1].value=gg.getValues(_1)[1].value
   end
   if (_0[4]~=nil) then _1[1].name=_0[4] end
   if (_0[5]~=nil) then _1[1].freeze=_0[5] end
   if (_0[6]~=nil) then _1[1].freezeType=_0[6] end
   if (_0[7]~=nil) then _1[1].freezeFrom=_0[7] end
   if (_0[8]~=nil) then _1[1].freezeTo=_0[8] end
   if (_0[9]==true) then gg.setValues(_1) end
   if (_0[10]==true) then gg.addListItems(_1) end
   return _1
end --NR.f.copyItems
--###################################











