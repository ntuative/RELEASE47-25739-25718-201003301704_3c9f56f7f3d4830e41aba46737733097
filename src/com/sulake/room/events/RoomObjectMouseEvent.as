package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1586:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1547:String = "ROE_MOUSE_ENTER";
      
      public static const const_369:String = "ROE_MOUSE_MOVE";
      
      public static const const_1569:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_222:String = "ROE_MOUSE_CLICK";
      
      public static const ROOM_OBJECT_MOUSE_DOWN:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1663:Boolean;
      
      private var var_1670:Boolean;
      
      private var var_1667:Boolean;
      
      private var var_1665:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1667 = param4;
         var_1665 = param5;
         var_1663 = param6;
         var_1670 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1670;
      }
      
      public function get altKey() : Boolean
      {
         return var_1667;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1665;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1663;
      }
   }
}
