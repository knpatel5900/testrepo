<%@ Page Title="" Language="C#" MasterPageFile="~/fam1.master" AutoEventWireup="true" CodeFile="Listview.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" 
        onselectedindexchanged="ListView1_SelectedIndexChanged">
        

    <ItemTemplate>
     <table border="1px" cellspacing="5px">
                <tr>
                    <td>
                   Asset_Id
                    </td>
                   
                    <td>
                  Asset_Name
                    </td>
                    <td>
                    Description
                    </td>
                    <td>
                    Ext_Description
                    </td>
                    <td>
                      Supplier_Id
                    </td>
                    <td>
                       Supplier_Name
                    </td>
                     <td>
                       Asset_Type
                    </td>
                    <td>
                       Asset_Price
                    </td>
                    <td>
                       Mfg_Date
                    </td>
                    <td>
                    Inst_Date

                    </td>
                    <td>
                        Mntnce

                    </td>
                    <td>
                   Life
                    </td>
                    
                               
                </tr>
            </table>
    <table>
                <tr>
                    <td>
                        <asp:Label ID="lbl1" runat="server" Text='<%#bind("assetid") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%#bind("assetname") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%#bind("description") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%#bind("extdescription") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text='<%#bind("suplid") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text='<%#bind("supnm") %>'></asp:Label>

                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text='<%#bind("asstype") %>'></asp:Label>

                    </td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text='<%#bind("assprice") %>'></asp:Label>

                    </td>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text='<%#bind("mfgdate") %>'></asp:Label>

                    </td>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text='<%#bind("instdate") %>'></asp:Label>

                    </td>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text='<%#bind("mntnc") %>'></asp:Label>

                    </td>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text='<%#bind("life") %>'></asp:Label>

                    </td>
                     <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="edit">edit</asp:LinkButton>
                    </td>
                               
                </tr>
            </table>
    
    
    
    </ItemTemplate>


    </asp:ListView>

</asp:Content>

