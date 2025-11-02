<!--
Name: Crystal Long
Assignment: Module 3.2
Purpose: Collect yearly item review data and submit to display.jsp for summary output.
-->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Yearly Item Review (Simple)</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 20px; background-color: #E6DEFF; }
    h1 { margin-bottom: 6px; }
    .note { color: #555; margin-bottom: 16px; }
    label { display: block; margin-top: 8px; }
    input[type="text"], input[type="email"], input[type="number"], textarea, select { width: 100%; max-width: 480px; }
    textarea { height: 120px; }
    .actions { margin-top: 12px; }
  </style>
</head>
<body>
  <h1>Yearly Product/Item Review</h1>
  <div class="note">Fields with * are required.</div>

  <form action="display.jsp" method="post">
    <input type="hidden" name="topic" value="yearly_review">

    <label for="fullName">Full Name *</label>
    <input id="fullName" name="fullName" type="text" required>

    <label for="email">Email *</label>
    <input id="email" name="email" type="email" required>

    <label>Preferred Contact</label>
    <label><input type="radio" name="contactPref" value="Email" checked> Email</label>
    <label><input type="radio" name="contactPref" value="Phone"> Phone</label>
    <label><input type="radio" name="contactPref" value="Text"> Text</label>

    <hr>

    <label for="itemName">Item *</label>
    <input id="itemName" name="itemName" type="text" placeholder="e.g., 2022 Honda Civic" required>

    <label for="purchaseYear">Purchase Year *</label>
    <input id="purchaseYear" name="purchaseYear" type="number" min="1980" max="2100" step="1" required>

    <label for="usage">Usage Frequency</label>
    <select id="usage" name="usage">
      <option value="Daily">Daily</option>
      <option value="Weekly">Weekly</option>
      <option value="Monthly">Monthly</option>
      <option value="Rarely">Rarely</option>
    </select>

    <label for="overallRating">Overall Rating (1–10) *</label>
    <input id="overallRating" name="overallRating" type="number" min="1" max="10" step="1" required>

    <label for="yearlyNotes">Yearly Notes *</label>
    <textarea id="yearlyNotes" name="yearlyNotes" required></textarea>

    <label><input type="checkbox" name="recommend" value="Yes"> I recommend this item</label>

    <label for="comments">Additional Comments</label>
    <textarea id="comments" name="comments"></textarea>

    <div class="actions">
      <input type="reset" value="Clear">
      <input type="submit" value="Submit">
    </div>
  </form>
</body>
</html>
