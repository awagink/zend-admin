<?php

class Zadmin_Controller_Basic
    extends Zend_Controller_Action
{
    protected function _disableView()
    {
        $this->_helper->getHelper('layout')->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
    }
    
    protected function _json($data)
    {
        $this->_response->setBody(Zend_Json_Encoder::encode($data));
    }
    
    protected function _notAjaxExit()
    {
        if (!$this->_request->isXmlHttpRequest()) {
            exit();
        }
    }
}
