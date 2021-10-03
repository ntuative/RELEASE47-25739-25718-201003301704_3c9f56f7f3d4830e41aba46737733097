package com.sulake.habbo.help.help.data
{
   public class FaqItem
   {
       
      
      private var var_1266:int;
      
      private var var_1265:String;
      
      private var var_2238:String;
      
      private var _index:int;
      
      private var var_2237:Boolean = false;
      
      private var _category:FaqCategory;
      
      public function FaqItem(param1:int, param2:String, param3:int, param4:FaqCategory)
      {
         super();
         var_1266 = param1;
         var_2238 = param2;
         _index = param3;
         _category = param4;
      }
      
      public function get answerText() : String
      {
         return var_1265;
      }
      
      public function get questionId() : int
      {
         return var_1266;
      }
      
      public function get questionText() : String
      {
         return var_2238;
      }
      
      public function set answerText(param1:String) : void
      {
         var_1265 = param1;
         var_2237 = true;
      }
      
      public function get hasAnswer() : Boolean
      {
         return var_2237;
      }
      
      public function get category() : FaqCategory
      {
         return _category;
      }
      
      public function get index() : int
      {
         return _index;
      }
   }
}
