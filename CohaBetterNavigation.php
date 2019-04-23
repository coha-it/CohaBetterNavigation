<?php 

namespace CohaFloatingCatNav;

use Doctrine\ORM\Tools\SchemaTool;
use Shopware\Components\Plugin;
use Shopware\Components\Plugin\Context\InstallContext;
use Shopware\Components\Plugin\Context\UninstallContext;
use Shopware\Components\Theme\LessDefinition;
use Shopware\Components\Plugin\Context\ActivateContext;

class CohaFloatingCatNav extends Plugin
{

    public function install(InstallContext $context)
    {
        $service = $this->container->get('shopware_attribute.crud_service');
        
        // Examples:
        // $service->update('s_categories_attributes', 'my_column', 'boolean');
        // $service->update('s_categories_attributes', 'coha_cat_floating_active', 'combobox', [
        //     'label' => 'Field label',
        //     'supportText' => 'Value under the field',
        //     'helpText' => 'Value which is displayed inside a help icon tooltip',

        //     //user has the opportunity to translate the attribute field for each shop
        //     'translatable' => true,

        //     //attribute will be displayed in the backend module
        //     'displayInBackend' => true,

        //     //in case of multi_selection or single_selection type, article entities can be selected,
        //     'entity' => 'Shopware\Models\Article\Article',

        //     //numeric position for the backend view, sorted ascending
        //     'position' => 100,

        //     //user can modify the attribute in the free text field module
        //     'custom' => true,

        //     //in case of combo box type, defines the selectable values
        //     'arrayStore' => [
        //         ['key' => '1', 'value' => 'first value'],
        //         ['key' => '2', 'value' => 'second value']
        //     ],
        // ]);

        // Is Activated?
        /*$service->update('s_categories_attributes', 'coha_cat_floating', 'boolean', [
            'label' => 'Floating Cat Activated',
            'supportText' => 'Is "Floating Category" enabled on this Category?',
            'helpText' => 'If yes, the following Category will float in a direction',

            //user has the opportunity to translate the attribute field for each shop
            'translatable' => true,

            //attribute will be displayed in the backend module
            'displayInBackend' => true,

            //numeric position for the backend view, sorted ascending
            'position' => 250,

            //user can modify the attribute in the free text field module
            'custom' => true,
        ]);*/

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

        /*$service->update('s_categories_attributes', 'coha_cat_floating_direction', 'combobox', [
                'label' => 'Floating Cat Direction',
                'supportText' => 'The Floating Direction',
                'helpText' => 'Defines the Direction in which the Category-Point should float',

                //user has the opportunity to translate the attribute field for each shop
                'translatable' => true,

                //attribute will be displayed in the backend module
                'displayInBackend' => true,

                //numeric position for the backend view, sorted ascending
                'position' => 251,

                //user can modify the attribute in the free text field module
                'custom' => true,

                //in case of combo box type, defines the selectable values
                'arrayStore' => [
                    ['key' => '1', 'value' => 'Left'],
                    ['key' => '2', 'value' => 'Right'],
                    ['key' => '3', 'value' => 'None'],
                    ['key' => '4', 'value' => 'Inherit'],
                ],
            ],
            null,
            true
        );*/
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
                __DIR__ . '/Resources/views/frontend/_public/src/less/coha-floating-cat-nav.less',
                __DIR__ . '/Resources/views/frontend/_public/src/less/coha-shop-nav-in-cart.less'
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
