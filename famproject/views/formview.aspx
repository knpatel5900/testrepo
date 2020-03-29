<%@ Page Title="" Language="C#" MasterPageFile="~/fam1.master" AutoEventWireup="true" CodeFile="formview.aspx.cs" Inherits="formview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView1" runat="server">
  
        <ItemTemplate>
       
        <table border="2px" >
        <tr><td>Asset_id</td> 
        <td>   <asp:Label ID="Label1" runat="server" Text='<%# bind("assetid") %>'></asp:Label></td>
        </tr>
        <tr><td>Asset_Name</td> 
        <td> <asp:Label ID="Label2" runat="server" Text='<%# bind("assetname") %>'></asp:Label></td>
        </tr>
        <tr>
        <td>Description</td>
        <td> <asp:Label ID="Label3" runat="server" Text='<%# bind("description") %>'></asp:Label></td>
        </tr>
        <tr>
        <td>Ext_Description</td>
        <td>  <asp:Label ID="Label4" runat="server" Text='<%# bind("extdescription") %>'></asp:Label></td>
        </tr>
        <tr>
        <td>Supplier_Id</td>
        <td>
            <asp:Label ID="Label5" runat="server" Text='<%# bind("suplid") %>'></asp:Label></td>
        </tr>
        <tr>
        <td>Supplier_Name</td>
        <td>  <asp:Label ID="Label6" runat="server" Text='<%# bind("supnm") %>'></asp:Label></td>
        </tr>
        <tr>
        <td>Assets_Type</td>
        <td> <asp:Label ID="Label7" runat="server" Text='<%# bind("asstype") %>'></asp:Label></td>
        </tr>
        <tr>
        <td>Assets_Price</td>
        <td>   <asp:Label ID="Label8" runat="server" Text='<%# bind("assprice") %>'></asp:Label></td>
        </tr>
        <tr>
        <td>Manufacture_Date</td>
        <td> <asp:Label ID="Label9" runat="server" Text='<%# bind("mfgdate") %>'></asp:Label></td>
        </tr>
        <tr>
        <td>Inst_Date</td>
        <td> <asp:Label ID="Label10" runat="server" Text='<%# bind("instdate") %>'></asp:Label></td>
        </tr>
        <tr>
        <td>Maintanance</td>
        <td>
            <asp:Label ID="Label11" runat="server" Text='<%# bind("mntnc") %>'></asp:Label></td>
        </tr>
        <tr>
        <td>Life</td>
        <td> <asp:Label ID="Label12" runat="server" Text='<%# bind("life") %>'></asp:Label></td>
        </tr>
       
            
            </table>
        </ItemTemplate>
   


    </asp:FormView>
</asp:Content>

