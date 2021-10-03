package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1053:int;
      
      private var var_1292:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1053 = param1;
         var_1292 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1053;
      }
      
      public function get itemName() : String
      {
         return var_1292;
      }
   }
}
