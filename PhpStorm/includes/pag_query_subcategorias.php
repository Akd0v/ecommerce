<?php
$loop = 4;
$i=1;
$num_rows = $produto->rowCount();
$rows_per_page= 8;
$lastpage= ceil($num_rows / $rows_per_page);
$page=(int)$page;
if($page > $lastpage){
    $page= $lastpage;
}
if($page < 1){
    $page=1;
}
$limit= 'LIMIT '. ($page -1) * $rows_per_page . ',' .$rows_per_page;
$prod =$pdo->prepare("select * from ecommerce.produtos where idsubcat=? order by idproduto asc $limit");
$prod->execute(array($idSubCat));
