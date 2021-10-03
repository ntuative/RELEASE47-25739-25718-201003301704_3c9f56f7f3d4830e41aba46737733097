package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_1390:Array;
      
      private var var_1612:Boolean;
      
      private var var_613:Array;
      
      private var var_1613:int;
      
      private var var_614:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var_1390 = [];
         var_614 = [];
         var_613 = [];
         var_1612 = param1.readBoolean();
         var_1613 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_1390.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_614.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_613.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_613;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1390;
      }
      
      public function get method_13() : int
      {
         return var_1613;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boxTypes() : Array
      {
         return var_614;
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return var_1612;
      }
   }
}
