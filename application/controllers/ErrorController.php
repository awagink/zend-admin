<?php

class ErrorController extends Zend_Controller_Action
{

    public function preDispatch()
    {
        $this->_helper->getHelper('layout')->disableLayout();
    }

    public function errorAction()
    {
        $errors = $this->_getParam('error_handler');

        Zend_Registry::get('log')->warn($errors->exception->getMessage());

        if (APPLICATION_ENV === 'production') {
            if ($errors->type == Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_CONTROLLER ||
                    $errors->type == Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ACTION) {
                $this->SetErrorMsg('Page not found');
            } else if ($errors->exception instanceof Sp_Exception_ShowUser) {
                $this->SetErrorMsg($errors->exception->getMessage());
            } else if ($errors->exception instanceof Sp_Exception_Internal) {
                $this->SetErrorMsg('Internal error');
            } else {
                $this->SetErrorMsg('Internal error');
            }
            return $this->render('production-error');
        } else if (APPLICATION_ENV === 'development') {
            switch ($errors->type) {
                case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_CONTROLLER:
                case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ACTION:
                    //404 error -- controller or action not found
                    $this->getResponse()->setHttpResponseCode(404);
                    break;
                default:
                    //application error
                    $this->getResponse()->setHttpResponseCode(500);
                    break;
            }
            $this->view->exception = $errors->exception;
            $this->view->request = $errors->request;
            return $this->render('development-error');
        }
    }

    private function SetErrorMsg($msg)
    {
        $this->view->errorMsg = $this->view->translate($msg);
    }

}