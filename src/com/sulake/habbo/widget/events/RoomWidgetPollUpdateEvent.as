package com.sulake.habbo.widget.events
{
   public class RoomWidgetPollUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_107:String = "RWPUW_CONTENT";
      
      public static const const_121:String = "RWPUW_OFFER";
      
      public static const const_62:String = "RWPUW_ERROR";
       
      
      private var var_942:Array = null;
      
      private var var_1115:String = "";
      
      private var var_1353:String;
      
      private var var_1116:String = "";
      
      private var var_943:int = 0;
      
      private var _id:int = -1;
      
      public function RoomWidgetPollUpdateEvent(param1:int, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         _id = param1;
         super(param2,param3,param4);
      }
      
      public function get questionArray() : Array
      {
         return var_942;
      }
      
      public function get startMessage() : String
      {
         return var_1115;
      }
      
      public function get summary() : String
      {
         return var_1353;
      }
      
      public function set startMessage(param1:String) : void
      {
         var_1115 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_943 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1353 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_943;
      }
      
      public function set endMessage(param1:String) : void
      {
         var_1116 = param1;
      }
      
      public function get endMessage() : String
      {
         return var_1116;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         var_942 = param1;
      }
   }
}
