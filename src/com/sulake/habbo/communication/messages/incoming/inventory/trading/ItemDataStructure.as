package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1053:String;
      
      private var var_1776:int;
      
      private var var_2141:int;
      
      private var var_1564:int;
      
      private var var_2142:int;
      
      private var _category:int;
      
      private var var_2379:int;
      
      private var var_2146:int;
      
      private var var_2145:int;
      
      private var var_2147:int;
      
      private var var_2143:int;
      
      private var var_2144:Boolean;
      
      private var var_1383:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1776 = param1;
         var_1053 = param2;
         var_2141 = param3;
         var_2147 = param4;
         _category = param5;
         var_1383 = param6;
         var_1564 = param7;
         var_2145 = param8;
         var_2146 = param9;
         var_2143 = param10;
         var_2142 = param11;
         var_2144 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_2147;
      }
      
      public function get extra() : int
      {
         return var_1564;
      }
      
      public function get stuffData() : String
      {
         return var_1383;
      }
      
      public function get groupable() : Boolean
      {
         return var_2144;
      }
      
      public function get creationMonth() : int
      {
         return var_2143;
      }
      
      public function get roomItemID() : int
      {
         return var_2141;
      }
      
      public function get itemType() : String
      {
         return var_1053;
      }
      
      public function get itemID() : int
      {
         return var_1776;
      }
      
      public function get songID() : int
      {
         return var_1564;
      }
      
      public function get timeToExpiration() : int
      {
         return var_2145;
      }
      
      public function get creationYear() : int
      {
         return var_2142;
      }
      
      public function get creationDay() : int
      {
         return var_2146;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
