package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_579;
         param1["bitmap"] = const_724;
         param1["border"] = const_574;
         param1["border_notify"] = const_1372;
         param1["button"] = const_412;
         param1["button_thick"] = const_500;
         param1["button_icon"] = const_1250;
         param1["button_group_left"] = const_650;
         param1["button_group_center"] = const_733;
         param1["button_group_right"] = const_529;
         param1["canvas"] = const_543;
         param1["checkbox"] = const_656;
         param1["closebutton"] = const_926;
         param1["container"] = const_312;
         param1["container_button"] = const_631;
         param1["display_object_wrapper"] = const_633;
         param1["dropmenu"] = const_446;
         param1["dropmenu_item"] = const_428;
         param1["frame"] = const_327;
         param1["frame_notify"] = const_1139;
         param1["header"] = const_566;
         param1["icon"] = const_794;
         param1["itemgrid"] = const_927;
         param1["itemgrid_horizontal"] = const_478;
         param1["itemgrid_vertical"] = const_626;
         param1["itemlist"] = const_1006;
         param1["itemlist_horizontal"] = const_321;
         param1["itemlist_vertical"] = const_309;
         param1["maximizebox"] = const_1287;
         param1["menu"] = const_1174;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_815;
         param1["minimizebox"] = const_1244;
         param1["notify"] = const_1284;
         param1["null"] = const_718;
         param1["password"] = const_553;
         param1["radiobutton"] = const_502;
         param1["region"] = const_430;
         param1["restorebox"] = const_1356;
         param1["scaler"] = const_791;
         param1["scaler_horizontal"] = const_1188;
         param1["scaler_vertical"] = const_1246;
         param1["scrollbar_horizontal"] = const_441;
         param1["scrollbar_vertical"] = const_587;
         param1["scrollbar_slider_button_up"] = const_824;
         param1["scrollbar_slider_button_down"] = const_806;
         param1["scrollbar_slider_button_left"] = const_864;
         param1["scrollbar_slider_button_right"] = const_970;
         param1["scrollbar_slider_bar_horizontal"] = const_801;
         param1["scrollbar_slider_bar_vertical"] = const_933;
         param1["scrollbar_slider_track_horizontal"] = const_883;
         param1["scrollbar_slider_track_vertical"] = const_952;
         param1["scrollable_itemlist"] = const_1312;
         param1["scrollable_itemlist_vertical"] = const_452;
         param1["scrollable_itemlist_horizontal"] = const_967;
         param1["selector"] = const_691;
         param1["selector_list"] = const_699;
         param1["submenu"] = const_815;
         param1["tab_button"] = const_570;
         param1["tab_container_button"] = const_903;
         param1["tab_context"] = const_425;
         param1["tab_content"] = const_935;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_728;
         param1["input"] = const_623;
         param1["toolbar"] = const_1381;
         param1["tooltip"] = const_333;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
