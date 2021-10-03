package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2191:Boolean = false;
      
      private var var_2189:int = 0;
      
      private var var_1856:int = 0;
      
      private var var_2190:int = 0;
      
      private var var_1443:int = 0;
      
      private var var_1854:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1443 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2189;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2191;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2191 = param1;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2189 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1856 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1443;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2190 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1856;
      }
      
      public function get pixelBalance() : int
      {
         return var_2190;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1854 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1854;
      }
   }
}
