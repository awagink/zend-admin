<?php



class Forms_AddItem
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
            $this->_addField(new Forms_Fields_Types_Manager($field));
        }
    }

    protected function _addField(Forms_Fields_Types_Manager $field)
    {
    }
}
