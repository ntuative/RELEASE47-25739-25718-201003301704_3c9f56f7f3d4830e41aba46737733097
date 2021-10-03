package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_970:PetData;
      
      private var var_1438:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1438 = param1.readBoolean();
         var_970 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1438 + ", " + var_970.id + ", " + var_970.name + ", " + pet.figure + ", " + var_970.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1438;
      }
      
      public function get pet() : PetData
      {
         return var_970;
      }
   }
}
