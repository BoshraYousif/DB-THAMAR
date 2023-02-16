import 'package:sqflite/sqflite.dart' ;
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'models.dart';
import 'dart:io';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
final Future <Database> database= openDatabase(join(await getDatabasesPath(),'Thamaryourhand.db'),version: 1
,onCreate:CreateDatabase);

}
CreateDatabase(Database db, int version) async{


  await db.execute("create table $MAPgoogl($MAP_ID INT PRAMARY KEY AUTOINCREMENT"
      ",$MAP_ADRESS TEXT ,$XAXIS DOUBLE,$YAXIS DOUBLE,$ZOOM INT,$SITE_DESCRIPTION VARCHAR ,$COUNTERY_ID INT FOREIGN KEY");


  await db.execute("create table $PROVIINCIAL($COUNTRY_ID INT PRAMARY KEY AUTOINCREMENT"
      ",$COUN_NAME TEXT ,$XAXIS DOUBLE,$YAXIS DOUBLE,$Image TEXT,$COUNTRY_ADDRES TEXT ,$MAP_ID INT FOREIGN KEY");

  await db.execute("create table $Notifications($Notification_ID INTEGER PRAMARY KEY AUTOINCREMENT"
      ",$Notification_ADRESS TEXT ,$Start_Notification DateTime "+
      "$End_Notification DateTime ,$ZOOM INT,$period_Notification int ");

  await db.execute("create table $Accessibility($Accessibility_ID INTEGER PRAMARY KEY AUTOINCREMENT,$verification Text "+
      "$ServiceOwner_phone int foreign key ");

  await db.execute("create table $ConSerProvi($COUNTRY_ID INTEGER PRAMARY KEY AUTOINCREMENT,$Services_owner_ID INTEGER PRAMARY KEY AUTOINCREMENT "+
      "$Services_ID INTEGER PRAMARY KEY AUTOINCREMENT");

  await db.execute("create table $ServicesType($ServicesType_ID INTEGER PRAMARY KEY AUTOINCREMENT,$ServicesType_Name varchar(60) ");

  await db.execute("create table $Services($Services_ID INTEGER PRAMARY KEY AUTOINCREMENT,$Services_Name varchar(60)"+
      "$Services_Featurees varchar(300),$TimeOfWork varchar(60) ,$Image Text ,$video MP4 ,$XAXIS DOUBLE,$YAXIS DOUBLE"
          "$ServicesType_ID int foreign key");


  await db.execute("create table $OwnerServices($Services_owner_ID INTEGER PRAMARY KEY AUTOINCREMENT,$Services_owner_Name varchar(60)"
      "$Services_owner_phone varchar(9),$Services_owner_Mail varchar(9),$Accessibility_ID INTEGER FOREIGN KEY");


  await db.execute("create table $NotificationsType($Notifications_Type_ID INTEGER PRAMARY KEY AUTOINCREMENT,$Notifications_Image TEXT"
      "$Notifications_Video Mp4,$Notifications_Text varchar(9)");


  await db.execute("create table $LinkNotifServOwner($Notifications_ID INTEGER PRAMARY KEY AUTOINCREMENT,$Notifications_Type_ID INTEGER PRAMARY KEY AUTOINCREMENT"
      "$Services_owner_ID INTEGER PRAMARY KEY AUTOINCREMENT");


  await db.execute("create table $Admin($Admin_ID INTEGER PRAMARY KEY AUTOINCREMENT,$Admin_Name varchar(60),$Admin_Phone varchar(60)"
      "$Admin_Mail VARCHAR(60),$Accessibility INTEGER PRAMARY KEY AUTOINCREMENT");

}
//Select data
Future<List<Map<String,dynamic>>>GetDatabasetomap() async {
  Database db=await this.database;
  var resmab =await db.query($MAPgoogl, orderBy:$MAP_ID);
  var resPROV =await db.query($PROVIINCIAL, orderBy:$COUNTRY_ID);
  var resNotif =await db.query($Notifications, orderBy:$Notification_ID);
  var resAcces =await db.query($Accessibility, orderBy:Accessibility_ID);
  var resConSe =await db.query($ConSerProvi, orderBy:$COUNTRY_ID);
  var resServi =await db.query($ServicesType, orderBy:$ServicesType_ID);
  var reservi =await db.query($Services, orderBy:Services_ID);
  var resOwnerS =await db.query($OwnerServices, orderBy:$Services_owner_ID);
  var resNotifty =await db.query($NotificationsType, orderBy:$Notifications_Type_ID);
  var resLinkN =await db.query($LinkNotifServOwner, orderBy:Notifications_ID);
  var resAdmin =await db.query($Admin, orderBy:$Admin_ID);

}

//insert  data
Future<int> insertMap(MapG map) async
{  Database db=await this.database;
   var inseMap =await db.insert($MAPgoogl,map.toMap());
  return inseMap;
}
Future<int> insertProv(PROVIINCIALC prov) async
{  Database db= this.database;
var inseprov=await db.insert($PROVIINCIAL,prov.toMapProvi());
return inseprov;
}

Future<int> insertNotif(NotificationsClas notif) async
{  Database db=await this.database;
var inseNotif=await db.insert($Notifications,notif.toMapNotific());
return inseNotif;
}

Future<int> insertAcces(AccessibilityClass Acces) async
{  Database db=await this.database;
var inseAcces=await db.insert($Accessibility,Acces.toMapAccess());
return inseAcces;
}

Future<int> insertConSerProvi(ConnSerProvi CSP) async
{  Database db=await this.database;
var inseConSerProvi=await db.insert($ConSerProvi,CSP.toMapconnec());
return inseConSerProvi;
}


Future<int> insertServTy(ServicesTYPE SerType) async
{  Database db=await this.database;
var inseSerType=await db.insert($ServicesType,SerType.toMapSert());
return inseSerType;
}


Future<int> insertServ(Services Ser) async
{  Database db=await this.database;
var inseSer=await db.insert($Services,Ser.toMapSer());
return inseSer;
}

Future<int> insertOwnServ(OwnerServicesclass OS) async
{  Database db=await this.database;
var inseOS=await db.insert($OwnerServices,OS.toMapOwner());
return inseOS;
}

Future<int> insertNotifTyp(NotificationsClas notif) async
{  Database db=await this.database;
var insenotf=await db.insert($NotificationsType,notif.toMapNotific());
return insenotf;
}
Future<int> insertLInKNoOw(LinkNotifServOwnerC LInKNoOw) async
{  Database db=await this.database;
var inseLInKNoOwT=await db.insert($LinkNotifServOwner,LInKNoOw.toMapLink());
return inseLInKNoOwT;
}

Future<int> insertAdmin(AdminC Admin) async
{  Database db=await this.database;
var inseAdmin=await db.insert($Admin,Admin.toMapAdm());
return inseAdmin;
}
 //update data
Future<int> UpdatMap(MapG map) async
{
  Database db = await this.database;
  var inseMap = await db.update($MAPgoogl, map.toMap(), where: "$MAP_ID = ?", whereArgs: [map.MAP_ID]);
  return inseMap;
}

Future<int> UPtProv(PROVIINCIALC prov) async
{  Database db= this.database;
var UPprov=await db.update($PROVIINCIAL,prov.toMapProvi(),where: "$COUNTRY_ID =?" ,whereArgs: [prov.COUNTRY_ID]);
return UPprov;
}

Future<int> UPtNotif(NotificationsClas notif) async
{  Database db=await this.database;
var UPNotif=await db.update($Notifications,notif.toMapNotific(),where: "$Notification_ID=?",whereArgs: [notif.Notification_ID]);
return UPNotif;
}

Future<int> UPAcces(AccessibilityClass Acces) async
{  Database db=await this.database;
var UPAcces=await db.update($Accessibility,Acces.toMapAccess(),where:"$Accessibility_ID=?" ,whereArgs: [Acces.Accessibility_ID]);
return UPAcces;
}

Future<int> upConSerProvi(ConnSerProvi CSP) async
{  Database db=await this.database;
var UPConSerProvi=await db.update($ConSerProvi,CSP.toMapconnec(),where: COUNTRY_ID,whereArgs: [CSP.COUNTRY_ID]);
return UPConSerProvi;
}


Future<int> UPServTy(ServicesTYPE SerType) async
{  Database db=await this.database;
var UPSerType=await db.update($ServicesType,SerType.toMapSert(),where:"$ServicesType_ID=?" ,whereArgs: [SerType.ServicesType_ID]);
return UPSerType;
}


Future<int> UPServ(Services Ser) async
{
  Database db = await this.database;
  var UPSer = await db.update(
      $Services, Ser.toMapSer(), where: "$Services_ID=?",
      whereArgs: [Ser.Services_ID]);
  return UPSer;
}



Future<int> UPOwnServ(OwnerServicesclass OS) async
{  Database db=await this.database;
var UPDAOS=await db.update($OwnerServices,OS.toMapOwner(),where:"$Services_owner_ID=?" ,whereArgs: [OS.Services_owner_ID]);
return UPDAOS;
}


Future<int> UPNotifTyp(NotificationsClas notif) async
{  Database db=await this.database;
var upenotf=await db.update($NotificationsType,notif.toMapNotific(),where:"$Notification_ID=?" ,whereArgs: [notif.Notification_ID]);
return upenotf;
}
Future<int> UPLInKNoOw(LinkNotifServOwnerC LInKNoOw) async
{  Database db=await this.database;
var upLInKNoOwT=await db.update($LinkNotifServOwner,LInKNoOw.toMapLink(),where:"$Services_owner_ID=?" ,whereArgs: [LInKNoOw.Services_owner_ID]);
return upLInKNoOwT;
}

Future<int> UPAdmin(AdminC Admin) async
{  Database db=await this.database;
var upAdmin=await db.update($Admin,Admin.toMapAdm(),where:"$Admin_ID" ,whereArgs: [Admin.Admin_ID]);
return upAdmin;
}
//delate data


Future<int> DeMap(MapG map) async
{
  Database db = await this.database;
  var DeMap = await db.delete($MAPgoogl,where: "$MAP_ID = ?", whereArgs: [map.MAP_ID]);
  return DeMap;
}

Future<int> DeProv(PROVIINCIALC prov) async
{  Database db= this.database;
var Deprov=await db.delete($PROVIINCIAL,where: "$COUNTRY_ID =?" ,whereArgs: [prov.COUNTRY_ID]);
return Deprov;
}

Future<int> DeNotif(NotificationsClas notif) async
{  Database db=await this.database;
var DeNotif=await db.delete($Notifications,where: "$Notification_ID=?",whereArgs: [notif.Notification_ID]);
return DeNotif;
}

Future<int> DeAcces(AccessibilityClass Acces) async
{  Database db=await this.database;
var DeAcces=await db.delete($Accessibility,where:"$Accessibility_ID=?" ,whereArgs: [Acces.Accessibility_ID]);
return DeAcces;
}

Future<int> DeConSerProvi(ConnSerProvi CSP) async
{  Database db=await this.database;
var DeConSerProvi=await db.delete($ConSerProvi,where: COUNTRY_ID,whereArgs: [CSP.COUNTRY_ID]);
return DeConSerProvi;
}


Future<int> DeServTy(ServicesTYPE SerType) async
{  Database db=await this.database;
var DeSerType=await db.delete($ServicesType,SerType.toMapSert(),where:"$ServicesType_ID=?" ,whereArgs: [SerType.ServicesType_ID]);
return DeSerType;
}

Future<int> DeServ(Services Ser) async
{
  Database db = await this.database;
  var DeSer = await db.delete(
      $Services,  where: "$Services_ID=?",
      whereArgs: [Ser.Services_ID]);
  return DeSer;
}



Future<int> deOwnServ(OwnerServicesclass OS) async
{  Database db=await this.database;
var DeAOS=await db.delete($OwnerServices,where:"$Services_owner_ID=?" ,whereArgs: [OS.Services_owner_ID]);
return DeAOS;
}


Future<int> DeNotifTyp(NotificationsClas notif) async
{  Database db=await this.database;
var Denotf=await db.delete($NotificationsType,where:"$Notification_ID=?" ,whereArgs: [notif.Notification_ID]);
return Denotf;
}
Future<int> DeLInKNoOw(LinkNotifServOwnerC LInKNoOw) async
{  Database db=await this.database;
var DeLInKNoOwT=await db.delete($LinkNotifServOwner,where:"$Services_owner_ID=?" ,whereArgs: [LInKNoOw.Services_owner_ID]);
return DeLInKNoOwT;
}

Future<int> DeAdmin(AdminC Admin) async
{
  Database db=await database ;
  var DeAdmin = db.delete($Admin,where:"$Admin_ID=?" ,whereArgs: [Admin.Admin_ID]);
  return DeAdmin;
}