<?php

class Model_AdminTable
    extends Zend_Db_Table_Abstract
{
    protected $_name = 'admin_table';
    protected $_primary = 'id_table';
    
    /**
     * Add table
     *
     * @param array $data
     * @return primary
     */
    public function addTable(array $data)
    {
        $row = $this->createRow();
        $row->name = $data['name'];
        $row->created = date('Y-m-d H:i:s');
        return $row->save();
    }
    
    /**
     * Find table by id
     *
     * @param int $idTable
     * @return Zend_Db_Table_Row
     */
    public function getTableById($idTable)
    {
        return $this->find($idTable)->current();
    }
}
