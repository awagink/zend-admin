<?php

class AdminTablesController
    extends Zend_Controller_Action
{
    public function indexAction()
    {
        
    }
    
    public function addTableAction()
    {
        $addTableForm = new Form_AddTable();
        if ($this->_request->isPost()) {
            //add table
            $idTable = $addTableForm->addTable($this->_request->getPost());
            if ($idTable) {
                $this->_redirect('/admin-tables/add-field/id/' . $idTable);
            }
        }
        $this->view->addTableForm = $addTableForm;
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
