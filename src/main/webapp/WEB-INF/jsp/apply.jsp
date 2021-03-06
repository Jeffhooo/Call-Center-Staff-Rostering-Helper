<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hejunfeng
  Date: 18-8-16
  Time: 上午8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="webjars/jquery/3.3.1/jquery.min.js"></script>
    <script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
    <style>
        html{
            height:100%;
        }
        body{
            min-height:100%;
            margin:0;
            padding:0;
            position:relative;
        }
        footer{
            width: 950px;
            position:absolute;
            bottom:0;
            margin-bottom: 5px;
            text-align: center;
        }
        .navbar {
            background-color: lightseagreen;
        }
        .navbar-brand {
            color: white;
        }
        #brand {
            color: white;
        }
        #help {
            color: white;
            margin-left: 500px;
        }
        #logOut {
            color: white;
        }
        .btn-default {
            margin-top: 5px;
        }
        .btn-primary {
            width: 70px;
            margin-top: 5px;
            background-color: lightseagreen;
            border: lightseagreen;
        }
        .btn-primary:hover {
            background-color: mediumseagreen;
        }
        .btn-primary:visited {
            background-color: lightseagreen;
        }
        .nav > li > a:hover {
            background-color: mediumseagreen;
        }
        .nav > li > a:visited{
            background-color: lightseagreen;
        }
        #timetable td{
            width: 110px;
            height: 150px;
            text-align: center;
        }
        #timetable th{
            width: 110px;
            height: 50px;
            text-align: center;
        }
        .container {
            width: 950px;
            margin-top: auto;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
        }
        #applyReasonHeader{
            margin-top: 20px
        }
        #applyReason {
            width: 880px;
            height: 50px;
            text-align: left;
        }
        #buttons {
            margin-top: 10px;
        }
        .form-signin-heading {
            font-size: 20px;
        }
        #applyTime {
            margin-top: 20px;
            height: 20px;
            font-size: 20px
        }
        #applicationTable {
            margin-top: 10%;
        }
        #bottomSpace {
            height: 100px;
        }
        #resultHeader{
            text-align: center;
            width: 100px;
            height: 50px;
        }
        #beginTimeHeader, #endTimeHeader, #applyReasonTableHeader, #commentTableHeader {
            text-align: center;
            width: 195px;
            height: 50px;
        }
        #applicationTable td {
            text-align: center;
            height: 50px;
        }
        #applicationForm {
            margin-top: 20px;
        }
    </style>
    <title>Apply</title>
</head>
<body>
<div class="container">
    <!-- Fixed navbar -->
    <nav class="navbar navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" id="brand">Call Center Rostering Helper</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a id="help">Help</a></li>
                    <li><a id="logOut" data-toggle="modal" data-target="#LogOutModal">Log Out</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <table class="table-bordered" id="applicationTable">
        <thead>
        <tr id="tableHeader">
            <th id="beginTimeHeader">Begin Time</th>
            <th id="endTimeHeader">End Time</th>
            <th id="applyReasonTableHeader">Apply Reason</th>
            <th id="resultHeader">Result</th>
            <th id="commentTableHeader">Comment</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>

    <button class="btn btn-primary" id="openCreate" type="button">New</button>
    <button class="btn btn-primary" id="back" type="button" onclick="history.go(-1);">Back</button>

    <form class="form-signin" id="applicationForm">
        <h3 id="createNewHolidayHeader">Create New Application:</h3>
        <table class="table-bordered" id="timetable">
            <thead>
            <tr>
                <th></th>
                <th id="day1"></th>
                <th id="day2"></th>
                <th id="day3"></th>
                <th id="day4"></th>
                <th id="day5"></th>
                <th id="day6"></th>
                <th id="day7"></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td id="time1"></td>
                <td id="content1"></td>
                <td id="content3"></td>
                <td id="content5"></td>
                <td id="content7"></td>
                <td id="content9"></td>
                <td id="content11"></td>
                <td id="content13"></td>
            </tr>
            <tr>
                <td id="time2"></td>
                <td id="content2"></td>
                <td id="content4"></td>
                <td id="content6"></td>
                <td id="content8"></td>
                <td id="content10"></td>
                <td id="content12"></td>
                <td id="content14"></td>
            </tr>
            </tbody>
        </table>
        </table>

        <div id="applyTime" >Apply Time: </div>
        <h2 class="form-signin-heading" id="applyReasonHeader">Apply reason:</h2>
        <label for="applyReason" class="sr-only">Apply Reason</label>
        <textarea type="text" id="applyReason" class="form-control" name = "applyReason" placeholder="Apply Reason"></textarea>
        <p id="buttons">
            <button class="btn btn-primary" id="submit" type="submit">Submit</button>
            <button class="btn btn-primary" id="cancelSubmit" type="submit">Cancel</button>
        </p>
    </form>

    <div id="userId" hidden>${userId}</div>
    <div id="bottomSpace"></div>
    <footer class="copyright">
        &copy; 2018 He Junfeng All Right Reserved<br>
    </footer>
</div>
<div class="modal fade" id="LogOutModal" tabindex="-1" role="dialog" aria-labelledby="logOutModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    Log Out
                </h4>
            </div>
            <div class="modal-body">
                Are you sure to log out?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="logOutConfirm">Yes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="RemindModal" tabindex="-1" role="dialog" aria-labelledby="RemindModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="RemindModalLabel">
                    Submit
                </h4>
            </div>
            <div class="modal-body">
                You have to choose a time.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="SubmitModal" tabindex="-1" role="dialog" aria-labelledby="SubmitModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="SubmitModalLabel">
                    Submit
                </h4>
            </div>
            <div class="modal-body" id="SubmitModalBody">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="submitConfirm">Yes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="isSubmittedModal" tabindex="-1" role="dialog" aria-labelledby="isSubmittedModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="isSubmittedModalLabel">
                    Submit
                </h4>
            </div>
            <div class="modal-body">
                Application is submitted.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        var now = new Date(); //current date
        var nowDayOfWeek = now.getDay(); //the day number of this week
        var nowDay = now.getDate(); //current day
        var nowMonth = now.getMonth(); //current month
        var nowYear = now.getYear(); //current year
        nowYear += (nowYear < 2000) ? 1900 : 0; //

        //format date：yyyy-MM-dd
        function formatDate(date) {
            var myyear = date.getFullYear();
            var mymonth = date.getMonth()+1;
            var myweekday = date.getDate();

            if(mymonth < 10){
                mymonth = "0" + mymonth;
            }
            if(myweekday < 10){
                myweekday = "0" + myweekday;
            }
            return (myyear+"-"+mymonth + "-" + myweekday);
        }

        //get begin date of this week
        function getWeekBeginDate() {
            var weekBeginDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
            return formatDate(weekBeginDate);
        }

        //get end date of this week
        function getWeekEndDate() {
            var weekEndDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek + 7);
            return formatDate(weekEndDate);
        }

        function getOffsetBeginDate(dayOffset) {
            var date = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek + dayOffset);
            return formatDate(date);
        }

        function getOffsetEndDate(dayOffset) {
            var date = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek + dayOffset + 7);
            return formatDate(date);
        }

        var userId = $("#userId").text();
        var loadBeginDate = getOffsetBeginDate(7);
        var loadEndDate = getOffsetEndDate(7);
        var applyBeginTimeMap = {};
        var applyEndTimeMap = {};
        var workTime = new Array();
        workTime[0] = "08:00:00";
        workTime[1] = "16:00:00";
        workTime[2] = "23:00:00";
        var chooseContent = null;
        var $days = [];
        $days[0] = $("#day1");
        $days[1] = $("#day2");
        $days[2] = $("#day3");
        $days[3] = $("#day4");
        $days[4] = $("#day5");
        $days[5] = $("#day6");
        $days[6] = $("#day7");

        var $times = [];
        $times[0] = $("#time1");
        $times[1] = $("#time2");

        var $contents = [];
        $contents[0] = $("#content1");
        $contents[1] = $("#content2");
        $contents[2] = $("#content3");
        $contents[3] = $("#content4");
        $contents[4] = $("#content5");
        $contents[5] = $("#content6");
        $contents[6] = $("#content7");
        $contents[7] = $("#content8");
        $contents[8] = $("#content9");
        $contents[9] = $("#content10");
        $contents[10] = $("#content11");
        $contents[11] = $("#content12");
        $contents[12] = $("#content13");
        $contents[13] = $("#content14");

        loadApplicationTimetable(userId, loadBeginDate, loadEndDate);

        function loadApplicationTimetable(userId, beginTime, endTime) {
            var loadPage = {
                title:"Staff",
                staffId:userId,
                beginTime:beginTime,
                endTime:endTime };
            $.ajax({
                async:false,
                url: "loadApplicationTimetable",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(loadPage),
                dataType: "json",
                success: function(timetable) {
                    var days = timetable.days;
                    $.each(days, function (i, day) {
                        $days[i].text(day);
                    });
                    var times = timetable.times;
                    $.each(times, function (i, time) {
                        $times[i].text(time);
                    });
                    if(times[0] == "9:00-17:00") {
                        workTime[0] = "09:00:00";
                        workTime[1] = "17:00:00";
                        workTime[2] = "24:00:00";
                    }

                    var contents = timetable.content;
                    $.each(contents, function (i, content) {
                        $contents[i].text(content);
                    });

                    applyBeginTimeMap["content1"] = days[0] + " " + workTime[0];
                    applyBeginTimeMap["content2"] = days[0] + " " + workTime[1];
                    applyBeginTimeMap["content3"] = days[1] + " " + workTime[0];
                    applyBeginTimeMap["content4"] = days[1] + " " + workTime[1];
                    applyBeginTimeMap["content5"] = days[2] + " " + workTime[0];
                    applyBeginTimeMap["content6"] = days[2] + " " + workTime[1];
                    applyBeginTimeMap["content7"] = days[3] + " " + workTime[0];
                    applyBeginTimeMap["content8"] = days[3] + " " + workTime[1];
                    applyBeginTimeMap["content9"] = days[4] + " " + workTime[0];
                    applyBeginTimeMap["content10"] = days[4] + " " + workTime[1];
                    applyBeginTimeMap["content11"] = days[5] + " " + workTime[0];
                    applyBeginTimeMap["content12"] = days[5] + " " + workTime[1];
                    applyBeginTimeMap["content13"] = days[6] + " " + workTime[0];
                    applyBeginTimeMap["content14"] = days[6] + " " + workTime[1];

                    applyEndTimeMap["content1"] = days[0] + " " + workTime[1];
                    applyEndTimeMap["content2"] = days[0] + " " + workTime[2];
                    applyEndTimeMap["content3"] = days[1] + " " + workTime[1];
                    applyEndTimeMap["content4"] = days[1] + " " + workTime[2];
                    applyEndTimeMap["content5"] = days[2] + " " + workTime[1];
                    applyEndTimeMap["content6"] = days[2] + " " + workTime[2];
                    applyEndTimeMap["content7"] = days[3] + " " + workTime[1];
                    applyEndTimeMap["content8"] = days[3] + " " + workTime[2];
                    applyEndTimeMap["content9"] = days[4] + " " + workTime[1];
                    applyEndTimeMap["content10"] = days[4] + " " + workTime[2];
                    applyEndTimeMap["content11"] = days[5] + " " + workTime[1];
                    applyEndTimeMap["content12"] = days[5] + " " + workTime[2];
                    applyEndTimeMap["content13"] = days[6] + " " + workTime[1];
                    applyEndTimeMap["content14"] = days[6] + " " + workTime[2];

                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("load applications timetable error.");
                }
            });
        }

        function loadApplicationList(userId, beginTime, endTime) {
            var requestInfo = {
                staffId: userId,
                beginTime: beginTime,
                endTime: endTime
            };
            $.ajax({
                url: "loadStaffApplications",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(requestInfo),
                dataType: "json",
                success: function(applications) {
                    $.each(applications, function (index, application) {
                        var tr = "<tr id=\"" + application.applicationId + "\">" +
                            "<td>" + application.beginTime + "</td>" +
                            "<td>" + application.endTime + "</td>" +
                            "<td>" + application.applyReason + "</td>" +
                            "<td>" + ((application.result == null)? "" : application.result) + "</td>" +
                            "<td>" + ((application.comment == null)? "" : application.comment) + "</td></tr>";
                        $("#applicationTable").append(tr);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("loadApplications error.");
                }
            });
        }

        $("td").click(function () {
            $("td").css("background-color", "#FFFFFF");
            $("td").css("color", "#000000");
            var contentId = $(this).attr("id");
            if((contentId !== "time1") && (contentId !== "time2")) {
                $(this).css("background-color", "lightseagreen");
                $(this).css("color", "#FFFFFF");
                $("#applyTime").text("Apply Time: " + applyBeginTimeMap[contentId].substr(0, 16) + "-" + applyEndTimeMap[contentId].substr(11, 5));
                chooseContent = contentId;
            }
        });

        $("#submitConfirm").click(function (event) {
            var application = {staffId: userId, applyReason: $("#applyReason").val(),
                beginTime: applyBeginTimeMap[chooseContent], endTime: applyEndTimeMap[chooseContent]};
            $.ajax({
                url: "submitApplication",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(application),
                dataType: "json",
                success: function (Message) {
                    $("#isSubmittedModal").modal("toggle");
                    $("#SubmitModal").modal("hide");
                    loadApplicationTimetable(userId, loadBeginDate, loadEndDate);
                    $("#applyReason").val("");
                    $("#applicationTable tbody").empty();
                    loadApplicationList(userId, loadBeginDate, loadEndDate);
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("Submit application error.");
                }
            });
            event.preventDefault();
        });

        $("#submit").click(function (event) {
            if(chooseContent == null) {
                $("#RemindModal").modal("toggle");
            } else {
                $("#SubmitModalBody").html("Apply Time: " +
                    applyBeginTimeMap[chooseContent].substr(0, 16) +
                    "-" + applyEndTimeMap[chooseContent].substr(11, 5) +
                    "<br/> Apply Reason: " +
                    $("#applyReason").val() +
                    "<br/> Are you sure to submit this application?");
                $("#SubmitModal").modal("toggle");
            }
            event.preventDefault();
        });

        $("#logOutConfirm").click(function (event) {
            window.location.href = "login";
            event.preventDefault();
        });

        $("#help").click(function (event) {
            window.location.href = "helpStaff${userId}";
            event.preventDefault();
        });

        $("#brand").click(function (event) {
            window.location.href = "staffMain${userId}";
            event.preventDefault();
        });

        $("#openCreate").click(function (event) {
            $("#applicationForm").show();
            event.preventDefault();
        });

        $("#cancelSubmit").click(function (event) {
            $("#applicationForm").hide();
            event.preventDefault();
        });

        loadApplicationList(userId, loadBeginDate, loadEndDate);
        $("#applicationForm").hide();
    });
</script>
</html>
