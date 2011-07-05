<?php

class Model_AdminField
    extends Zend_Db_Table_Abstract
{
    const FIELD_TYPE_TEXT     = 1;
    const FIELD_TYPE_CHECKBOX = 2;
    const FIELD_TYPE_HTML     = 3;
    const FIELD_TYPE_RADIO    = 4;
    const FIELD_TYPE_FILE     = 5;
    const FIELD_TYPE_PASSWORD = 6;
    const FIELD_TYPE_DATE     = 7;
    const FIELD_TYPE_IMAGE    = 8;
    const FIELD_TYPE_SELECT   = 9;

    
    public static $fieldTypes = array(
        self::FIELD_TYPE_TEXT     => 'Text',
        self::FIELD_TYPE_SELECT   => 'Select',
        self::FIELD_TYPE_CHECKBOX => 'Checkbox',
        self::FIELD_TYPE_HTML     => 'Html',
        self::FIELD_TYPE_RADIO    => 'Radio',
        self::FIELD_TYPE_FILE     => 'File',
        self::FIELD_TYPE_PASSWORD => 'Password',
        self::FIELD_TYPE_DATE     => 'Date',
        self::FIELD_TYPE_IMAGE    => 'Image'
    );
    
    protected $_name    = 'admin_table_field';
    protected $_primary = 'id_field';
    protected $_fields  = array(
        'id_field',
        'id_table',
        'name',
        'label',
        'created',
        'type',
        'is_primary',
        'required',
        'field_order',
        'show_view',
        'other'
    );
    
    /**
     * Describe new table field
     *
     * @param array $data field data
     * @return primary key
     */
    public function addField(array $data)
    {
        $row = $this->createRow();
        $row->id_table   = $data['id_table'];
        $row->name       = $data['name'];
        $row->created    = date('Y-m-d H:i:s');
        $row->type       = $data['type'];
        $row->is_primary = $data['is_primary'];
        $row->required   = $data['required'];
        $row->label      = $data['label'];
        $row->show_view  = $data['show_view'];
        $row->other      = $data['other'];
        
        $lastField = @$this->getLastTableField($data['id_table'])->field_order;
        $row->field_order = $lastField > 0 ? $lastField + 1 : 1;
        
        return $row->save();
    }
    
    /**
     * Find all table fields
     *
     * @param int $idTable
     * @return Zend_Db_Table_Rowset
     */
    public function getTableFields($idTable)
    {
        $select = $this->select();
        $select->from(array('atf' => $this->_name), $this->_fields);
        $select->where('atf.id_table = ?', $idTable);
        $select->order('atf.field_order');
//        if ($onlyForView === true) {
//            $select->where('atf.show_view = 1');
//            die('1');
//        }
        return $this->fetchAll($select);
    }
    
    public function getLastTableField($idTable)
    {
        $select = $this->select();
        $select->from(array('atf' => $this->_name), $this->_fields);
        $select->where('atf.id_table = ?', $idTable);
        $select->order('atf.field_order DESC');
        return $this->fetchRow($select);
    }
    
    /**
     * Find field by its id
     *
     * @param int $idField
     * @return Zend_Db_Table_Row
     */
    public function getFieldById($idField)
    {
        $select = $this->select();
        $select->from(array('atf' => $this->_name), $this->_fields);
        $select->where('atf.id_field = ?', $idField);
        return $this->fetchRow($select);
    }
    
    /**
     * Delete table field
     *
     * @param int $idField
     * @return int
     */
    public function deleteFieldById($idField)
    {
        $where = $this->getAdapter()->quoteInto('id_field = ?', $idField);
        return $this->delete($where);
    }
}
