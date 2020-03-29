<%@ Page Title="" Language="C#" MasterPageFile="~/fam1.master" AutoEventWireup="true" CodeFile="maintanancem.aspx.cs" Inherits="maintanance" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
<script type="text/javascript">

    function validate() {
        var txtmid = document.getElementById('<% =TextBox1.ClientID %>');
        var txtcost = document.getElementById('<% =TextBox2.ClientID %>');
        var txtdate = document.getElementById('<% =TextBox3.ClientID %>');
        var txtmby = document.getElementById('<% =TextBox5.ClientID %>');
        var txtassid = document.getElementById('<% =DropDownList1.ClientID %>');
        var exp1 = /^[0-9]+$/;
        var exp2 = /^[0-9a-zA-Z]+$/;
        var str = "";

        if (txtmid.value== "") {

            str = str + "Enter Maintananceid\n";
           


        }
        else if (exp2.test(txtmid.value) == false) {
            str+= "please enter no and character Eg bbb111\n";
        }
        if (txtcost.value == "") {
            str += "Enter cost\n";
        }
         else if (exp1.test(txtcost.value) == false)
         {
         str+="enter no only\n";
         }

        if (txtdate.value == "") {

            str+= "enter date \n";

        }
        if (txtassid.value == "-----Asset id------") {
            str += "Enter Asseetid\n";
        }
        
        if (txtmby.value == "") {

            str += "Enter maintananceby\n";
        }
        if (str == "") {
            return true;
        }
        else {
            alert(str);
            return false;
        }
    }

    var temp;
    function brdr(temp) {
        var cnrl = document.getElementById(temp);
        cnrl.className = "ff";
    }
    function brdr1(temp) {
        var cnrl = document.getElementById(temp);
        cnrl.className = "gg";
    }


</script>
     
       
 <style type="text/css">
    .ff 
    {
    
                  border-color :Blue;
                border-width:1px;
                border-style:solid;
                border-radius:10px 0px 10px 0px;
                box-shadow:2px -2px 2px #000000;
                /*-moz-animation:ss 10s infinite;*/
    
    
    }
    .gg
    {
        
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<center>

<table cellspacing="8px" cellpadding="4px"> 
<tr>
<td><b>Maintanance ID:</b></td>
<td>
    <asp:TextBox ID="TextBox1" runat="server" onfocus="brdr('TextBox1')" 
        onblur="brdr1('TextBox1')" placeholder="Enter Maintanance ID" 
        CssClass="txt" Height="30px" Width="207px"></asp:TextBox></td>
</tr>
<tr>
<td><b>Maintanance Cost:</b></td>
<td>
    <asp:TextBox ID="TextBox2"  runat="server"  placeholder=" Enter Maintanance Cost " CssClass="txt" Height="30px" Width="207px">  </asp:TextBox></td>
</tr>

<tr>

<td><b>Maintanance Date:</b></td>
<td>
    <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter Maintanance Date" CssClass="txt" Height="30px" Width="207px"></asp:TextBox>
    <asp:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="TextBox3">
    </asp:CalendarExtender>
    </td>
</tr>

<tr>
<td><b>Assets ID:</b></td>
<td>
   
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                     Width="149px">
                                </asp:DropDownList>       
                               
                   
                    </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="DropDownList1"/> 
                            </Triggers>
   
    </asp:UpdatePanel>
    
</td>
</tr>

<tr>
<td><b>Maintanance By:</b></td>
<td>
     <asp:TextBox ID="TextBox5" runat="server"   placeholder="Enter Maintanance By" CssClass="txt" Height="30px" Width="207px"> </asp:TextBox></td>
</tr>
<tr>

<td>
    <asp:Button ID="Button1" runat="server" Text="Submit" 
        onclick="Button1_Click1"  OnClientClick="return validate();" Height="39px" Width="78px" Font-Size="Medium" BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite"/></td>
    <td>
        <asp:Label ID="Label1" runat="server" Text="."></asp:Label></td>
</tr>



</table>
</center>
</asp:Content>

