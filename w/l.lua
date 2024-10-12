NR.v.link={
   teleUZ='https://t.me/undeadzone',
   teleNR='https://t.me/nguoirungne'	
}
NR.v.note={
   '📢 test note!'
	
}

NR.f.num2Hex=function(__) return string.format('%02x',__) end --NR.f.num2Hex

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
         if (_1==__) then return true end
         gg.alert('× Do not change the script name!')
         os.exit()         
end --NR.f.checkLName


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



















