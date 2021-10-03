package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_126:int = 0;
      
      public static const const_110:int = 1;
      
      public static const const_99:int = 2;
      
      public static const const_606:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1201:int = 0;
      
      private var var_1648:String = "";
      
      private var var_183:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_183 = param2;
         var_1201 = param3;
         var_1648 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_1648;
      }
      
      public function get chatType() : int
      {
         return var_1201;
      }
      
      public function get text() : String
      {
         return var_183;
      }
   }
}
