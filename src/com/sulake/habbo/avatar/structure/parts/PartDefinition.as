package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1422:int = -1;
      
      private var var_1146:Boolean;
      
      private var var_1147:String;
      
      private var var_1693:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_1693 = String(param1["set-type"]);
         var_1147 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1146 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1422 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1147;
      }
      
      public function get staticId() : int
      {
         return var_1422;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1422 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1146;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1146 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1147 = param1;
      }
      
      public function get setType() : String
      {
         return var_1693;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
