<cfoutput>
<h1>Fallback Image</h1>

<p>This plugin resides in the view layer. It simply wraps the internal call to $imageTag. If an error occurs because the image is missing or corrupt then you have the chance to provide a fall back image to be loaded instead of giving the end user a big fat error message.</p>

<h2>Notes</h2>

<p>This tag does mask potential errors, but it can be very useful when dealing with user submitted content which isn't critical.</p>

<h2>Arguments:</h2>

<p><em>Takes all the normal arguments that the <a href="http://cfwheels.org/docs/1-1/function/imagetag">imageTag()</a> takes plus one more:</em></p>

<h3>fallback</h3>
<ul>
	<li>type: string</li>
	<li>required: false</li>
</ul>
<p>
	The image to display if the primary image fails.
</p>

<h2>Configuration:</h2>

<p>You can also modify which environments the fallback image will be used in, so if you want to see errors in design, but not production this is your global siwtch.</p>

<pre>
&lt;!--- in your settings.cfm ---&gt;
&lt;cfset application.fallbackImage.environments = "production,maintenance"&gt;
</pre>

<h2>Usage Example:</h2>

<pre>
&lt;!--- in your view page ---&gt;
##imageTag( source= "avatar/user123.png", fallback= "avatar/default.png" )##
</pre>

<h2>Uninstallation:</h2>
<p>
To uninstall this plugin, simply delete the /plugins/FallbackImage-0.1.zip file.
</p>

<h2>Credits</h2>
<p>
	This plugin was created by <a href="http://www.imagineer.ca/">Jordan Clark</a>
</p>
<!--- <p>
	To submit an issue or fork this plugin, visit the
	<a href="http://github.com/liquifusion/cfwheels-required-fields">liquifusion/cfwheels-required-fields</a>
	repository on GitHub.
</p> --->

<h2>Disclaimer</h2>
<p>Remember that you use this at your own risk and I'm not responsible for anything. Please don't sue me :)</p>
</cfoutput>