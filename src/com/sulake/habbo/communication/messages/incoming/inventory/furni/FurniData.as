package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1383:String;
      
      private var var_1053:String;
      
      private var var_1988:Boolean;
      
      private var var_1564:int;
      
      private var var_1984:int;
      
      private var var_1987:Boolean;
      
      private var var_1983:String = "";
      
      private var var_1985:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1171:int;
      
      private var var_1989:Boolean;
      
      private var var_1710:int = -1;
      
      private var var_1986:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1984 = param1;
         var_1053 = param2;
         _objId = param3;
         var_1171 = param4;
         _category = param5;
         var_1383 = param6;
         var_1988 = param7;
         var_1985 = param8;
         var_1989 = param9;
         var_1987 = param10;
         var_1986 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1983;
      }
      
      public function get extra() : int
      {
         return var_1564;
      }
      
      public function get classId() : int
      {
         return var_1171;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_1987;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_1988;
      }
      
      public function get stripId() : int
      {
         return var_1984;
      }
      
      public function get stuffData() : String
      {
         return var_1383;
      }
      
      public function get songId() : int
      {
         return var_1710;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1983 = param1;
         var_1564 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1053;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1986;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1989;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1985;
      }
   }
}
