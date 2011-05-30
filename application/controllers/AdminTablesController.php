<?php

class AdminTablesController
    extends Zend_Controller_Action
{
    public function indexAction()
    {
        
    }
    
    public function addTableAction()
    {
        $this->view->addTableForm = new Form_AddTable();
    }
    
    public function addFieldAction()
    {
        $addFieldForm = new Form_AddField;
        $idTable = (int)$this->_getParam('id');
        if ($this->_request->isPost()) {
            
        } else {
            $addFieldForm->getElement('id_table')->setValue($idTable);
        }
        $this->view->addFieldForm = $addFieldForm;
    }
}
