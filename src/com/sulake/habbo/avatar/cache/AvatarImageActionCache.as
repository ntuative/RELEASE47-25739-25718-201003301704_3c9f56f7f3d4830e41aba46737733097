package com.sulake.habbo.avatar.cache
{
   import com.sulake.core.utils.Map;
   import flash.utils.getTimer;
   
   public class AvatarImageActionCache
   {
       
      
      private var var_2258:int;
      
      private var var_135:Map;
      
      public function AvatarImageActionCache()
      {
         super();
         var_135 = new Map();
         setLastAccessTime();
      }
      
      public function setLastAccessTime() : void
      {
         var_2258 = getTimer();
      }
      
      private function debugInfo(param1:String) : void
      {
      }
      
      public function getLastAccessTime() : int
      {
         return var_2258;
      }
      
      public function getDirectionCache(param1:int) : AvatarImageDirectionCache
      {
         var _loc2_:String = param1.toString();
         return var_135.getValue(_loc2_) as AvatarImageDirectionCache;
      }
      
      public function updateDirectionCache(param1:int, param2:AvatarImageDirectionCache) : void
      {
         var _loc3_:String = param1.toString();
         var_135.add(_loc3_,param2);
      }
      
      public function dispose() : void
      {
         debugInfo("[dispose]");
         if(var_135 == null)
         {
            return;
         }
         var_135.dispose();
      }
   }
}
