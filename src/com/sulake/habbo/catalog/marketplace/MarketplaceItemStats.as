package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1551:Array;
      
      private var var_1689:int;
      
      private var var_1690:int;
      
      private var var_1692:int;
      
      private var var_1691:int;
      
      private var _dayOffsets:Array;
      
      private var var_1688:int;
      
      private var var_1550:Array;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1551;
      }
      
      public function set averagePrices(param1:Array) : void
      {
         var_1551 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_1690;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1550 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1689 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_1692;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1691;
      }
      
      public function get offerCount() : int
      {
         return var_1688;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1688 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1550;
      }
      
      public function get averagePrice() : int
      {
         return var_1689;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_1691 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_1692 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_1690 = param1;
      }
   }
}
