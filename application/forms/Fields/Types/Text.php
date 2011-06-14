<?php



class Form_Fields_Types_Text
    extends Sadmin_Model_Type_Abstract
    implements Form_Fields_Types_Type_Interface
{
    public function getElement()
    {
        return $this->is_primary ? null : new Zend_Form_Element_Text($this->name, array(
            'label' => $this->_getLabel(),
            'required' => $this->required
        ));
    }
}
