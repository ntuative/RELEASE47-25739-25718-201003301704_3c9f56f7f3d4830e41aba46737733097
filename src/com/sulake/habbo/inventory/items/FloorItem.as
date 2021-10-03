package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_2273:Boolean;
      
      protected var var_1564:Number;
      
      protected var var_2275:Boolean;
      
      protected var _type:int;
      
      protected var var_2274:Boolean;
      
      protected var var_1710:int;
      
      protected var var_2276:Boolean;
      
      protected var var_1383:String;
      
      protected var var_2142:int;
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var var_1983:String;
      
      protected var var_2144:Boolean;
      
      protected var _category:int;
      
      protected var var_2143:int;
      
      protected var var_2277:int;
      
      protected var var_2146:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         _id = param1;
         _type = param2;
         _ref = param3;
         _category = param4;
         var_2144 = param5;
         var_2276 = param6;
         var_2273 = param7;
         var_2275 = param8;
         var_1383 = param9;
         var_1564 = param10;
         var_2277 = param11;
         var_2146 = param12;
         var_2143 = param13;
         var_2142 = param14;
         var_1983 = param15;
         var_1710 = param16;
      }
      
      public function get locked() : Boolean
      {
         return var_2274;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get extra() : Number
      {
         return var_1564;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2274 = param1;
      }
      
      public function get ref() : int
      {
         return _ref;
      }
      
      public function get songId() : int
      {
         return var_1710;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get sellable() : Boolean
      {
         return var_2275;
      }
      
      public function get slotId() : String
      {
         return var_1983;
      }
      
      public function get expires() : int
      {
         return var_2277;
      }
      
      public function get creationYear() : int
      {
         return var_2142;
      }
      
      public function get creationDay() : int
      {
         return var_2146;
      }
      
      public function get stuffData() : String
      {
         return var_1383;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2276;
      }
      
      public function get groupable() : Boolean
      {
         return var_2144;
      }
      
      public function get creationMonth() : int
      {
         return var_2143;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2273;
      }
   }
}
