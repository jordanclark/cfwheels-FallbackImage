<cfcomponent output="false" mixin="global">

<cfset $initFallbackImage()>

<cffunction name="init">
	<cfset this.version = "1.1.5">
	
	<cfreturn this>
</cffunction>

<cffunction name="$initFallbackImage" mixin="controller" hint="Initializes application variables used to generate the required field indicator.">
	<cfparam name="application.fallbackImage.environments" type="string" default="design,development,testing,maintenance,production">
</cffunction>

<cffunction name="$imageTag" returntype="string" access="public" output="false">
	<cfset var backup = "">
	<cfif structKeyExists( arguments, "fallback" ) AND len( arguments.fallback ) AND listFindNoCase( application.fallbackImage.environments, application.wheels.environment )>
		<cfset backup = arguments.fallback>
		<cfscript>
			local.source = listToArray(arguments.source,"/");
			if (local.source[1] eq "images") {
				arrayDeleteAt(local.source,1);	
			}
			local.source = arrayToList(local.source,"/");
			StructUpdate(arguments, "source", local.source);
		</cfscript>
		<cfset structDelete( arguments, "fallback" )>
		<cftry>
			<cfreturn core.$imageTag( argumentCollection=arguments )>
			<cfcatch>
				<cfset arguments.source = backup>
				<cfreturn core.$imageTag( argumentCollection=arguments )>
			</cfcatch>
		</cftry>
	<cfelse>
		<cfreturn core.$imageTag( argumentCollection=arguments )>
	</cfif>
</cffunction>

</cfcomponent>