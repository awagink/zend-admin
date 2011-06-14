<?php



class Form_Fields_Manager
{
    protected $_typesPrefix = 'Form_Fields_Types_';
    
    public function getFieldType($field)
    {
        $typeName = $this->_typesPrefix . $this->getTypeAsString($field['type']);
        return new $typeName($field);
    }
    
    public function getTypeAsString($typeInt)
    {
        if (array_key_exists($typeInt, Model_AdminField::$fieldTypes)) {
            return Model_AdminField::$fieldTypes[$typeInt];
        }
        throw new Sadmin_Exception_Internal("Field with type {$typeInt} does not exist");
    }
}
