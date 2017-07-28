
$ ->
		items = new Bloodhound(
		  datumTokenizer: Bloodhound.tokenizers.whitespace
		  queryTokenizer: Bloodhound.tokenizers.whitespace
		  remote:
		    url: '/items/autocomplete?query=%QUERY'
		    wildcard: '%QUERY')
				
		$('#item_search').typeahead null, source: items
