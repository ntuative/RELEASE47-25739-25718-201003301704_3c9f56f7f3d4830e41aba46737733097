package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1915:Boolean;
      
      private var var_1881:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1915 = Boolean(parseInt(param1.@club));
         var_1881 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1915;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1881;
      }
   }
}
