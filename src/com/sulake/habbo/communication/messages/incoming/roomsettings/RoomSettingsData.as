package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_454:int = 0;
      
      public static const const_109:int = 2;
      
      public static const const_159:int = 1;
      
      public static const const_597:Array = ["open","closed","password"];
       
      
      private var _name:String;
      
      private var var_1841:Boolean;
      
      private var var_1845:Boolean;
      
      private var var_1844:int;
      
      private var var_1840:Array;
      
      private var var_1843:int;
      
      private var var_1743:Boolean;
      
      private var var_1152:String;
      
      private var var_1842:int;
      
      private var var_1748:int;
      
      private var var_1170:int;
      
      private var _roomId:int;
      
      private var var_622:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_1842;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1842 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_622;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1743;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_1843 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1840 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_622 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_1841;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1845;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_1844;
      }
      
      public function get categoryId() : int
      {
         return var_1170;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1743 = param1;
      }
      
      public function get controllerCount() : int
      {
         return var_1843;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1840;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1748 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_1841 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1845 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_1844 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1748;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1170 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1152 = param1;
      }
      
      public function get description() : String
      {
         return var_1152;
      }
   }
}
