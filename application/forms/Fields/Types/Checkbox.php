<?php



class Form_Fields_Types_Checkbox
    extends Sadmin_Model_Type_Abstract
    implements Form_Fields_Types_Interface
{
    public function getElement()
    {
        return new Zend_Form_Element_Checkbox($this->name, array(
            'label'    => $this->_getLabel(),
            'required' => $this->required
        ));
    }
}
