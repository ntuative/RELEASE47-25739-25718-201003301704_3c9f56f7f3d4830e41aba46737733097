package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_392:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_317:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_877:int;
      
      private var var_257:Boolean;
      
      private var var_1893:Boolean;
      
      private var var_1467:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_877 = param2;
         var_1893 = param3;
         var_257 = param4;
         var_1467 = param5;
      }
      
      public function get position() : int
      {
         return var_877;
      }
      
      public function get isActive() : Boolean
      {
         return var_257;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1467;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_1893;
      }
   }
}
