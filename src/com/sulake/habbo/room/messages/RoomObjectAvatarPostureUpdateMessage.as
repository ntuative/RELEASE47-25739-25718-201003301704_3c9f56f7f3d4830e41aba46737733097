package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1637:String;
      
      private var var_809:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_1637 = param1;
         var_809 = param2;
      }
      
      public function get postureType() : String
      {
         return var_1637;
      }
      
      public function get parameter() : String
      {
         return var_809;
      }
   }
}
