<%-- 
Name: Crystal Long
Assignment: Module 3.2
Purpose: Receive POSTed yearly review data and display values in an HTML table.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
  String nvl(String s) { return (s == null || s.trim().isEmpty()) ? "N/A" : s.trim(); }
  request.setCharacterEncoding("UTF-8");

  String fullName = request.getParameter("fullName");
  String email = request.getParameter("email");
  String contactPref = request.getParameter("contactPref");

  String itemName = request.getParameter("itemName");
  String purchaseYear = request.getParameter("purchaseYear");
  String usage = request.getParameter("usage");
  String overallRating = request.getParameter("overallRating");
  String yearlyNotes = request.getParameter("yearlyNotes");
  String recommend = request.getParameter("recommend"); // null if unchecked
  String comments = request.getParameter("comments");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Yearly Review Summary</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 20px; background-color: #E6DEFF; }
    table { border-collapse: collapse; width: 100%; max-width: 800px; }
    th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
    th { width: 260px; background: #f7f7f7; }
  </style>
</head>
<body>
  <h1>Submission Summary</h1>
  <p>This table displays the values you submitted.</p>

  <h2>General Information</h2>
  <table>
    <tr><th>Full Name</th><td><%= nvl(fullName) %></td></tr>
    <tr><th>Email</th><td><%= nvl(email) %></td></tr>
    <tr><th>Preferred Contact</th><td><%= nvl(contactPref) %></td></tr>
  </table>

  <h2>Yearly Product/Item Review</h2>
  <table>
    <tr><th>Item</th><td><%= nvl(itemName) %></td></tr>
    <tr><th>Purchase Year</th><td><%= nvl(purchaseYear) %></td></tr>
    <tr><th>Usage Frequency</th><td><%= nvl(usage) %></td></tr>
    <tr><th>Overall Rating (1–10)</th><td><%= nvl(overallRating) %></td></tr>
    <tr><th>Yearly Notes</th><td><%= nvl(yearlyNotes) %></td></tr>
    <tr><th>Would Recommend?</th><td><%= (recommend != null) ? "Yes" : "No" %></td></tr>
    <tr><th>Additional Comments</th><td><%= nvl(comments) %></td></tr>
  </table>

  <p><a href="form.jsp">&larr; Back to Form</a></p>
</body>
</html>
