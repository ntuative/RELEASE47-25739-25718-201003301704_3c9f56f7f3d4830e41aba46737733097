package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var var_1678:int = 0;
      
      private var _type:int = 0;
      
      private var var_1722:String = "";
      
      private var var_1723:String = "";
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _type = param1.readInteger();
         var_1678 = param1.readInteger();
         var_1723 = param1.readString();
         var_1722 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get badgeID() : String
      {
         return var_1723;
      }
      
      public function get removedBadgeID() : String
      {
         return var_1722;
      }
      
      public function get level() : int
      {
         return var_1678;
      }
   }
}
