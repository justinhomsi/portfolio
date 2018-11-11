<%
' Declare Variables
Dim yearOfGames
Dim cityOfGames
Dim commenceDate
Dim endDate


' Array creation
	'Create array for storing competitor names
		Dim compName()
		ReDim compName(x + 0)
	' Create array for storing medals
		Dim medalsWon()
		ReDim medalsWon(x + 0)
	' Create array for storing world records
		Dim worldRecord()
		ReDim worldRecord(x + 0)
	' Create array for storing error messages
		Dim arrErrorMessages()
		ReDim arrErrorMessages(x + 0)
	' Create array for storing countries
		Dim Countries()
		ReDim Countries(x + 0)
	'Create array for storing events
		Dim Events()
		ReDim Events(x + 0)
	' Create array for results
		Dim Results()
		ReDim Results(4, x + 0)
	'Create array for position
		Dim Position()
		ReDim Position(1, x + 0)


' Initialize formValid for validation
Dim formValid
formValid = TRUE

' Gets textbox data from form
yearOfGames = trim(request.form("YearOfGames"))
cityOfGames = trim(request.form("CityOfGames"))
commenceDate = trim(request.form("CommenceDate"))
endDate = trim(request.form("EndDate"))


'Get competitors, medals and world record from form table
for n = 0 to 25
	ReDim Preserve compName(n) 
	compName(n) = trim(request.form("CompName_R_" + CStr(n)))
	ReDim Preserve medalsWon(n) 
	medalsWon(n) = trim(request.form("MedalWon_R_" + CStr(n)))
	ReDim Preserve worldRecord(n) 
	worldRecord(n) = trim(request.form("WorldRecord_R_" + CStr(n)))
	ReDim Preserve Countries(n)
	Countries(n) = trim(request.form("CountryList_R_" + CStr(n)))
	ReDim Preserve Events(n)
	Events(n) = trim(request.form("Event_R_" + CStr(n)))
next


' Setting pattern variables for validation
	' Pattern for alphabet validation
		Dim characterPattern
		set characterPattern = CreateObject("vbscript.regexp")
		characterPattern.Pattern = "^[a-zA-Z\'\-\ ]{1,50}$"
	' Pattern for numeric validation
		Dim numberPattern
		set numberPattern = CreateObject("vbscript.regexp")
		numberPattern.Pattern = "^[0-9]{4}$"
	'Pattern for date format validation
		Dim datePattern
		set datePattern = CreateObject("vbscript.regexp")
		datePattern.Pattern = "(((0|1)[1-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((\d\d\d\d)))$"
	'Pattern for name validation
		Dim namePattern
		set namePattern = CreateObject("vbscript.regexp")
		namePattern.Pattern = "^[a-zA-Z\'\-\ ]{5,100}$"
	'Pattern for medal validation
		Dim medalPattern
		set medalPattern = CreateObject("vbscript.regexp")
		medalPattern.Pattern = "^[GSB]{1}$"
	'Pattern for world record validation
		Dim recordPattern
		set recordPattern = CreateObject("vbscript.regexp")
		recordPattern.Pattern = "^[YN]{1}$"

		
		
' Validate year of games
if not (numberPattern.test(YearOfGames)) then
	ReDim Preserve arrErrorMessages((UBound(arrErrorMessages)) + 1)
	arrErrorMessages(UBound(arrErrorMessages)) = "Year is not valid (must be a 4 digit number)"
	formValid = FALSE
end if

'Validate city of games
if not (characterPattern.test(CityOfGames)) then
	ReDim Preserve arrErrorMessages((UBound(arrErrorMessages)) + 1)
	arrErrorMessages(UBound(arrErrorMessages)) = "City is not valid (must be alphabetical and not blank)"
	formValid = FALSE
end if

'Validate Dates
if (datePattern.test(commenceDate)) and (datePattern.test(endDate)) then
	if cdate(commenceDate) > cdate(endDate) then
		ReDim Preserve arrErrorMessages((UBound(arrErrorMessages)) + 1)
		arrErrorMessages(UBound(arrErrorMessages)) = "Please ensure commence date comes before end date."
		formValid = FALSE
	end if
ElseIf not (datePattern.test(commenceDate)) then
	ReDim Preserve arrErrorMessages((UBound(arrErrorMessages)) + 1)
	arrErrorMessages(UBound(arrErrorMessages)) = "Invalid Commence Date (must be DD/MM/YYYY)."
	formValid = FALSE
ElseIf not (datePattern.test(endDate)) then
	ReDim Preserve arrErrorMessages((UBound(arrErrorMessages)) + 1)
	arrErrorMessages(UBound(arrErrorMessages)) = "Invalid End Date (must be DD/MM/YYYY)."
	formValid = FALSE
end if

'Validate competitor name
for x = 0 to ((UBound(compName)))
	if not (namePattern.test(compName(x))) and not (trim(medalsWon(x)) = "") and not (trim(worldRecord(x)) = "") then
		ReDim Preserve arrErrorMessages((UBound(arrErrorMessages)) + 1)
		arrErrorMessages(UBound(arrErrorMessages)) = "Competitor Name " +CStr(x)+ " must not be blank, must contain atleast 5 characters and have no numbers"
		formValid = FALSE
	end if
next

'Validate medals
for x = 0 to ((UBound(medalsWon)))
	if not (medalPattern.test(medalsWon(x))) and not (trim(compName(x)) = "") and not (trim(worldRecord(x)) = "") then
		ReDim Preserve arrErrorMessages((UBound(arrErrorMessages)) + 1)
		arrErrorMessages(UBound(arrErrorMessages)) = "Invalid medal " +CStr(x)+" (must be G for Gold, S for Silver, or B for Bronze)"
		formValid = FALSE
	end if
next

'Validate world record
for x = 0 to ((UBound(worldRecord)))
	if not (recordPattern.test(worldRecord(x))) and not (trim(compName(x)) = "") and not (trim(medalsWon(x)) = "") then
		ReDim Preserve arrErrorMessages((UBound(arrErrorMessages)) + 1)
		arrErrorMessages(UBound(arrErrorMessages)) = "Invalid world record " + CStr(x)+ " entry (must be Y for yes or N for no)"
		formValid = FALSE
	end if
next

' Add countries to results array
for x = 0 to (UBound(Countries))
varDuplicate = 0
	if not medalsWon(x) = "" then
	
		for a = 0 to UBound(Results, 2)
			if Results(0,a) = Countries(x) then
				varDuplicate = 1
			end if
		next
		
		if varDuplicate = 0 then
			ReDim Preserve Results(4, (UBound(Results, 2)) + 1)
			Results(0, (UBound(Results, 2))) = Countries(x)
		end if
	end if
next


'zeroing counters
for x = 0 to (UBound(Results, 2))
	Results(1, x) = 0
	Results(2, x) = 0
	Results(3, x) = 0
next

'Add gold medal count to results array
for x = 0 to (UBound(medalsWon))
	if medalsWon(x) = "G" then
		for a = 0 to (UBound(Results, 2))
			if Results(0, a) = Countries(x) then
				Results(1, a) = Results(1, a) + 1
			end if
		next
	end if
next

'Add silver medal count to results array
for x = 1 to (UBound(medalsWon))
	if medalsWon(x) = "S" then
		for a = 0 to (UBound(Results, 2))
			if Results(0, a) = Countries(x) then
				Results(2, a) = Results(2, a) + 1
			end if
		next
	end if
next

'Add bronze medal count to results array
for x = 1 to (UBound(medalsWon))
	if medalsWon(x) = "B" then
		for a = 0 to (UBound(Results, 2))
			if Results(0, a) = Countries(x) then
				Results(3, a) = Results(3, a) + 1
			end if
		next
	end if
next

'Create array for storing world record setters
Dim Records()
ReDim Records(1, x + 0)

' Loop through and find world record setters and store their name and the event
for x = 1 to 25
	if worldRecord(x) = "Y" and not (compName(x) = "") and not (medalsWon(x) = "") then
		ReDim Preserve Records(1, (UBound(Records, 2)) + 1)
		Records(0, (UBound(Records, 2))) = compName(x)
		Records(1, (UBound(Records, 2))) = Events(x)
	end if
next

'Determine total medal count for each country
for x = 0 to (UBound(Results, 2))
	if Results(0, x) = Countries(x) then
		for a = 0 to (UBound(Results, 2))
			ReDim Preserve Results(4, (UBound(Results, 2)))
			Results(4, a) = Results(1, a) + Results(2, a) + Results(3, a)
		next
	end if
next


'sort by total medal count
for i=1 to ubound(Results, 2)-1
for j = i+1 to ubound(Results, 2)
if Results(4, j) => Results(4, i) then
nTemp = Results(0, j)
nTemp2 = Results(1, j)
nTemp3 = Results(2, j)
nTemp4 = Results(3, j)
nTemp5 = Results(4, j)
Results(0, j) = Results(0, i)
Results(1, j) = Results(1, i)
Results(2, j) = Results(2, i)
Results(3, j) = Results(3, i)
Results(4, j) = Results(4, i)
Results(0, i) = nTemp
Results(1, i) = nTemp2
Results(2, i) = nTemp3
Results(3, i) = nTemp4
Results(4, i) = nTemp5
end if
next
next



' add countries to Position array
for x = 0 to (UBound(Results, 2))
	if not (Results(0, x) = "") then
		for a = 0 to (UBound(Position, 2))
			if Position(0, a) = Results(0, x) then
				varDuplicate = 1
			end if
		next
		
		if varDuplicate = 0 then
			ReDim Preserve Position(1, (UBound(Position, 2)) + 1)
			Position(0, a) = Results(0, x)
		end if
	end if
next
		
		
' Loop to determine country positions based on medals won	
posCount = 1
for x = 1 to UBound(Position, 2)
	if Position(0, x) = Countries(x) then
		for a = 1 to (UBound(Position, 2))
				if a = 1 then
					Position(1, a) = posCount
				elseif Results(4, a) = Results(4, a - 1) and (Results(1, a) = Results(1, a - 1)) and (Results(2, a) = Results(2, a - 1)) and (Results(3, a) = Results(3, a - 1)) then
					Position(1, a) = posCount
				elseif Results(4, a) = Results(4, a - 1) then
					Position(1, a) = posCount
				elseif Results(4, a) < Results(4, a - 1) then
					posCount = posCount + 1
					Position(1, a) = posCount
				elseif Results(4, a) > Results(4, a - 1) then
					posCount = posCount - 1
					Position(1, a) = posCount
				end if
		next
	end if
next


%>
	<html>
	<meta charset="UTF-8">
<head>
<style>
table, th, td {
    border: 1px solid black;
}
</style>
</head>
<body>

<table style="width:100%">
  <tr>
    <th>Position</th>
    <th>Country</th>
    <th>Gold</th>
	<th>Silver</th>
    <th>Bronze</th>
    <th>Total</th>
  </tr>
<%For x = 1 to UBound(Position, 2)
%>
  <tr>
  <td><%response.write(Position(1,x))%></td>
    <td><%response.write(Position(0,x))%></td>
    <td><%response.write(Results(1, x))%></td>
	<td><%response.write(Results(2, x))%></td>
    <td><%response.write(Results(3, x))%></td>
    <td><%response.write(Results(4, x))%></td>
  </tr>
  <%
  next
  %>
</table>
</br>
</body>
</html>
<%

' Loop through world record holders and print their name and event
for rcount = 1 to UBound(Records, 2)
	if not (Records(0, rcount) = "") and not (Records(1, rcount) = "") then
		LineNo = rcount + 1
		response.write(Records(0, rcount) + " set the world record in " + Records(1, rcount))
		%><br><%
	end if
next


' Display error messages
if formValid = FALSE then
	for counter = 0 to (UBound(arrErrorMessages))
		response.write(arrErrorMessages(counter) + "<br>")
	next
	else
	%>
	<br /><input type="button" name="back" value="Back to Form" onClick="window.history.back()">
	<%
end if
%>