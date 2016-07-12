<%-- 
    Document   : addArtist
    Created on : Jul 12, 2016, 9:38:49 AM
    Author     : yogesh
--%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/import/head.jsp"%>

        <%
            SessionFactory sessionFactory = com.hibconfig.HibernateUtil.getSessionFactory();
            Session hibsession = sessionFactory.openSession();
            Criteria cr = hibsession.createCriteria(com.hibconfig.Artist.class);
            cr.add(Restrictions.eq("id", Integer.parseInt(request.getParameter("id").toString())));
            com.hibconfig.Artist a=(com.hibconfig.Artist)cr.list().get(0);
        %>

    <form ng-submit="uploadFile();">
        <div>
            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control" ng-model="form.name" required="">
            </div>

            <div class="form-group">
                <label>Contact</label>
                <input type="text" class="form-control" ng-model="form.contact" required>
            </div>

            <div class="form-group">
                <label>Address</label>
                <textarea ng-model="form.address" class="form-control" required></textarea>
            </div>


            <div class="radio">
                <label>
                    <input type="radio" ng-model="form.gender" value="male" checked>Male
                </label>
            </div>
            <div class="radio">
                <label>
                    <input type="radio" ng-model="form.gender" value="female">Female
                </label>
            </div>
            <div class="form-group">
                <label>D.O.B</label>
                <input type="text" class="form-control" ng-model="form.dob" required>
            </div>

            <div class="form-group">
                <label>Facebook</label>
                <input type="text" class="form-control" ng-model="form.facebook" required>
            </div>


            <div class="form-group">
                <label>Summary</label>
                <textarea ng-model="form.summary" class="form-control" required></textarea>
            </div>

            <div class="form-group">
                <label>Qualification</label>
                <textarea ng-model="form.qualification" class="form-control" required></textarea>
            </div>

            <div class="form-group">
                <label>Award</label>
                <textarea ng-model="form.award" class="form-control" required></textarea>
            </div>

            <div class="form-group">
                <label>Solo</label>
                <textarea ng-model="form.solo" class="form-control" required></textarea>
            </div>

            <div class="form-group">
                <label>Group Show</label>
                <textarea ng-model="form.groupShow" class="form-control" required></textarea>
            </div>

            <div class="form-group">
                <label>Collection</label>
                <textarea ng-model="form.collection" class="form-control" required></textarea>
            </div>      
            
            <input type="text" ng-model="form.id" hidden="">
            
        </div><!--End of hidden div-->

        {{form}}

        <input type="file" file-model="myFile"/>

        <button type="submit" class="btn btn-default">Submit</button>
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
                        $scope.myFile = null;
                        $scope.form = {
                            id: "<%= a.getId()%>",
                            name: "<%= a.getName() %>",
                            contact: "<%= a.getContact() %>",
                            address: "<%= a.getAddress() %>",
                            gender: "<%= a.getGender() %>",
                            dob: "<%= a.getDob() %>",
                            summary: "<%= a.getSummary() %>",
                            facebook: "<%= a.getFacebook() %>",
                            qualification: "<%= a.getQualification() %>",
                            award: "<%= a.getAward() %>",
                            solo: "<%= a.getSolo() %>",
                            groupShow: "<%= a.getGroupShow() %>",
                            collection: "<%= a.getCollection() %>"
                        };

                        $scope.uploadFile = function () {
                            console.log("Uploading..");
                            var file = $scope.myFile;
                            if (file == null) {
                                $scope.form.photo = "null";
                                uploadData();
                            } else {
                                var fd = new FormData();
                                fd.append('image', file);
                                $http({
                                    method: 'POST',
                                    url: "http://upchar.esy.es/upload.php",
                                    headers: {'Content-Type': undefined},
                                    data: fd
                                }).then(function successCallback(response) {
                                    $scope.form.photo = file.name;
                                    uploadData();
                                }, function errorCallback(response) {
                                    console.log("Error");
                                });
                            }
                        }

                        var uploadData = function () {
                            $http({
                                method: 'GET',
                                url: "updateArtist_Action.jsp",
                                params: $scope.form
                            }).then(function successCallback(response) {
                                console.log("Ok Success " + response.data);
                            }, function errorCallback(response) {
                                console.log("Error Data");
                            });
                        }

                    }]);
    </script>


</body>
</html>
