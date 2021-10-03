package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_132:String = "RWPUE_VOTE_RESULT";
      
      public static const const_112:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1207:int;
      
      private var var_1041:String;
      
      private var var_646:Array;
      
      private var var_972:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1041 = param2;
         var_972 = param3;
         var_646 = param4;
         if(var_646 == null)
         {
            var_646 = [];
         }
         var_1207 = param5;
      }
      
      public function get votes() : Array
      {
         return var_646.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1207;
      }
      
      public function get question() : String
      {
         return var_1041;
      }
      
      public function get choices() : Array
      {
         return var_972.slice();
      }
   }
}
