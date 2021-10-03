package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_340:Number = 0.5;
      
      private static const const_748:int = 3;
      
      private static const const_1073:Number = 1;
       
      
      private var var_1863:Boolean = false;
      
      private var var_1859:Boolean = false;
      
      private var var_995:int = 0;
      
      private var var_259:Vector3d = null;
      
      private var var_1865:int = 0;
      
      private var var_1866:int = 0;
      
      private var var_1858:Boolean = false;
      
      private var var_1862:int = -2;
      
      private var var_1867:Boolean = false;
      
      private var var_1864:int = 0;
      
      private var var_1861:int = -1;
      
      private var var_395:Vector3d = null;
      
      private var var_1860:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1865;
      }
      
      public function get targetId() : int
      {
         return var_1861;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1864 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1865 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1863 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1861 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1859 = param1;
      }
      
      public function dispose() : void
      {
         var_395 = null;
         var_259 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_395 == null)
         {
            var_395 = new Vector3d();
         }
         var_395.assign(param1);
         var_995 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1862;
      }
      
      public function get screenHt() : int
      {
         return var_1860;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1866 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_259;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1860 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1864;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1863;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1859;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_395 != null && var_259 != null)
         {
            ++var_995;
            _loc2_ = Vector3d.dif(var_395,var_259);
            if(_loc2_.length <= const_340)
            {
               var_259 = var_395;
               var_395 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_340 * (const_748 + 1))
               {
                  _loc2_.mul(const_340);
               }
               else if(var_995 <= const_748)
               {
                  _loc2_.mul(const_340);
               }
               else
               {
                  _loc2_.mul(const_1073);
               }
               var_259 = Vector3d.sum(var_259,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1858 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1866;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1867 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1862 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_259 != null)
         {
            return;
         }
         var_259 = new Vector3d();
         var_259.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1858;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1867;
      }
   }
}
