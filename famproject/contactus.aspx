<%@ Page Title="" Language="C#" MasterPageFile="~/fammain.master" AutoEventWireup="true" CodeFile="contactus.aspx.cs" Inherits="contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        .style1
        {
            width: 213px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
<h1>Contact Us</h1>
    <table cellspacing="5px" cellpadding="5px">
<tr><td><b>Your Name:</b></td>
<td><asp:TextBox ID="TextBox1" runat="server"  Height="30px" Width="198px"></asp:TextBox></td>
    </tr>
<tr><td><b>Your E-mail:</b></td>
<td>
    <asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="198px"></asp:TextBox></td></tr>
<tr><td><b>Your City</b></td>
<td>
    <asp:TextBox ID="TextBox3" runat="server"  Height="30px" Width="198px"></asp:TextBox></td></tr>
<tr><td><b>Your Message:</b></td>
<td>
    <asp:TextBox ID="TextBox4" runat="server"  Height="100px" Width="198px"></asp:TextBox></td></tr>
<tr><td>
    <asp:Button ID="Button1" runat="server" Text="SEND"  Height="39px" Width="78px" Font-Size="Medium" BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite" /></td>
<td>
    <asp:Button ID="Button2" runat="server" Text="CLEAR"  Height="39px" Width="78px" Font-Size="Medium" BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite" /></td></tr>
</table></center>
</asp:Content>

