package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_698:int = 6;
      
      public static const const_195:int = 5;
      
      public static const const_664:int = 2;
      
      public static const const_283:int = 9;
      
      public static const const_320:int = 4;
      
      public static const const_262:int = 2;
      
      public static const const_660:int = 4;
      
      public static const const_225:int = 8;
      
      public static const const_504:int = 7;
      
      public static const const_244:int = 3;
      
      public static const const_318:int = 1;
      
      public static const const_197:int = 5;
      
      public static const const_438:int = 12;
      
      public static const const_295:int = 1;
      
      public static const const_523:int = 11;
      
      public static const const_661:int = 3;
      
      public static const const_1455:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_429:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_429 = new Array();
         var_429.push(new Tab(_navigator,const_318,const_438,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_432));
         var_429.push(new Tab(_navigator,const_262,const_295,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_432));
         var_429.push(new Tab(_navigator,const_320,const_523,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_842));
         var_429.push(new Tab(_navigator,const_244,const_195,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_432));
         var_429.push(new Tab(_navigator,const_197,const_225,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_603));
         setSelectedTab(const_318);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_429)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_429)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_429)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_320;
      }
      
      public function get tabs() : Array
      {
         return var_429;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
