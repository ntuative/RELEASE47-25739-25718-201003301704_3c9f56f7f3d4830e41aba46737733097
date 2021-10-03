package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CanCreateRoomEventMessageParser implements IMessageParser
   {
       
      
      private var var_1194:int;
      
      private var var_2301:Boolean;
      
      public function CanCreateRoomEventMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2301 = param1.readBoolean();
         this.var_1194 = param1.readInteger();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1194;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get canCreateEvent() : Boolean
      {
         return var_2301;
      }
   }
}
