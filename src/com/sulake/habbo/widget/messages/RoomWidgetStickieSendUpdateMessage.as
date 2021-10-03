package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStickieSendUpdateMessage extends RoomWidgetMessage
   {
      
      public static const const_362:String = "RWSUM_STICKIE_SEND_UPDATE";
      
      public static const const_594:String = "RWSUM_STICKIE_SEND_DELETE";
       
      
      private var var_689:String;
      
      private var var_146:int;
      
      private var var_183:String;
      
      public function RoomWidgetStickieSendUpdateMessage(param1:String, param2:int, param3:String = "", param4:String = "")
      {
         super(param1);
         var_146 = param2;
         var_183 = param3;
         var_689 = param4;
      }
      
      public function get objectId() : int
      {
         return var_146;
      }
      
      public function get text() : String
      {
         return var_183;
      }
      
      public function get colorHex() : String
      {
         return var_689;
      }
   }
}
