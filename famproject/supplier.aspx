<%@ Page Title="" Language="C#" MasterPageFile="~/fam1.master" AutoEventWireup="true" CodeFile="supplier.aspx.cs" Inherits="Default2" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    
    function fun() {
        var sid = document.getElementById('<%=TextBox1.ClientID %>');
        var snm = document.getElementById('<%=TextBox2.ClientID %>');
        var sadd = document.getElementById('<%= TextBox3.ClientID%>');
        var sem = document.getElementById('<%=TextBox4.ClientID %>');
        var spdt = document.getElementById('<%=TextBox5.ClientID %>');
        var mno = document.getElementById('<%=TextBox6.ClientID%>');
        var exp1 = /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/;
           
        var str = "";

        if (sid.value == "") {
            str = str + "Enter Supplier_ID\n";
            sid.className = "txt";
          sid.className="txt1"
            sid.focus();
            sid.blur();
        }
        if (snm.value == "") {
            str += "Enter Supplier_Name\n";
            snm.className = "txt";
           
            snm.focus();
            snm.blur();
        }
        if (sadd.value == "") {
            str += "Enter Supplier_Address\n";
            sadd.focus();
            sadd.className = "txt";
        }
        if (sem.value == "") {
            str += "Enter E-Mail\n";
            sem.focus();
            sem.className = "txt";
        }
        else if (exp1.test(sem.value) == false) {
            str += "Enter Valid E-mail";

        
        }
        if (spdt.value == "") {
            str += "Enter Purchase_Date\n";
            spdt.focus();
            spdt.className = "txt";
        }
        if (mno.value == "") {
            str += "Enter Mobile_No\n";
            mno.focus();
            mno.className = "txt";
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
    function brdr() {
        var cnrl = document.getElementById();
        sid.className = "txt";
        
    }
    function brdr1() {
        var cnrl = document.getElementById();
        sid.className = "txt1";
    }
    </script>
    <style type="text/css">
                td
{
    font-size:16pt;
    }
    .txt3
    {
        font-family:Gill Sans Ultra Condensed;
        font-size:13pt;
        font-weight:900;
        .txt
        {
               
                border-color:Blue;
                border-width:1px;
                border-style:solid;
                border-radius:10px 0px 10px 0px;
                box-shadow:2px -2px 2px #000000;
                -moz-animation:ss 10s infinite;
            } 
             .txt1
            {
                
                }
            //*@-moz-keyframes ss
            {
                    from{width:100px;}
                    to{width:200px;}
                }*//
           
         
 
        }
    </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<center>
<table  cellspacing="8px" cellpadding="4px">
<tr>
<td><b>Supplier ID:</b></td>
<td>
    <asp:TextBox ID="TextBox1" runat="server"  placeholder="Enter Supplier ID"  CssClass="txt3" Height="30px" Width="207px"></asp:TextBox></td>
</tr>
<tr>
<td><b>Supplier Name:</b></td>
<td>
    <asp:TextBox ID="TextBox2" runat="server"  placeholder="Enter Supplier Name"  CssClass="txt3" Height="30px" Width="207px"></asp:TextBox></td>
</tr>
<tr>
<td><b>Supplier Address:</b></td>
<td>
    <asp:TextBox ID="TextBox3" runat="server"  placeholder="Enter Supplier Address "  CssClass="txt3" Height="30px" Width="207px"></asp:TextBox></td>
</tr>
<tr>
<td><b>E-Mail:</b></td>
<td>
    <asp:TextBox ID="TextBox4" runat="server" placeholder="EnterE-Mail"  CssClass="txt3" Height="30px" Width="207px"></asp:TextBox></td>
</tr>

<tr>
<td><b>Purchase Date:</b></td>
<td>
    <asp:TextBox ID="TextBox5" runat="server" placeholder="Enter Purchase Date"  CssClass="txt3" Height="30px" Width="207px"></asp:TextBox>
    <asp:CalendarExtender ID="TextBox5_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="TextBox5">
    </asp:CalendarExtender>
    </td>
</tr>
<tr>
<td><b>Mobile No:</b></td>
<td>
    <asp:TextBox ID="TextBox6" runat="server"  placeholder="Enter Mobile No"  CssClass="txt3" Height="30px" Width="207px"></asp:TextBox></td>
</tr>
<tr>
    <td><asp:Button ID="Button1" runat="server" Text="SUBMIT" 
            OnClientClick="return fun();" onclick="Button1_Click" Height="39px" 
            Width="78px" Font-Size="Medium" BackColor="DodgerBlue" Font-Bold="true" 
            ForeColor="AntiqueWhite" />


    <asp:Label ID="Label1" runat="server" Text="."></asp:Label></td>
  
    </tr>
</table>
</center>
</asp:Content>

