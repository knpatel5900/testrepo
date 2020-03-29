<%@ Page Title="" Language="C#" MasterPageFile="~/fam1.master" AutoEventWireup="true" CodeFile="graph1.aspx.cs" Inherits="graph1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <asp:Chart ID="Chart1" runat="server">
            <Series>
                <asp:Series Name="Series1" XValueMember="Assetname" YValueMembers="AssPrice" 
                    ChartType="Bar" YValuesPerPoint="6">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1" Area3DStyle-Enable3D="true">
<Area3DStyle Enable3D="True"></Area3DStyle>
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>

        
    
   
</asp:Content>

