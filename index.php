<?php 

include("config.php");

class Borngroup{

	public function getProductPrice($product,$db){

		$product = array_count_values($product);
		$productTotal = []; 
		foreach ($product as $productCode => $productOccurance) {
			$result = mysqli_query($db,"SELECT pt.id, pt.product_code, pt.product_unit_price, ptsp.bulk_qty, ptsp.bulk_qty_price FROM `product_table` as pt LEFT JOIN `product_table_special_price` as ptsp on `pt`.id = ptsp.pid WHERE `pt`.product_code = '".$productCode."'");

			$addProducts = mysqli_fetch_array($result,MYSQLI_ASSOC);
			
			if($addProducts['bulk_qty'] == ''){
				$productTotal[$productCode] = $addProducts['product_unit_price']*$productOccurance; 
			}else{
				if($productOccurance < $addProducts['bulk_qty']){
					$productTotal[$productCode] = $addProducts['product_unit_price']*$productOccurance; 
				}else if($productOccurance == $addProducts['bulk_qty']){
					$productTotal[$productCode] = $addProducts['bulk_qty_price'];	
				}
				else if($productOccurance > $addProducts['bulk_qty']){ 
					$remainder = $productOccurance	 % $addProducts['bulk_qty'];
					$quotient = ($productOccurance - $remainder) / $addProducts['bulk_qty'];
					$productPrice = ($quotient*$addProducts['bulk_qty']) + ($remainder * $addProducts['product_unit_price']); 
					//echo $productPrice;  
					$productTotal[$productCode] = $productPrice;


				}
			}
		}
				echo '<pre>'; print_r($productTotal);
				echo array_sum($productTotal); 
	}

}

$bornObj = new Borngroup();
//$bornObj->getProductPrice(array('A','B','B','C','D','D','D','D','D','D','D','D','D'),$db);
$bornObj->getProductPrice(array('A','B','C','D'),$db);