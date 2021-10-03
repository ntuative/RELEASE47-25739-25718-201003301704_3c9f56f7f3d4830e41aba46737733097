package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1678:int;
      
      private var var_2043:int;
      
      private var var_2062:int;
      
      private var _type:int;
      
      private var var_1261:int = -1;
      
      private var var_2063:int;
      
      private var _nutrition:int;
      
      private var var_2064:int;
      
      private var _energy:int;
      
      private var var_1633:int;
      
      private var var_2061:int;
      
      private var var_2081:int;
      
      private var var_2048:int;
      
      private var _petRespect:int;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var _image:BitmapData;
      
      private var _ownerName:String;
      
      private var var_2080:Boolean;
      
      private var _name:String = "";
      
      private var var_2041:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get isOwnPet() : Boolean
      {
         return var_2080;
      }
      
      public function get level() : int
      {
         return var_1678;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get experienceMax() : int
      {
         return var_2064;
      }
      
      public function get id() : int
      {
         return var_1261;
      }
      
      public function get nutritionMax() : int
      {
         return var_2062;
      }
      
      public function get ownerId() : int
      {
         return var_2041;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         _name = param1.name;
         var_1261 = param1.id;
         _type = param1.petType;
         var_1633 = param1.petRace;
         _image = param1.image;
         var_2080 = param1.isOwnPet;
         var_2041 = param1.ownerId;
         _ownerName = param1.ownerName;
         _canOwnerBeKicked = param1.canOwnerBeKicked;
         var_1678 = param1.level;
         var_2063 = param1.levelMax;
         var_2043 = param1.experience;
         var_2064 = param1.experienceMax;
         _energy = param1.energy;
         var_2061 = param1.energyMax;
         _nutrition = param1.nutrition;
         var_2062 = param1.nutritionMax;
         _petRespect = param1.petRespect;
         var_2081 = param1.roomIndex;
         var_2048 = param1.age;
      }
      
      public function get roomIndex() : int
      {
         return var_2081;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get energyMax() : int
      {
         return var_2061;
      }
      
      public function get levelMax() : int
      {
         return var_2063;
      }
      
      public function get petRespect() : int
      {
         return _petRespect;
      }
      
      public function get race() : int
      {
         return var_1633;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return _canOwnerBeKicked;
      }
      
      public function get experience() : int
      {
         return var_2043;
      }
      
      public function get age() : int
      {
         return var_2048;
      }
   }
}
