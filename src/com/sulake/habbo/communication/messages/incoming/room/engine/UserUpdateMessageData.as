package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_85:Number = 0;
      
      private var var_232:int = 0;
      
      private var var_1933:int = 0;
      
      private var var_1939:Number = 0;
      
      private var var_1941:Number = 0;
      
      private var var_1940:Number = 0;
      
      private var var_1937:Number = 0;
      
      private var var_1938:Boolean = false;
      
      private var var_84:Number = 0;
      
      private var _id:int = 0;
      
      private var var_196:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_196 = [];
         super();
         _id = param1;
         var_84 = param2;
         _y = param3;
         var_85 = param4;
         var_1937 = param5;
         var_232 = param6;
         var_1933 = param7;
         var_1939 = param8;
         var_1941 = param9;
         var_1940 = param10;
         var_1938 = param11;
         var_196 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_85;
      }
      
      public function get dir() : int
      {
         return var_232;
      }
      
      public function get localZ() : Number
      {
         return var_1937;
      }
      
      public function get isMoving() : Boolean
      {
         return var_1938;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1933;
      }
      
      public function get targetX() : Number
      {
         return var_1939;
      }
      
      public function get targetY() : Number
      {
         return var_1941;
      }
      
      public function get targetZ() : Number
      {
         return var_1940;
      }
      
      public function get x() : Number
      {
         return var_84;
      }
      
      public function get actions() : Array
      {
         return var_196.slice();
      }
   }
}
