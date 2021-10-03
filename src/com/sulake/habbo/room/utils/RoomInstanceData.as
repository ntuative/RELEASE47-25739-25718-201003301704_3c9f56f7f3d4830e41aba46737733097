package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_904:LegacyWallGeometry = null;
      
      private var var_605:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_606:TileHeightMap = null;
      
      private var var_2186:String = null;
      
      private var _roomId:int = 0;
      
      private var var_604:SelectedRoomObjectData = null;
      
      private var var_903:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_904 = new LegacyWallGeometry();
         var_903 = new RoomCamera();
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_605 != null)
         {
            var_605.dispose();
         }
         var_605 = param1;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_606 != null)
         {
            var_606.dispose();
         }
         var_606 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_2186 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_904;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return var_604;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_903;
      }
      
      public function dispose() : void
      {
         if(var_606 != null)
         {
            var_606.dispose();
            var_606 = null;
         }
         if(var_904 != null)
         {
            var_904.dispose();
            var_904 = null;
         }
         if(var_903 != null)
         {
            var_903.dispose();
            var_903 = null;
         }
         if(var_605 != null)
         {
            var_605.dispose();
            var_605 = null;
         }
         if(var_604 != null)
         {
            var_604.dispose();
            var_604 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_606;
      }
      
      public function get worldType() : String
      {
         return var_2186;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_604 != null)
         {
            var_604.dispose();
         }
         var_604 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_605;
      }
   }
}
