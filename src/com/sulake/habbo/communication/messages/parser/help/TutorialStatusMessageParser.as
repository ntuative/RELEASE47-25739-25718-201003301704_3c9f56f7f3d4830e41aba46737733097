package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1066:Boolean;
      
      private var var_1064:Boolean;
      
      private var var_1065:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1066;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1064;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1065 = param1.readBoolean();
         var_1064 = param1.readBoolean();
         var_1066 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1065;
      }
      
      public function flush() : Boolean
      {
         var_1065 = false;
         var_1064 = false;
         var_1066 = false;
         return true;
      }
   }
}
