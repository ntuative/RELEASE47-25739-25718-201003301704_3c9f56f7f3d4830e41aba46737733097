package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPresentDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_433:String = "RWPDUE_CONTENTS_CLUB";
      
      public static const const_408:String = "RWPDUE_CONTENTS_LANDSCAPE";
      
      public static const const_77:String = "RWPDUE_CONTENTS";
      
      public static const const_468:String = "RWPDUE_CONTENTS_WALLPAPER";
      
      public static const const_436:String = "RWPDUE_CONTENTS_FLOOR";
      
      public static const const_60:String = "RWPDUE_PACKAGEINFO";
       
      
      private var var_183:String;
      
      private var var_1661:BitmapData;
      
      private var var_146:int = -1;
      
      private var var_13:Boolean;
      
      public function RoomWidgetPresentDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_146 = param2;
         var_183 = param3;
         var_13 = param4;
         var_1661 = param5;
      }
      
      public function get iconBitmapData() : BitmapData
      {
         return var_1661;
      }
      
      public function get text() : String
      {
         return var_183;
      }
      
      public function get objectId() : int
      {
         return var_146;
      }
      
      public function get controller() : Boolean
      {
         return var_13;
      }
   }
}
