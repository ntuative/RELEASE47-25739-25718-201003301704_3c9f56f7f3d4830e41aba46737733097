package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_240:uint = 1;
      
      public static const const_378:uint = 0;
      
      public static const const_951:uint = 8;
      
      public static const const_242:uint = 4;
      
      public static const const_388:uint = 2;
       
      
      private var var_415:uint;
      
      private var var_1812:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_1813:uint;
      
      private var var_96:Rectangle;
      
      private var var_622:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_96 = param3;
         _color = param4;
         var_415 = param5;
         var_1812 = param6;
         var_1813 = param7;
         var_622 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_1812;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_415;
      }
      
      public function get scaleV() : uint
      {
         return var_1813;
      }
      
      public function get tags() : Array
      {
         return var_622;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_96 = null;
         var_622 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_96;
      }
   }
}
