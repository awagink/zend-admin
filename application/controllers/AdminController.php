<?php

class AdminController
    extends Sadmin_Controller_Basic
{
    public function init()
    {
        $this->_addCkeditor();
        $modelTables = new Model_AdminTable();
        $this->view->tables = $modelTables->fetchAll();
    }

    public function indexAction()
    {
        
    }

    public function viewTableAction()
    {
        $idTable = (int)$this->_getParam('id-table');
        if ($idTable < 1) {
            throw new Sadmin_Exception_ShowUser('Unknown table id');
        }
        $t = Sadmin_Db::adminTable()->getTableById($idTable);
        if (is_null($t)) {
            throw new Sadmin_Exception_ShowUser('Table not found');
        }
        $page = (int)$this->_getParam('page', 1);

        $tableFieds = Sadmin_Db::adminTableItems()->getTableFields($t);

        $this->view->tableItemsPaginator = Sadmin_Db::adminTableItems()->getTableItems($t, $tableFieds, $page);
        $this->view->fields = $tableFieds;
        $this->view->table  = $t;
    }

    public function addItemAction()
    {
        $idTable = (int)$this->_getParam('id-table');
        $table = Sadmin_Db::adminTable()->getTableById($idTable);
        $tableFields = Sadmin_Db::adminField()->getTableFields($table->id_table);
        
        $form = new Form_AddItem;
        $form->setTable($table->toArray())
             ->setFields($tableFields->toArray())
             ->compile();
        
        $this->view->form = $form;
    }

    /**
     * @Ajax
     */
    public function removeItemAction()
    {
        
    }

    public function editItemAction()
    {

    }
}
