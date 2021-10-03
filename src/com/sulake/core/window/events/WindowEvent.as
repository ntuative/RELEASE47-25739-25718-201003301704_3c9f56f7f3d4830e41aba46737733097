package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_314:String = "WE_CHILD_RESIZED";
      
      public static const const_1152:String = "WE_CLOSE";
      
      public static const const_1301:String = "WE_DESTROY";
      
      public static const const_149:String = "WE_CHANGE";
      
      public static const const_1318:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1588:String = "WE_PARENT_RESIZE";
      
      public static const const_97:String = "WE_UPDATE";
      
      public static const const_1328:String = "WE_MAXIMIZE";
      
      public static const const_373:String = "WE_DESTROYED";
      
      public static const const_837:String = "WE_UNSELECT";
      
      public static const const_1363:String = "WE_MAXIMIZED";
      
      public static const const_1579:String = "WE_UNLOCKED";
      
      public static const const_393:String = "WE_CHILD_REMOVED";
      
      public static const const_170:String = "WE_OK";
      
      public static const const_44:String = "WE_RESIZED";
      
      public static const const_1258:String = "WE_ACTIVATE";
      
      public static const const_233:String = "WE_ENABLED";
      
      public static const const_427:String = "WE_CHILD_RELOCATED";
      
      public static const const_1319:String = "WE_CREATE";
      
      public static const const_735:String = "WE_SELECT";
      
      public static const const_161:String = "";
      
      public static const const_1437:String = "WE_LOCKED";
      
      public static const const_1593:String = "WE_PARENT_RELOCATE";
      
      public static const const_1527:String = "WE_CHILD_REMOVE";
      
      public static const const_1520:String = "WE_CHILD_RELOCATE";
      
      public static const const_1538:String = "WE_LOCK";
      
      public static const const_213:String = "WE_FOCUSED";
      
      public static const const_622:String = "WE_UNSELECTED";
      
      public static const const_989:String = "WE_DEACTIVATED";
      
      public static const const_1292:String = "WE_MINIMIZED";
      
      public static const const_1580:String = "WE_ARRANGED";
      
      public static const const_1493:String = "WE_UNLOCK";
      
      public static const const_1533:String = "WE_ATTACH";
      
      public static const const_1142:String = "WE_OPEN";
      
      public static const const_1153:String = "WE_RESTORE";
      
      public static const const_1438:String = "WE_PARENT_RELOCATED";
      
      public static const const_1238:String = "WE_RELOCATE";
      
      public static const const_1549:String = "WE_CHILD_RESIZE";
      
      public static const const_1578:String = "WE_ARRANGE";
      
      public static const const_1245:String = "WE_OPENED";
      
      public static const const_1260:String = "WE_CLOSED";
      
      public static const const_1587:String = "WE_DETACHED";
      
      public static const const_1502:String = "WE_UPDATED";
      
      public static const const_1304:String = "WE_UNFOCUSED";
      
      public static const const_396:String = "WE_RELOCATED";
      
      public static const const_1231:String = "WE_DEACTIVATE";
      
      public static const const_199:String = "WE_DISABLED";
      
      public static const const_571:String = "WE_CANCEL";
      
      public static const const_569:String = "WE_ENABLE";
      
      public static const const_1247:String = "WE_ACTIVATED";
      
      public static const const_1294:String = "WE_FOCUS";
      
      public static const const_1582:String = "WE_DETACH";
      
      public static const const_1138:String = "WE_RESTORED";
      
      public static const const_1306:String = "WE_UNFOCUS";
      
      public static const const_52:String = "WE_SELECTED";
      
      public static const const_1275:String = "WE_PARENT_RESIZED";
      
      public static const const_1309:String = "WE_CREATED";
      
      public static const const_1542:String = "WE_ATTACHED";
      
      public static const const_1185:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1598:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1380:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1598 = param3;
         var_1380 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1380;
      }
      
      public function get related() : IWindow
      {
         return var_1598;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1380 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
