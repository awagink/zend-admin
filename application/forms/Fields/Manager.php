<?php



class Forms_Fields_Manager
{
    protected $_field = null;

    public function __construct(Forms_Fields_Field $field)
    {
        $this->_field = $field;
    }

    public function setField(Forms_Fields_Field $field)
    {
        $this->_field = $field;
    }

    public function getField()
    {
        return $this->_field;
    }

    public function getZendFormElement()
    {
        $fieldTypeClass = "Forms_Fields_Types_{$this->_field->type}";
        $fieldTypeInst = new $fieldTypeClass($this);
        
    }
}
