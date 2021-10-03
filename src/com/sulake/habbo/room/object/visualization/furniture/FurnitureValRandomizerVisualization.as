package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1111:int = 31;
      
      private static const const_1041:int = 32;
      
      private static const const_496:int = 30;
      
      private static const const_778:int = 20;
      
      private static const const_497:int = 10;
       
      
      private var var_595:Boolean = false;
      
      private var var_240:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_240 = new Array();
         super();
         super.setAnimation(const_496);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_595 = true;
            var_240 = new Array();
            var_240.push(const_1111);
            var_240.push(const_1041);
            return;
         }
         if(param1 > 0 && param1 <= const_497)
         {
            if(var_595)
            {
               var_595 = false;
               var_240 = new Array();
               if(_direction == 2)
               {
                  var_240.push(const_778 + 5 - param1);
                  var_240.push(const_497 + 5 - param1);
               }
               else
               {
                  var_240.push(const_778 + param1);
                  var_240.push(const_497 + param1);
               }
               var_240.push(const_496);
               return;
            }
            super.setAnimation(const_496);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
