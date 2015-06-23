<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd2.Master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="RealEstate.ViewDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .span10 h2 {
            color: blue;
            font-size: 18px;
            margin-top: -20px;

        }
        .createdate {
            color: olive;
            float: left;
            margin-left: 5px;
            
        }
        .des {
            color: gray;
            margin-left: 5px;
            text-align: justify;
        }
        .img {
            text-align: center;
        }
        .cont {
            text-align: justify;
            margin-left: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="border: 1px solid grey; margin-left: 5px; margin-top: -20px; width: 98%">
        <div class="span10">
            <% if (listRealEstateNew.Count == 0)
               {%>
                   <%--<h2> chưa có gi </h2>
                   <h2><% =listRealEstateNew[0].Title  %></h2>
                   <p><span> <% =listRealEstateNew[0].CreateDate %></span></p>
                   <p><span><%= listRealEstateNew[0].Description %></span></p>
                   <img src="<%= listRealEstateNew[0].Images %>" alt=""/>
                   <p><span><%= listRealEstateNew[0].Content %> </span></p>--%>
               <%}
               else
               {%>
                   <h2><% =listRealEstateNew[0].Title  %></h2>
                        <div class="row"><p class="createdate"><span> <% =listRealEstateNew[0].CreateDate %></span></p></div>
                        <div class="row"><p class="des"><span><%= listRealEstateNew[0].Description %></span></p></div>
                        <div class="row"><p class="img"><img src="<%= listRealEstateNew[0].Images %>" alt="" width="50%"/></p></div>
                        <div class="row"><p class="cont"><span><%= listRealEstateNew[0].Content %> </span></p></div>            
               <%} %>           
        </div>
    </div>
</asp:Content>
