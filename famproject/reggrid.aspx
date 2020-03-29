<%@ Page Title="" Language="C#" MasterPageFile="~/fam1.master" AutoEventWireup="true" CodeFile="reggrid.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   
   <center>


       -<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        Height="83px" Width="249px" 
        onrowediting="GridView1_RowEditing" 
        onrowcancelingedit="GridView1_RowCancelingEdit" 
        onrowupdating="GridView1_RowUpdating" 
        onrowdeleting="GridView1_RowDeleting" BackColor="White" 
    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" >
        <Columns>
            
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton123" runat="server" Visible="false" CommandName="edit">Edit</asp:LinkButton>
                    
                </ItemTemplate>
                <EditItemTemplate>

                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="update">Upadte</asp:LinkButton>
                      <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
               
                </EditItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField>
                <HeaderTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" 
                        oncheckedchanged="CheckBox2_CheckedChanged" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Id">
                <EditItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# bind("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Firstname">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# bind("firstname") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# bind("firstname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Lastname">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# bind("lastname") %>'></asp:TextBox>
                </EditItemTemplate>
                  <FooterTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# bind("lastname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# bind("password") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# bind("password") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
               
           
            <asp:TemplateField HeaderText="birthday">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# bind("birthday") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# bind("birthday") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
               
           
            <asp:TemplateField HeaderText="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# bind("email") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
<asp:TemplateField HeaderText="category">
    <EditItemTemplate>
        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
    </EditItemTemplate>
    <ItemTemplate>
        <asp:Label ID="Label13" runat="server" Text='<%# bind("category") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>
            <asp:TemplateField HeaderText="Country">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# bind("country") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label14" runat="server" Text='<%# bind("country") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="State">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# bind("state") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# bind("country") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# bind("state") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# bind("city") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>



        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#008469" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#003399" HorizontalAlign="Left" BackColor="#99CCCC" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />



    </asp:GridView>
    </center>
    <center>

      <table>
        <tr>
       
         <td>
             <asp:Button ID="Button2" runat="server" Text="Update" 
                 onclick="Button2_Click1" Height="39px" Width="78px" Font-Size="Medium" BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite"  /></td>
          <td>
              <asp:Button ID="Button3" runat="server" Text="Delete" onclick="Button3_Click" 
                  Height="39px" Width="78px" Font-Size="Medium" BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite" /></td>
        
        <td>
            <asp:Label ID="Label7" runat="server" Text="."></asp:Label></td>
        </tr>
        
        
        </table>
        </center>
</asp:Content>

