package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_708:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_183:String;
      
      private var var_689:String;
      
      private var var_1503:String;
      
      private var var_146:int = -1;
      
      private var var_13:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_146 = param2;
         var_1503 = param3;
         var_183 = param4;
         var_689 = param5;
         var_13 = param6;
      }
      
      public function get objectType() : String
      {
         return var_1503;
      }
      
      public function get colorHex() : String
      {
         return var_689;
      }
      
      public function get text() : String
      {
         return var_183;
      }
      
      public function get objectId() : int
      {
         return var_146;
      }
      
      public function get controller() : Boolean
      {
         return var_13;
      }
   }
}
