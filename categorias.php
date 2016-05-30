<?php
session_start();
session_destroy();
require_once "class/produtos.php";
require_once "class/categorias.php";
?>
<!DOCTYPE html>
<?php include_once 'includes/inicio.php';?>
    <ul id="menu2">
        <form action="index.php" method="post">
            <input type="text" id="search"  placeholder="encontre o seu produto" size="30" name="search">
                <input type="submit" class="pp" value="buscar"> &nbsp; &nbsp;
                <li><a href="http://localhost:8080/includes/login/login.php"><ins>Entre</ins></a></li>
                ou
                <li><a href="http://localhost:8080/includes/cadastro/cadastro.php"><ins>Cadastre-se</ins></a>&nbsp; &nbsp;</li>
            </form>
        </ul>
    </header>
    <?php
    include_once 'includes/menu/menu1.php';
    ?>
    <section id="seccion">
        <?php
        $idCat = intval($_GET['idcat']);
        if (isset($idCat))
        {
            $cat = categorias::Singlenton();
            $query = $cat->getCategorias();
            if ($query->rowCount()>0)            {
                $row = $query->fetch(PDO::FETCH_ASSOC);
                ?>
                <h2><a href="http://localhost:8080/index.php"><ins>Home:</ins></a>&nbsp;<?= $row['nome'];?><br><br></h2>
                <?php
            }
        } ?>
        <table>
            <tr>
                <?php
                if(isset($_GET["page"]))
                {
                    $page= intval($_GET["page"]);
                }
                else
                {
                    $page=1;
                }
                if (isset($_GET["idcat"])){
                    $idCat= intval($_GET["idcat"]);
                    $produto = produtos::Singlenton();
                    $prodCat = $produto->produtoCategorias($idCat);
                    include_once 'includes/pagina/pag_query_categorias.php';
                    include_once 'includes/produtos/produtos.php';
                } else
                {
                    $idCat=1;
                    $produto = produtos::Singlenton();
                    $prodCat = $produto->produtoCategorias($idCat);
                    include_once 'includes/pagina/pag_query_categorias.php';
                    include_once 'includes/produtos/produtos.php';
                }
                ?>
            </tr>
        </table>
        <?php
        include_once 'includes/pagina/pagina_categorias.php';
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