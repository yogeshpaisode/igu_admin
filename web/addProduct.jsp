<%-- 
    Document   : addArtist
    Created on : Jul 12, 2016, 9:38:49 AM
    Author     : yogesh
--%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/import/head.jsp"%>

    <form ng-submit="uploadFile();">
        <select ng-model="form.artistId" required="">
            <%
                SessionFactory sessionFactory = com.hibconfig.HibernateUtil.getSessionFactory();
                Session hibsession = sessionFactory.openSession();
                Criteria cr = hibsession.createCriteria(com.hibconfig.Artist.class);
                List list = cr.list();

                for (Object o : list) {
                    com.hibconfig.Artist a = (com.hibconfig.Artist) o;
            %>
            <option value="<%= a.getId()%>"><%= a.getName()%></option>
            <%
                }

            %>
        </select>

        <div>
            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control" ng-model="form.name" required="">
            </div>  

            <div class="form-group">
                <label>Size</label>
                <input type="text" class="form-control" ng-model="form.size_p" required="">
            </div>
            <div class="form-group">
                <label>Medium</label>
                <input type="text" class="form-control" ng-model="form.medium" required="">
            </div>
            <div class="form-group">
                <label>Condition</label>
                <input type="text" class="form-control" ng-model="form.condition_p" required="">
            </div>
            <div class="form-group">
                <label>Sold By</label>
                <input type="text" class="form-control" ng-model="form.sold_By" required="">
            </div>
            <div class="form-group">
                <label>Price</label>
                <input type="text" class="form-control" ng-model="form.price" required="">
            </div>

        </div><!--End of hidden div-->

        <input type="file" file-model="feature_Img"/>
        <input type="file" file-model="cart_Img"/>

       <button type="submit" class="btn btn-default">{{status}}</button>
    </form>


    <script>
        angular.module("igu", [])
                .directive('fileModel', ['$parse', function ($parse) {
                        return {
                            restrict: 'A',
                            link: function (scope, element, attrs) {
                                var model = $parse(attrs.fileModel);
                                var modelSetter = model.assign;
                                element.bind('change', function () {
                                    scope.$apply(function () {
                                        modelSetter(scope, element[0].files[0]);
                                    });
                                });
                            }
                        };
                    }])
                .controller("indexCtr", ["$scope", "$http", function ($scope, $http) {
                        $scope.form = {
                            name: "Product Name1",
                            size_p: "200px X 400px",
                            medium: "This is MEdiaum",
                            condition_p: "this is condition",
                            sold_By: "sold by here",
                            price: "5000"
                        };

                        $scope.status="Upload";
                        $scope.uploadFile = function () {
                            console.log("Uploading Feature_Img..");                            
                             $scope.status = "Processing...";
                            var file = $scope.feature_Img;
                            var fd = new FormData();
                            fd.append('image', file);
                            $http({
                                method: 'POST',
                                url: "http://upchar.esy.es/upload.php",
                                headers: {'Content-Type': undefined},
                                data: fd
                            }).then(function successCallback(response) {
                                $scope.form.feature_Img = file.name;
                                uploadCartFile();
                            }, function errorCallback(response) {                                
                                 alert("Error While Uploading FEATURE IMAGE..");
                                 $scope.status = "Upload";
                            });
                        }

                        var uploadCartFile = function () {
                            console.log("Uploading cart_Img..");
                            var file = $scope.cart_Img;
                            var fd = new FormData();
                            fd.append('image', file);
                            $http({
                                method: 'POST',
                                url: "http://upchar.esy.es/upload.php",
                                headers: {'Content-Type': undefined},
                                data: fd
                            }).then(function successCallback(response) {
                                $scope.form.cart_Img = file.name;
                                uploadData();
                            }, function errorCallback(response) {
                                 alert("Error While Uploading CART IMAGE..");
                                 $scope.status = "Upload";
                            });
                        }

                        var uploadData = function () {
                            $http({
                                method: 'GET',
                                url: "addProduct_Action.jsp",
                                params: $scope.form
                            }).then(function successCallback(response) {
                               window.location.assign("listProduct.jsp");
                            }, function errorCallback(response) {
                                 alert("Error While Uploading DATA..");
                                 $scope.status = "Upload";
                            });
                        }

                    }]);
    </script>


</body>
</html>
