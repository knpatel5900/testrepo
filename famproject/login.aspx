<%@ Page Title="" Language="C#" MasterPageFile="~/fammain.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
     function log()
          {
             var uname = document.getElementById('<%=TextBox1.ClientID%>');
             var pass = document.getElementById('<%=TextBox2.ClientID%>');
             var cat = document.getElementById('<%=DropDownList1.ClientID%>')
             var str = "";
             if (uname.value == "") 
             {
                 str = str + "Enter UserName\n";
                 uname.className = "ff";
                 uname.className = "gg";
                 uname.focus();
                 uname.blur();
                 
             }

             if (cat.value == "-----category------") {
                 str += "select category";
             }
             if (pass.value == "")
              {

                  str += "Enter Password";
                  pass.className = "ff";
                  pass.className = "gg";
           pass.focus();
           pass.blur();
          
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
        function brdr(temp) 
        {
            var cnrl = document.getElementById(temp);
            cnrl.className = "ff";
        }
        function brdr1(temp)
         {
            var cnrl = document.getElementById(temp);
            cnrl.className = "gg";
        }
     
     </script>
         <style type="text/css">
        .ff
        {
               
                border-color:Blue;
                border-width:1px;
                border-style:solid;
                border-radius:10px 0px 10px 0px;
                box-shadow:2px -2px 2px #000000;
                -moz-animation:ss 10s infinite;
            } 
           
            .gg
            {
                
                }
         
             .style1
             {
                 width: 236px;
             }
         
    </style>
</asp:Content>

 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <center>
     <h1>Login</h1>
   <table cellspacing="10px">

            <tr>
                <td class="style1">
                    <b >UserName</b>
                    </td></tr>
                   <tr> 
               <td class="style1">
                   <asp:TextBox ID="TextBox1" runat="server" onfocus="brdr('TextBox1')" 
                       onblur="brdr1('TextBox1')" Height="31px" Width="235px" 
                       BackColor="Azure" Font-Bold="true"></asp:TextBox>
                </td>
            
           </tr>
           <tr>
                <td class="style1">
                    <b> Password</b>
                </td>
                </tr>
                <tr>
                <td class="style1">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" 
                        onfocus="brdr('TextBox2')" onblur="brdr1('TextBox2')" Height="31px" 
                        Width="235px" Font-Bold="true" BackColor="Azure"></asp:TextBox>
                   
                </td>
                <tr><td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td></tr>
           </tr>
           <tr>
         
                <td class="style1">
                    <asp:Button ID="Button1" runat="server" Text="Log in"  OnClick="Button1_Click" 
                        OnClientClick="return log();" Height="39px" Width="78px" Font-Size="Larger" BackColor="DodgerBlue" Font-Bold="true" ForeColor="AntiqueWhite" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label1" runat="server" Text="*"></asp:Label>
                </td>
            </tr>
             
           
        </table>
      
           </center> 
       

</asp:Content>

