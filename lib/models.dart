import 'dart:ffi';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' ;
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

class MapG {

  int MAP_ID;
  Text MAP_ADRESS;
  Double XAXIS;
  Double YAXIS;
  int ZOOM;
  var SITE_DESCRIPTION;

  MapG(this.MAP_ADRESS, this.XAXIS, this.YAXIS, this.ZOOM,
      this.SITE_DESCRIPTION);

  Map<String,dynamic> toMap(){
     var map = Map<String,dynamic> ();
    map["MAP_ID"]=this.MAP_ID;
    map[" MAP_ADRESS"]=this.MAP_ADRESS;
    map["XAXIS"]=this.XAXIS;
    map["YAXIS"]=this.YAXIS;
    map["ZOOM"]=this.ZOOM;
    map["SITE_DESCRIPTION"]=this.SITE_DESCRIPTION;
    return map;
}
  MapG.getMap(Map<String,dynamic> map)
  {
    this.MAP_ID = map["MAP_ID"];
    this.MAP_ADRESS = map[" MAP_ADRESS"] ;
    this.XAXIS = map["XAXIS"];
    this.YAXIS = map["YAXIS"];
    this.ZOOM = map["ZOOM"];
    this.SITE_DESCRIPTION = map["SITE_DESCRIPTION"];

  }
}


class Services {

  int Services_ID;
  var Services_Name;
  var Services_Featurees;
 var TimeOfWork;
 Text Image;
 var video;
 double  XAXIS;
 double YAXIS;
  var serv = Map<String, dynamic>();
  Services(this.Services_Name, this.Services_Featurees, this.TimeOfWork,
      this.Image, this.video, this.XAXIS, this.YAXIS);

  Map<String,dynamic> toMapSer() {
  //  var serv = Map<String, dynamic>();
    serv[" Services_ID"] = this.Services_ID;
    serv["Services_Name"] = this.Services_Name;
    serv["XAXIS"] = this.XAXIS;
    serv["YAXIS"] = this.YAXIS;
    serv["Services_Featurees"] = this.Services_Featurees;
    serv["TimeOfWork"] = this.TimeOfWork;
    serv["video"] = this.video;
    serv["Image"] = this.Image;
    return serv;
  }
  Services.getMap(Map<String,dynamic> map)
  {
    serv[" Services_ID"] = this.Services_ID;
    this.Services_Name = serv["Services_Name"];
    this.XAXIS = serv["XAXIS"];
    this.YAXIS = serv["YAXIS"];
    this.Services_Featurees = serv["Services_Featurees"];
    this.TimeOfWork = serv["TimeOfWork"];
    this.video = serv["video"];
    this.Image = serv["Image"];
  }}

class ServicesTYPE {

  int ServicesType_ID;
  var ServicesType_Name;
  var servType = Map<String, dynamic>();

  ServicesTYPE(this.ServicesType_Name);

  Map<String,dynamic> toMapSert() {
    servType["ServicesType_ID"] = this.ServicesType_ID;
    servType["ServicesType_Name"] = this.ServicesType_Name;
  }

  ServicesTYPE.getMap(Map<String, dynamic> map)
  {
    this.ServicesType_ID  = servType["ServicesType_ID"];
    this.ServicesType_Name = servType["ServicesType_Name"] ;
  }
}
class ConnSerProvi {
 int COUNTRY_ID;
 int Services_owner_ID;
  int Services_ID;

 ConnSerProvi(this.COUNTRY_ID, this.Services_owner_ID, this.Services_ID);

  var connSerProvi = Map<String, dynamic>();

 Map<String,dynamic> toMapconnec() {
   connSerProvi["COUNTRY_ID"] = this.COUNTRY_ID;
   connSerProvi["Services_owner_ID"] = this.Services_owner_ID;
   connSerProvi["Services_ID"] = this.Services_ID;
   return connSerProvi;
 }
 ConnSerProvi.getMap(Map<String, dynamic> map){

  this.COUNTRY_ID = connSerProvi["COUNTRY_ID"]  ;
this.Services_owner_ID  = connSerProvi["Services_owner_ID"];
this.Services_ID =connSerProvi["Services_ID"] ;
}
}

class OwnerServicesclass {

 int  Services_owner_ID;
  Text Services_owner_Name;
  int Services_owner_phone;
 var Services_owner_Mail;
 var owner_serv = Map<String, dynamic>();
 OwnerServicesclass(this.Services_owner_Name, this.Services_owner_phone,
      this.Services_owner_Mail);

  Map<String,dynamic> toMapOwner()
  {
    owner_serv["Services_owner_ID"] = this.Services_owner_ID;
    owner_serv["Services_owner_Name"] = this.Services_owner_Name;
    owner_serv["Services_owner_phone"] = this.Services_owner_phone;
    owner_serv["Services_owner_Mail"] = this.Services_owner_Mail;
  return owner_serv;
  }
 ConnSerProvi.getMap(Map<String, dynamic> map){
   this.Services_owner_ID  = owner_serv["Services_owner_ID"];
   this.Services_owner_Name  =owner_serv["Services_owner_Name"];
   this.Services_owner_phone =  owner_serv["Services_owner_phone"];
   this.Services_owner_Mail  = owner_serv["Services_owner_Mail"] ;
 }
}
class AccessibilityClass {
  int Accessibility_ID;
  var verification;
  int ServiceOwner_phone;

  AccessibilityClass(this.verification, this.ServiceOwner_phone);
  var Access = Map<String, dynamic>();

  Map<String,dynamic> toMapAccess()
  {
    Access["Acessibility_ID"] = this.Accessibility_ID;
    Access["verification"] = this.verification;
    Access["ServiceOwner_phone"] = this.ServiceOwner_phone;
    return Access;
  }
  AccessibilityClass.getMap(Map<String, dynamic> map){
    this.Accessibility_ID  = Access["Acessibility_ID"];
    this.verification   = Access["verification"];
    this.ServiceOwner_phone =Access["ServiceOwner_phone"]  ;
  }

}
class NotificationsClas
{

  int Notification_ID;
  var Notification_ADRESS;
  Date Start_Notification;
  DataTime End_Notification;
  int period_Notification;

  NotificationsClas(this.Notification_ADRESS, this.Start_Notification,
      this.End_Notification, this.period_Notification);

  var Notific = Map<String, dynamic>();
  Map<String,dynamic> toMapNotific()
  {
    Notific["Notification_ID"] = this.Notification_ID;
    Notific["Notification_ADRESS"] = this.Notification_ADRESS;
    Notific["Start_Notification"] = this.Start_Notification;
    Notific["End_Notification"] = this.End_Notification;
    Notific["period_Notification"] = this.period_Notification;
  return Notific;
  }
  NotificationsClas.getMap(Map<String, dynamic> map){
    this.Notification_ID  =Notific["Notification_ID"] ;
    this.Notification_ADRESS  = Notific["Notification_ADRESS"];
    this.Start_Notification =Notific["Start_Notification"];
    this.End_Notification= Notific["End_Notification"]  ;
    this.period_Notification  =Notific["period_Notification"] ;
  }
}
class NotificationsTypeC {
  int Notifications_Type_ID;
 var Notifications_Image;
  var Notifications_Video;
  var Notifications_Text;

  NotificationsTypeC(this.Notifications_Type_ID, this.Notifications_Video,
      this.Notifications_Text);

  var Notificty = Map<String, dynamic>();
  Map<String,dynamic> toMapNotific()
  {
    Notificty["Notifications_Type_ID"] = this.Notifications_Type_ID;
    Notificty["Notifications_Image"] = this.Notifications_Image;
    Notificty["Notifications_Video"] = this.Notifications_Video;
    Notificty["Notifications_Text"] = this.Notifications_Text;
    return Notificty;
  }
  NotificationsClas.getMap(Map<String, dynamic> map){

    this.Notifications_Type_ID = Notificty["Notifications_Type_ID"]  ;
    this.Notifications_Image = Notificty["Notifications_Image"];
    this.Notifications_Video  =Notificty["Notifications_Video"] ;
    this.Notifications_Text =Notificty["Notifications_Text"] ;
  }

  }
  class LinkNotifServOwnerC {

  }