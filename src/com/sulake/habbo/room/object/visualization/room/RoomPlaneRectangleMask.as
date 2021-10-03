package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2025:Number = 0;
      
      private var var_2023:Number = 0;
      
      private var var_2024:Number = 0;
      
      private var var_2022:Number = 0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_2023 = param1;
         var_2024 = param2;
         var_2025 = param3;
         var_2022 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_2023;
      }
      
      public function get leftSideLength() : Number
      {
         return var_2025;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_2024;
      }
      
      public function get rightSideLength() : Number
      {
         return var_2022;
      }
   }
}
