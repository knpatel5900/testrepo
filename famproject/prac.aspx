<%@ Page Language="C#" AutoEventWireup="true" CodeFile="prac.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DataList ID="DataList1" runat="server" BackColor="#CCCCCC" 
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
            CellSpacing="5" GridLines="Both" RepeatColumns="5" 
            RepeatDirection="Horizontal" ForeColor="Black">
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="White" />
            <ItemTemplate>
            <table>
            <tr>
            <td>Asset ID:</td>
            <td><asp:Label ID="Label1" runat="server" Text='<%# bind("Assetid") %>'></asp:Label>
                </td>
            </tr>
             <tr>
            <td>Asset Name:</td>
            <td><asp:Label ID="Label2" runat="server" Text='<%# bind("assetname") %>'></asp:Label></td>
            </tr>
             <tr>
            <td>supplier ID:</td>
            <td> <asp:Label ID="Label3" runat="server" Text='<%# bind("suplid") %>'></asp:Label></td>
            </tr>
             <tr>
            <td>Supplier Name:</td>
            <td> <asp:Label ID="Label4" runat="server" Text='<%# bind("supnm") %>'></asp:Label></td>
               </tr> <tr>
            <td>Asset Price:</td>
            <td> <asp:Label ID="Label5" runat="server" Text='<%# bind("assprice") %>'></asp:Label></td>
            </tr>
            <tr>
            <td>Manufactur Date:</td>
            <td><asp:Label ID="Label6" runat="server" Text='<%# bind("mfgdate") %>'></asp:Label></td>
            </tr>
             <tr>
            <td>Instalation Date:</td>
            <td> <asp:Label ID="Label7" runat="server" Text='<%# bind("instdate") %>'></asp:Label></td>
            </tr>
             <tr>
            <td>Asset life:</td>
            <td><asp:Label ID="Label8" runat="server" Text='<%# bind("life") %>'></asp:Label></td>
            </tr>
             <tr>
            <td>Department:</td>
            <td><asp:Label ID="Label9" runat="server" Text='<%# bind("deptid") %>'></asp:Label></td>
            </tr>
           <tr>
           <td>Asset Type:</td>
          <td>  <asp:Label ID="Label10" runat="server" Text='<%# bind("atid") %>'></asp:Label></td>
           </tr>
            </table>
                
               
               
               
                
               
                
                
               
            </ItemTemplate>
            <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
    </div>
    </form>
</body>
</html>
