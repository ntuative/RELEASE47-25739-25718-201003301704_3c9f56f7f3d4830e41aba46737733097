package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1678:int;
      
      private var var_2044:int;
      
      private var var_2043:int;
      
      private var var_2062:int;
      
      private var _nutrition:int;
      
      private var var_1261:int;
      
      private var var_2063:int;
      
      private var var_2064:int;
      
      private var _energy:int;
      
      private var var_2048:int;
      
      private var var_2061:int;
      
      private var _ownerName:String;
      
      private var var_2041:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1678;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_2044 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1678 = param1;
      }
      
      public function get petId() : int
      {
         return var_1261;
      }
      
      public function get experienceMax() : int
      {
         return var_2064;
      }
      
      public function get nutritionMax() : int
      {
         return var_2062;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_2063 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_2041;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1261 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_2061;
      }
      
      public function get respect() : int
      {
         return var_2044;
      }
      
      public function get levelMax() : int
      {
         return var_2063;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_2064 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_2043 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_2062 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_2041 = param1;
      }
      
      public function get experience() : int
      {
         return var_2043;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_2061 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_2048 = param1;
      }
      
      public function get age() : int
      {
         return var_2048;
      }
   }
}
