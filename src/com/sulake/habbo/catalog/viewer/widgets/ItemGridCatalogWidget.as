package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.catalog.viewer.BundleProductContainer;
   import com.sulake.habbo.catalog.viewer.IGridItem;
   import com.sulake.habbo.catalog.viewer.IItemGrid;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.ProductContainer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ItemGridCatalogWidget extends CatalogWidget implements ICatalogWidget, IItemGrid
   {
       
      
      private var var_844:int = 0;
      
      private var var_173:Timer;
      
      private var _scrollBar:IScrollbarWindow;
      
      protected var var_305:IGridItem;
      
      protected var var_133:Boolean = true;
      
      protected var var_931:IItemGridWindow;
      
      private var var_1504:int = 0;
      
      protected var var_1382:XML;
      
      public function ItemGridCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
         _scrollBar = _window.findChildByName("itemGridScrollbar") as IScrollbarWindow;
         if(_scrollBar != null)
         {
            _scrollBar.visible = false;
            _scrollBar.addEventListener(WindowEvent.const_569,activateScrollbar);
            _scrollBar.addEventListener(WindowEvent.const_233,activateScrollbar);
            _scrollBar.addEventListener(WindowEvent.WINDOW_EVENT_DISABLE,deActivateScrollbar);
            _scrollBar.addEventListener(WindowEvent.const_199,deActivateScrollbar);
         }
      }
      
      override public function dispose() : void
      {
         if(var_173 != null)
         {
            var_173.stop();
            var_173.removeEventListener(TimerEvent.TIMER,populateItemGrid);
            var_173 = null;
         }
         var_931.destroyGridItems();
         var_931 = null;
         var_1382 = null;
         var_305 = null;
         super.dispose();
      }
      
      protected function populateItemGrid(param1:TimerEvent = null) : void
      {
         var _loc4_:* = null;
         var _loc2_:int = -1;
         if(param1 != null)
         {
            _loc2_ = param1.currentTarget.currentCount;
            if(var_844 == page.offers.length)
            {
               (param1.target as Timer).removeEventListener(TimerEvent.TIMER,populateItemGrid);
               (param1.target as Timer).stop();
            }
         }
         var _loc3_:int = 0;
         while(_loc3_ < 3)
         {
            if(var_844 >= 0 && var_844 < page.offers.length)
            {
               _loc4_ = page.offers[var_844];
               createGridItem(_loc4_);
               _loc4_.productContainer.grid = this;
            }
            ++var_844;
            _loc3_++;
         }
      }
      
      protected function createGridItem(param1:Offer) : void
      {
         var _loc2_:IWindowContainer = page.viewer.catalog.windowManager.buildFromXML(var_1382) as IWindowContainer;
         var_931.addGridItem(_loc2_);
         param1.productContainer.view = _loc2_;
         param1.productContainer.initProductIcon(page.viewer.roomEngine);
         if(param1.pricingModel == Offer.const_450)
         {
            ++var_1504;
            (param1.productContainer as BundleProductContainer).setBundleCounter(var_1504);
         }
      }
      
      override public function init() : void
      {
         var_931 = _window.findChildByName("itemGrid") as IItemGridWindow;
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("gridItem") as XmlAsset;
         var_1382 = _loc1_.content as XML;
         populateItemGrid();
         if(var_133)
         {
            var_173 = new Timer(25);
            var_173.addEventListener(TimerEvent.TIMER,populateItemGrid);
            var_173.start();
         }
      }
      
      private function deActivateScrollbar(param1:WindowEvent) : void
      {
         (param1.target as IWindow).visible = false;
      }
      
      private function activateScrollbar(param1:WindowEvent) : void
      {
         (param1.target as IWindow).visible = true;
      }
      
      public function select(param1:IGridItem) : void
      {
         if(var_305 != null)
         {
            var_305.deActivate();
         }
         var_305 = param1;
         param1.activate();
         var _loc2_:Offer = (param1 as ProductContainer).offer;
         if(_loc2_ != null)
         {
            events.dispatchEvent(new SelectProductEvent(_loc2_));
         }
      }
   }
}
