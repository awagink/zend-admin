<?php

class Form_AddField extends Zend_Form
{

    public function init()
    {
        $this->setMethod('post');
        $this->setAttrib('class', 'customForm');
        $formElements['id_table'] = new Zend_Form_Element_Select('id_table', array(
                    'label' => 'Table',
//                    'class' => 'text-long',
                    'required' => true,
                    'multiOptions' => $this->_getTables(),
                    'decorators' => array(
                        'ViewHelper',
                        'Label',
                        'Errors',
                        array('HtmlTag', array('tag' => 'p'))
                    )
                        )
        );
        
        $formElements['name'] = new Zend_Form_Element_Text('name', array(
                    'label' => 'Field name',
                    'class' => 'text-long',
                    'required' => true,
                    'filters' => array(
                        array(new Zend_Filter_StringTrim)
                    ),
                    'decorators' => array(
                        'ViewHelper',
                        'Label',
                        'Errors',
                        array('HtmlTag', array('tag' => 'p'))
                    )
                ));
        $formElements['label'] = new Zend_Form_Element_Text('label', array(
                    'label' => 'Field label',
                    'class' => 'text-long',
                    'required' => false,
                    'filters' => array(
                        array(new Zend_Filter_StringTrim)
                    ),
                    'decorators' => array(
                        'ViewHelper',
                        'Label',
                        'Errors',
                        array('HtmlTag', array('tag' => 'p'))
                    )
                ));
        $types = Model_AdminField::$fieldTypes;
        $types[''] = 'Select type';
        $formElements['type'] = new Zend_Form_Element_Select('type', array(
                    'label' => 'Field type',
                    'required' => true,
                    'multiOptions' => $types,
                    'value' => '',
                    'description' => '&nbsp;',
                    'id' => 'typeField',
                    'decorators' => array(
                        'ViewHelper',
                        'Label',
                        array('HtmlTag', array('tag' => 'p')),
                        array('Description', array('tag' => 'div', 'id' => 'typeFieldArea', 'escape' => false)),    
                        'Errors',
                    )
                ));
        $formElements['is_primary'] = new Zend_Form_Element_Radio('is_primary', array(
                    'label' => 'Primary',
                    'required' => true,
                    'value' => '0',
                    'multiOptions' => array(
                        '0' => 'No',
                        '1' => 'Yes'
                    ),
                    'separator' => '',
                    'decorators' => array(
                        'ViewHelper',
                        array('Label'),
                        'Errors',
                        array('HtmlTag', array('tag' => 'p'))
                    )
                ));

        $formElements['required'] = new Zend_Form_Element_Radio('required', array(
                    'label' => 'Field required',
                    'value' => '0',
                    'multiOptions' => array(
                        '0' => 'No',
                        '1' => 'Yes'
                    ),
                    'separator' => '',
                    'decorators' => array(
                        'ViewHelper',
                        'Label',
                        'Errors',
                        array('HtmlTag', array('tag' => 'p'))
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
            'label',
            'type',
            'is_primary',
            'required',
            'submit',
            ''
                ), 'groups', array("legend" => "Add field")
        );
    }

    public function addField(array $post)
    {
        if ($this->isValid($post)) {
            $data = $this->getValues();
            $m = new Model_AdminField;
            $m->addField($post);
            return $this->getValue('id_table');
        }
        return false;
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

}

