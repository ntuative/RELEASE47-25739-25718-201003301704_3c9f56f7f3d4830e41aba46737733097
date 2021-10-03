package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_133:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1268:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_133);
         var_1268 = param1;
      }
      
      public function get vote() : int
      {
         return var_1268;
      }
   }
}
