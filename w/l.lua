NR.v.link={
   teleUZ='https://t.me/undeadzone',
   teleNR='https://t.me/nguoirungne'	
}
NR.v.note={
   '📢 test world note!\n'	
}
NR.v.blockC={
   server={'https://cdn.now.gg', 'https://404.playrix.com'},
   cSuite={'TLS_AES_256_GCM_SHA384'}
}

NR.f.num2Hex=function(__) return string.format('%02x',__) end --NR.f.num2Hex

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

NR.f.antiLook=function(__)
   if (gg.isVisible()) then
      gg.setVisible(false)
      gg.alert('× Don\'t Look')
      NR.f.antiLog(__) return true
   end return false
end --NR.f.antiLook

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

NR.f.checkPW=function(__)
   if (__.dBool.pw) then return true else
      local _1=gg.prompt({'Enter Password:'},nil,{'text'})
      if not _1 then gg.toast('Canceled!') mainMenu() end
      if (_1[1]==__.dPW) then gg.toast('√ Logged in!') __.dBool.pw=true return true
      else gg.toast('× Passwords do not match!') return false end
   end
end --NR.f.checkPW

NR.f.checkDate=function(__)
   local _1=gg.makeRequest(NR.v.blockC.server[2]).headers.Date
   print (_1)
end --NR.f.checkDate

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

NR.f.checkLName=function(__)
   local _1=string.match(gg.getFile(),'[^/]+$')
   if (_1==__) then return true else
      print(_1)
      print(__)
      gg.alert('× Do not change the script name!')
      gg.copyText(__)
      gg.toast('√ name has copied!')
      os.exit()
   end
end --NR.f.checkLName

NR.f.menuTab=function(__)
   local _1={}
   for _=1, #__[1] do _1[_]=__[1][_][1] end
   local _2=gg.choice(_1, nil, __.title)
   if not _2 then NR.f.waitM() end
   return _2 and __[1][_2][2](__[1][_2][3])
end --NR.f.menuTab

NR.f.waitM=function()
   gg.setVisible(false)
   while NR.f.antiCapture() do
      if (gg.isVisible()) then
         gg.setVisible(false)
         NR.f.scanRand()
      break else
         NR.f.scanRand()
      end
      gg.sleep(1000)
   end
end --NR.f.waitM

NR.f.exitM=function()
   gg.clearList()
   gg.clearResults()
   gg.alert('Good bye!')
   gg.setVisible(true)
   os.exit()
end --NR.f.exitM

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



















