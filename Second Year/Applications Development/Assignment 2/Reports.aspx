<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <a href="SearchDatabase.aspx">Search Database</a>
    <h1>Reports</h1>Search event photos:<p>
        Please enter Event ID and press Enter</p>
    <p>
        <asp:TextBox ID="searchEventPhotosTextbox" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:GridView ID="eventPhotosGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Photo_ID" DataSourceID="viewEventPhotos">
            <Columns>
                <asp:BoundField DataField="Photo_ID" HeaderText="Photo_ID" InsertVisible="False" ReadOnly="True" SortExpression="Photo_ID" />
                <asp:BoundField DataField="Event_Photo" HeaderText="Event_Photo" SortExpression="Event_Photo" />
                <asp:BoundField DataField="Event_PhotoTags" HeaderText="Event_PhotoTags" SortExpression="Event_PhotoTags" />
                <asp:BoundField DataField="Event_ID" HeaderText="Event_ID" SortExpression="Event_ID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="viewEventPhotos" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:databaseConnectionString %>" DeleteCommand="DELETE FROM [Event_Photo] WHERE [Photo_ID] = ? AND (([Event_Photo] = ?) OR ([Event_Photo] IS NULL AND ? IS NULL)) AND (([Event_PhotoTags] = ?) OR ([Event_PhotoTags] IS NULL AND ? IS NULL)) AND (([Event_ID] = ?) OR ([Event_ID] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [Event_Photo] ([Photo_ID], [Event_Photo], [Event_PhotoTags], [Event_ID]) VALUES (?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:databaseConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Event_Photo] WHERE ([Event_ID] = ?)" UpdateCommand="UPDATE [Event_Photo] SET [Event_Photo] = ?, [Event_PhotoTags] = ?, [Event_ID] = ? WHERE [Photo_ID] = ? AND (([Event_Photo] = ?) OR ([Event_Photo] IS NULL AND ? IS NULL)) AND (([Event_PhotoTags] = ?) OR ([Event_PhotoTags] IS NULL AND ? IS NULL)) AND (([Event_ID] = ?) OR ([Event_ID] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Photo_ID" Type="Int32" />
                <asp:Parameter Name="original_Event_Photo" Type="String" />
                <asp:Parameter Name="original_Event_Photo" Type="String" />
                <asp:Parameter Name="original_Event_PhotoTags" Type="String" />
                <asp:Parameter Name="original_Event_PhotoTags" Type="String" />
                <asp:Parameter Name="original_Event_ID" Type="Int32" />
                <asp:Parameter Name="original_Event_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Photo_ID" Type="Int32" />
                <asp:Parameter Name="Event_Photo" Type="String" />
                <asp:Parameter Name="Event_PhotoTags" Type="String" />
                <asp:Parameter Name="Event_ID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="searchEventPhotosTextbox" Name="Event_ID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Event_Photo" Type="String" />
                <asp:Parameter Name="Event_PhotoTags" Type="String" />
                <asp:Parameter Name="Event_ID" Type="Int32" />
                <asp:Parameter Name="original_Photo_ID" Type="Int32" />
                <asp:Parameter Name="original_Event_Photo" Type="String" />
                <asp:Parameter Name="original_Event_Photo" Type="String" />
                <asp:Parameter Name="original_Event_PhotoTags" Type="String" />
                <asp:Parameter Name="original_Event_PhotoTags" Type="String" />
                <asp:Parameter Name="original_Event_ID" Type="Int32" />
                <asp:Parameter Name="original_Event_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

