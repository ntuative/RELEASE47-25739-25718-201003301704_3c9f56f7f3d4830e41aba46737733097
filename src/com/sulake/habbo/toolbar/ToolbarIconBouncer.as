package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1706:Number;
      
      private var var_539:Number = 0;
      
      private var var_1705:Number;
      
      private var var_540:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1706 = param1;
         var_1705 = param2;
      }
      
      public function update() : void
      {
         var_540 += var_1705;
         var_539 += var_540;
         if(var_539 > 0)
         {
            var_539 = 0;
            var_540 = var_1706 * -1 * var_540;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_540 = param1;
         var_539 = 0;
      }
      
      public function get location() : Number
      {
         return var_539;
      }
   }
}
