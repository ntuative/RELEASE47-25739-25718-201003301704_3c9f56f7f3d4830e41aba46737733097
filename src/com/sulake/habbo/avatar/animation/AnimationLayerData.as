package com.sulake.habbo.avatar.animation
{
   import com.sulake.habbo.avatar.AvatarStructure;
   import com.sulake.habbo.avatar.actions.ActiveActionData;
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   import flash.utils.Dictionary;
   
   public class AnimationLayerData implements IAnimationLayerData
   {
      
      public static const const_638:String = "bodypart";
      
      public static const const_360:String = "fx";
       
      
      private var _items:Dictionary;
      
      private var _id:String;
      
      private var _dx:int;
      
      private var var_1489:IActiveActionData;
      
      private var _type:String;
      
      private var var_1914:int;
      
      private var var_468:int;
      
      private var var_1020:String;
      
      private var var_1254:int;
      
      private var var_1215:int;
      
      private var var_1214:int;
      
      public function AnimationLayerData(param1:AvatarStructure, param2:XML, param3:String, param4:int, param5:IActionDefinition)
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         _items = new Dictionary();
         super();
         var_468 = param4;
         _id = String(param2.@id);
         var_1914 = parseInt(param2.@frame);
         _dx = parseInt(param2.@dx);
         var_1214 = parseInt(param2.@dy);
         var_1215 = parseInt(param2.@dz);
         var_1254 = parseInt(param2.@dd);
         _type = param3;
         var_1020 = String(param2.@base);
         for each(_loc6_ in param2.item)
         {
            _items[String(_loc6_.@id)] = String(_loc6_.@base);
         }
         _loc7_ = "";
         if(var_1020 != "")
         {
            _loc7_ = String(baseAsInt());
         }
         if(param5 != null)
         {
            var_1489 = new ActiveActionData(param5.state,_loc7_);
            var_1489.definition = param5;
         }
      }
      
      public function get items() : Dictionary
      {
         return _items;
      }
      
      public function baseAsInt() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < var_1020.length)
         {
            _loc1_ += var_1020.charCodeAt(_loc2_);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get frameCounter() : int
      {
         return var_468;
      }
      
      public function get base() : String
      {
         return var_1020;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get dx() : int
      {
         return _dx;
      }
      
      public function get dz() : int
      {
         return var_1215;
      }
      
      public function get animationFrame() : int
      {
         return var_1914;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get dy() : int
      {
         return var_1214;
      }
      
      public function get action() : IActiveActionData
      {
         return var_1489;
      }
      
      public function get directionOffset() : int
      {
         return var_1254;
      }
   }
}
