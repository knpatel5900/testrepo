<%@ Page Title="" Language="C#" MasterPageFile="~/fam1.master" AutoEventWireup="true" CodeFile="Dt.aspx.cs" Inherits="Dt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="313px" Width="347px" 
        AutoGenerateRows="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" >
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="Assetid">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# bind("assetid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="AssetName">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# bind("assetname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SupplierId">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# bind("suplid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SupplierName">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# bind("supnm") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           
        </Fields>
        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#333333" HorizontalAlign="Center" BackColor="#FFCC66" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:DetailsView>
   
</asp:Content>

