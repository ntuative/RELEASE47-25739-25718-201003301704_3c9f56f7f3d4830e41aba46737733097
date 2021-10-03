package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_146:int = 1;
      
      public static const const_1369:int = 3;
      
      public static const const_437:int = 2;
       
      
      private var var_2203:int;
      
      private var var_2149:int;
      
      private var var_2204:int;
      
      private var var_1702:int;
      
      private var var_35:int;
      
      private var var_378:int;
      
      private var var_1283:int;
      
      private var var_1874:int;
      
      private var var_1014:int;
      
      private var _roomResources:String;
      
      private var var_2200:int;
      
      private var var_2208:int;
      
      private var var_2206:String;
      
      private var var_1895:String;
      
      private var var_2205:int = 0;
      
      private var var_1208:String;
      
      private var _message:String;
      
      private var var_1974:int;
      
      private var var_2202:String;
      
      private var var_1170:int;
      
      private var var_740:String;
      
      private var var_2207:String;
      
      private var var_1470:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1014 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_2205 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_2208;
      }
      
      public function set roomName(param1:String) : void
      {
         var_740 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_2200 = param1;
      }
      
      public function get state() : int
      {
         return var_35;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_740;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1702 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_35 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_2149;
      }
      
      public function get priority() : int
      {
         return var_2203 + var_2205;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1874 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1895;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1470) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1170;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_2208 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1283;
      }
      
      public function set flatType(param1:String) : void
      {
         var_2206 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_2200;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1702;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_2207 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1208 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1874;
      }
      
      public function set priority(param1:int) : void
      {
         var_2203 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_2149 = param1;
      }
      
      public function get flatType() : String
      {
         return var_2206;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_2204 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1895 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1974 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1208;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1283 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_2204;
      }
      
      public function set flatId(param1:int) : void
      {
         var_378 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1170 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1470 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1974;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_2202 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1470;
      }
      
      public function get reportedUserId() : int
      {
         return var_1014;
      }
      
      public function get flatId() : int
      {
         return var_378;
      }
      
      public function get flatOwnerName() : String
      {
         return var_2207;
      }
      
      public function get reporterUserName() : String
      {
         return var_2202;
      }
   }
}
