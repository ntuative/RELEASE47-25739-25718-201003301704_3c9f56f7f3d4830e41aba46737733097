package deng.fzip
{
   import deng.utils.ChecksumUtil;
   import flash.utils.*;
   
   public class FZipFile
   {
      
      public static const const_627:int = 8;
      
      public static const const_1568:int = 10;
      
      public static const const_1333:int = 6;
      
      private static var var_982:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").hasComplexContent();
      
      public static const const_1193:int = 0;
      
      public static const const_1476:int = 1;
      
      public static const const_1513:int = 2;
      
      public static const const_1478:int = 3;
      
      public static const const_1565:int = 4;
      
      public static const const_1495:int = 5;
      
      public static const const_1581:int = 9;
      
      public static const const_1490:int = 7;
       
      
      private var var_165:uint = 0;
      
      private var var_983:uint = 0;
      
      private var var_666:Date;
      
      private var var_1820:int = -1;
      
      private var parseFunc:Function;
      
      private var var_473:Boolean = false;
      
      private var var_2300:int = -1;
      
      private var var_1173:uint = 0;
      
      private var var_1822:String = "";
      
      private var _extraFields:Dictionary;
      
      private var var_812:uint;
      
      private var var_21:ByteArray;
      
      private var var_667:uint;
      
      private var var_1450:Boolean = false;
      
      private var var_2299:int = -1;
      
      private var var_1449:String = "2.0";
      
      private var var_166:Boolean = false;
      
      private var var_1821:Boolean = false;
      
      private var var_339:String;
      
      private var var_557:uint = 0;
      
      private var var_1174:int = 0;
      
      private var var_389:String = "";
      
      private var var_665:int = 8;
      
      private var var_1448:Boolean = false;
      
      public function FZipFile(param1:String = "utf-8")
      {
         parseFunc = parseFileHead;
         super();
         var_339 = param1;
         _extraFields = new Dictionary();
         var_21 = new ByteArray();
         var_21.endian = Endian.BIG_ENDIAN;
      }
      
      public function get sizeUncompressed() : uint
      {
         return var_557;
      }
      
      public function set filename(param1:String) : void
      {
         var_389 = param1;
      }
      
      protected function uncompress() : void
      {
         if(var_166 && false)
         {
            var_21.position = 0;
            if(var_982)
            {
               var_21.uncompress.apply(var_21,["deflate"]);
            }
            else
            {
               var_21.uncompress();
            }
            var_21.position = 0;
            var_166 = false;
         }
      }
      
      public function get filename() : String
      {
         return var_389;
      }
      
      public function get date() : Date
      {
         return var_666;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && parseFunc(param1))
         {
         }
         return parseFunc === parseFileIdle;
      }
      
      private function parseFileContent(param1:IDataInput) : Boolean
      {
         if(var_1448)
         {
            parseFunc = parseFileIdle;
            throw new Error("Data descriptors are not supported.");
         }
         if(var_165 == 0)
         {
            parseFunc = parseFileIdle;
         }
         else
         {
            if(param1.bytesAvailable < var_165)
            {
               return false;
            }
            parseContent(param1);
            parseFunc = parseFileIdle;
         }
         return true;
      }
      
      public function get versionNumber() : String
      {
         return var_1449;
      }
      
      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(var_166)
         {
            uncompress();
         }
         var_21.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = var_21.readUTFBytes(var_21.bytesAvailable);
         }
         else
         {
            _loc3_ = var_21.readMultiByte(var_21.bytesAvailable,param2);
         }
         var_21.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      private function parseFileIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(var_665 === const_627 && !var_1450)
         {
            if(var_982)
            {
               param1.readBytes(var_21,0,var_165);
            }
            else
            {
               if(!var_473)
               {
                  throw new Error("Adler32 checksum not found.");
               }
               var_21.writeByte(120);
               _loc2_ = uint(~var_1820 << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               var_21.writeByte(_loc2_);
               param1.readBytes(var_21,2,var_165);
               var_21.position = var_21.length;
               var_21.writeUnsignedInt(var_812);
            }
            var_166 = true;
         }
         else
         {
            if(var_665 != const_1193)
            {
               throw new Error("Compression method " + var_665 + " is not supported.");
            }
            param1.readBytes(var_21,0,var_165);
            var_166 = false;
         }
         var_21.position = 0;
      }
      
      private function parseFileHead(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if(var_983 + var_1173 > 0)
            {
               parseFunc = parseFileHeadExt;
            }
            else
            {
               parseFunc = parseFileContent;
            }
            return true;
         }
         return false;
      }
      
      public function setContentAsString(param1:String, param2:String = "utf-8") : void
      {
         var_21.length = 0;
         var_21.position = 0;
         var_166 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               var_21.writeUTFBytes(param1);
            }
            else
            {
               var_21.writeMultiByte(param1,param2);
            }
            var_667 = ChecksumUtil.CRC32(var_21);
            var_473 = false;
         }
         compress();
      }
      
      public function set date(param1:Date) : void
      {
         var_666 = param1 != null ? param1 : new Date();
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_1174 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_1174 << 8 | 20);
         param1.writeShort(var_339 == "utf-8" ? 2048 : 0);
         param1.writeShort(const_627);
         var _loc5_:Date = var_666 != null ? var_666 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(var_667);
         param1.writeUnsignedInt(var_165);
         param1.writeUnsignedInt(var_557);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = Endian.LITTLE_ENDIAN;
         if(var_339 == "utf-8")
         {
            _loc8_.writeUTFBytes(var_389);
         }
         else
         {
            _loc8_.writeMultiByte(var_389,var_339);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in _extraFields)
         {
            _loc15_ = _extraFields[_loc10_] as ByteArray;
            if(_loc15_ != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!var_473)
            {
               _loc16_ = var_166;
               if(_loc16_)
               {
                  uncompress();
               }
               var_812 = ChecksumUtil.Adler32(var_21,0,var_21.length);
               var_473 = true;
               if(_loc16_)
               {
                  compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(var_812);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && false)
         {
            if(var_339 == "utf-8")
            {
               _loc8_.writeUTFBytes(var_1822);
            }
            else
            {
               _loc8_.writeMultiByte(var_1822,var_339);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:int = 0;
         if(!param3 && var_165 > 0)
         {
            if(var_982)
            {
               _loc13_ = 0;
               param1.writeBytes(var_21,0,_loc13_);
            }
            else
            {
               _loc13_ = 4294967290;
               param1.writeBytes(var_21,2,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      public function get sizeCompressed() : uint
      {
         return var_165;
      }
      
      protected function compress() : void
      {
         if(!var_166)
         {
            if(false)
            {
               var_21.position = 0;
               var_557 = var_21.length;
               if(var_982)
               {
                  var_21.compress.apply(var_21,["deflate"]);
                  var_165 = var_21.length;
               }
               else
               {
                  var_21.compress();
                  var_165 = -6;
               }
               var_21.position = 0;
               var_166 = true;
            }
            else
            {
               var_165 = 0;
               var_557 = 0;
            }
         }
      }
      
      private function parseFileHeadExt(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= var_983 + var_1173)
         {
            parseHeadExt(param1);
            parseFunc = parseFileContent;
            return true;
         }
         return false;
      }
      
      protected function parseHeadExt(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(var_339 == "utf-8")
         {
            var_389 = param1.readUTFBytes(var_983);
         }
         else
         {
            var_389 = param1.readMultiByte(var_983,var_339);
         }
         var _loc2_:uint = var_1173;
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            _loc4_ = uint(param1.readUnsignedShort());
            if(_loc4_ > _loc2_)
            {
               throw new Error("Parse error in file " + var_389 + ": Extra field data size too big.");
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               var_812 = param1.readUnsignedInt();
               var_473 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _extraFields[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      protected function parseHead(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         var_1174 = _loc2_ >> 8;
         var_1449 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         var_665 = param1.readUnsignedShort();
         var_1450 = (_loc3_ & 1) !== 0;
         var_1448 = (_loc3_ & 8) !== 0;
         var_1821 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            var_339 = "utf-8";
         }
         if(var_665 === const_1333)
         {
            var_2299 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            var_2300 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(var_665 === const_627)
         {
            var_1820 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         var_666 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         var_667 = param1.readUnsignedInt();
         var_165 = param1.readUnsignedInt();
         var_557 = param1.readUnsignedInt();
         var_983 = param1.readUnsignedShort();
         var_1173 = param1.readUnsignedShort();
      }
      
      public function set content(param1:ByteArray) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(var_21,0,param1.length);
            var_667 = ChecksumUtil.CRC32(var_21);
            var_473 = false;
         }
         else
         {
            var_21.length = 0;
            var_21.position = 0;
            var_166 = false;
         }
         compress();
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + var_389 + "\n  date:" + var_666 + "\n  sizeCompressed:" + var_165 + "\n  sizeUncompressed:" + var_557 + "\n  versionHost:" + var_1174 + "\n  versionNumber:" + var_1449 + "\n  compressionMethod:" + var_665 + "\n  encrypted:" + var_1450 + "\n  hasDataDescriptor:" + var_1448 + "\n  hasCompressedPatchedData:" + var_1821 + "\n  filenameEncoding:" + var_339 + "\n  crc32:" + var_667.toString(16) + "\n  adler32:" + var_812.toString(16);
      }
      
      public function get content() : ByteArray
      {
         if(var_166)
         {
            uncompress();
         }
         return var_21;
      }
   }
}
