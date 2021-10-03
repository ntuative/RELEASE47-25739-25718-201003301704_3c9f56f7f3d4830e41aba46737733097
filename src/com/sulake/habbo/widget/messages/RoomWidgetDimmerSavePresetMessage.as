package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_520:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1659:int;
      
      private var var_1660:int;
      
      private var var_1658:Boolean;
      
      private var var_968:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_520);
         var_1660 = param1;
         var_1659 = param2;
         _color = param3;
         var_968 = param4;
         var_1658 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1659;
      }
      
      public function get presetNumber() : int
      {
         return var_1660;
      }
      
      public function get brightness() : int
      {
         return var_968;
      }
      
      public function get apply() : Boolean
      {
         return var_1658;
      }
   }
}
