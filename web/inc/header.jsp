<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
        <script src="./assets/js/bootstrap.bundle.min.js"></script>
        <style>
            .thunho{
                height: 700px;
                width: 100%;
            }
            .thunho2{
                height: 500px;
                width: 100%;
            }
            .thunho3{
                height: 400px;
                width: 100%;
            }
            div.card div.blockImage div.giohang{
                position: absolute;
                width: 100%;
                bottom: 100px;
                background: rgba(255,176,189,.9);
                padding-bottom: 20px;
                padding-top: 20px;
                left: 50%;
                transform: translateX(-50%);
                transition: all 0.3s ease-in-out;
                opacity: 0;
            }
            div.card div.giohang a{
                background: url(./assets/icon/action.png) no-repeat 0 0;
                margin-left: 140px;
                width: 23px;
                height: 29px;
            }
            div.card div.blockImage:hover div.giohang{
                bottom: 27%;
                opacity: 1;
            }
            nav.navbar{
                background: rgba(255,176,189,.9);
            }
            nav ul li a.nav-link{
                font-size: 18px;
                color: white;
                font-weight: 500;
                margin-left: 40px;
            }
            ul.dropdown-menu{
                background: rgba(255,176,189,.9);
                padding-left: 10px;
                padding-right: 10px;
            }
            a.dropdown-item{
                background: white;
            }
            h5.card-title a, a.qmk{
                color: black;
                text-decoration: none;
                transition: all 0.3s ease-out;
            }
            h5.card-title a:hover{
                color: rgba(255,176,189,.9);
            }
            a.qmk:hover{
                color: rgba(255,176,189,.9);
            }
            section.background{
                background: rgba(255,176,189,.9);
                color: #ffffff;
            }
            .pinkbt{
                background: rgba(255,176,189,.9);
            }
            .pinkbt:hover{
                background: #ffcccc;
            }
            div.dinhdang{
                display: block;
                white-space: nowrap;
                overflow: hidden;
            }
            
        </style>
    </head>
    <body>
        
