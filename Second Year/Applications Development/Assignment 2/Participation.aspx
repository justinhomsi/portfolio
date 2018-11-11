<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Participation.aspx.cs" Inherits="Participation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <a href="AddCompetitors.aspx">Add Competitors</a>&nbsp;&nbsp;&nbsp; <a href="Competitors.aspx">View Competitors</a> </p>
        <h1>View Participation</h1>
    <asp:SqlDataSource ID="ViewParticipation" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:databaseConnectionString %>" DeleteCommand="DELETE FROM [Participation] WHERE [Game_ID] = ? AND [Competitor_ID] = ?" InsertCommand="INSERT INTO [Participation] ([Game_ID], [Competitor_ID]) VALUES (?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:databaseConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Participation]">
        <DeleteParameters>
            <asp:Parameter Name="original_Game_ID" Type="Int32" />
            <asp:Parameter Name="original_Competitor_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Game_ID" Type="Int32" />
            <asp:Parameter Name="Competitor_ID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Game_ID,Competitor_ID" DataSourceID="ViewParticipation">
            <Columns>
                <asp:BoundField DataField="Game_ID" HeaderText="Game_ID" ReadOnly="True" SortExpression="Game_ID" />
                <asp:BoundField DataField="Competitor_ID" HeaderText="Competitor_ID" ReadOnly="True" SortExpression="Competitor_ID" />
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>

