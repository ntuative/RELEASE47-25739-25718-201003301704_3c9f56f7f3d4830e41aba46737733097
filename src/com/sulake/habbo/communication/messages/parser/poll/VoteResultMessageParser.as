package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1207:int;
      
      private var var_1041:String;
      
      private var var_646:Array;
      
      private var var_972:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_646.slice();
      }
      
      public function flush() : Boolean
      {
         var_1041 = "";
         var_972 = [];
         var_646 = [];
         var_1207 = 0;
         return true;
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
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1041 = param1.readString();
         var_972 = [];
         var_646 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_972.push(param1.readString());
            var_646.push(param1.readInteger());
            _loc3_++;
         }
         var_1207 = param1.readInteger();
         return true;
      }
   }
}
