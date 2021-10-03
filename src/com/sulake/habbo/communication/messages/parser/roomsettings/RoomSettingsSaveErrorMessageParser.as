package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1589:int = 9;
      
      public static const const_1434:int = 4;
      
      public static const const_1460:int = 1;
      
      public static const const_1192:int = 10;
      
      public static const const_1444:int = 2;
      
      public static const const_1227:int = 7;
      
      public static const const_1343:int = 11;
      
      public static const const_1510:int = 3;
      
      public static const const_1338:int = 8;
      
      public static const const_1354:int = 5;
      
      public static const const_1518:int = 6;
      
      public static const const_1233:int = 12;
       
      
      private var var_1700:String;
      
      private var _roomId:int;
      
      private var var_1194:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1700;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1194 = param1.readInteger();
         var_1700 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1194;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
