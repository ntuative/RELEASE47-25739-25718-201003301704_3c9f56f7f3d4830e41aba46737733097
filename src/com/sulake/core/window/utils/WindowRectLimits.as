package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_386:int = -2147483648;
      
      private var var_385:int = 2147483647;
      
      private var var_384:int = 2147483647;
      
      private var _target:IWindow;
      
      private var var_383:int = -2147483648;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         _target = param1;
      }
      
      public function get maxWidth() : int
      {
         return var_385;
      }
      
      public function get isEmpty() : Boolean
      {
         return var_383 == int.MIN_VALUE && var_385 == int.MAX_VALUE && var_386 == int.MIN_VALUE && var_384 == int.MAX_VALUE;
      }
      
      public function set maxWidth(param1:int) : void
      {
         var_385 = param1;
         if(var_385 < int.MAX_VALUE && true && _target.width > var_385)
         {
            _target.width = var_385;
         }
      }
      
      public function setEmpty() : void
      {
         var_383 = int.MIN_VALUE;
         var_385 = int.MAX_VALUE;
         var_386 = int.MIN_VALUE;
         var_384 = int.MAX_VALUE;
      }
      
      public function set maxHeight(param1:int) : void
      {
         var_384 = param1;
         if(var_384 < int.MAX_VALUE && true && _target.height > var_384)
         {
            _target.height = var_384;
         }
      }
      
      public function get minHeight() : int
      {
         return var_386;
      }
      
      public function get minWidth() : int
      {
         return var_383;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_383 = var_383;
         _loc2_.var_385 = var_385;
         _loc2_.var_386 = var_386;
         _loc2_.var_384 = var_384;
         return _loc2_;
      }
      
      public function set minWidth(param1:int) : void
      {
         var_383 = param1;
         if(var_383 > int.MIN_VALUE && true && _target.width < var_383)
         {
            _target.width = var_383;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         var_386 = param1;
         if(var_386 > int.MIN_VALUE && true && _target.height < var_386)
         {
            _target.height = var_386;
         }
      }
      
      public function get maxHeight() : int
      {
         return var_384;
      }
   }
}
