package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_524:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_451:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_524);
         var_451 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_451;
      }
   }
}
