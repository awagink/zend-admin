<?php


/**
 * @WARNING
 * There is no db table mapped to this model
 */
class Model_AdminTableItems
{
    public function getTableFields($table)
    {
        $adapter = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $adapter->select();
        $select->from(array('atf' => 'admin_table_field'), array(
            'id_field',
            'name',
            'is_primary'
        ));
        $select->where('atf.id_table = ?', $table->id_table);
        $select->where('(atf.show_field = 1');
        $select->orWhere('atf.is_primary = 1)');
        $select->order('atf.field_order');

        $fields = $adapter->fetchAll($select);
        $tableFields = array();
        foreach ($fields as $f) {
            $tableFields[] = $f['name'];
        }
        return $tableFields;
    }

    public function getTableItems($table, $fields, $page = 1)
    {
        $adapter = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $adapter->select();
        $select->from($table->name, $fields);
        $select->order($this->getTablePrimaryKey($table->id_table) . ' DESC');

//        echo '<pre>';
//        echo "\n";
//        var_dump($select->assemble());
//        echo "\n";
//        echo '</pre>';
//        die();
        return $this->_getPaginator($select, $page);
    }

    public function getTablePrimaryKey($idTable)
    {
        $adapter = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $adapter->select();
        
        $select->from(array('atf' => 'admin_table_field'), array(
            'name',
        ));
        $select->where('atf.id_table = ?', $idTable);
        $select->where('atf.is_primary = 1');
        $result = $adapter->fetchRow($select);
        if (!is_array($result)) {
            throw new Sadmin_Exception_Internal('Primary key not found');
        }
        return $result['name'];
    }

    protected function _getPaginator($select, $page, $perpage = 10, $pageRange = 10)
    {
        $adapter = new Zend_Paginator_Adapter_DbSelect($select);
        $paginator = new Zend_Paginator($adapter);
        $paginator->setPageRange($pageRange);
        $paginator->setCurrentPageNumber($page);
        $paginator->setItemCountPerPage($perpage);
        return $paginator;
    }
}
