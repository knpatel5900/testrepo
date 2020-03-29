<%@ Page Title="" Language="C#" MasterPageFile="~/FAM2.master" AutoEventWireup="true" CodeFile="gridAddassetm.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1"
            runat="server" Text="Search" onclick="Button1_Click" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" onrowediting="GridView1_RowEditing" 
    onrowupdating="GridView1_RowUpdating" 
        onrowcancelingedit="GridView1_RowCancelingEdit" 
        onrowdeleting="GridView1_RowDeleting" Font-Bold="True" CellPadding="4" 
    BackColor="White" BorderColor="#3366CC" BorderStyle="None" 
        BorderWidth="1px" Width="854px" style="margin-top: 0px">
        <Columns>
        <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton123" runat="server" Visible="false" CommandName="edit">Edit</asp:LinkButton>
                    
                </ItemTemplate>
                <EditItemTemplate>

                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="update" >Upadte</asp:LinkButton>
                      <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
               
                </EditItemTemplate>
                </asp:TemplateField>
           
            <asp:TemplateField HeaderText="Cost      Breakup">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton4" runat="server" 
                        oncommand="ImageButton4_Command" ImageUrl="icon%20images/ok.png"
                         CommandArgument='<%# bind("Assetid") %>' />
                </ItemTemplate>
            </asp:TemplateField>
           
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" 
                        oncheckedchanged="CheckBox2_CheckedChanged" />
                </HeaderTemplate>
            </asp:TemplateField>
           
             <asp:TemplateField HeaderText="Asset Id">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" 
                        CommandArgument='<%# bind("Assetid") %>' oncommand="LinkButton2_Command" 
                        Text='<%# bind("Assetid") %>'></asp:LinkButton>
                    
                </ItemTemplate>
                 <EditItemTemplate>
                     <asp:Label ID="Label13" runat="server" Text='<%# bind("assetid") %>'></asp:Label>
                 </EditItemTemplate>
               
            </asp:TemplateField>
           
           <asp:TemplateField HeaderText="Asset Name">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# bind("Assetname") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# bind("Assetname") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# bind("Description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# bind("Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Supplier Id">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# bind("SuplID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# bind("SuplID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Supplier Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# bind("SupNM") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# bind("supNM") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Asset Price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# bind("AssPrice") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# bind("AssPrice") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Manufacture Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# bind("MFGDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# bind("MFGdate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Installation Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# bind("InstDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# bind("InstDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Asset Life ">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# bind("Life") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# bind("Life") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             
        </Columns>
    
        <FooterStyle BackColor="" ForeColor="#003399" />
        <HeaderStyle BackColor="#008469" Font-Bold="True" Font-Size="13pt" 
            ForeColor="White" />
        <PagerStyle BackColor="#008469" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    
    </asp:GridView>
    </center>
    <center>
    <table> <tr>
       
         <td>
             <%--<asp:Button ID="Button2" runat="server" Text="Update" onclick="Button2_Click" Height="39px" Width="78px" Font-Size="Larger" BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite"/></td>
        --%>  <td>
              <asp:Button ID="Button3" runat="server" Text="Delete" onclick="Button3_Click" 
                  Height="39px" Width="78px" Font-Size="Larger" BackColor=DodgerBlue Font-Bold="true" ForeColor="AntiqueWhite" /></td>
        
        <td>
            <asp:Label ID="Label7" runat="server" Text="."></asp:Label></td>
        </tr></table></center>
      


</asp:Content>

