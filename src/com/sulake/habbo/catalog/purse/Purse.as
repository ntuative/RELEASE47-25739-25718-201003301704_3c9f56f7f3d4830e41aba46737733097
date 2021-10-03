package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1856:int = 0;
      
      private var var_1855:int = 0;
      
      private var var_1853:int = 0;
      
      private var var_1854:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get pixels() : int
      {
         return var_1855;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1855 = param1;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1856 = param1;
      }
      
      public function get credits() : int
      {
         return var_1853;
      }
      
      public function get clubDays() : int
      {
         return var_1856;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1854 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1853 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1854;
      }
   }
}
