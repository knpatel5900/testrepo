<%@ Page Title="" Language="C#" MasterPageFile="~/FAM2.master" AutoEventWireup="true" CodeFile="Addassetsm.aspx.cs" Inherits="Default2" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
    function assfun() {

        var id = document.getElementById('<%=TextBox1.ClientID %>');
        var nm = document.getElementById('<%=TextBox5.ClientID%>');
        var des = document.getElementById('<% =TextBox2.ClientID%>');
        var asspr = document.getElementById('<%=TextBox10.ClientID%>');
        var mfg = document.getElementById('<%=TextBox11.ClientID%>');
        var ins = document.getElementById('<%=TextBox12.ClientID%>');
        var mntnc = document.getElementById('<%=TextBox13.ClientID%>');
        var lif = document.getElementById('<%=TextBox14.ClientID%>');
        var dept = document.getElementById('<%=DropDownList1.ClientID%>');
        var asstype = document.getElementById('<%=DropDownList2.ClientID%>');
        var asscat = document.getElementById('<%=DropDownList3.ClientID%>');
        var sup = document.getElementById('<%=DropDownList4.ClientID%>');
        var str = "";
        
        if (id.value == "") {


            str = str + "Enter Asset_ID\n";
        }
        if (nm.value == "") {
            str += "Enter Asset_Name\n";
            nm.placeholder = ""; 
         }
        if (des.value == "") {
            str += "Enter Asset_Description\n";
            des.placeholder = ""; 
        }
        if (asspr.value == "") { str += "Enter Asset_Price\n"; }
        if (mfg.value == "") { str += "Enter Manufacturing Date\n"; }
        if (ins.value == "") { str += "Enter Instance_Date\n"; }
        if (mntnc.value == "") { str += "Enter Maintanance\n"; }
        if (sup.value == "---------select supplier------") {
            str = str + "Select Supplier\n";
        }
        if (lif.value == "") { str += "Enter Asset_Life\n"; }
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
 <table cellspacing="4px" cellpadding="4px">
            <tr>
                <td>
                    <b>Asset ID:</b>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"  CssClass="txt" aria-required="true" placeholder="Enter Asset ID" aria-label="First Name" Height="30px" Width="207px"></asp:TextBox>
                    </td>
                  
                    <td>
                   <b> Suplier ID:</b>
                </td>
                <td>  <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDownList4_SelectedIndexChanged"></asp:DropDownList>
                    
                </td>
                
            </tr>

          
            <tr>
                <td>
                    <b>Asset Name:</b>
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
            <tr>
                <td>
                   <b> Description: </b>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="txt" placeholder="Enter Description" Height="30px" Width="207px"></asp:TextBox>
                </td>
                 <td>
                    <b>Supplier Address:</b>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="."></asp:Label>
                </td>
               
            </tr>
            <tr>
                <td>
                   <b>Asset Price: </b>
                </td>
                <td>
                    <asp:TextBox ID="TextBox10" runat="server" CssClass="txt" placeholder="Enter Asset Price" Height="30px" Width="207px"></asp:TextBox>
                </td>
                  
                 
            </tr>
            
            <tr>
                <td>
                    <b>Manufacturing Date:</b>
                </td>
                <td>
                    <asp:TextBox ID="TextBox11" runat="server" CssClass="txt"  placeholder="Enter Manufacturing Date" Height="30px" Width="207px"></asp:TextBox>
                    <asp:CalendarExtender ID="TextBox11_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="TextBox11">
                    </asp:CalendarExtender>
                </td>
                
            </tr>
            
            <tr>
                <td>
                   <b>Installation date:</b>
                </td>
                <td>
                    <asp:TextBox ID="TextBox12" runat="server"  CssClass="txt"  placeholder="Enter  Installation date" Height="30px" Width="207px"></asp:TextBox>
                    <asp:CalendarExtender ID="TextBox12_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="TextBox12">
                    </asp:CalendarExtender>
                </td>
                 <td><b>Department:</b></td>
            <td>
                
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                          <ContentTemplate>
                              <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                  onselectedindexchanged="DropDownList1_SelectedIndexChanged1">
                              </asp:DropDownList>
                </ContentTemplate> 
                            <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="DropDownList1"  EventName="SelectedIndexChanged"/> 
                            </Triggers>
                        </asp:UpdatePanel>
            </td>
                
            </tr>
           
            <tr>
                <td>
                    <b>Maintaince Duration:</b>
                </td>
                <td>
                    <asp:TextBox ID="TextBox13" runat="server"  CssClass="txt" placeholder="Enter Maintaince Duration" Height="30px" Width="207px"></asp:TextBox>
                </td>
                 <td>
                    <b>Asset Type:</b>
                </td>
                
                <td>
                    
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                           <ContentTemplate> <asp:DropDownList ID="DropDownList2" runat="server" 
                                   AutoPostBack="True" onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                </asp:DropDownList> </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="DropDownList2"  EventName="SelectedIndexChanged"/> 
                            </Triggers>
                        </asp:UpdatePanel>
                  
                </td>
            </tr>
            
            <tr>
                <td>
                   <b> Life</b>
                </td>
                <td>
                    <asp:TextBox ID="TextBox14" runat="server"  CssClass="txt" placeholder="Enter Life " Height="30px" Width="207px"></asp:TextBox>
                </td>
                 <td><b>Asset Category:</b></td>
            <td>
                
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                 <ContentTemplate>
                      <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True">
                </asp:DropDownList></ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="DropDownList3"  EventName="SelectedIndexChanged"/> 
                            </Triggers>
                        </asp:UpdatePanel>
            </td>
            </tr>
            <tr><td>
                
            </td></tr>
           
            <tr>
                <td>
                      </td>
                <td><asp:Button ID="Button1" runat="server" Text="SAVE" onclick="Button1_Click" OnClientClick="return assfun();" Height="39px" Width="78px" Font-Size="Medium" BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite"/>

              
                       
            <td><asp:Button ID="Button2" runat="server" Text="RESET" onclick="Button2_Click" Height="39px" Width="78px" Font-Size="Medium" BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite" sh /></td>
        </td> </tr>

            </table>
  </center>
        <asp:Label ID="Label1" runat="server" Text="*"></asp:Label>
</asp:Content>

