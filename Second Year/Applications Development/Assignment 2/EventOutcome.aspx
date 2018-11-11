<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EventOutcome.aspx.cs" Inherits="EventOutcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <a href="AddEvents.aspx">Add Events</a>&nbsp;&nbsp;&nbsp;<a href="Events.aspx">View Events</a></p>
    <p>
        <h1>Event Outcome</h1>
    <asp:SqlDataSource ID="EventsOutcome" runat="server" ConnectionString="<%$ ConnectionStrings:databaseConnectionString %>" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:databaseConnectionString.ProviderName %>" SelectCommand="SELECT [Competitor_Medal] FROM [Event_Outcome]">
    </asp:SqlDataSource>
    </p>
    <p>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="Event_ID" DataSourceID="EventsOutcome" DefaultMode="Insert">
            <EditItemTemplate>
                Event_ID:
                <asp:Label ID="Event_IDLabel1" runat="server" Text='<%# Eval("Event_ID") %>' />
                <br />
                Competitor_ID:
                <asp:TextBox ID="Competitor_IDTextBox" runat="server" Text='<%# Bind("Competitor_ID") %>' />
                <br />
                Competitor_Position:
                <asp:TextBox ID="Competitor_PositionTextBox" runat="server" Text='<%# Bind("Competitor_Position") %>' />
                <br />
                Competitor_Medal:
                <asp:TextBox ID="Competitor_MedalTextBox" runat="server" Text='<%# Bind("Competitor_Medal") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Competitor_ID:
                <asp:TextBox ID="Competitor_IDTextBox" runat="server" Text='<%# Bind("Competitor_ID") %>' />
                <br />
                Competitor_Position:
                <asp:TextBox ID="Competitor_PositionTextBox" runat="server" Text='<%# Bind("Competitor_Position") %>' />
                <br />
                Competitor_Medal:
                <asp:TextBox ID="Competitor_MedalTextBox" runat="server" Text='<%# Bind("Competitor_Medal") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                Event_ID:
                <asp:Label ID="Event_IDLabel" runat="server" Text='<%# Eval("Event_ID") %>' />
                <br />
                Competitor_ID:
                <asp:Label ID="Competitor_IDLabel" runat="server" Text='<%# Bind("Competitor_ID") %>' />
                <br />
                Competitor_Position:
                <asp:Label ID="Competitor_PositionLabel" runat="server" Text='<%# Bind("Competitor_Position") %>' />
                <br />
                Competitor_Medal:
                <asp:Label ID="Competitor_MedalLabel" runat="server" Text='<%# Bind("Competitor_Medal") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </p>
</asp:Content>

