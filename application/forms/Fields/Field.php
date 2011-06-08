<?php



class Forms_Fields_Field
{
    protected $_properties = array();
    
    public function __construct(array $properties)
    {
        $this->_properties = $properties;
    }

    public function  __get($name)
    {
        if (array_key_exists($name, $this->_properties)) {
            return $this->_properties[$name];
        }
        throw new Zadmin_Exception_Internal("Unkown property {$name}");
    }
}
