<%@ Page Title="" Language="C#" MasterPageFile="~/fam1.master" AutoEventWireup="true" CodeFile="Transfer.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    function transfer() {
        var dept = document.getElementById('<%=DropDownList2.ClientID%>');
        var asstype = document.getElementById('<%=DropDownList1.ClientID%>');
        var asscat = document.getElementById('<%=DropDownList3.ClientID%>');
        var str = "";
        if (dept.value == "-------select department------") {


            str = str + "Select Department\n";
        } if (asstype.value == "") {


            str = str + "select Asset Type\n";
        } if (asscat.value == "") {


            str = str + "Select Asset Category\n";
        }
        if (asstype.value == "-------select asset type------") {


            str = str + "select Asset Type\n";
        } if (asscat.value == "-------select asset category------") {


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
   <h1>Asset Transfer</h1>
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
                    
                                <asp:DropDownList ID="DropDownList1" runat="server" onselectedindexchanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                                           
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
                    onclick="Button1_Click"  Height="39px" Width="135px" Font-Size="Medium" 
                    BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite" OnClientClick="return transfer();" /></td></tr>
            </table></center>
    
    <center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        onrowupdating="GridView1_RowUpdating" BackColor="White" 
    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
            <asp:TemplateField HeaderText="AssetID">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" oncommand="LinkButton1_Command" 
                        Text='<%# bind("Assetid") %>'
                        CommandArgument='<%# bind("Assetid") %>'></asp:LinkButton>
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
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#008469" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>


       </center>       



</asp:Content>

