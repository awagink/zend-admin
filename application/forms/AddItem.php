<?php



class Form_AddItem
    extends Zend_Form
{
    protected $_fields = array();
    protected $_table  = array();
    
    public function setTable(array $table)
    {
        $this->_table = $table;
        return $this;
    }

    public function setFields(array $fields)
    {
        $this->_fields = $fields;
        return $this;
    }

    public function compile()
    {
        $fieldsManager = new Form_Fields_Manager;
        foreach($this->_fields as $field) {
            $this->_addField($fieldsManager->getFieldType($field));
        }
        
        $this->addElement(new Zend_Form_Element_Submit('submit', array(
            'label'  => 'Submit',
            'ignore' => true
        )));
    }

    protected function _addField(Form_Fields_Types_Type_Interface $type)
    {
        $element = $type->getElement();
        if (is_null($element) === false) {
            $this->addElement($element);
        }
    }
}
