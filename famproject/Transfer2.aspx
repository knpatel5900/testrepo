<%@ Page Title="" Language="C#" MasterPageFile="~/fam1.master" AutoEventWireup="true" CodeFile="Transfer2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function transfer() {
        var dept = document.getElementById('<%=DropDownList4.ClientID%>');
        var asstype = document.getElementById('<%=DropDownList5.ClientID%>');
        var asscat = document.getElementById('<%=DropDownList6.ClientID%>');
        var str = "";
        if (dept.value == "------------select dept------") {


            str = str + "Select Department\n";
        } if (asstype.value == "------------select asstype------") {


            str = str + "select Asset Type\n";
        } if (asscat.value == "------------select asscat------") {


            str = str + "Select Asset Category\n";
        } if (asstype.value == "") {


            str = str + "Select Asset Type\n";
        } if (asscat.value == "") {


            str = str + "Select Asset Category\n";
        }
      
        if (str == "") {
            return true;
        }
        else {
            alert(str);
            return false;

        }
    }
        </script>
    <style type="text/css">
td
{
    font-size:16pt;
    }
    .txt
    {
        font-family:Gill Sans Ultra Condensed;
        font-size:13pt;
        font-weight:900;
        }
</style><center>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="280px" Width="347px" 
        AutoGenerateRows="False" BackColor="White" BorderColor="#08469" 
        BorderStyle="Ridge" BorderWidth="4px" CellPadding="3" CellSpacing="2">
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:TemplateField HeaderText="Assetid">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# bind("assetid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="AssetName">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# bind("assetname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SupplierId">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# bind("suplid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SupplierName">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# bind("supnm") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Deptid">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# bind("dname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Asstype">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="asset category">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# bind("ac_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#08469" ForeColor="White" />
    </asp:DetailsView></center>
    <b style="font-size:large">Transfer to Department:</b>
    <center>
     <table cellspacing="10px" cellpadding="4px">
    <tr>
 <td><b>Department</b></td>
            <td>
                

                <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDownList4_SelectedIndexChanged1">
                </asp:DropDownList>
                
            </td>
            </tr>
            <tr>
                <td>
                    <b>Asset Type:</b>
                </td>
                <td>
                    
                              
                    <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList5_SelectedIndexChanged1">
                    </asp:DropDownList>
                  
                </td>
                
            </tr>
            <tr>
            <td><b>Asset Category:</b></td>
            <td>
                
               
                <asp:DropDownList ID="DropDownList6" runat="server">
                </asp:DropDownList>
            </td>
            </tr>
            <tr><td>
                <asp:Button ID="Button2" runat="server" Text="Transfer" 
                    onclick="Button2_Click"  Height="39px" Width="111px" Font-Size="Medium" 
                    BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite"  OnClientClick="return transfer();" /></td></tr>
            </table></center>
</asp:Content>

