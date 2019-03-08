
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notes Details</title>
<style>

    body{
          background-color:Maroon;
          font-size:25px;
    }
    h1{
        text-align:center;
        color:black;
    }
    th{
         color:white;
    }
    input{
              font-size:20px;
              border-radius:5px;
              padding:5px;
        }
    input[type="submit"]{
          background-color:orange;
          font-size:20px;
          border-radius:5px;
          padding:5px;
          text-align:center;
    }
    #tab1,tr,th,td{
          border:2px solid black;
          border-collapse:collapse;
         }

    #tab2 {
          border:2px solid black;
          border-collapse:collapse;
    }
    button{
                 border-radius:4px;
                 color:Blue;
                 padding:5px;
         }
    button a:hover{

          background-color:red;
    }
</style>
</head>
<body>
<h1>NOTES DETAILS</h1>
	<!-- Create a form which will have text boxes for Note ID, title, content and status along with a Send 
		 button. Handle errors like empty fields -->
		 <center>
		 <c:if test="${error ne null}">
		 <p style="color:red">${error}</p>
		 </c:if>
		 <form action="/saveNote">
           <table id="tab2">

		     <tr><td> Note_ID</td> <td><input type="number" name="noteId" required min="1" pattern="[1-9]"></td></tr>
		     <tr><td> Title</td> <td><input type = "text" name="noteTitle" required></td></tr>
		     <tr><td> Content</td> <td><input type ="text" name="noteContent" required></td></tr>
		     <tr><td> Status</td> <td><input type = "text" name = "noteStatus" required></td></tr><br/><br/>
		   </table>
		    <input type="submit" value="Add to Records"/>
		 </form></center>

	<!-- display all existing notes in a tabular structure with Id, Title,Content,Status, Created Date and Action -->
    <c:if test="${list.size() >0}">
    <h1>Records</h1>
    <center>
	<table id="tab1">
      <tr>
	     <th>Note_ID</th>
	     <th>Title</th>
	     <th>Content</th>
	     <th>Status</th>
	     <th>CreatedAt</th>
      </tr>
      <c:forEach items="${list}" var="note">
      <tr>
      <td>${note.noteId}</td>
      <td>${note.noteTitle}</td>
      <td>${note.noteContent}</td>
      <td>${note.noteStatus}</td>
      <td>${note.createdAt}</td>
      <td><button><a href="<c:url value="/deleteNote?noteId=${note.noteId}" />">Delete</a></button></td>
      </tr>
      </c:forEach>
	</table>
	</center>
	</c:if>
</body>
</html>