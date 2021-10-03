package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_132:String = "RSPE_VOTE_RESULT";
      
      public static const const_112:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1207:int = 0;
      
      private var var_1041:String = "";
      
      private var var_646:Array;
      
      private var var_972:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_972 = [];
         var_646 = [];
         super(param1,param2,param7,param8);
         var_1041 = param3;
         var_972 = param4;
         var_646 = param5;
         if(var_646 == null)
         {
            var_646 = [];
         }
         var_1207 = param6;
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
