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
            $idTable = $addFieldForm->addField($this->_request->getPost());
            if (is_numeric($idTable)) {
                $this->_redirect('/admin-tables/view-table/id_table/' . $idTable);
            }
        } else {
            $addFieldForm->getElement('id_table')->setValue($idTable);
        }
        $this->view->addFieldForm = $addFieldForm;
    }
    
    public function viewTableAction()
    {
        $idTable = (int)$this->_getParam('id_table');
        
        $adminTableModel = new Model_AdminTable;
        $table = $adminTableModel->find($idTable)->current();
        if (!is_object($table)) {
            throw new Zadmin_Exception_ShowUser('Table not found');
        }
        $adminFieldsModel = new Model_AdminField;
        $this->view->table  = $table;
        $this->view->fields = $adminFieldsModel->getTableFields($table->id_table);
    }
}
