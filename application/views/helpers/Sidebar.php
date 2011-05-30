<?php

class Zend_View_Helper_Sidebar
    extends Zend_View_Helper_Abstract
{
    public function sidebar()
    {
        $controller = Zend_Controller_Front::getInstance()->getRequest()->getControllerName();
        switch($controller) {
            case 'admin':
                return $this->view->render('/common/sidebar.phtml');
                break;
            case 'admin-tables':
                return $this->view->render('/common/_tables-sidebar.phtml');
                break;
            case 'admin-settings':
                break;
        }
    }
}
