<%@ Page Title="" Language="C#" MasterPageFile="~/FAM2.master" AutoEventWireup="true" CodeFile="Depreactionm.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    function depr() 
    {
        var dept = document.getElementById('<%=DropDownList2.ClientID%>');
        var asstype = document.getElementById('<%=DropDownList1.ClientID%>');
        var asscat = document.getElementById('<%=DropDownList3.ClientID%>');
        var str = "";
        if (dept.value == "-------select department------") {


            str = str + "Select Department\n";
        }
        if (asstype.value == "-------select assettype------") {


            str = str + "Select Asset Type\n";
        }

        if (asscat.value == "-------select asset category------") {


            str = str + "Select Asset Category\n";
        }
        if (asstype.value == "") {


            str = str + "select Asset Type\n";
        } 
        if (asscat.value == "") {


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
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <center>
    <table cellpadding="10px" cellpadding="4px">
    <tr>
 <td><b>Department</b></td>
            <td>
                
                                <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"
                    AutoPostBack="True" >

                </asp:DropDownList>
                
            </td>
            </tr>
            <tr>
                <td>
                    <b>Asset Type:</b>
                </td>
                <td>
                    
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    onselectedindexchanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                                           
                    </asp:DropDownList>
                    
                  
                </td>
                
            </tr>
            <tr>
            <td><b>Asset Category:</b></td>
            <td>
                
                               <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                     >
                </asp:DropDownList>
                 
            </td>
            </tr>
            <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="View Asset" 
                    onclick="Button1_Click"  Height="39px" Width="134px" Font-Size="Medium" 
                    BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite"  OnClientClick="return depr();" /></td></tr>
            </table>
            </center><center>
            <asp:GridView ID="GridView1" runat="server" 
    AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
    BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:TemplateField HeaderText="AssetID">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# bind("Assetid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="AssetName">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# bind("Assetname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SupplierID">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# bind("SuplID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SupplierName">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# bind("SupNM") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DepartmentID">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# bind("dname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="AssetType">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Asset Category">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# bind("ac_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Asset Price">
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# bind("Assprice") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Inst Date">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# bind("InstDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Calculate Depteaction">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/search.gif" 
                        CommandArgument='<%# bind("Assetid") %>' oncommand="ImageButton1_Command" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" oncommand="LinkButton2_Command" CommandArgument='<%# bind("Assetid") %>'>SAVE</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#008469" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView></center><center>
    <table><tr><td>
        <asp:Label ID="Label10" runat="server" Text="."></asp:Label>
        <asp:Label ID="Label9" runat="server" Text="."></asp:Label></td></tr></table></center>
</asp:Content>

