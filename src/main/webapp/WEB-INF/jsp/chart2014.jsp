<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>대졸자 이동경로조사</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../bootstrap/css/simple-sidebar.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://code.highcharts.com/highcharts.js"></script>
<script type="text/javascript" src="http://code.highcharts.com/modules/data.js"></script>


<!-- 2. Add the JavaScript to initialize the chart on document ready -->
<script type="text/javascript">
    $(document).ready(function () {
        $.get('toeic1.csv', function (csv) {
            $('#toeic').highcharts({
                chart: {
                    type: 'column'
                },
                data: {
                    csv: csv
                },
                title: {
                    text: '토익'
                },
                subtitle: {
                    text: ''
                },
                yAxis: {
                    type: 'logarithmic',
                    title: {
                        text: '사람수'
                    }
                }
            });
        });
    });
    $(document).ready(function () {
        $.get('sex1.csv', function (csv) {
            $('#sex1').highcharts({
                chart: {
                    type: 'pie'
                },
                data: {
                    csv: csv
                },
                title: {
                    text: '남녀비율'
                },
                subtitle: {
                    text: '취업자'
                }

            });
        });
    });
    $(document).ready(function () {
        $.get('sex2.csv', function (csv) {
            $('#sex2').highcharts({
                chart: {
                    type: 'pie'
                },
                data: {
                    csv: csv
                },
                title: {
                    text: '남녀비율'
                },
                subtitle: {
                    text: '미취업자'
                }

            });
        });
    });
    $(document).ready(function () {
        $.get('LT.csv', function (csv) {
            $('#lt').highcharts({
                chart: {
                    type: 'column'
                },
                data: {
                    csv: csv
                },
                title: {
                    text: '어학연수'
                },
                subtitle: {
                    text: ''
                },
                yAxis: {
                    type: 'logarithmic',
                    title: {
                        text: '사람수'
                    }
                }
            });
        });
    });
    $(document).ready(function () {
        $.get('submajor.csv', function (csv) {
            $('#sm').highcharts({
                chart: {
                    type: 'column'
                },
                data: {
                    csv: csv
                },
                title: {
                    text: '복수/부/연계전공'
                },
                subtitle: {
                    text: ''
                },
                yAxis: {
                    type: 'logarithmic',
                    title: {
                        text: '사람수'
                    }
                }
            });
        });
    });
    $(document).ready(function () {
        $.get('grade5.csv', function (csv) {
            $('#grade5').highcharts({
                chart: {
                    type: 'column'
                },
                data: {
                    csv: csv
                },
                title: {
                    text: '이수학점 4.5만점'
                },
                subtitle: {
                    text: ''
                },
                yAxis: {
                    type: 'logarithmic',
                    title: {
                        text: '사람수'
                    }
                }
            });
        });
    });
    $(document).ready(function () {
        $.get('grade3.csv', function (csv) {
            $('#grade3').highcharts({
                chart: {
                    type: 'column'
                },
                data: {
                    csv: csv
                },
                title: {
                    text: '이수학점 4.3만점'
                },
                subtitle: {
                    text: ''
                },
                yAxis: {
                    type: 'logarithmic',
                    title: {
                        text: '사람수'
                    }
                }
            });
        });
    });
    $(document).ready(function () {
        $.get('grade0.csv', function (csv) {
            $('#grade0').highcharts({
                chart: {
                    type: 'column'
                },
                data: {
                    csv: csv
                },
                title: {
                    text: '이수학점 4.0만점'
                },
                subtitle: {
                    text: ''
                },
                yAxis: {
                    type: 'logarithmic',
                    title: {
                        text: '사람수'
                    }
                }
            });
        });
    });
    $(document).ready(function () {
        $.get('cert1.csv', function (csv) {
            $('#cert1').highcharts({
                chart: {
                    type: 'pie'
                },
                data: {
                    csv: csv
                },
                title: {
                    text: '자격증개수'
                },
                subtitle: {
                    text: '취업자'
                }

            });
        });
    });
    $(document).ready(function () {
        $.get('cert2.csv', function (csv) {
            $('#cert2').highcharts({
                chart: {
                    type: 'pie'
                },
                data: {
                    csv: csv
                },
                title: {
                    text: '자격증개수'
                },
                subtitle: {
                    text: '미취업자'
                }

            });
        });
    });
</script>

</head>
<body>
<div id="wrapper">
    <div class="overlay"></div>

    <!-- Sidebar -->
    <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
        <ul class="nav sidebar-nav">
            <li class="sidebar-brand">
                <a href="#">
                    대졸자이동경로
                </a>
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">2014대졸자이동경로 <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li class="dropdown-header">2014년 조사</li>
                    <li><a href="/decisiontree">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="/chart2014">Chart</a></li>

                </ul>
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">2013대졸자이동경로 <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li class="dropdown-header">2013년 조사</li>
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Chart</a></li>

                </ul>
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">2012대졸자이동경로 <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li class="dropdown-header">2102년 조사</li>
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Chart</a></li>

                </ul>
            </li>

        </ul>
    </nav>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <button type="button" class="hamburger is-closed" data-toggle="offcanvas">
            <span class="hamb-top"></span>
            <span class="hamb-middle"></span>
            <span class="hamb-bottom"></span>
        </button>
        <div class="container">
            <div class="row">
                <div class="col-md-8 ">
                    <div id="toeic" style="width: 1000px; height: 400px; margin: 0 auto"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 "id="sex1" style="width: 500px; height: 400px;margin: 0 auto"></div>
                <div class="col-md-6 "id="sex2" style="width: 500px; height: 400px; margin: 0 auto"></div>
            </div>
            <div class="row">
                <div class="col-md-6 "id="lt" style="width: 500px; height: 400px;margin: 0 auto"></div>
                <div class="col-md-6 "id="sm" style="width: 500px; height: 400px; margin: 0 auto"></div>
            </div>

            <div class="row">
                <div class="col-md-4 " id="grade5" style="width: 33%; height: 400px;margin: 0 auto "></div>
                <div class="col-md-4 " id="grade3" style="width: 33%; height: 400px;margin: 0 auto "></div>
                <div class="col-md-4 " id="grade0" style="width: 33%; height: 400px;margin: 0 auto "></div>
            </div>
            <div class="row">
                <div class="col-md-6 "id="cert1" style="width: 500px; height: 400px;margin: 0 auto"></div>
                <div class="col-md-6 "id="cert2" style="width: 500px; height: 400px; margin: 0 auto"></div>
            </div>


        </div>
    </div>
    <!-- /#page-content-wrapper -->


    <!-- jQuery -->
    <%--<script src="../../bootstrap/js/jquery.js"></script>--%>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../bootstrap/js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
        $(document).ready(function () {
            var trigger = $('.hamburger'),
                overlay = $('.overlay'),
                isClosed = false;

            trigger.click(function () {
                hamburger_cross();
            });

            function hamburger_cross() {

                if (isClosed == true) {
                    overlay.hide();
                    trigger.removeClass('is-open');
                    trigger.addClass('is-closed');
                    isClosed = false;
                } else {
                    overlay.show();
                    trigger.removeClass('is-closed');
                    trigger.addClass('is-open');
                    isClosed = true;
                }
            }

            $('[data-toggle="offcanvas"]').click(function () {
                $('#wrapper').toggleClass('toggled');
                $('#wrapper').addClass('animating').delay(500).queue(function () {
                    $(this).removeClass("animating").dequeue();
                });
            });
        });
    </script>
</div>
</body>


</html>