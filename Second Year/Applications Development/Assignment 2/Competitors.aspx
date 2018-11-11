<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Competitors.aspx.cs" Inherits="Competitors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
        <a href="AddCompetitors.aspx">Add Competitors</a>&nbsp;&nbsp;&nbsp; <a href="Participation.aspx">View Participation</a> 
       <h1>View Competitors</h1>
        <asp:SqlDataSource ID="ViewCompetitors" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:databaseConnectionString %>" DeleteCommand="DELETE FROM [Competitors] WHERE [Competitor_ID] = ? AND (([Competitor_Name] = ?) OR ([Competitor_Name] IS NULL AND ? IS NULL)) AND (([Competitor_Salutation] = ?) OR ([Competitor_Salutation] IS NULL AND ? IS NULL)) AND (([Competitor_DoB] = ?) OR ([Competitor_DoB] IS NULL AND ? IS NULL)) AND (([Competitor_Email] = ?) OR ([Competitor_Email] IS NULL AND ? IS NULL)) AND (([Competitor_Description] = ?) OR ([Competitor_Description] IS NULL AND ? IS NULL)) AND (([Competitor_Country] = ?) OR ([Competitor_Country] IS NULL AND ? IS NULL)) AND (([Competitor_ContactNo] = ?) OR ([Competitor_ContactNo] IS NULL AND ? IS NULL)) AND (([Competitor_Website] = ?) OR ([Competitor_Website] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [Competitors] ([Competitor_ID], [Competitor_Name], [Competitor_Salutation], [Competitor_DoB], [Competitor_Email], [Competitor_Description], [Competitor_Country], [Competitor_ContactNo], [Competitor_Website]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:databaseConnectionString.ProviderName %>" SelectCommand="SELECT [Competitor_ID], [Competitor_Name], [Competitor_Salutation], [Competitor_DoB], [Competitor_Email], [Competitor_Description], [Competitor_Country], [Competitor_ContactNo], [Competitor_Website] FROM [Competitors]" UpdateCommand="UPDATE [Competitors] SET [Competitor_Name] = ?, [Competitor_Salutation] = ?, [Competitor_DoB] = ?, [Competitor_Email] = ?, [Competitor_Description] = ?, [Competitor_Country] = ?, [Competitor_ContactNo] = ?, [Competitor_Website] = ? WHERE [Competitor_ID] = ? AND (([Competitor_Name] = ?) OR ([Competitor_Name] IS NULL AND ? IS NULL)) AND (([Competitor_Salutation] = ?) OR ([Competitor_Salutation] IS NULL AND ? IS NULL)) AND (([Competitor_DoB] = ?) OR ([Competitor_DoB] IS NULL AND ? IS NULL)) AND (([Competitor_Email] = ?) OR ([Competitor_Email] IS NULL AND ? IS NULL)) AND (([Competitor_Description] = ?) OR ([Competitor_Description] IS NULL AND ? IS NULL)) AND (([Competitor_Country] = ?) OR ([Competitor_Country] IS NULL AND ? IS NULL)) AND (([Competitor_ContactNo] = ?) OR ([Competitor_ContactNo] IS NULL AND ? IS NULL)) AND (([Competitor_Website] = ?) OR ([Competitor_Website] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Competitor_ID" Type="Int32" />
                <asp:Parameter Name="original_Competitor_Name" Type="String" />
                <asp:Parameter Name="original_Competitor_Name" Type="String" />
                <asp:Parameter Name="original_Competitor_Salutation" Type="String" />
                <asp:Parameter Name="original_Competitor_Salutation" Type="String" />
                <asp:Parameter Name="original_Competitor_DoB" Type="DateTime" />
                <asp:Parameter Name="original_Competitor_DoB" Type="DateTime" />
                <asp:Parameter Name="original_Competitor_Email" Type="String" />
                <asp:Parameter Name="original_Competitor_Email" Type="String" />
                <asp:Parameter Name="original_Competitor_Description" Type="String" />
                <asp:Parameter Name="original_Competitor_Description" Type="String" />
                <asp:Parameter Name="original_Competitor_Country" Type="String" />
                <asp:Parameter Name="original_Competitor_Country" Type="String" />
                <asp:Parameter Name="original_Competitor_ContactNo" Type="Int32" />
                <asp:Parameter Name="original_Competitor_ContactNo" Type="Int32" />
                <asp:Parameter Name="original_Competitor_Website" Type="String" />
                <asp:Parameter Name="original_Competitor_Website" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Competitor_ID" Type="Int32" />
                <asp:Parameter Name="Competitor_Name" Type="String" />
                <asp:Parameter Name="Competitor_Salutation" Type="String" />
                <asp:Parameter Name="Competitor_DoB" Type="DateTime" />
                <asp:Parameter Name="Competitor_Email" Type="String" />
                <asp:Parameter Name="Competitor_Description" Type="String" />
                <asp:Parameter Name="Competitor_Country" Type="String" />
                <asp:Parameter Name="Competitor_ContactNo" Type="Int32" />
                <asp:Parameter Name="Competitor_Website" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Competitor_Name" Type="String" />
                <asp:Parameter Name="Competitor_Salutation" Type="String" />
                <asp:Parameter Name="Competitor_DoB" Type="DateTime" />
                <asp:Parameter Name="Competitor_Email" Type="String" />
                <asp:Parameter Name="Competitor_Description" Type="String" />
                <asp:Parameter Name="Competitor_Country" Type="String" />
                <asp:Parameter Name="Competitor_ContactNo" Type="Int32" />
                <asp:Parameter Name="Competitor_Website" Type="String" />
                <asp:Parameter Name="original_Competitor_ID" Type="Int32" />
                <asp:Parameter Name="original_Competitor_Name" Type="String" />
                <asp:Parameter Name="original_Competitor_Name" Type="String" />
                <asp:Parameter Name="original_Competitor_Salutation" Type="String" />
                <asp:Parameter Name="original_Competitor_Salutation" Type="String" />
                <asp:Parameter Name="original_Competitor_DoB" Type="DateTime" />
                <asp:Parameter Name="original_Competitor_DoB" Type="DateTime" />
                <asp:Parameter Name="original_Competitor_Email" Type="String" />
                <asp:Parameter Name="original_Competitor_Email" Type="String" />
                <asp:Parameter Name="original_Competitor_Description" Type="String" />
                <asp:Parameter Name="original_Competitor_Description" Type="String" />
                <asp:Parameter Name="original_Competitor_Country" Type="String" />
                <asp:Parameter Name="original_Competitor_Country" Type="String" />
                <asp:Parameter Name="original_Competitor_ContactNo" Type="Int32" />
                <asp:Parameter Name="original_Competitor_ContactNo" Type="Int32" />
                <asp:Parameter Name="original_Competitor_Website" Type="String" />
                <asp:Parameter Name="original_Competitor_Website" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Competitor_ID" DataSourceID="ViewCompetitors">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Competitor_ID" HeaderText="Competitor_ID" ReadOnly="True" SortExpression="Competitor_ID" />
                <asp:BoundField DataField="Competitor_Name" HeaderText="Competitor_Name" SortExpression="Competitor_Name" />
                <asp:BoundField DataField="Competitor_Salutation" HeaderText="Competitor_Salutation" SortExpression="Competitor_Salutation" />
                <asp:BoundField DataField="Competitor_DoB" HeaderText="Competitor_DoB" SortExpression="Competitor_DoB" />
                <asp:BoundField DataField="Competitor_Email" HeaderText="Competitor_Email" SortExpression="Competitor_Email" />
                <asp:BoundField DataField="Competitor_Description" HeaderText="Competitor_Description" SortExpression="Competitor_Description" />
                <asp:BoundField DataField="Competitor_Country" HeaderText="Competitor_Country" SortExpression="Competitor_Country" />
                <asp:BoundField DataField="Competitor_ContactNo" HeaderText="Competitor_ContactNo" SortExpression="Competitor_ContactNo" />
                <asp:BoundField DataField="Competitor_Website" HeaderText="Competitor_Website" SortExpression="Competitor_Website" />
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>

