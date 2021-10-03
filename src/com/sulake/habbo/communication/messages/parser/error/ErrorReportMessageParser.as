package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1294:int;
      
      private var var_1194:int;
      
      private var var_1295:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1294;
      }
      
      public function flush() : Boolean
      {
         var_1194 = 0;
         var_1294 = 0;
         var_1295 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1194;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1294 = param1.readInteger();
         var_1194 = param1.readInteger();
         var_1295 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1295;
      }
   }
}
