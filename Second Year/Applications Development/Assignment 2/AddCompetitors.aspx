<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddCompetitors.aspx.cs" Inherits="AddCompetitors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <a href="Competitors.aspx">View Competitors</a> </p>
        <h1>Add Competitors<asp:SqlDataSource ID="AddCompetitor" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:databaseConnectionString %>" DeleteCommand="DELETE FROM [Competitors] WHERE [Competitor_ID] = ? AND (([Competitor_Name] = ?) OR ([Competitor_Name] IS NULL AND ? IS NULL)) AND (([Competitor_Salutation] = ?) OR ([Competitor_Salutation] IS NULL AND ? IS NULL)) AND (([Competitor_DoB] = ?) OR ([Competitor_DoB] IS NULL AND ? IS NULL)) AND (([Competitor_Email] = ?) OR ([Competitor_Email] IS NULL AND ? IS NULL)) AND (([Competitor_Description] = ?) OR ([Competitor_Description] IS NULL AND ? IS NULL)) AND (([Competitor_Country] = ?) OR ([Competitor_Country] IS NULL AND ? IS NULL)) AND (([Competitor_Gender] = ?) OR ([Competitor_Gender] IS NULL AND ? IS NULL)) AND (([Competitor_ContactNo] = ?) OR ([Competitor_ContactNo] IS NULL AND ? IS NULL)) AND (([Competitor_Website] = ?) OR ([Competitor_Website] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [Competitors] ([Competitor_ID], [Competitor_Name], [Competitor_Salutation], [Competitor_DoB], [Competitor_Email], [Competitor_Description], [Competitor_Country], [Competitor_Gender], [Competitor_ContactNo], [Competitor_Website]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:databaseConnectionString.ProviderName %>" SelectCommand="SELECT [Competitor_ID], [Competitor_Name], [Competitor_Salutation], [Competitor_DoB], [Competitor_Email], [Competitor_Description], [Competitor_Country], [Competitor_Gender], [Competitor_ContactNo], [Competitor_Website] FROM [Competitors]" UpdateCommand="UPDATE [Competitors] SET [Competitor_Name] = ?, [Competitor_Salutation] = ?, [Competitor_DoB] = ?, [Competitor_Email] = ?, [Competitor_Description] = ?, [Competitor_Country] = ?, [Competitor_Gender] = ?, [Competitor_ContactNo] = ?, [Competitor_Website] = ? WHERE [Competitor_ID] = ? AND (([Competitor_Name] = ?) OR ([Competitor_Name] IS NULL AND ? IS NULL)) AND (([Competitor_Salutation] = ?) OR ([Competitor_Salutation] IS NULL AND ? IS NULL)) AND (([Competitor_DoB] = ?) OR ([Competitor_DoB] IS NULL AND ? IS NULL)) AND (([Competitor_Email] = ?) OR ([Competitor_Email] IS NULL AND ? IS NULL)) AND (([Competitor_Description] = ?) OR ([Competitor_Description] IS NULL AND ? IS NULL)) AND (([Competitor_Country] = ?) OR ([Competitor_Country] IS NULL AND ? IS NULL)) AND (([Competitor_Gender] = ?) OR ([Competitor_Gender] IS NULL AND ? IS NULL)) AND (([Competitor_ContactNo] = ?) OR ([Competitor_ContactNo] IS NULL AND ? IS NULL)) AND (([Competitor_Website] = ?) OR ([Competitor_Website] IS NULL AND ? IS NULL))">
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
                <asp:Parameter Name="original_Competitor_Gender" Type="String" />
                <asp:Parameter Name="original_Competitor_Gender" Type="String" />
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
                <asp:Parameter Name="Competitor_Gender" Type="String" />
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
                <asp:Parameter Name="Competitor_Gender" Type="String" />
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
                <asp:Parameter Name="original_Competitor_Gender" Type="String" />
                <asp:Parameter Name="original_Competitor_Gender" Type="String" />
                <asp:Parameter Name="original_Competitor_ContactNo" Type="Int32" />
                <asp:Parameter Name="original_Competitor_ContactNo" Type="Int32" />
                <asp:Parameter Name="original_Competitor_Website" Type="String" />
                <asp:Parameter Name="original_Competitor_Website" Type="String" />
            </UpdateParameters>
            </asp:SqlDataSource>
    </h1>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Competitor_ID" DataSourceID="AddCompetitor" DefaultMode="Insert">
        <EditItemTemplate>
            Competitor_ID:
            <asp:Label ID="Competitor_IDLabel1" runat="server" Text='<%# Eval("Competitor_ID") %>' />
            <br />
            Competitor_Name:
            <asp:TextBox ID="Competitor_NameTextBox" runat="server" Text='<%# Bind("Competitor_Name") %>' />
            <br />
            Competitor_Salutation:
            <asp:TextBox ID="Competitor_SalutationTextBox" runat="server" Text='<%# Bind("Competitor_Salutation") %>' />
            <br />
            Competitor_DoB:
            <asp:TextBox ID="Competitor_DoBTextBox" runat="server" Text='<%# Bind("Competitor_DoB") %>' />
            <br />
            Competitor_Email:
            <asp:TextBox ID="Competitor_EmailTextBox" runat="server" Text='<%# Bind("Competitor_Email") %>' />
            <br />
            Competitor_Description:
            <asp:TextBox ID="Competitor_DescriptionTextBox" runat="server" Text='<%# Bind("Competitor_Description") %>' />
            <br />
            Competitor_Country:
            <asp:TextBox ID="Competitor_CountryTextBox" runat="server" Text='<%# Bind("Competitor_Country") %>' />
            <br />
            Competitor_Gender:
            <asp:TextBox ID="Competitor_GenderTextBox" runat="server" Text='<%# Bind("Competitor_Gender") %>' />
            <br />
            Competitor_ContactNo:
            <asp:TextBox ID="Competitor_ContactNoTextBox" runat="server" Text='<%# Bind("Competitor_ContactNo") %>' />
            <br />
            Competitor_Website:
            <asp:TextBox ID="Competitor_WebsiteTextBox" runat="server" Text='<%# Bind("Competitor_Website") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Competitor_ID:
            <asp:TextBox ID="Competitor_IDTextBox" runat="server" Text='<%# Bind("Competitor_ID") %>' />
            <br />
            Competitor_Name:
            <asp:TextBox ID="Competitor_NameTextBox" runat="server" Text='<%# Bind("Competitor_Name") %>' />
            <br />
            Competitor_Salutation:
            <asp:TextBox ID="Competitor_SalutationTextBox" runat="server" Text='<%# Bind("Competitor_Salutation") %>' />
            <br />
            Competitor_DoB:
            <asp:TextBox ID="Competitor_DoBTextBox" runat="server" Text='<%# Bind("Competitor_DoB") %>' />
            <br />
            Competitor_Email:
            <asp:TextBox ID="Competitor_EmailTextBox" runat="server" Text='<%# Bind("Competitor_Email") %>' />
            <br />
            Competitor_Description:
            <asp:TextBox ID="Competitor_DescriptionTextBox" runat="server" Text='<%# Bind("Competitor_Description") %>' />
            <br />
            Competitor_Country:
            <asp:TextBox ID="Competitor_CountryTextBox" runat="server" Text='<%# Bind("Competitor_Country") %>' />
            <br />
            Competitor_Gender:
            <asp:TextBox ID="Competitor_GenderTextBox" runat="server" Text='<%# Bind("Competitor_Gender") %>' />
            <br />
            Competitor_ContactNo:
            <asp:TextBox ID="Competitor_ContactNoTextBox" runat="server" Text='<%# Bind("Competitor_ContactNo") %>' />
            <br />
            Competitor_Website:
            <asp:TextBox ID="Competitor_WebsiteTextBox" runat="server" Text='<%# Bind("Competitor_Website") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Competitor_ID:
            <asp:Label ID="Competitor_IDLabel" runat="server" Text='<%# Eval("Competitor_ID") %>' />
            <br />
            Competitor_Name:<asp:RequiredFieldValidator ID="compNameRequiredValidator" runat="server" ErrorMessage="RequiredFieldValidator" Text='<%# Eval("Competitor_Name") %>'></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="Competitor_NameLabel" runat="server" Text='<%# Bind("Competitor_Name") %>' />
            <br />
            Competitor_Salutation:&nbsp;<asp:Label ID="Competitor_SalutationLabel" runat="server" Text='<%# Bind("Competitor_Salutation") %>' />
            <br />
            Competitor_DoB:
            <asp:Label ID="Competitor_DoBLabel" runat="server" Text='<%# Bind("Competitor_DoB") %>' />
            <br />
            Competitor_Email:<asp:RequiredFieldValidator ID="compEmailRequiredValidator" runat="server" ErrorMessage="RequiredFieldValidator" Text='<%# Eval("Competitor_Email") %>'></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="Competitor_EmailLabel" runat="server" Text='<%# Bind("Competitor_Email") %>' />
            <br />
            Competitor_Description:
            <asp:Label ID="Competitor_DescriptionLabel" runat="server" Text='<%# Bind("Competitor_Description") %>' />
            <br />
            Competitor_Country:<asp:RequiredFieldValidator ID="compCountryRequiredValidator" runat="server" ErrorMessage="RequiredFieldValidator" Text='<%# Eval("Competitor_Country") %>'></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="Competitor_CountryLabel" runat="server" Text='<%# Bind("Competitor_Country") %>' />
            <br />
            Competitor_Gender:<asp:RequiredFieldValidator ID="compGenderRequiredValidator" runat="server" ErrorMessage="RequiredFieldValidator" Text='<%# Eval("Competitor_Gender") %>'></asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="Competitor_GenderLabel" runat="server" Text='<%# Bind("Competitor_Gender") %>' />
            <br />
            Competitor_ContactNo:
            <asp:Label ID="Competitor_ContactNoLabel" runat="server" Text='<%# Bind("Competitor_ContactNo") %>' />
            <br />
            Competitor_Website:
            <asp:Label ID="Competitor_WebsiteLabel" runat="server" Text='<%# Bind("Competitor_Website") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    </asp:Content>

