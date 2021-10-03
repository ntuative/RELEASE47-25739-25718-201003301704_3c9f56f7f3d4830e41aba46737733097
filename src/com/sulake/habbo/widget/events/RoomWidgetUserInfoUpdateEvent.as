package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_200:String = "RWUIUE_PEER";
      
      public static const const_210:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1171:String = "BOT";
      
      public static const const_912:int = 2;
      
      public static const const_1352:int = 0;
      
      public static const const_995:int = 3;
       
      
      private var var_1212:String = "";
      
      private var var_1786:Boolean = false;
      
      private var var_1784:int = 0;
      
      private var var_1780:int = 0;
      
      private var var_1783:Boolean = false;
      
      private var var_1213:String = "";
      
      private var var_1785:Boolean = false;
      
      private var var_779:int = 0;
      
      private var var_1777:Boolean = true;
      
      private var var_1003:int = 0;
      
      private var var_1781:Boolean = false;
      
      private var var_1242:Boolean = false;
      
      private var var_1790:Boolean = false;
      
      private var var_1787:int = 0;
      
      private var var_1788:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_284:Array;
      
      private var var_1241:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1782:int = 0;
      
      private var var_1779:Boolean = false;
      
      private var var_1778:int = 0;
      
      private var var_1789:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_284 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1780;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1780 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_1786;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_1777;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_1777 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_1785 = param1;
      }
      
      public function get motto() : String
      {
         return var_1212;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_1781 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1242;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1212 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_1779;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1789;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1242 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_1788;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1787 = param1;
      }
      
      public function get badges() : Array
      {
         return var_284;
      }
      
      public function get amIController() : Boolean
      {
         return var_1783;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_1783 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_1779 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_1778 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1789 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1213 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_1785;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_1781;
      }
      
      public function get carryItem() : int
      {
         return var_1787;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1241;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1241 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_779 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_1778;
      }
      
      public function get realName() : String
      {
         return var_1213;
      }
      
      public function set webID(param1:int) : void
      {
         var_1782 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_284 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_1790 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_1788 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_779;
      }
      
      public function get webID() : int
      {
         return var_1782;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1003 = param1;
      }
      
      public function get xp() : int
      {
         return var_1784;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_1786 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1003;
      }
      
      public function get canTrade() : Boolean
      {
         return var_1790;
      }
      
      public function set xp(param1:int) : void
      {
         var_1784 = param1;
      }
   }
}
