class UserActivities {
  List<Events> events;
  int defaulteventcontext;
  int courseid;
  int categoryid;
  bool isloggedin;

  UserActivities(
      {this.events,
      this.defaulteventcontext,
      this.courseid,
      this.categoryid,
      this.isloggedin});

  UserActivities.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = new List<Events>();
      json['events'].forEach((v) {
        events.add(new Events.fromJson(v));
      });
    }
    defaulteventcontext = json['defaulteventcontext'];
    courseid = json['courseid'];
    categoryid = json['categoryid'];
    isloggedin = json['isloggedin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.events != null) {
      data['events'] = this.events.map((v) => v.toJson()).toList();
    }
    data['defaulteventcontext'] = this.defaulteventcontext;
    data['courseid'] = this.courseid;
    data['categoryid'] = this.categoryid;
    data['isloggedin'] = this.isloggedin;
    return data;
  }
}

class Events {
  int id;
  String name;
  String description;
  int categoryid;
  int groupid;
  int userid;
  int repeatid;
  int eventcount;
  String modulename;
  int instance;
  String eventtype;
  int timestart;
  int timeduration;
  int timesort;
  int visible;
  int timemodified;
  Icon icon;
  Course course;
  Subscription subscription;
  bool canedit;
  bool candelete;
  String deleteurl;
  String editurl;
  String viewurl;
  String formattedtime;
  bool isactionevent;
  bool iscourseevent;
  bool iscategoryevent;
  String groupname;
  String url;
  bool islastday;
  String calendareventtype;
  String popupname;
  int mindaytimestamp;
  String mindayerror;
  bool draggable;

  Events(
      {this.id,
      this.name,
      this.description,
      this.categoryid,
      this.groupid,
      this.userid,
      this.repeatid,
      this.eventcount,
      this.modulename,
      this.instance,
      this.eventtype,
      this.timestart,
      this.timeduration,
      this.timesort,
      this.visible,
      this.timemodified,
      this.icon,
      this.course,
      this.subscription,
      this.canedit,
      this.candelete,
      this.deleteurl,
      this.editurl,
      this.viewurl,
      this.formattedtime,
      this.isactionevent,
      this.iscourseevent,
      this.iscategoryevent,
      this.groupname,
      this.url,
      this.islastday,
      this.calendareventtype,
      this.popupname,
      this.mindaytimestamp,
      this.mindayerror,
      this.draggable});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    categoryid = json['categoryid'];
    groupid = json['groupid'];
    userid = json['userid'];
    repeatid = json['repeatid'];
    eventcount = json['eventcount'];
    modulename = json['modulename'];
    instance = json['instance'];
    eventtype = json['eventtype'];
    timestart = json['timestart'];
    timeduration = json['timeduration'];
    timesort = json['timesort'];
    visible = json['visible'];
    timemodified = json['timemodified'];
    icon = json['icon'] != null ? new Icon.fromJson(json['icon']) : null;
    course =
        json['course'] != null ? new Course.fromJson(json['course']) : null;
    subscription = json['subscription'] != null
        ? new Subscription.fromJson(json['subscription'])
        : null;
    canedit = json['canedit'];
    candelete = json['candelete'];
    deleteurl = json['deleteurl'];
    editurl = json['editurl'];
    viewurl = json['viewurl'];
    formattedtime = json['formattedtime'];
    isactionevent = json['isactionevent'];
    iscourseevent = json['iscourseevent'];
    iscategoryevent = json['iscategoryevent'];
    groupname = json['groupname'];
    url = json['url'];
    islastday = json['islastday'];
    calendareventtype = json['calendareventtype'];
    popupname = json['popupname'];
    mindaytimestamp = json['mindaytimestamp'];
    mindayerror = json['mindayerror'];
    draggable = json['draggable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['categoryid'] = this.categoryid;
    data['groupid'] = this.groupid;
    data['userid'] = this.userid;
    data['repeatid'] = this.repeatid;
    data['eventcount'] = this.eventcount;
    data['modulename'] = this.modulename;
    data['instance'] = this.instance;
    data['eventtype'] = this.eventtype;
    data['timestart'] = this.timestart;
    data['timeduration'] = this.timeduration;
    data['timesort'] = this.timesort;
    data['visible'] = this.visible;
    data['timemodified'] = this.timemodified;
    if (this.icon != null) {
      data['icon'] = this.icon.toJson();
    }
    if (this.course != null) {
      data['course'] = this.course.toJson();
    }
    if (this.subscription != null) {
      data['subscription'] = this.subscription.toJson();
    }
    data['canedit'] = this.canedit;
    data['candelete'] = this.candelete;
    data['deleteurl'] = this.deleteurl;
    data['editurl'] = this.editurl;
    data['viewurl'] = this.viewurl;
    data['formattedtime'] = this.formattedtime;
    data['isactionevent'] = this.isactionevent;
    data['iscourseevent'] = this.iscourseevent;
    data['iscategoryevent'] = this.iscategoryevent;
    data['groupname'] = this.groupname;
    data['url'] = this.url;
    data['islastday'] = this.islastday;
    data['calendareventtype'] = this.calendareventtype;
    data['popupname'] = this.popupname;
    data['mindaytimestamp'] = this.mindaytimestamp;
    data['mindayerror'] = this.mindayerror;
    data['draggable'] = this.draggable;
    return data;
  }
}

class Icon {
  String key;
  String component;
  String alttext;

  Icon({this.key, this.component, this.alttext});

  Icon.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    component = json['component'];
    alttext = json['alttext'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['component'] = this.component;
    data['alttext'] = this.alttext;
    return data;
  }
}

class Course {
  int id;
  String fullname;
  String shortname;
  String idnumber;
  String summary;
  int summaryformat;
  int startdate;
  int enddate;
  String fullnamedisplay;
  String viewurl;

  Course(
      {this.id,
      this.fullname,
      this.shortname,
      this.idnumber,
      this.summary,
      this.summaryformat,
      this.startdate,
      this.enddate,
      this.fullnamedisplay,
      this.viewurl});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    shortname = json['shortname'];
    idnumber = json['idnumber'];
    summary = json['summary'];
    summaryformat = json['summaryformat'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    fullnamedisplay = json['fullnamedisplay'];
    viewurl = json['viewurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['shortname'] = this.shortname;
    data['idnumber'] = this.idnumber;
    data['summary'] = this.summary;
    data['summaryformat'] = this.summaryformat;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    data['fullnamedisplay'] = this.fullnamedisplay;
    data['viewurl'] = this.viewurl;
    return data;
  }
}

class Subscription {
  bool displayeventsource;

  Subscription({this.displayeventsource});

  Subscription.fromJson(Map<String, dynamic> json) {
    displayeventsource = json['displayeventsource'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayeventsource'] = this.displayeventsource;
    return data;
  }
}