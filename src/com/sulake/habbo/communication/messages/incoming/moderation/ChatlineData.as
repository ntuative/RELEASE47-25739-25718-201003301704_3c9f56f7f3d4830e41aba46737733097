package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1469:String;
      
      private var var_2224:int;
      
      private var var_2223:int;
      
      private var var_2222:int;
      
      private var var_2221:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_2224 = param1.readInteger();
         var_2222 = param1.readInteger();
         var_2223 = param1.readInteger();
         var_2221 = param1.readString();
         var_1469 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1469;
      }
      
      public function get hour() : int
      {
         return var_2224;
      }
      
      public function get minute() : int
      {
         return var_2222;
      }
      
      public function get chatterName() : String
      {
         return var_2221;
      }
      
      public function get chatterId() : int
      {
         return var_2223;
      }
   }
}
