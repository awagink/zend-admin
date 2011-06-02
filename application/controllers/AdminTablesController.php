<?php

class AdminTablesController
    extends Zadmin_Controller_Basic
{
    protected $_rootCrumb = array(
            'link' => '/admin-tables',
            'text' => 'Tables Setup'
    );
    protected $_crumbs = array();
    
    public function indexAction()
    {
        $m = new Model_AdminTable;
        $this->view->tables = $m->fetchAll();
        $this->_rootCrumb['active'] = true;
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
        
        $this->_crumbs[] = array(
            'link' => '/admin-tables/add-table',
            'text' => 'Add table',
            'active' => true
        );
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
        
        $this->_crumbs[] = array(
            'link' => '/admin-tables/add-field',
            'text' => 'Add field',
            'active' => true
        );
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
        
        $this->_crumbs[] = array(
            'link' => '/admin-tables/view-table/id_table/' . $idTable,
            'text' => ucwords($table->name),
            'active' => true
        );        
    }
    
    public function editFieldAction()
    {
        $editFieldForm = new Form_EditField;
        $idField = (int)$this->_getParam('id-field');
        $m = new Model_AdminField;
        $field = $m->getFieldById($idField);
        
        if (!is_object($field)) {
            throw new Zadmin_Exception_ShowUser('Field not found');
        }
        
        if ($this->_request->isPost()) {
            if ($editFieldForm->saveEdit($this->_request->getPost(), $field)) {
                $this->_redirect('/admin-tables/view-table/id_table/' . $field->id_table);
            }
        } else {
            $editFieldForm->populate($field->toArray());
        }
        $this->view->editFieldForm = $editFieldForm;
        
        $idTableEl = $editFieldForm->getElement('id_table');
        $this->_crumbs[] = array(
            'link' => '/admin-tables/view-table/id_table/' . $field->id_table,
            'text' => ucwords($idTableEl->getMultiOption($idTableEl->getValue()))
        );        
        $this->_crumbs[] = array(
            'link' => '/admin-tables/edit-field/id-field/' . $idField,
            'text' => 'Edit field "' . $field->name . '"',
            'active' => true
        );        
    }
    
    /**
     * @Ajax
     */
    public function deleteFieldAction()
    {
        $this->_notAjaxExit();
        $this->_disableView();
        
        $response = array();
        $idField  = (int)$this->_getParam('idField');
        $m = new Model_AdminField;
        if ($m->deleteFieldById($idField) > 0) {
            $response['status'] = 1;
        } else {
            $response['status'] = 2;
        }

        $this->_json($response);
    }
    
    /**
     * @Ajax
     */
    public function saveFieldOrderAction()
    {
        $this->_notAjaxExit();
        $this->_disableView();
        
        $idTable = (int)$this->_getParam('idTable');
        
        $fields = trim($this->_getParam('ids'), ',');
        $fieldsIds = explode(',', $fields);
        
        $m = new Model_AdminField;
        foreach($fieldsIds as $k => $id) {
            $field = $m->getFieldById($id);
            $field->field_order = $k;
            $field->save();
        }
    }
    
    public function postDispatch()
    {
        $res = array();
        $res[] = $this->_rootCrumb;
        $res = array_merge($res, $this->_crumbs);
        $this->view->breadcrumbs = $res;
    }
    
}
