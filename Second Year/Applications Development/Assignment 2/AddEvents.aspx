<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddEvents.aspx.cs" Inherits="AddEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <a href="Events.aspx">View Events</a>&nbsp;&nbsp;&nbsp; <a href="EventOutcome.aspx">Event Outcome</a></p>
        <h1>Add Events</h1>
    <p>
        <asp:SqlDataSource ID="AddEvent" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:databaseConnectionString %>" DeleteCommand="DELETE FROM [Event] WHERE [Event_ID] = ? AND (([Game_ID] = ?) OR ([Game_ID] IS NULL AND ? IS NULL)) AND (([FeatureEvent] = ?) OR ([FeatureEvent] IS NULL AND ? IS NULL)) AND (([EventVenue] = ?) OR ([EventVenue] IS NULL AND ? IS NULL)) AND (([EventDate] = ?) OR ([EventDate] IS NULL AND ? IS NULL)) AND (([EventStartTime] = ?) OR ([EventStartTime] IS NULL AND ? IS NULL)) AND (([EventEndTime] = ?) OR ([EventEndTime] IS NULL AND ? IS NULL)) AND (([EventDescription] = ?) OR ([EventDescription] IS NULL AND ? IS NULL)) AND (([WorldRecord] = ?) OR ([WorldRecord] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [Event] ([Event_ID], [Game_ID], [FeatureEvent], [EventVenue], [EventDate], [EventStartTime], [EventEndTime], [EventDescription], [WorldRecord]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:databaseConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Event]" UpdateCommand="UPDATE [Event] SET [Game_ID] = ?, [FeatureEvent] = ?, [EventVenue] = ?, [EventDate] = ?, [EventStartTime] = ?, [EventEndTime] = ?, [EventDescription] = ?, [WorldRecord] = ? WHERE [Event_ID] = ? AND (([Game_ID] = ?) OR ([Game_ID] IS NULL AND ? IS NULL)) AND (([FeatureEvent] = ?) OR ([FeatureEvent] IS NULL AND ? IS NULL)) AND (([EventVenue] = ?) OR ([EventVenue] IS NULL AND ? IS NULL)) AND (([EventDate] = ?) OR ([EventDate] IS NULL AND ? IS NULL)) AND (([EventStartTime] = ?) OR ([EventStartTime] IS NULL AND ? IS NULL)) AND (([EventEndTime] = ?) OR ([EventEndTime] IS NULL AND ? IS NULL)) AND (([EventDescription] = ?) OR ([EventDescription] IS NULL AND ? IS NULL)) AND (([WorldRecord] = ?) OR ([WorldRecord] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Event_ID" Type="Int32" />
                <asp:Parameter Name="original_Game_ID" Type="Int32" />
                <asp:Parameter Name="original_Game_ID" Type="Int32" />
                <asp:Parameter Name="original_FeatureEvent" Type="String" />
                <asp:Parameter Name="original_FeatureEvent" Type="String" />
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
                <asp:Parameter Name="FeatureEvent" Type="String" />
                <asp:Parameter Name="EventVenue" Type="String" />
                <asp:Parameter Name="EventDate" Type="DateTime" />
                <asp:Parameter Name="EventStartTime" Type="DateTime" />
                <asp:Parameter Name="EventEndTime" Type="DateTime" />
                <asp:Parameter Name="EventDescription" Type="String" />
                <asp:Parameter Name="WorldRecord" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Game_ID" Type="Int32" />
                <asp:Parameter Name="FeatureEvent" Type="String" />
                <asp:Parameter Name="EventVenue" Type="String" />
                <asp:Parameter Name="EventDate" Type="DateTime" />
                <asp:Parameter Name="EventStartTime" Type="DateTime" />
                <asp:Parameter Name="EventEndTime" Type="DateTime" />
                <asp:Parameter Name="EventDescription" Type="String" />
                <asp:Parameter Name="WorldRecord" Type="String" />
                <asp:Parameter Name="original_Event_ID" Type="Int32" />
                <asp:Parameter Name="original_Game_ID" Type="Int32" />
                <asp:Parameter Name="original_Game_ID" Type="Int32" />
                <asp:Parameter Name="original_FeatureEvent" Type="String" />
                <asp:Parameter Name="original_FeatureEvent" Type="String" />
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
    <p>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="Event_ID" DataSourceID="AddEvent" DefaultMode="Insert">
            <EditItemTemplate>
                Event_ID:
                <asp:Label ID="Event_IDLabel1" runat="server" Text='<%# Eval("Event_ID") %>' />
                <br />
                Game_ID:
                <asp:TextBox ID="Game_IDTextBox" runat="server" Text='<%# Bind("Game_ID") %>' />
                <br />
                FeatureEvent:
                <asp:TextBox ID="FeatureEventTextBox" runat="server" Text='<%# Bind("FeatureEvent") %>' />
                <br />
                EventVenue:
                <asp:TextBox ID="EventVenueTextBox" runat="server" Text='<%# Bind("EventVenue") %>' />
                <br />
                EventDate:
                <asp:TextBox ID="EventDateTextBox" runat="server" Text='<%# Bind("EventDate") %>' />
                <br />
                EventStartTime:
                <asp:TextBox ID="EventStartTimeTextBox" runat="server" Text='<%# Bind("EventStartTime") %>' />
                <br />
                EventEndTime:
                <asp:TextBox ID="EventEndTimeTextBox" runat="server" Text='<%# Bind("EventEndTime") %>' />
                <br />
                EventDescription:
                <asp:TextBox ID="EventDescriptionTextBox" runat="server" Text='<%# Bind("EventDescription") %>' />
                <br />
                WorldRecord:
                <asp:TextBox ID="WorldRecordTextBox" runat="server" Text='<%# Bind("WorldRecord") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Game_ID:
                <asp:TextBox ID="Game_IDTextBox" runat="server" Text='<%# Bind("Game_ID") %>' />
                <br />
                FeatureEvent:
                <asp:TextBox ID="FeatureEventTextBox" runat="server" Text='<%# Bind("FeatureEvent") %>' />
                <br />
                EventVenue:
                <asp:TextBox ID="EventVenueTextBox" runat="server" Text='<%# Bind("EventVenue") %>' />
                <br />
                EventDate:
                <asp:TextBox ID="EventDateTextBox" runat="server" Text='<%# Bind("EventDate") %>' />
                <br />
                EventStartTime:
                <asp:TextBox ID="EventStartTimeTextBox" runat="server" Text='<%# Bind("EventStartTime") %>' />
                <br />
                EventEndTime:
                <asp:TextBox ID="EventEndTimeTextBox" runat="server" Text='<%# Bind("EventEndTime") %>' />
                <br />
                EventDescription:
                <asp:TextBox ID="EventDescriptionTextBox" runat="server" Text='<%# Bind("EventDescription") %>' />
                <br />
                WorldRecord:
                <asp:TextBox ID="WorldRecordTextBox" runat="server" Text='<%# Bind("WorldRecord") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                Event_ID:
                <asp:Label ID="Event_IDLabel" runat="server" Text='<%# Eval("Event_ID") %>' />
                <br />
                Game_ID:
                <asp:Label ID="Game_IDLabel" runat="server" Text='<%# Bind("Game_ID") %>' />
                <asp:RequiredFieldValidator ID="gameIDRequiredValidator" runat="server" ErrorMessage="gameIDRequiredValidator" Text='<%# Eval("Game_ID") %>'></asp:RequiredFieldValidator>
                <br />
                FeatureEvent:
                <asp:Label ID="FeatureEventLabel" runat="server" Text='<%# Bind("FeatureEvent") %>' />
                <br />
                EventVenue:
                <asp:Label ID="EventVenueLabel" runat="server" Text='<%# Bind("EventVenue") %>' />
                <asp:RequiredFieldValidator ID="eventVenueRequiredValidator" runat="server" ErrorMessage="eventVenueRequiredValidator" Text='<%# Eval("EventVenue") %>'></asp:RequiredFieldValidator>
                <br />
                EventDate:
                <asp:Label ID="EventDateLabel" runat="server" Text='<%# Bind("EventDate") %>' />
                <br />
                EventStartTime:
                <asp:Label ID="EventStartTimeLabel" runat="server" Text='<%# Bind("EventStartTime") %>' />
                <br />
                EventEndTime:
                <asp:Label ID="EventEndTimeLabel" runat="server" Text='<%# Bind("EventEndTime") %>' />
                <br />
                EventDescription:<asp:RequiredFieldValidator ID="eventDescriptionRequiredValidator" runat="server" ErrorMessage="eventDescRequiredValidator" Text='<%# Eval("EventDescription") %>'></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="EventDescriptionLabel" runat="server" Text='<%# Bind("EventDescription") %>' />
                <br />
                WorldRecord:
                <asp:Label ID="WorldRecordLabel" runat="server" Text='<%# Bind("WorldRecord") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </p>
</asp:Content>

