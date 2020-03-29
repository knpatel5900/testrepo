<%@ Page Title="" Language="C#" MasterPageFile="~/fammain.master" AutoEventWireup="true"
    CodeFile="Registration.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function validate() {

            var txtfn = document.getElementById('<%=fntxt.ClientID %>');
            var txtln = document.getElementById('<%=lntxt.ClientID %>');
            var txtpass = document.getElementById('<%=passtxt.ClientID %>');
            var txtbth = document.getElementById('<%=TextBox1.ClientID %>');
            var txtrepass = document.getElementById('<%=TextBox2.ClientID %>');
            var txtemail = document.getElementById('<%=emailtxt.ClientID %>');
            var count = document.getElementById('<%=DropDownList1.ClientID%>');
            var state = document.getElementById('<%=DropDownList2.ClientID%>');
            var city = document.getElementById('<%=DropDownList3.ClientID%>');
          

            var exp1 = /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/;
            var str = "";
            
            if (txtfn.value == "") {
                str = str + "Enter FirstName\n";
            }
            if (txtln.value == "") {
                str += "Enter LastName\n";
            }
            if (txtpass.value == "") {
                str += "Enter Password\n";
            }
            if (txtrepass.value == "") {
                str += "Enter RePassword\n";
            }
            else if (txtpass.value != txtrepass.value) {
                str += "Password Mismatch\n";
            }
            if (txtbth.value == "") {
                str += "Enter Birthdate\n";
            }
            if (txtemail.value == "") {
                str += "Enter E-mail\n";
            }
            else if (exp1.test(txtemail.value) == false)
            
             {
                str += "Enter Proper Email ID\n";

            }
            if (count.value == "------------select  country------") {
                str = str + "Select Country\n";
            }

            if (state.value == "------------select  state------") {
                str = str + "Select State\n";
            }
            if (city.value == "------------select  city------") {
                str = str + "Select City\n";
            }
            if (state.value == "") {
                str = str + "Select State\n";
            }
            if (city.value == "") {
                str = str + "Select City\n";
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
        .style1
        {
            width: 213px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <center>
    <h1>Registration</h1>
        <div>
            <table cellspacing="2px" cellpadding="3px">
                <tr>
                    
                   
                    <td>
                        <asp:TextBox ID="fntxt" runat="server" CssClass="txt" placeholder="Enter First Name" Height="30px" Width="207px"></asp:TextBox>
                    </td>
                  
                    <td class="style1">
                        <asp:TextBox ID="lntxt" runat="server" CssClass="txt"  placeholder="Enter Last Name" Height="30px" Width="207px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    
                    <td>
                        <asp:TextBox ID="passtxt" runat="server" TextMode="Password" CssClass="txt"  
                            placeholder=" Enter Password" Height="30px" Width="207px"></asp:TextBox>
                    </td>
                    
                </tr>
                 
                <tr>
                    
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="txt"  placeholder="Enter Re-Password"  Height="30px" Width="207px"></asp:TextBox>
                    </td>
                    
               
                <tr>
                    
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="txt" placeholder="  Enter Birth Date"  Height="30px" Width="207px"></asp:TextBox>
                       
                        <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="TextBox1">
                        </asp:CalendarExtender>
                    </td>
                   
                </tr>
                <tr>
                   
                    <td>
                        <asp:TextBox ID="emailtxt" runat="server" CssClass="txt" placeholder=" Enter E-mail"  Height="30px" Width="207px"></asp:TextBox>
                    </td>
                </tr>
                <tr><td><b>Category:</b></td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonList1"
                        runat="server" >
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>Manager</asp:ListItem>
                    </asp:RadioButtonList>
                </td></tr>
                <tr> 
                <td>
                      <b> Country:</b>
                        </td> <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    </tr>
                <tr>
                <td>
                        <b>State:</b>
                   </td><td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                </asp:DropDownList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="DropDownList1"  EventName="SelectedIndexChanged"/> 
                            </Triggers>
                        </asp:UpdatePanel>
                    </td></tr>
                <tr> <td>
                        <b>City:</b>
                       </td>  <td>
                          <asp:UpdatePanel  ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" >
                                </asp:DropDownList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="DropDownList2" /> 
                            </Triggers>
                        </asp:UpdatePanel>
                              
                   
                       
                    </td>
                    </tr>
               
               
                    <td><asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" OnClientClick="return validate();" Height="39px" Width="78px" Font-Size="Medium" BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite"  /></td>
           <td class="style1"> <asp:Button ID="Button2" runat="server" Text="Reset" OnClick="Button2_Click" Height="39px" Width="78px" Font-Size="Medium" BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite" /></td>
           <td> <asp:Label ID="Label1" runat="server" Text="*"></asp:Label></td>
                </tr>
               
            </table>
            
        </div>
    </center>
</asp:Content>
