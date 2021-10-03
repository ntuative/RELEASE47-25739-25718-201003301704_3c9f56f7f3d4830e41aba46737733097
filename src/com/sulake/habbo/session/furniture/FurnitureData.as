package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1584:String = "e";
      
      public static const const_1574:String = "i";
      
      public static const const_1506:String = "s";
       
      
      private var _id:int;
      
      private var _title:String;
      
      private var _type:String;
      
      private var var_1826:int;
      
      private var var_1193:Array;
      
      private var var_1828:int;
      
      private var var_1829:int;
      
      private var var_1827:int;
      
      private var _name:String;
      
      private var var_1825:int;
      
      private var var_1152:String;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String)
      {
         super();
         _type = param1;
         _id = param2;
         _name = param3;
         var_1826 = param4;
         var_1825 = param5;
         var_1828 = param6;
         var_1829 = param7;
         var_1827 = param8;
         var_1193 = param9;
         _title = param10;
         var_1152 = param11;
      }
      
      public function get tileSizeY() : int
      {
         return var_1829;
      }
      
      public function get tileSizeZ() : int
      {
         return var_1827;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function get revision() : int
      {
         return var_1825;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get colourIndex() : int
      {
         return var_1826;
      }
      
      public function get tileSizeX() : int
      {
         return var_1828;
      }
      
      public function get colours() : Array
      {
         return var_1193;
      }
      
      public function get description() : String
      {
         return var_1152;
      }
   }
}
