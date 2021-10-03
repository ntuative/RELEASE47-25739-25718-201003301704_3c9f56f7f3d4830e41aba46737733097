package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_702:int = -1;
      
      public static const const_841:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_2244:int = -1;
      
      private var var_84:int = 0;
      
      private var var_1361:int = 1;
      
      private var var_918:int = 1;
      
      private var var_2245:Boolean = false;
      
      private var var_2246:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_84 = param2;
         _y = param3;
         var_2245 = param5;
         if(param4 < 0)
         {
            param4 = const_702;
         }
         var_918 = param4;
         var_1361 = param4;
         if(param6 >= 0)
         {
            var_2244 = param6;
            var_2246 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_918 > 0 && param1 > var_918)
         {
            param1 = var_918;
         }
         var_1361 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_918;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_2246;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_918 < 0)
         {
            return const_702;
         }
         return var_1361;
      }
      
      public function get activeSequence() : int
      {
         return var_2244;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_2245;
      }
      
      public function get x() : int
      {
         return var_84;
      }
   }
}
