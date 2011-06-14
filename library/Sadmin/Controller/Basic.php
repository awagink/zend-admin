<?php

class Sadmin_Controller_Basic
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
    
    protected function _appendScript($name, $fullName = false)
    {
        if ($fullName !== false) {
            $pathToScript = $name;
        } else {
            $pathToScript = '/js/' . ltrim($name, '/');
        }

        $this->view->headScript()->appendFile($pathToScript);

        return $this;
    }
    
    protected function _addCkeditor()
    {
	$this->_appendScript('/js/library/ckfinder/ckfinder.js', true);
	$this->_appendScript('/js/library/ckeditor/ckeditor.js', true);
	$this->_appendScript('/js/library/ckeditor/adapters/jquery.js', true);
        
    }
}
