MikTRO={};MikTRO.__index=MikTRO;function MikTRO:NewRecyclerObject(maxEntries)recyclerObject={};recyclerObject.PrimaryCache={};recyclerObject.MaxEntries=maxEntries;recyclerObject.NumNew=0;recyclerObject.NumRecycled=0;recyclerObject.NumErased=0;recyclerObject.NumReclaimed=0;recyclerObject.AmountMemFreed=0;recyclerObject.OverflowCache={};setmetatable(recyclerObject.OverflowCache,{__mode="v"});setmetatable(recyclerObject,self);return recyclerObject;end
function MikTRO:AcquireTable()if(table.getn(self.PrimaryCache)>0)then
self.NumRecycled=self.NumRecycled+1;return table.remove(self.PrimaryCache);elseif self:TablesInOverflow()then
self.NumRecycled=self.NumRecycled+1;for i in pairs(self.OverflowCache)do return table.remove(self.OverflowCache,i);end
else
self.NumNew=self.NumNew+1;return{};end end
function MikTRO:ReclaimTable(t)if(type(t)~="table")then return;end
self:EraseTable(t);if(table.getn(self.PrimaryCache)>=self.MaxEntries)then
table.insert(self.OverflowCache,t);else
table.insert(self.PrimaryCache,t);end
self.NumReclaimed=self.NumReclaimed+1;end
function MikTRO:EraseTable(t)if(type(t)~="table")then return;end
local currentMem=gcinfo();for key in pairs(t)do t[key]=nil;end
table.setn(t,0);self.AmountMemFreed=self.AmountMemFreed+math.abs(gcinfo()-currentMem);self.NumErased=self.NumErased+1;end
function MikTRO:PrintStats()local overflowSize=0;for i in pairs(self.OverflowCache)do overflowSize=overflowSize+1;end DEFAULT_CHAT_FRAME:AddMessage(string.format("|cff00ff00New Tables: %d|r  |cffffff00Recycled Tables: %d|r  |cff00ffffCached Tables: %d|r  |cffff0000Overflow Tables: %d|r  |cff888888Erased Tables: %d|r  |cffff00ffMemory Saved: %d KiB|r  |cffff0088Tables Lost to GC: %d",self.NumNew,self.NumRecycled,table.getn(self.PrimaryCache),overflowSize,self.NumErased,self.AmountMemFreed+((32/1024)*self.NumRecycled),self.NumReclaimed-self.NumRecycled-table.getn(self.PrimaryCache)));end
function MikTRO:TablesInOverflow()for i in pairs(self.OverflowCache)do return true;end end