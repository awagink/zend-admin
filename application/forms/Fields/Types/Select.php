<?php

class Form_Fields_Types_Select
    extends Sadmin_Model_Type_Abstract
    implements Form_Fields_Types_Type_Interface
{
    public function getElement()
    {
        return new Zend_Form_Element_Select($this->name, array(
            'label'        => $this->_getLabel(),
            'required'     => $this->required,
            'multiOptions' => $this->_getMultiOptions()
        ));
    }
    
    public function _getMultiOptions()
    {
        return array(
            '1' => 'Apple',
            '2' => 'Drums'
        );
    }
}
