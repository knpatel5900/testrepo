<%@ Page Title="" Language="C#" MasterPageFile="~/FAM2.master" AutoEventWireup="true" CodeFile="Costbreakupm.aspx.cs" Inherits="Costbreakup" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <script type="text/javascript">
     function assfun() {

         var id = document.getElementById('<%=TextBox1.ClientID %>');
         var nm = document.getElementById('<%=TextBox5.ClientID%>');
         var asspr = document.getElementById('<%=TextBox10.ClientID%>');
         var mfg = document.getElementById('<%=TextBox11.ClientID%>');
         var ins = document.getElementById('<%=TextBox12.ClientID%>');
         var mntnc = document.getElementById('<%=TextBox13.ClientID%>');
         var lif = document.getElementById('<%=TextBox14.ClientID%>');
         var sup = document.getElementById('<%=DropDownList4.ClientID%>');
       
         var str = "";
         if (id.value == "") {


             str = str + "Enter Asset_ID\n";
         }
         if (nm.value == "") {
             str += "Enter Asset_Name\n";
             nm.placeholder = "";
         }
        


         if (asspr.value == "") { str += "Enter Asset_Price\n"; }

         if (mfg.value == "") { str += "Enter Manufacturing Date\n"; }

         if (ins.value == "") { str += "Enter Instance_Date\n"; }
         if (mntnc.value == "") { str += "Enter Maintanance\n"; }
         if (lif.value == "") { str += "Enter Asset_Life\n"; }
         if (sup.value == "---------select supplier------") { str += "Select Supplier\n"; }
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
    b
    {
         font-size:16pt;
        
        }
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
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
 
    <b style="font-size:x-large">Asset ID:</b>
     <asp:Label ID="Label4" runat="server" Text="" CssClass="txt"></asp:Label>
   <center>
    <table cellspacing="8px" cellpadding="4px">
            <tr>
                <td>
                    <b></b>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"  CssClass="txt" aria-required="true" placeholder="Enter Sub Asset ID" aria-label="First Name" Height="30px" Width="207px"></asp:TextBox>
                    </td>
                  <td>
                   <b> Suplier ID:</b>
                </td>
                <td>  
                    <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList4_SelectedIndexChanged" 
                       ></asp:DropDownList>
                    
                </td>
                   
                
            </tr>

          
            <tr>
                <td>
                    <b></b>
                </td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" Text=""  CssClass="txt" placeholder="Enter Asset Name" Height="30px" Width="207px"></asp:TextBox>
                </td>
               <td>
                    <b>Supplier Name:</b>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="."></asp:Label>
                </td>
                
            </tr>
            <tr><td>
                   <b> </b>
                </td>
                <td>
                    <asp:TextBox ID="TextBox10" runat="server" CssClass="txt" placeholder="Enter Sub Asset Price" Height="30px" Width="207px"></asp:TextBox>
                </td>
                
                 
                 <td>
                    <b>Supplier Address:</b>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="."></asp:Label>
                </td>
               
           
            </tr>
            <tr>
                
               
            </tr>
            
            <tr>
                <td>
                    <b></b>
                </td>
                <td>
                    <asp:TextBox ID="TextBox11" runat="server" CssClass="txt"  placeholder="Enter Manufacturing Date" Height="30px" Width="207px"></asp:TextBox>
                  
                    <asp:CalendarExtender ID="TextBox11_CalendarExtender" runat="server" 
                        TargetControlID="TextBox11">
                    </asp:CalendarExtender>
                  
                </td>
               
                
            </tr>
            
            <tr>
                <td>
                   <b></b>
                </td>
                <td>
                    <asp:TextBox ID="TextBox12" runat="server"  CssClass="txt"  placeholder="Enter  Installation date" Height="30px" Width="207px"></asp:TextBox>

                    <asp:CalendarExtender ID="TextBox12_CalendarExtender" runat="server" 
                        TargetControlID="TextBox12">
                    </asp:CalendarExtender>

                </td>
                
                </tr>
                
           
            <tr>
                <td>
                    <b></b>
                </td>
                <td>
                    <asp:TextBox ID="TextBox13" runat="server"  CssClass="txt" placeholder="Enter Maintaince Duration" Height="30px" Width="207px"></asp:TextBox>
                </td>
               
                </tr>
            
            <tr>
                <td>
                   <b> </b>
                </td>
                <td>
                    <asp:TextBox ID="TextBox14" runat="server"  CssClass="txt" placeholder="Enter Life " Height="30px" Width="207px"></asp:TextBox>
                </td>
                
                 
            </tr>
           
            <tr>
                <td>
                      </td>
                <td><asp:Button ID="Button1" runat="server" Text="SAVE"  
                        OnClientClick="return assfun();" Height="39px" Width="78px" Font-Size="Medium" 
                        BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite" 
                        onclick="Button1_Click"/>

              
                       
            <td><asp:Button ID="Button2" runat="server" Text="RESET"  Height="39px" Width="78px" Font-Size="Medium" BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite" /></td>
        </td> <td> <asp:Label ID="Label1" runat="server" Text="."></asp:Label>
        </td></tr>
           </table>
           </center>
</asp:Content>

