//global vars used by disqus
var disqus_shortname = 'hardclimbs';
var disqus_identifier; 
var disqus_url; 
//var disqus_developer = 1;

function loadDisqus(source, identifier, url) {
	
	/*if ($('#disqus_thread').length > 0) {
		$('#disqus_thread').hide();
		//return;
	}*/
   if (window.DISQUS) {
	   $('#disqus_thread').appendTo(source); //append the HTML to the control parent
	   $('#disqus_thread').show();
	   //if Disqus exists, call it's reset method with new parameters
	   DISQUS.reset({
	      reload: true,
	      config: function () {
	      this.page.identifier = identifier;
	      this.page.url = url;
	      }
   		});

	} else {

	  //insert a wrapper in HTML after the relevant "show comments" link
	  $('<div id="disqus_thread"></div>').appendTo(source);
	  disqus_identifier = identifier; //set the identifier argument
	  disqus_url = url; //set the permalink argument

	  //append the Disqus embed script to HTML
	  var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
	  dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
	  $('head').append(dsq);

	}
};

/* * * DON'T EDIT BELOW THIS LINE * * */
(function () {
    var s = document.createElement('script'); s.async = true;
    s.type = 'text/javascript';
    s.src = '//' + disqus_shortname + '.disqus.com/count.js';
    (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
}());