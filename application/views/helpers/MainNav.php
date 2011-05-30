<?php

class Zend_View_Helper_MainNav
    extends Zend_View_Helper_Abstract
{
    public function mainNav()
    {
        return $this->view->render('/common/main-nav.phtml');
    }
}
