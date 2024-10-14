function checkF(__)
   if NR.f.checkPW(eht.check) then
      if __==1 then userM() end
      if __==2 then hunterM() end
      if __==3 then shopM() end
      if __==4 then matB() end
   else mainM() end
end

function userB(__)
   if (eht.var.dataU.hasK==false) then
      eht.var.dataU.classK=NR.f.getB16LE(eht.class.dataU)
      eht.var.dataU.hasK=true
   end
   if (eht.var.dataU.hasB==false) then
      NR.f.setScan(32, false)
      NR.f.scan(eht.var.dataU.classK, 32)
      local _1=NR.f.allResults()
      NR.f.setScan()
      if (#_1<300) then gg.alert('× Base not found.') mainM() end
      gg.alert('Base ok '..#_1)
   end
end

function uGold()

end

function uElemental()

end

function hunterB(__)
   gg.alert('hunter base')
end

function shopB(__)
   gg.alert('shop base')
end

function matB()

end

function fullMat()
   gg.alert('material')
end












