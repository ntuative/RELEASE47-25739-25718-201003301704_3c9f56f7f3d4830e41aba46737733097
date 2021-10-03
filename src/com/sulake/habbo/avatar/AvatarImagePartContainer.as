package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_1755:int;
      
      private var var_1758:String;
      
      private var var_1489:IActionDefinition;
      
      private var var_1756:Boolean;
      
      private var _color:IPartColor;
      
      private var var_1754:String;
      
      private var var_1760:String;
      
      private var var_1759:Boolean;
      
      private var var_1761:ColorTransform;
      
      private var var_1757:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_1758 = param1;
         var_1754 = param2;
         var_1755 = param3;
         _color = param4;
         _frames = param5;
         var_1489 = param6;
         var_1759 = param7;
         var_1757 = param8;
         var_1760 = param9;
         var_1756 = param10;
         var_1761 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1759;
      }
      
      public function get partType() : String
      {
         return var_1754;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_1757;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_1756;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_1755;
      }
      
      public function get flippedPartType() : String
      {
         return var_1760;
      }
      
      public function get bodyPartId() : String
      {
         return var_1758;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1489;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_1761;
      }
   }
}
