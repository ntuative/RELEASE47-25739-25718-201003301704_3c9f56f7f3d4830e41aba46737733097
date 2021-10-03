package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1984:int;
      
      private var var_1985:Boolean;
      
      private var var_1710:int;
      
      private var var_1383:String;
      
      private var var_2073:Boolean = false;
      
      private var var_1986:int;
      
      private var var_443:int;
      
      private var var_1053:String;
      
      private var var_1983:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1171:int;
      
      private var var_1989:Boolean;
      
      private var var_2072:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1984 = param1;
         var_1053 = param2;
         _objId = param3;
         var_1171 = param4;
         var_1383 = param5;
         var_1985 = param6;
         var_1989 = param7;
         var_1986 = param8;
         var_1983 = param9;
         var_1710 = param10;
         var_443 = -1;
      }
      
      public function get songId() : int
      {
         return var_1710;
      }
      
      public function get iconCallbackId() : int
      {
         return var_443;
      }
      
      public function get expiryTime() : int
      {
         return var_1986;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_2072 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2073 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_443 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1989;
      }
      
      public function get slotId() : String
      {
         return var_1983;
      }
      
      public function get classId() : int
      {
         return var_1171;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1985;
      }
      
      public function get stuffData() : String
      {
         return var_1383;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1984;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2073;
      }
      
      public function get prevCallbackId() : int
      {
         return var_2072;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1053;
      }
   }
}
