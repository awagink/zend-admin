<?php

class Form_EditField
    extends Form_AddField
{
    public function init()
    {
        parent::init();
        $this->getElement('submit')->setLabel('Save field');
    }
    
    public function saveEdit(array $post, Zend_Db_Table_Row $field)
    {
        if ($this->isValid($post)) {
            $data = $this->getValues();
            $field->setFromArray($data);
            $field->save();
            return true;
        }
        return false;
    }
}
