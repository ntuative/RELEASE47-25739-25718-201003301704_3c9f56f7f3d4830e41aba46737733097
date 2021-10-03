package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1283:String = "WN_CREATED";
      
      public static const const_985:String = "WN_DISABLE";
      
      public static const const_979:String = "WN_DEACTIVATED";
      
      public static const const_830:String = "WN_OPENED";
      
      public static const const_1008:String = "WN_CLOSED";
      
      public static const const_871:String = "WN_DESTROY";
      
      public static const const_1539:String = "WN_ARRANGED";
      
      public static const const_366:String = "WN_PARENT_RESIZED";
      
      public static const const_880:String = "WN_ENABLE";
      
      public static const const_876:String = "WN_RELOCATE";
      
      public static const const_957:String = "WN_FOCUS";
      
      public static const const_814:String = "WN_PARENT_RELOCATED";
      
      public static const const_447:String = "WN_PARAM_UPDATED";
      
      public static const const_565:String = "WN_PARENT_ACTIVATED";
      
      public static const const_208:String = "WN_RESIZED";
      
      public static const const_953:String = "WN_CLOSE";
      
      public static const const_833:String = "WN_PARENT_REMOVED";
      
      public static const const_248:String = "WN_CHILD_RELOCATED";
      
      public static const const_683:String = "WN_ENABLED";
      
      public static const const_250:String = "WN_CHILD_RESIZED";
      
      public static const const_962:String = "WN_MINIMIZED";
      
      public static const const_604:String = "WN_DISABLED";
      
      public static const const_205:String = "WN_CHILD_ACTIVATED";
      
      public static const const_409:String = "WN_STATE_UPDATED";
      
      public static const const_572:String = "WN_UNSELECTED";
      
      public static const const_413:String = "WN_STYLE_UPDATED";
      
      public static const const_1494:String = "WN_UPDATE";
      
      public static const const_367:String = "WN_PARENT_ADDED";
      
      public static const const_501:String = "WN_RESIZE";
      
      public static const const_653:String = "WN_CHILD_REMOVED";
      
      public static const const_1572:String = "";
      
      public static const const_925:String = "WN_RESTORED";
      
      public static const const_331:String = "WN_SELECTED";
      
      public static const const_888:String = "WN_MINIMIZE";
      
      public static const const_940:String = "WN_FOCUSED";
      
      public static const const_1302:String = "WN_LOCK";
      
      public static const const_307:String = "WN_CHILD_ADDED";
      
      public static const const_936:String = "WN_UNFOCUSED";
      
      public static const const_462:String = "WN_RELOCATED";
      
      public static const const_984:String = "WN_DEACTIVATE";
      
      public static const const_1340:String = "WN_CRETAE";
      
      public static const const_1003:String = "WN_RESTORE";
      
      public static const const_286:String = "WN_ACTVATED";
      
      public static const const_1367:String = "WN_LOCKED";
      
      public static const const_372:String = "WN_SELECT";
      
      public static const const_892:String = "WN_MAXIMIZE";
      
      public static const const_897:String = "WN_OPEN";
      
      public static const const_548:String = "WN_UNSELECT";
      
      public static const const_1474:String = "WN_ARRANGE";
      
      public static const const_1305:String = "WN_UNLOCKED";
      
      public static const const_1596:String = "WN_UPDATED";
      
      public static const const_938:String = "WN_ACTIVATE";
      
      public static const const_1325:String = "WN_UNLOCK";
      
      public static const const_956:String = "WN_MAXIMIZED";
      
      public static const const_843:String = "WN_DESTROYED";
      
      public static const const_881:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1598,cancelable);
      }
   }
}
