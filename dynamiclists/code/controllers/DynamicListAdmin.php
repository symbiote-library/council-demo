<?php
/*

Copyright (c) 2009, Symbiote PTY LTD - www.symbiote.com.au
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of SilverStripe nor the names of its contributors may be used to endorse or promote products derived from this software
      without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
OF SUCH DAMAGE.
*/

/**
 * @author Marcus Nyeholt <marcus@symbiote.com.au>
 */
class DynamicListAdmin extends ModelAdmin {
    static $managed_models = array('DynamicList');
	static $url_segment = 'dynamiclistadmin';

	static $menu_title = "Dynamic Lists";

	static $model_importers = array(
		'DynamicList' => 'DynamicListCsvLoader',
	);

	public function ImportForm() {
		$form = parent::ImportForm();
		$form->Fields()->replaceField('EmptyBeforeImport', new CheckboxField('EmptyBeforeImport', 'Clear Database before import', false));
		return $form;
	}

}


class DynamicListCsvLoader extends CsvBulkLoader {
	public function __construct($objectClass) {
		parent::__construct($objectClass);

		$this->relationCallbacks = array(
			'AgencyTitle' => array(
				'relationname' => 'Items',
				'callback' => 'getItemByTitle'
			),
		);
	}

	protected function processRecord($record, $columnMap, &$results, $preview = false) {
		$class = $this->objectClass;
		
		$title = trim($record['Title']);
		$item = trim($record['ListItem']);

		$existingList = DynamicList::get_dynamic_list($title);
		if (!$existingList) {
			$existingList = new DynamicList;
			$existingList->Title = $title;
			$existingList->write();
		}

		// now add the item to that list
		$existingItem = DataObject::get_one('DynamicListItem', '"Title"=\''.Convert::raw2sql($item).'\' AND "ListID" = '.((int) $existingList->ID));
		if (!$existingItem) {
			$existingItem = new DynamicListItem;
			$existingItem->Title = $item;
			$existingItem->ListID = $existingList->ID;
			$existingItem->write();
		}
	}
}