<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchDatabase.aspx.cs" Inherits="SearchDatabase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Search Database:</p>
    <p>
        Please enter Event ID and press Enter</p>
    <p>
        <asp:TextBox ID="searchDatabaseTextbox" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:GridView ID="databaseGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Event_ID" DataSourceID="viewDatabase">
            <Columns>
                <asp:BoundField DataField="Event_ID" HeaderText="Event_ID" ReadOnly="True" SortExpression="Event_ID" />
                <asp:BoundField DataField="Game_ID" HeaderText="Game_ID" SortExpression="Game_ID" />
                <asp:CheckBoxField DataField="FeatureEvent" HeaderText="FeatureEvent" SortExpression="FeatureEvent" />
                <asp:BoundField DataField="EventVenue" HeaderText="EventVenue" SortExpression="EventVenue" />
                <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" />
                <asp:BoundField DataField="EventStartTime" HeaderText="EventStartTime" SortExpression="EventStartTime" />
                <asp:BoundField DataField="EventEndTime" HeaderText="EventEndTime" SortExpression="EventEndTime" />
                <asp:BoundField DataField="EventDescription" HeaderText="EventDescription" SortExpression="EventDescription" />
                <asp:BoundField DataField="WorldRecord" HeaderText="WorldRecord" SortExpression="WorldRecord" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="viewDatabase" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:databaseConnectionString %>" DeleteCommand="DELETE FROM [Event] WHERE [Event_ID] = ? AND (([Game_ID] = ?) OR ([Game_ID] IS NULL AND ? IS NULL)) AND [FeatureEvent] = ? AND (([EventVenue] = ?) OR ([EventVenue] IS NULL AND ? IS NULL)) AND (([EventDate] = ?) OR ([EventDate] IS NULL AND ? IS NULL)) AND (([EventStartTime] = ?) OR ([EventStartTime] IS NULL AND ? IS NULL)) AND (([EventEndTime] = ?) OR ([EventEndTime] IS NULL AND ? IS NULL)) AND (([EventDescription] = ?) OR ([EventDescription] IS NULL AND ? IS NULL)) AND (([WorldRecord] = ?) OR ([WorldRecord] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [Event] ([Event_ID], [Game_ID], [FeatureEvent], [EventVenue], [EventDate], [EventStartTime], [EventEndTime], [EventDescription], [WorldRecord]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:databaseConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Event] WHERE ([Event_ID] = ?)" UpdateCommand="UPDATE [Event] SET [Game_ID] = ?, [FeatureEvent] = ?, [EventVenue] = ?, [EventDate] = ?, [EventStartTime] = ?, [EventEndTime] = ?, [EventDescription] = ?, [WorldRecord] = ? WHERE [Event_ID] = ? AND (([Game_ID] = ?) OR ([Game_ID] IS NULL AND ? IS NULL)) AND [FeatureEvent] = ? AND (([EventVenue] = ?) OR ([EventVenue] IS NULL AND ? IS NULL)) AND (([EventDate] = ?) OR ([EventDate] IS NULL AND ? IS NULL)) AND (([EventStartTime] = ?) OR ([EventStartTime] IS NULL AND ? IS NULL)) AND (([EventEndTime] = ?) OR ([EventEndTime] IS NULL AND ? IS NULL)) AND (([EventDescription] = ?) OR ([EventDescription] IS NULL AND ? IS NULL)) AND (([WorldRecord] = ?) OR ([WorldRecord] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Event_ID" Type="Int32" />
                <asp:Parameter Name="original_Game_ID" Type="Int32" />
                <asp:Parameter Name="original_Game_ID" Type="Int32" />
                <asp:Parameter Name="original_FeatureEvent" Type="Boolean" />
                <asp:Parameter Name="original_EventVenue" Type="String" />
                <asp:Parameter Name="original_EventVenue" Type="String" />
                <asp:Parameter Name="original_EventDate" Type="DateTime" />
                <asp:Parameter Name="original_EventDate" Type="DateTime" />
                <asp:Parameter Name="original_EventStartTime" Type="DateTime" />
                <asp:Parameter Name="original_EventStartTime" Type="DateTime" />
                <asp:Parameter Name="original_EventEndTime" Type="DateTime" />
                <asp:Parameter Name="original_EventEndTime" Type="DateTime" />
                <asp:Parameter Name="original_EventDescription" Type="String" />
                <asp:Parameter Name="original_EventDescription" Type="String" />
                <asp:Parameter Name="original_WorldRecord" Type="String" />
                <asp:Parameter Name="original_WorldRecord" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Event_ID" Type="Int32" />
                <asp:Parameter Name="Game_ID" Type="Int32" />
                <asp:Parameter Name="FeatureEvent" Type="Boolean" />
                <asp:Parameter Name="EventVenue" Type="String" />
                <asp:Parameter Name="EventDate" Type="DateTime" />
                <asp:Parameter Name="EventStartTime" Type="DateTime" />
                <asp:Parameter Name="EventEndTime" Type="DateTime" />
                <asp:Parameter Name="EventDescription" Type="String" />
                <asp:Parameter Name="WorldRecord" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="searchDatabaseTextbox" Name="Event_ID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Game_ID" Type="Int32" />
                <asp:Parameter Name="FeatureEvent" Type="Boolean" />
                <asp:Parameter Name="EventVenue" Type="String" />
                <asp:Parameter Name="EventDate" Type="DateTime" />
                <asp:Parameter Name="EventStartTime" Type="DateTime" />
                <asp:Parameter Name="EventEndTime" Type="DateTime" />
                <asp:Parameter Name="EventDescription" Type="String" />
                <asp:Parameter Name="WorldRecord" Type="String" />
                <asp:Parameter Name="original_Event_ID" Type="Int32" />
                <asp:Parameter Name="original_Game_ID" Type="Int32" />
                <asp:Parameter Name="original_Game_ID" Type="Int32" />
                <asp:Parameter Name="original_FeatureEvent" Type="Boolean" />
                <asp:Parameter Name="original_EventVenue" Type="String" />
                <asp:Parameter Name="original_EventVenue" Type="String" />
                <asp:Parameter Name="original_EventDate" Type="DateTime" />
                <asp:Parameter Name="original_EventDate" Type="DateTime" />
                <asp:Parameter Name="original_EventStartTime" Type="DateTime" />
                <asp:Parameter Name="original_EventStartTime" Type="DateTime" />
                <asp:Parameter Name="original_EventEndTime" Type="DateTime" />
                <asp:Parameter Name="original_EventEndTime" Type="DateTime" />
                <asp:Parameter Name="original_EventDescription" Type="String" />
                <asp:Parameter Name="original_EventDescription" Type="String" />
                <asp:Parameter Name="original_WorldRecord" Type="String" />
                <asp:Parameter Name="original_WorldRecord" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

