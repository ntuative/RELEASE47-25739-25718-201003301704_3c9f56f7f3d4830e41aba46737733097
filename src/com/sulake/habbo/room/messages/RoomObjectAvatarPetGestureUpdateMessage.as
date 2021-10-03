package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPetGestureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1117:String;
      
      public function RoomObjectAvatarPetGestureUpdateMessage(param1:String)
      {
         super();
         var_1117 = param1;
      }
      
      public function get gesture() : String
      {
         return var_1117;
      }
   }
}
