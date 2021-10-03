package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1543:int = 2;
      
      public static const const_1202:int = 4;
      
      public static const const_1164:int = 1;
      
      public static const const_1248:int = 3;
       
      
      private var var_979:int = 0;
      
      private var var_809:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_979;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_979 = param1.readInteger();
         if(var_979 == 3)
         {
            var_809 = param1.readString();
         }
         else
         {
            var_809 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_979 = 0;
         var_809 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_809;
      }
   }
}
