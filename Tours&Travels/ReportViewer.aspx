<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportViewer.aspx.cs" Inherits="Tours_Travels.ReportViewer" %>

<%@ Register Assembly="CrystalDecisions.Web" Namespace="CrystalDecisions.Web" TagPrefix="cr" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Crystal Report Viewer</title>
</head>
<body>
    <form id="form1" runat="server">
        <cr:CrystalReportViewer 
            ID="CrystalReportViewer1" 
            runat="server" 
            AutoDataBind="true" 
            ToolPanelView="None" 
            Width="100%" 
            Height="900px" />
    </form>
</body>
</html>
