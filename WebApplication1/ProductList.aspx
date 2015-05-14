<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="WebApplication1.ProductList" %>

<!DOCTYPE html>
<html lang="pl">
<head id="Head1" runat="server">
  <meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title>Dashboard Maps, Free Admin Template</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width">   
  <link href="jqvmap/jqvmap.css" media="screen" rel="stylesheet" type="text/css" />   
  <link rel="stylesheet" href="css/templatemo_main.css">

</head>
<body>
    <form id="form1" runat="server">
  <div id="main-wrapper">
    <div class="navbar navbar-inverse" role="navigation">
      <div class="navbar-header">
        <div class="logo"><h1>Panel Administracyjny TenisShop</h1></div>
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button> 
      </div>   
    </div>
    <div class="template-page-wrapper">
     <div class="navbar-collapse collapse templatemo-sidebar">
        <ul class="templatemo-sidebar-menu">
          <li>
              <input type="text" class="form-control" id="templatemo_search_box" placeholder="Szukaj produktu">
              <span class="btn btn-default">Szukaj</span>
            </li>
          <li class="active"><a href="index.aspx"><i class="fa fa-home"></i>Strona głowna</a></li>
          <li><a href="data-visualization.html"><i class="fa fa-cubes"></i><span class="badge pull-right">9</span>Realizacja zamówień</a></li>
          <li><a href="ManagementProduct.aspx"><i class="fa fa-cubes"></i><span class="badge pull-right">9</span>Dodaj produkt</a></li>
          <li><a href="ManagementProductType.aspx"><i class="fa fa-cubes"></i><span class="badge pull-right">9</span>Dodaj kategorie</a></li>
          <li><a href="maps.html"><i class="fa fa-map-marker"></i><span class="badge pull-right">42</span>Lista produktów</a></li>
          <li><a href="tables.html"><i class="fa fa-users"></i><span class="badge pull-right">NEW</span>Użytkownicy</a></li>
          <li><a href="preferences.html"><i class="fa fa-cog"></i>Preferences</a></li>
          <li><a href="javascript:;" data-toggle="modal" data-target="#confirmModal"><i class="fa fa-sign-out"></i>Wyloguj</a></li>
        </ul>
      </div><!--/.navbar-collapse -->
      
      <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
           <p>Lista produktów</p>
            <asp:GridView ID="gridProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sdsProducts" Width="100%" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="TypeId" HeaderText="TypeId" SortExpression="TypeId" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sdsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:TenisShopDbConnectionString %>" DeleteCommand="DELETE FROM [Product] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Product] ([TypeId], [Name], [Price], [Description], [Image]) VALUES (@TypeId, @Name, @Price, @Description, @Image)" SelectCommand="SELECT * FROM [Product]" UpdateCommand="UPDATE [Product] SET [TypeId] = @TypeId, [Name] = @Name, [Price] = @Price, [Description] = @Description, [Image] = @Image WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TypeId" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Price" Type="Int32" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Image" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TypeId" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Price" Type="Int32" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Image" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
           <p>
               <p>Lista kategorii</p>
               <asp:GridView ID="gridProductType" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sdsProductTypes" Width="30%">
                   
                   <Columns>
                       <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                       <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                       <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                   </Columns>
               </asp:GridView>
               <asp:SqlDataSource ID="sdsProductTypes" runat="server" ConnectionString="<%$ ConnectionStrings:TenisShopDbConnectionString %>" DeleteCommand="DELETE FROM [ProductType] WHERE [Id] = @Id" InsertCommand="INSERT INTO [ProductType] ([Name]) VALUES (@Name)" SelectCommand="SELECT * FROM [ProductType]" UpdateCommand="UPDATE [ProductType] SET [Name] = @Name WHERE [Id] = @Id">
                   <DeleteParameters>
                       <asp:Parameter Name="Id" Type="Int32" />
                   </DeleteParameters>
                   <InsertParameters>
                       <asp:Parameter Name="Name" Type="String" />
                   </InsertParameters>
                   <UpdateParameters>
                       <asp:Parameter Name="Name" Type="String" />
                       <asp:Parameter Name="Id" Type="Int32" />
                   </UpdateParameters>
               </asp:SqlDataSource>
            </p>
          </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Czy napewno chcesz się wylogować ?</h4>
              </div>
              <div class="modal-footer">
                <a href="sign-in.html" class="btn btn-primary">Tak</a>
                <button type="button" class="btn btn-default" data-dismiss="modal">Nie</button>
              </div>
            </div>
          </div>
        </div>
      </div>
        <footer class="templatemo-footer">
          <div class="templatemo-copyright">
            <p>Copyright &copy; Marcin Szczepański</p>
          </div>
        </footer>
      
      <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/templatemo_script.js"></script>
      <script src="jqvmap/jquery.vmap.js" type="text/javascript"></script>
      

</div>
    </form>
</body>
</html>

