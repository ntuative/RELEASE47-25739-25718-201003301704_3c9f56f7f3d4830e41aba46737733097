package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_898:String = "price_type_none";
      
      public static const const_391:String = "pricing_model_multi";
      
      public static const const_467:String = "price_type_credits";
      
      public static const const_459:String = "price_type_credits_and_pixels";
      
      public static const const_450:String = "pricing_model_bundle";
      
      public static const const_383:String = "pricing_model_single";
      
      public static const const_611:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1347:String = "pricing_model_unknown";
      
      public static const const_456:String = "price_type_pixels";
       
      
      private var var_884:int;
      
      private var _offerId:int;
      
      private var var_883:int;
      
      private var var_426:String;
      
      private var var_598:String;
      
      private var var_2115:int;
      
      private var var_563:ICatalogPage;
      
      private var var_1291:String;
      
      private var var_425:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1291 = param1.localizationId;
         var_884 = param1.priceInCredits;
         var_883 = param1.priceInPixels;
         var_563 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_426;
      }
      
      public function get page() : ICatalogPage
      {
         return var_563;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_2115 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_425;
      }
      
      public function get localizationId() : String
      {
         return var_1291;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_883;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1291 = "";
         var_884 = 0;
         var_883 = 0;
         var_563 = null;
         if(var_425 != null)
         {
            var_425.dispose();
            var_425 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_598;
      }
      
      public function get previewCallbackId() : int
      {
         return var_2115;
      }
      
      public function get priceInCredits() : int
      {
         return var_884;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_426 = const_383;
            }
            else
            {
               var_426 = const_391;
            }
         }
         else if(param1.length > 1)
         {
            var_426 = const_450;
         }
         else
         {
            var_426 = const_1347;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_426)
         {
            case const_383:
               var_425 = new SingleProductContainer(this,param1);
               break;
            case const_391:
               var_425 = new MultiProductContainer(this,param1);
               break;
            case const_450:
               var_425 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_426);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_884 > 0 && var_883 > 0)
         {
            var_598 = const_459;
         }
         else if(var_884 > 0)
         {
            var_598 = const_467;
         }
         else if(var_883 > 0)
         {
            var_598 = const_456;
         }
         else
         {
            var_598 = const_898;
         }
      }
   }
}
