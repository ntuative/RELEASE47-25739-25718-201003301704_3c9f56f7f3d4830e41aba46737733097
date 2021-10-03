package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToWidth implements BinarySearchTest
   {
       
      
      private var var_385:int;
      
      private var var_168:String;
      
      private var var_183:ITextWindow;
      
      public function CutToWidth()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_168 = param1;
         var_183 = param2;
         var_385 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_183.text = var_168.substring(0,param1) + "...";
         return var_183.textWidth > var_385;
      }
   }
}
