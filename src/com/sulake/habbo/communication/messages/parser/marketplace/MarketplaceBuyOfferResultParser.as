package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceBuyOfferResultParser implements IMessageParser
   {
       
      
      private var var_1791:int = -1;
      
      private var var_1792:int = -1;
      
      private var var_1793:int = -1;
      
      private var _result:int;
      
      public function MarketplaceBuyOfferResultParser()
      {
         super();
      }
      
      public function get newPrice() : int
      {
         return var_1792;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get requestedOfferId() : int
      {
         return var_1791;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _result = param1.readInteger();
         var_1793 = param1.readInteger();
         var_1792 = param1.readInteger();
         var_1791 = param1.readInteger();
         return true;
      }
      
      public function get result() : int
      {
         return _result;
      }
      
      public function get offerId() : int
      {
         return var_1793;
      }
   }
}
