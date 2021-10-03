package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_581:String;
      
      private var var_1678:int;
      
      private var var_1734:String;
      
      private var var_1037:int;
      
      private var var_1261:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1261;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1261 = param1.readInteger();
         var_1734 = param1.readString();
         var_1678 = param1.readInteger();
         var_581 = param1.readString();
         var_1037 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_1734;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_581;
      }
      
      public function get petType() : int
      {
         return var_1037;
      }
      
      public function get level() : int
      {
         return var_1678;
      }
   }
}
