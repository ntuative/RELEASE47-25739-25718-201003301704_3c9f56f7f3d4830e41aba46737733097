package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCatMessageParser implements IMessageParser
   {
       
      
      private var var_378:int;
      
      private var var_1351:int;
      
      public function FlatCatMessageParser()
      {
         super();
      }
      
      public function get flatId() : int
      {
         return var_378;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_378 = param1.readInteger();
         var_1351 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_378 = 0;
         var_1351 = 0;
         return true;
      }
      
      public function get nodeId() : int
      {
         return var_1351;
      }
   }
}
