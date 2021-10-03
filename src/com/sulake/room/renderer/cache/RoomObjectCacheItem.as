package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_539:RoomObjectLocationCacheItem = null;
      
      private var var_169:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         var_539 = new RoomObjectLocationCacheItem(param1);
         var_169 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return var_539;
      }
      
      public function dispose() : void
      {
         if(var_539 != null)
         {
            var_539.dispose();
            var_539 = null;
         }
         if(var_169 != null)
         {
            var_169.dispose();
            var_169 = null;
         }
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return var_169;
      }
   }
}
