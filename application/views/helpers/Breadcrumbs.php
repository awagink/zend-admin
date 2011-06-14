<?php

class Zend_View_Helper_Breadcrumbs
    extends Zend_View_Helper_Abstract
{
    public function breadcrumbs()
    {
        $html = '';
        if (is_array($this->view->breadcrumbs)) {
            $crumbs = array();
            foreach ($this->view->breadcrumbs as $c) {
                $crumbs[] = $this->_getCrumb($c);
            }
            $res = implode('&raquo; ', $crumbs);
            $html = '<h2>' .  $res. '</h2>';
        }
        return $html;
    }
    
    /*
*                     <h2>
                        <a href="#">Dashboard</a> 
                        &raquo; 
                        <a href="#" class="active">Print resources</a>
                      </h2>
     */
    protected function _getCrumb($c)
    {
        $active = isset($c['active']) && $c['active'] === true ? 'class="active"' : '';
        if (!isset($c['link'])) {
            throw new Sadmin_Exception_ShowUser('You have to specify breadcrumb link');
        }
        $str = "<a href=\"{$c['link']}\" {$active}>{$c['text']}</a>";
        return $str;
        
        
    }
}
