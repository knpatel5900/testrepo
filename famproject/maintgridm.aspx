<%@ Page Title="" Language="C#" MasterPageFile="~/FAM2.master" AutoEventWireup="true" CodeFile="maintgridm.aspx.cs" Inherits="maintgrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        onrowediting="GridView1_RowEditing" 
        onrowupdating="GridView1_RowUpdating" 
        onrowcancelingedit="GridView1_RowCancelingEdit" 
        onrowdeleting="GridView1_RowDeleting" BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
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
            <asp:TemplateField HeaderText="Maintanance Id">
                <EditItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# bind("maintananceid") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# bind("maintananceid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Maintanance Cost">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# bind("cost") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# bind("cost") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Maintanance Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# bind("date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# bind("date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Asset Id">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# bind("assetid") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# bind("assetid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Maintanance By">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# bind("maintananceby") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# bind("maintananceby") %>'></asp:Label>
                </ItemTemplate>
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
         <table>
        <tr>
        <td>
            &nbsp;</td>
         <td>
             <asp:Button ID="Button2" runat="server" Text="Update" onclick="Button2_Click"  Height="39px" Width="78px" Font-Size="Larger" BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite"/></td>
          <td>
              <asp:Button ID="Button3" runat="server" Text="Delete"
                  onclick="Button3_Click"  Height="39px" Width="78px" Font-Size="Larger" BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite"  /></td>
        
        <td>
            <asp:Label ID="Label7" runat="server" Text="."></asp:Label></td>
        </tr>
        
        
        </table>
    </center>
     
</asp:Content>

