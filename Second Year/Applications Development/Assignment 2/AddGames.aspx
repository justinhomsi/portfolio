<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddGames.aspx.cs" Inherits="AddGames" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <a href="Games.aspx">View Games</a></p>
        <h1>Add Games<asp:SqlDataSource ID="AddGame" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:databaseConnectionString %>" DeleteCommand="DELETE FROM [Games] WHERE [Game_ID] = ? AND (([Game_Code] = ?) OR ([Game_Code] IS NULL AND ? IS NULL)) AND (([Game_Name] = ?) OR ([Game_Name] IS NULL AND ? IS NULL)) AND (([Game_DurationInHours] = ?) OR ([Game_DurationInHours] IS NULL AND ? IS NULL)) AND (([Game_Description] = ?) OR ([Game_Description] IS NULL AND ? IS NULL)) AND (([Field1] = ?) OR ([Field1] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [Games] ([Game_ID], [Game_Code], [Game_Name], [Game_DurationInHours], [Game_Description], [Field1]) VALUES (?, ?, ?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:databaseConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Games]" UpdateCommand="UPDATE [Games] SET [Game_Code] = ?, [Game_Name] = ?, [Game_DurationInHours] = ?, [Game_Description] = ?, [Field1] = ? WHERE [Game_ID] = ? AND (([Game_Code] = ?) OR ([Game_Code] IS NULL AND ? IS NULL)) AND (([Game_Name] = ?) OR ([Game_Name] IS NULL AND ? IS NULL)) AND (([Game_DurationInHours] = ?) OR ([Game_DurationInHours] IS NULL AND ? IS NULL)) AND (([Game_Description] = ?) OR ([Game_Description] IS NULL AND ? IS NULL)) AND (([Field1] = ?) OR ([Field1] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Game_ID" Type="Int32" />
                <asp:Parameter Name="original_Game_Code" Type="String" />
                <asp:Parameter Name="original_Game_Code" Type="String" />
                <asp:Parameter Name="original_Game_Name" Type="String" />
                <asp:Parameter Name="original_Game_Name" Type="String" />
                <asp:Parameter Name="original_Game_DurationInHours" Type="Int32" />
                <asp:Parameter Name="original_Game_DurationInHours" Type="Int32" />
                <asp:Parameter Name="original_Game_Description" Type="String" />
                <asp:Parameter Name="original_Game_Description" Type="String" />
                <asp:Parameter Name="original_Field1" Type="String" />
                <asp:Parameter Name="original_Field1" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Game_ID" Type="Int32" />
                <asp:Parameter Name="Game_Code" Type="String" />
                <asp:Parameter Name="Game_Name" Type="String" />
                <asp:Parameter Name="Game_DurationInHours" Type="Int32" />
                <asp:Parameter Name="Game_Description" Type="String" />
                <asp:Parameter Name="Field1" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Game_Code" Type="String" />
                <asp:Parameter Name="Game_Name" Type="String" />
                <asp:Parameter Name="Game_DurationInHours" Type="Int32" />
                <asp:Parameter Name="Game_Description" Type="String" />
                <asp:Parameter Name="original_Game_ID" Type="Int32" />
                <asp:Parameter Name="original_Game_Code" Type="String" />
                <asp:Parameter Name="original_Game_Code" Type="String" />
                <asp:Parameter Name="original_Game_Name" Type="String" />
                <asp:Parameter Name="original_Game_Name" Type="String" />
                <asp:Parameter Name="original_Game_DurationInHours" Type="Int32" />
                <asp:Parameter Name="original_Game_DurationInHours" Type="Int32" />
                <asp:Parameter Name="original_Game_Description" Type="String" />
                <asp:Parameter Name="original_Game_Description" Type="String" />
                <asp:Parameter Name="original_Game_Description" Type="String" />
                <asp:Parameter Name="original_Field1" Type="String" />
                <asp:Parameter Name="original_Field1" Type="String" />
            </UpdateParameters>
            </asp:SqlDataSource>
    </h1>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Game_ID" DataSourceID="AddGame" DefaultMode="Insert">
        <EditItemTemplate>
            Game_ID:
            <asp:Label ID="Game_IDLabel1" runat="server" Text='<%# Eval("Game_ID") %>' />
            <br />
            Game_Code:
            <asp:TextBox ID="Game_CodeTextBox" runat="server" Text='<%# Bind("Game_Code") %>' />
            <br />
            Game_Name:
            <asp:TextBox ID="Game_NameTextBox" runat="server" Text='<%# Bind("Game_Name") %>' />
            <br />
            Game_DurationInHours:
            <asp:TextBox ID="Game_DurationInHoursTextBox" runat="server" Text='<%# Bind("Game_DurationInHours") %>' />
            <br />
            Game_Description:
            <asp:TextBox ID="Game_DescriptionTextBox" runat="server" Text='<%# Bind("Game_Description") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Game_ID:
            <asp:TextBox ID="Game_IDTextBox" runat="server" Text='<%# Bind("Game_ID") %>' />
            <br />
            Game_Code:
            <asp:TextBox ID="Game_CodeTextBox" runat="server" Text='<%# Bind("Game_Code") %>' />
            <br />
            Game_Name:
            <asp:TextBox ID="Game_NameTextBox" runat="server" Text='<%# Bind("Game_Name") %>' />
            <br />
            Game_DurationInHours:
            <asp:TextBox ID="Game_DurationInHoursTextBox" runat="server" Text='<%# Bind("Game_DurationInHours") %>' />
            <br />
            Game_Description:
            <asp:TextBox ID="Game_DescriptionTextBox" runat="server" Text='<%# Bind("Game_Description") %>' />
            <br />
            Game_RulesBooklet:
            <asp:FileUpload ID="gameRulesBookletUpload" runat="server" Enabled='<%# Bind("Field1") %>' />
            <asp:RequiredFieldValidator ID="gameRulesBookletRequiredValidator" runat="server" ControlToValidate="gameRulesBookletUpload" ErrorMessage="Rules booklet is required" Text='<%# Eval("Field1") %>'></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Game_ID:
            <asp:Label ID="Game_IDLabel" runat="server" Text='<%# Eval("Game_ID") %>' />
            <br />
            Game_Code:
            <asp:RegularExpressionValidator ID="gameCodeRegexpValidator" runat="server" ErrorMessage="Game Code must be 7 characters long and contain 4 uppercase letters and 3 numbers" Text='<%# Eval("Game_Code") %>' ValidationExpression="^[A-Z]{4}[0-9]{3}$"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="gameCodeRequiredValidator" runat="server" ErrorMessage="Game Code cannot be blank" Text='<%# Eval("Game_Code") %>'></asp:RequiredFieldValidator>
            <asp:Label ID="Game_CodeLabel" runat="server" Text='<%# Bind("Game_Code") %>' />
            <br />
            Game_Name:
            <asp:RequiredFieldValidator ID="gameNameRequiredValidator" runat="server" ErrorMessage="Game Name cannot be blank" Text='<%# Eval("Game_Name") %>'></asp:RequiredFieldValidator>
            <asp:Label ID="Game_NameLabel" runat="server" Text='<%# Bind("Game_Name") %>' />
            <br />
            Game_DurationInHours:
            <asp:Label ID="Game_DurationInHoursLabel" runat="server" Text='<%# Bind("Game_DurationInHours") %>' />
            <br />
            Game_Description:
            <asp:Label ID="Game_DescriptionLabel" runat="server" Text='<%# Bind("Game_Description") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    </asp:Content>

