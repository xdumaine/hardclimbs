$(function(){
	if (typeof gon == 'undefined') { return; }
	map = new jvm.WorldMap({   
	  container: $('#world-map'),
	  map: 'world_mill_en',
	  zoomOnScroll: false,
	  backgroundColor: '#eeeeee',
	  regionStyle: {
	        		initial: {
	          			fill: '#aeaeae',
	          			"fill-opacity": 1,
	      				stroke: 'none',
	      				"stroke-width": 0,
	      				"stroke-opacity": 1
	        				},
	        		hover: {
	     		 			"fill-opacity": 0.5
	    					},
	        		selected: {
        			
	        				},
	        		selectedHover: {
	    					}
	      			},
	  series: {
	    regions: [{
	      values: gon.area_ascent_count,
	      scale: ['#8EBBE8', '#376ea4'],
	      normalizeFunction: 'polynomial'
	    }]
	  },
	  onRegionLabelShow: function(event, label, code) {
		  if (typeof gon.area_climb_count[code] != "undefined") {
	        label.html(
				label.html()+
				'<br>Areas - '+ gon.area_count[code] +
				'<br>Climbs - '+ gon.area_climb_count[code] + 
				'<br>Ascents - '+ gon.area_ascent_count[code] +
				'<br>Click to explore'
			);
		  }
	  },
	  onRegionClick: function(event, code) {
		  if (typeof gon.area_links[code] != "undefined") {
		  	window.location = gon.area_links[code];
	  	  }
	  }
	});
});
