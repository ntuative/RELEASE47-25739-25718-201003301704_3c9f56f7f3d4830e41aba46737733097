package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2048:int;
      
      private var var_581:String;
      
      private var var_1678:int;
      
      private var var_2044:int;
      
      private var var_2043:int;
      
      private var var_2046:int;
      
      private var _nutrition:int;
      
      private var var_1261:int;
      
      private var var_2045:int;
      
      private var var_2047:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_2041:int;
      
      private var var_2042:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1678;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_2046;
      }
      
      public function flush() : Boolean
      {
         var_1261 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_2045;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_2047;
      }
      
      public function get maxNutrition() : int
      {
         return var_2042;
      }
      
      public function get figure() : String
      {
         return var_581;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_2044;
      }
      
      public function get petId() : int
      {
         return var_1261;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1261 = param1.readInteger();
         _name = param1.readString();
         var_1678 = param1.readInteger();
         var_2045 = param1.readInteger();
         var_2043 = param1.readInteger();
         var_2047 = param1.readInteger();
         _energy = param1.readInteger();
         var_2046 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_2042 = param1.readInteger();
         var_581 = param1.readString();
         var_2044 = param1.readInteger();
         var_2041 = param1.readInteger();
         var_2048 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_2043;
      }
      
      public function get ownerId() : int
      {
         return var_2041;
      }
      
      public function get age() : int
      {
         return var_2048;
      }
   }
}
