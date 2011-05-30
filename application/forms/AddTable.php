<?php

class Form_AddTable extends Zend_Form
{

    public function init()
    {
        $this->setMethod('post');
        $this->setAttrib('class', 'customForm');
        $formElements['name'] = new Zend_Form_Element_Text('name', array(
                    'label' => 'Table name',
                    'class' => 'text-long',
                    'required' => true
                ));
        $formElements['submit'] = new Zend_Form_Element_Submit('submit', array(
                    'label' => 'Add table',
                    'ignore' => true
                ));

        $this->addElements($formElements);
        $this->addDisplayGroup(array('name', 'submit'), 'groups', array("legend" => "Add table"));
    }
    
    public function addTable(array $post)
    {
        if ($this->isValid($post)) {
            
        }
    }

}
