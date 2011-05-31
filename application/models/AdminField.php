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
    
    public static $fieldTypes = array(
        self::FIELD_TYPE_TEXT     => 'Text',
        self::FIELD_TYPE_CHECKBOX => 'Checkbox',
        self::FIELD_TYPE_HTML     => 'Html',
        self::FIELD_TYPE_RADIO    => 'Radio',
        self::FIELD_TYPE_FILE     => 'File',
        self::FIELD_TYPE_PASSWORD => 'Password',
    );
    
    protected $_name    = 'admin_table_field';
    protected $_primary = 'id_field';
    protected $_fields  = array(
        'id_field',
        'id_table',
        'name',
        'created',
        'type',
        'is_primary',
        'required'
    );
    
    public function addField(array $data)
    {
        $row = $this->createRow();
        $row->id_table   = $data['id_table'];
        $row->name       = $data['name'];
        $row->created    = date('Y-m-d H:i:s');
        $row->type       = $data['type'];
        $row->is_primary = $data['is_primary'];
        $row->required   = $data['required'];
        return $row->save();
    }
    
    public function getTableFields($idTable)
    {
        $select = $this->select();
        $select->from(array('atf' => $this->_name), $this->_fields);
        $select->where('atf.id_table = ?', $idTable);
        return $this->fetchAll($select);
    }
}
