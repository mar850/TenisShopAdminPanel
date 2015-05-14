<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagementProduct.aspx.cs" Inherits="WebApplication1.add_product" %>

<!DOCTYPE html>
<html lang="pl">
<head runat="server">
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
            <form class="navbar-form">
              <input type="text" class="form-control" id="templatemo_search_box" placeholder="Szukaj produktu">
              <span class="btn btn-default">Szukaj</span>
            </form>
          </li>
          <li class="active"><a href="index.aspx"><i class="fa fa-home"></i>Strona głowna</a></li>
          <li><a href="data-visualization.html"><i class="fa fa-cubes"></i><span class="badge pull-right">9</span>Realizacja zamówień</a></li>
          <li><a href="ManagementProduct.aspx"><i class="fa fa-cubes"></i><span class="badge pull-right">9</span>Dodaj produkt</a></li>
          <li><a href="ManagementProductType.aspx"><i class="fa fa-cubes"></i><span class="badge pull-right">9</span>Dodaj kategorie</a></li>
          <li><a href="ProductList.aspx"><i class="fa fa-map-marker"></i><span class="badge pull-right">42</span>Lista produktów</a></li>
          <li><a href="tables.html"><i class="fa fa-users"></i><span class="badge pull-right">NEW</span>Użytkownicy</a></li>
          <li><a href="preferences.html"><i class="fa fa-cog"></i>Preferences</a></li>
          <li><a href="javascript:;" data-toggle="modal" data-target="#confirmModal"><i class="fa fa-sign-out"></i>Wyloguj</a></li>
        </ul>
      </div><!--/.navbar-collapse -->
      
      <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
            <form id="form1" runat="server">
           <div class="form-group">
            <label for="usr">Nazwa produktu</label>
            <input type="text" class="form-control" runat="server" id="product_name" placeholder="nazwa">
           </div>
            <div class="form-group">
            <label for="usr">Cena</label>
            <input type="text" class="form-control" runat="server" id="price" placeholder="cena w zł">
           </div>
            <div class="form-group">
                <label for="comment">Kategoria</label>
                <asp:DropDownList ID="DropDownCategoryList" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TenisShopDbConnectionString %>" SelectCommand="SELECT * FROM [ProductType]"></asp:SqlDataSource>
            
           </div>
            <div class="form-group">
              <label for="comment">Opis</label>
              <textarea class="form-control" runat="server" rows="5" id="comment"></textarea>
            </div>
            <div class="form-group">
               <label for="exampleInputFile">Wybierz plik</label>
               <input runat="server" type="file" id="images_files">
                
          </div>
          <button type="submit" class="btn btn-default" runat="server" id="add_product_button">Dodaj</button>
            </form>
          <label for="usr" id="info_label_product" runat="server"></label>
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
</body>
</html>
