package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1316:int;
      
      private var var_2164:int = -1;
      
      private var var_370:int;
      
      private var var_1689:int;
      
      private var var_2114:int;
      
      private var _offerId:int;
      
      private var var_1317:int;
      
      private var var_1935:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         _offerId = param1;
         var_1935 = param2;
         var_2114 = param3;
         var_1316 = param4;
         var_370 = param5;
         var_2164 = param6;
         var_1689 = param7;
         var_1317 = param8;
      }
      
      public function get status() : int
      {
         return var_370;
      }
      
      public function get price() : int
      {
         return var_1316;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_2164;
      }
      
      public function get offerCount() : int
      {
         return var_1317;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_2114;
      }
      
      public function get averagePrice() : int
      {
         return var_1689;
      }
      
      public function get furniId() : int
      {
         return var_1935;
      }
   }
}
