package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_959:Boolean;
      
      private var var_1168:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_959 = param1.readInteger() > 0;
         var_1168 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_959;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1168;
      }
      
      public function flush() : Boolean
      {
         var_959 = false;
         var_1168 = false;
         return true;
      }
   }
}
