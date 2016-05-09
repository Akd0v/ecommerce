<?php
    require_once "connect/connect.php";

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Meu Ecommerce">
    <meta name="keywords" content="HTML5, CSS3, JavaScript">
    <title>Minha Loja</title>
    <link rel="stylesheet" href="CSS/style.css">
</head>
<body>
<div id="agrupar">
    <header id="cabecera">

        <h1><img src="fotos/images.jpg"> Minha Loja</h1>

        <ul id="menu2">
            <input type="text" id="search"  placeholder="encontre o seu produto" size="30"> &nbsp; &nbsp;
            <li><a href="#"><ins>Entre</ins></a></li>
            ou
            <li><a href="#"><ins>Cadastre-se</ins></a>&nbsp; &nbsp;</li>
            <img src="fotos/compras.jpg">
            <li><a href="#"><ins>1 Item</ins></a></li>
        </ul>

    </header>
    <?php
    require_once 'includes/menu.php';
    ?>
    <section id="seccion">
        <h2><ins>Home:</ins> Smartphones<br><br></h2>
        <table>
            <tr>
                <?php
                if(isset($_GET['page']))
                {
                    $page= $_GET['page'];
                }
                else
                {
                    $page=1;
                }
                if (isset($_GET["idsubcat"])){
                    $idSubCat=$_GET["idsubcat"];
                    $produto = $pdo->prepare("select * from ecommerce.produtos where idsubcat=? order by idproduto asc");
                    $produto->execute(array($idSubCat));
                    include_once 'includes/pag_query_subcategorias.php';
                    include_once 'includes/produtos.php';
                } else
                {
                    $idSubCat=1;
                    $produto = $pdo->prepare("select * from ecommerce.produtos where idsubcat=? order by idproduto asc");
                    $produto->execute(array($idSubCat));
                    include_once 'includes/pag_query_subcategorias.php';
                    include_once 'includes/produtos.php';
                }               
                ?>
            </tr>
        </table>
        <?php
        include_once 'includes/pagina_subcategorias.php';
        ?>
        <footer id="pie">
            <br>Dereitos Reservados &copy; 2016
        </footer>
    </section>
</div>
</body>
</html>

<?php
$pdo = null;
?>
