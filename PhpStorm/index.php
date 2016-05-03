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
    <nav id="menu">
        <?php
            $cats = $pdo->prepare("select * from ecommerce.categorias order by idcat asc");
            $cats->execute();
            if ($cats->rowCount() >= 1):
                echo '<ul>';
                foreach ($cats->fetchAll() as $result):
                    $id = $result['idcat'];
                    echo '<li>';
                        echo '<a><ins>'.$result['nome'].'</ins></a>';
                        $subCats = $pdo->prepare("select * from ecommerce.subcategorias where idcat=? order by idsubcat asc");
                        $subCats->execute(array($id));
                        if ($subCats->rowCount() >= 1):
                            echo '<ul>';
                            foreach ($subCats->fetchAll() as $result2):
                                echo '<li>';
                                    echo '<a href="'.$result2['url'].'">'.$result2['nome'].'</a>';
                                echo '</li>';
                            endforeach;
                            echo '</ul>';
                        endif;
                    echo '</li>';
                endforeach;
                echo '</ul>';
            endif;
        ?>
    </nav>
    <section id="seccion">

        <h2><ins>Home:</ins> Smartphones<br><br></h2>

        <article>

            <figure>
                <img src="fotos/celular.jpg">
                <figcaption>

                    <strong>Celular Galaxy S20, 4GB RAM, espaço interno 32 GB</strong>
                </figcaption>
                <br><strong>Por: R$ 500,00</strong>
                <br><br><input type="button" class="kk" value="Adicionar ao carrinho">
            </figure>

        </article>
        <article>
            <figure>
                <img src="fotos/celular.jpg">
                <figcaption>

                    <strong>Celular Galaxy S20, 4GB RAM, espaço interno 32 GB</strong>
                </figcaption>
                <br><strong>Por: R$ 500,00</strong>
                <br><br><input type="button" class="kk" value="Adicionar ao carrinho">
            </figure>

        </article>
        <article>
            <figure>
                <img src="fotos/celular.jpg">
                <figcaption>

                    <strong>Celular Galaxy S20, 4GB RAM, espaço interno 32 GB</strong>
                </figcaption>
                <br><strong>Por: R$ 500,00</strong>
                <br><br><input type="button" class= "kk" value="Adicionar ao carrinho">
            </figure>

        </article>
        <article>
            <figure>
                <img src="fotos/celular.jpg">
                <figcaption>

                    <strong>Celular Galaxy S20, 4GB RAM, espaço interno 32 GB</strong>
                </figcaption>
                <br><strong>Por: R$ 500,00</strong>
                <br><br><input type="button" class= "kk" value="Adicionar ao carrinho">
            </figure>

        </article>

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
