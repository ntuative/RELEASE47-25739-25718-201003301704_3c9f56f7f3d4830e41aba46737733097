package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_114;
         param1["bound_to_parent_rect"] = const_89;
         param1["child_window"] = const_948;
         param1["embedded_controller"] = const_296;
         param1["resize_to_accommodate_children"] = const_61;
         param1["input_event_processor"] = const_49;
         param1["internal_event_handling"] = const_498;
         param1["mouse_dragging_target"] = const_229;
         param1["mouse_dragging_trigger"] = const_330;
         param1["mouse_scaling_target"] = const_232;
         param1["mouse_scaling_trigger"] = const_457;
         param1["horizontal_mouse_scaling_trigger"] = const_212;
         param1["vertical_mouse_scaling_trigger"] = const_204;
         param1["observe_parent_input_events"] = const_799;
         param1["optimize_region_to_layout_size"] = const_389;
         param1["parent_window"] = const_981;
         param1["relative_horizontal_scale_center"] = const_168;
         param1["relative_horizontal_scale_fixed"] = const_127;
         param1["relative_horizontal_scale_move"] = const_285;
         param1["relative_horizontal_scale_strech"] = const_239;
         param1["relative_scale_center"] = const_909;
         param1["relative_scale_fixed"] = const_711;
         param1["relative_scale_move"] = const_798;
         param1["relative_scale_strech"] = const_893;
         param1["relative_vertical_scale_center"] = const_178;
         param1["relative_vertical_scale_fixed"] = const_113;
         param1["relative_vertical_scale_move"] = const_308;
         param1["relative_vertical_scale_strech"] = const_246;
         param1["on_resize_align_left"] = const_512;
         param1["on_resize_align_right"] = const_435;
         param1["on_resize_align_center"] = const_434;
         param1["on_resize_align_top"] = const_554;
         param1["on_resize_align_bottom"] = const_374;
         param1["on_resize_align_middle"] = const_371;
         param1["on_accommodate_align_left"] = const_854;
         param1["on_accommodate_align_right"] = const_363;
         param1["on_accommodate_align_center"] = const_713;
         param1["on_accommodate_align_top"] = const_878;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_580;
         param1["route_input_events_to_parent"] = const_382;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_987;
         param1["scalable_with_mouse"] = const_929;
         param1["reflect_horizontal_resize_to_parent"] = const_439;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_273;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
