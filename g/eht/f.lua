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
      print(eht.var.dataU.classK)
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












