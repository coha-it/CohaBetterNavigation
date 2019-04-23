<?php 

namespace CohaBetterNavigation;

use Doctrine\ORM\Tools\SchemaTool;
use Shopware\Components\Plugin;
use Shopware\Components\Plugin\Context\InstallContext;
use Shopware\Components\Plugin\Context\UninstallContext;
use Shopware\Components\Theme\LessDefinition;
use Shopware\Components\Plugin\Context\ActivateContext;

class CohaBetterNavigation extends Plugin
{

    public function install(InstallContext $context)
    {
        $service = $this->container->get('shopware_attribute.crud_service');

        // Is Group Right
        $service->update('s_categories_attributes', 'coha_cat_floating', 'boolean', [
            'label' => 'Floating to Right',
            'supportText' => 'Select if this Menu should float to right',
            'helpText' => 'If yes, the following Category will float in the right Direction',

            //user has the opportunity to translate the attribute field for each shop
            'translatable' => true,

            //attribute will be displayed in the backend module
            'displayInBackend' => true,

            //numeric position for the backend view, sorted ascending
            'position' => 250,

            //user can modify the attribute in the free text field module
            'custom' => true,
        ]);

    }

    // On Activation
    public function activate(ActivateContext $context)
    {
        $context->scheduleClearCache(ActivateContext::CACHE_LIST_ALL);
    }

    public function uninstall(UninstallContext $context)
    {
        $service = $this->container->get('shopware_attribute.crud_service');
        //service->delete('s_categories_attributes', 'coha_cat_floating_direction');
        $service->delete('s_categories_attributes', 'coha_cat_floating');
    }

    public function addLessFiles(){
        return new LessDefinition(
           [],
           [
                __DIR__ . '/Resources/views/frontend/_public/src/less/coha-better-nav.less',
           ]
        );
      }

    public static function getSubscribedEvents()
    {
        return [
            'Enlight_Controller_Action_PreDispatch_Frontend' => ['onFrontend',-100],
            'Enlight_Controller_Action_PreDispatch_Widgets' => ['onFrontend',-100],
            'Theme_Compiler_Collect_Plugin_Less' => 'addLessFiles',
        ];
    }

    /**
     * @param \Enlight_Event_EventArgs $args
     * @throws \Exception
     */
    public function onFrontend(\Enlight_Event_EventArgs $args)
    {
        $this->container->get('Template')->addTemplateDir(
            $this->getPath() . '/Resources/views/'
        );
    }

}
