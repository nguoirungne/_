_G[NR.f.l('m')]=function(...)
   local _0={...}
   local _1=''  
   if _0[2]==nil then _0[2]=NR.f.l('el~dby~elen') end
   for _=1, #_0[1] do
      local __1=string.byte(_0[1],_)
      local __2=string.byte(_0[2],(_%#_0[2])+1)
      _1=_1..string.char(bit32.bxor(__1,__2))
   end
   return _1
end

NR[' ']={}
for _ in pairs(_G) do
   if (_~='l') then NR[' '][#NR[' ']+1]=l(_) end --remove global var name
   if (type(_G[_])=='table') and (_~='_G') and (_~='NR') and (_~='l') then
      NR[' '][l(_)]={}
      for __ in pairs(_G[_]) do
         NR[' '][l(_)][#NR[' '][l(_)]+1]=l(__)
      end
   end
end







