<?php

class Form_AddField
    extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');
        $this->setAttrib('class', 'customForm');
        $formElements['id_table'] = new Zend_Form_Element_Select('id_table', array(
                    'label' => 'Table',
//                    'class' => 'text-long',
                    'required' => true,
                    'multiOptions' => $this->_getTables()
                ));
        
        $formElements['name'] = new Zend_Form_Element_Text('name', array(
            'label' => 'Field name',
            'required' => true,
            'filters' => array(
                array(new Zend_Filter_StringTrim)
            )
        ));
        
        $formElements['type'] = new Zend_Form_Element_Select('type', array(
            'label' => 'Field type',
            'required' => true,
            'multiOptions' => array_merge(array('' => 'Select type'), Model_AdminField::$fieldTypes)
        ));
        
        $formElements['is_primary'] = new Zend_Form_Element_Radio('is_primary', array(
            'label' => 'Primary',
            'required' => true,
            'multiOptions' => array(
                '0' => 'No',
                '1' => 'Yes'
            )
        ));
        
        $formElements['required'] = new Zend_Form_Element_Radio('required', array(
            'label' => 'Field required',
            'multiOptions' => array(
                '0' => 'No',
                '1' => 'Yes'
            )
        ));
        
        $formElements['submit'] = new Zend_Form_Element_Submit('submit', array(
                    'label' => 'Add field',
                    'ignore' => true
                ));

        $this->addElements($formElements);
        $this->addDisplayGroup(array(
                'id_table', 
                'name', 
                'type',
                'is_primary',
                'required',
                'submit',
                ''
            ), 'groups', array("legend" => "Add table")
        );
    
    }
    
    protected function _getTables()
    {
        $multiOptions = array(
            '' => 'Select table'
        );
        $m = new Model_AdminTable;
        $tables = $m->fetchAll();
        foreach ($tables as $t) {
            $multiOptions[$t->id_table] = $t->name;
        }
        return $multiOptions;
    }
//        'id_field',
//        'id_table',
//        'name',
//        'created',
//        'type',
//        'is_primary',
//        'required'
}





















