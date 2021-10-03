package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_2044:int;
      
      private var var_1204:PetData;
      
      private var var_2090:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_2044;
      }
      
      public function get petData() : PetData
      {
         return var_1204;
      }
      
      public function flush() : Boolean
      {
         var_1204 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_2090;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_2044 = param1.readInteger();
         var_2090 = param1.readInteger();
         var_1204 = new PetData(param1);
         return true;
      }
   }
}
