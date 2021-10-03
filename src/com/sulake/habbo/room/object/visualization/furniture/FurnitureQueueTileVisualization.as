package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1120:int = 1;
      
      private static const const_1041:int = 3;
      
      private static const const_1119:int = 2;
      
      private static const const_1121:int = 15;
       
      
      private var var_901:int;
      
      private var var_240:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_240 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1119)
         {
            var_240 = new Array();
            var_240.push(const_1120);
            var_901 = const_1121;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_901 > 0)
         {
            --var_901;
         }
         if(var_901 == 0)
         {
            if(false)
            {
               super.setAnimation(var_240.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
