<?php

class Sadmin_Model_Type_Abstract 
{
    private $_field = null;
    
    public function __construct(array $field)
    {
        $this->_field = $this->_toStdClass($field);
    }
    
    protected function _toStdClass(array $array)
    {
        $stdClass = new stdClass();
        foreach ($array as $key => $value) {
            $stdClass->$key = $value;
        }
        return $stdClass;
    }
    
    public function __get($name)
    {
        if (property_exists($this->_field, $name)) {
            return $this->_field->$name;
        }
        throw new Sadmin_Exception_Internal("Property with name {$name} does not exist");
    }
    
    protected function _getLabel()
    {
        return is_null($this->label) ? $this->name : $this->label;
    }
}
