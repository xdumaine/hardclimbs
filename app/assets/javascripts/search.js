$(function() {
	$('.search-query').typeahead( [
	    {
	       name: 'climbers',
	       prefetch: {
			   url: '/load_climbers.json',
			   ttl: 500
		   },
		   header: '<h3>Climbers</h3>',
		   template: [                                                                 
			  	'<p class="ascents">{{sends}}</p>',
			  	'<p class="name">{{name}}</p>'              
		     ].join(''),                                                                 
		     engine: Hogan
	   },
	    {
	       name: 'areas',
	       prefetch: {
			   url: '/load_areas.json',
			   ttl: 500
		   },
	       header: '<h3>Areas</h3>',
 		  template: [
 		  	'<p class="ascents">{{sends}}</p>',
 		  	'<p class="name">{{name}}</p>',
 			'<p class="detail">{{country}}'
 		  ].join(''),
 		  engine: Hogan
	   },
	   {
	      name: 'climbs',
	      prefetch: {
			  url: '/load_climbs.json',
			  ttl: 86400000
		  },
	      header: '<h3>Climbs</h3>',
		  template: [
		  	'<p class="ascents">{{sends}}</p>',
		  	'<p class="name">{{name}} ({{grade}})</p>',
			'<p class="detail">{{style}} in {{area}}'
		  	
		  ].join(''),
		  engine: Hogan
	  }
		]
	);

	// Auto submit search once user selects item
	$('.search-query').bind("typeahead:selected", function () {
	    $("form").submit();
	 });
	  
	 // Hack to hide menu on phones
	//$('.tt-dropdown-menu').addClass('hidden-phone');
	$('.search-query').bind("typeahead:opened", function() {
		$('.tt-dropdown-menu').addClass('hidden-phone');
		$('.tt-dropdown-menu').addClass('hidden-tablet')
	});
	
});