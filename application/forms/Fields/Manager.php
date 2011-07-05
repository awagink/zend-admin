<?php



class Form_Fields_Manager
{
    protected $_typesPrefix = 'Form_Fields_Types_';
    
    public function getFieldType($field)
    {
        if (is_array($field)) {
            $typeName = $this->_typesPrefix . $this->getTypeAsString($field['type']);
            return new $typeName($field);
        } else if (is_string($field)) {
            $typeName = $this->_typesPrefix . $this->parseTypeFromString($field);
            return new $typeName[$field];
        }
    }
    
    public function getTypeAsString($typeInt)
    {
        if (array_key_exists($typeInt, Model_AdminField::$fieldTypes)) {
            return Model_AdminField::$fieldTypes[$typeInt];
        }
        throw new Sadmin_Exception_Internal("Field with type {$typeInt} does not exist");
    }
    
    public function parseTypeFromString(&$field)
    {
        $propertiesArr = explode(';', $field);
        $propertiesFinal = array();
        foreach ($propertiesArr as $p) {
            $pTmp = explode('=>', $p);
            $propertiesFinal[trim($pTmp[0])] = trim($pTmp[1]);
        }
        $field = $propertiesFinal;
        return $this->getTypeAsString($field['type']);
    }
}
