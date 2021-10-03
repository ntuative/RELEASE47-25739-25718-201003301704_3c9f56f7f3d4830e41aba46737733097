package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_1148:String;
      
      private var _id:int;
      
      private var var_1873:String = "";
      
      private var var_1872:int;
      
      private var var_1871:String;
      
      private var var_1759:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_1872 = parseInt(param1.@pattern);
         var_1148 = String(param1.@gender);
         var_1759 = Boolean(parseInt(param1.@colorable));
         var_1873 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_1873;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1759;
      }
      
      public function get gender() : String
      {
         return var_1148;
      }
      
      public function get patternId() : int
      {
         return var_1872;
      }
      
      public function get avatarFigureString() : String
      {
         return var_1871;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_1871 = param1;
      }
   }
}
