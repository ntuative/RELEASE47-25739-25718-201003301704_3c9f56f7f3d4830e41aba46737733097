package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _password:String;
      
      private var var_1842:int;
      
      private var var_1748:int;
      
      private var var_1841:Boolean;
      
      private var var_1845:Boolean;
      
      private var var_1840:Array;
      
      private var var_1743:Boolean;
      
      private var var_1170:int;
      
      private var _name:String;
      
      private var _roomId:int;
      
      private var var_622:Array;
      
      private var var_1152:String;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get doorMode() : int
      {
         return var_1748;
      }
      
      public function get description() : String
      {
         return var_1152;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1845;
      }
      
      public function get maximumVisitors() : int
      {
         return var_1842;
      }
      
      public function set description(param1:String) : void
      {
         var_1152 = param1;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1743 = param1;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1842 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get categoryId() : int
      {
         return var_1170;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1840;
      }
      
      public function get tags() : Array
      {
         return var_622;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1743;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1748 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_1841 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_622 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1840 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1170 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_1841;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1845 = param1;
      }
   }
}
