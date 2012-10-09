<?php

define('ZENGALLERY_MODULE', 'zengallery');

if (basename(dirname(__FILE__)) != ZENGALLERY_MODULE) {
	throw new Exception(ZENGALLERY_MODULE . ' module not installed in correct directory');
}