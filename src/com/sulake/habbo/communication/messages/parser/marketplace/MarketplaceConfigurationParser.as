package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1928:int;
      
      private var var_1494:int;
      
      private var var_1927:int;
      
      private var var_1925:int;
      
      private var var_1930:int;
      
      private var var_1493:int;
      
      private var var_1926:int;
      
      private var var_1672:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1928;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1494;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1926;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1925;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1930;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1493;
      }
      
      public function get commission() : int
      {
         return var_1927;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1672 = param1.readBoolean();
         var_1927 = param1.readInteger();
         var_1494 = param1.readInteger();
         var_1493 = param1.readInteger();
         var_1925 = param1.readInteger();
         var_1928 = param1.readInteger();
         var_1930 = param1.readInteger();
         var_1926 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1672;
      }
   }
}
