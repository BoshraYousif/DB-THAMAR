import 'package:sqflite/sqflite.dart' ;
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'models.dart';

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
      "$Admin_ INTEGER PRAMARY KEY AUTOINCREMENT");

}
