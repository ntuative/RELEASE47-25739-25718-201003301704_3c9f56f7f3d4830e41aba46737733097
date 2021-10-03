package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1633:String;
      
      private var var_581:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_581 = param1;
         var_1633 = param2;
      }
      
      public function get race() : String
      {
         return var_1633;
      }
      
      public function get figure() : String
      {
         return var_581;
      }
   }
}
