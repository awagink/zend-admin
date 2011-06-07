<?php

class AdminController
    extends Zadmin_Controller_Basic
{
    public function init()
    {
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
            throw new Zadmin_Exception_ShowUser('Unknown table id');
        }
        $t = Zadmin_Db::adminTable()->getTableById($idTable);
        if (is_null($t)) {
            throw new Zadmin_Exception_ShowUser('Table not found');
        }
        $page = (int)$this->_getParam('page', 1);

        $tableFieds = Zadmin_Db::adminTableItems()->getTableFields($t);

        $this->view->tableItemsPaginator = Zadmin_Db::adminTableItems()->getTableItems($t, $tableFieds, $page);
        $this->view->fields = $tableFieds;
    }
}
