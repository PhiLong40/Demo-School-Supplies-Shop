<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="./assets/icon/logoshop.png" width="80" height="50" style="margin-left: 30px"/>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="margin: 0 auto">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="./Home">Home</a>
                        </li>                       
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Category
                            </a>
                            <ul class="dropdown-menu">
                                <c:forEach items="${listCategory}" var="category">
                                    <li><a class="dropdown-item" href="./Home?id_category=${category.id}">${category.name}</a></li>
                                    </c:forEach>
                            </ul>
                        </li>
                        <c:if test="${user==null}">
                        <li class="nav-item">
                            <a class="nav-link" href="./Dangnhap">Login</a>                                                   
                        </li>
                        </c:if>
                        <c:if test="${user!=null}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Hi ${user.getName()}
                                </a>
                                <ul class="dropdown-menu">                                 
                                    <li><a class="dropdown-item" href="#">Profile</a></li>
                                    <li><a class="dropdown-item" href="./views/logout.jsp">Logout</a></li>
                                </ul>
                            </li>
                        </c:if>
                        <li class="nav-item">
                            <a class="nav-link" href="BuySP">
                                <img src="./assets/icon/cart.png" width="25" height="25"/>
                                <i>${cart.size()}</i>
                            </a>
                        </li>
                        
                    </ul>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>