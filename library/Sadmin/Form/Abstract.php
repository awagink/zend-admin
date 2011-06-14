<?php



class Sadmin_Form_Abstract
    extends Zend_Form
{
    protected $_fields = array();

    public function setFields(array $fields)
    {
        $this->_fields = $fields;
    }

    public function compile()
    {
        foreach($this->_fields as $field) {
            $this->_addField($field);
        }
    }

    protected function _addField(array $field)
    {
        $fieldType =
    }
}
