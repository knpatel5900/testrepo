<%@ Page Title="" Language="C#" MasterPageFile="~/fam1.master" AutoEventWireup="true" CodeFile="gridsupplier.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <asp:GridView ID="GridView1" runat="server" 
    AutoGenerateColumns="False" 
    BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
    CellPadding="4" style="margin-right: 0px" onrowupdating="GridView1_RowUpdating" 
            onrowediting="GridView1_RowEditing" 
            onrowcancelingedit="GridView1_RowCancelingEdit">
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
            <asp:TemplateField HeaderText="Supplier ID">
                <EditItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# bind("supid") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# bind("supid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Supplier Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# bind("supname") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# bind("supname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Supplier Address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# bind("supaddrs") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# bind("supaddrs") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="E-mail">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# bind("email") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="purchasedate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# bind("purchasedate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# bind("purchasedate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mobile No">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# bind("mobileno") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# bind("mobileno") %>'></asp:Label>
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

