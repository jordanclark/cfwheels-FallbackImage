<cfcomponent output="false" mixin="global">

<cfset $initFallbackImage()>

<cffunction name="init">
	<cfset this.version = "1.1.5,1.1.7">
	
	<cfreturn this>
</cffunction>

<cffunction name="$initFallbackImage" mixin="controller" hint="Initializes application variables used to generate the required field indicator.">
	<cfparam name="application.fallbackImage.environments" type="string" default="design,development,testing,maintenance,production">
</cffunction>

<cffunction name="$imageTag" returntype="string" access="public" output="false">
	<cfset var backup = "">
	<cfif structKeyExists( arguments, "fallback" ) AND len( arguments.fallback ) AND listFindNoCase( application.fallbackImage.environments, application.wheels.environment )>
		<cfset backup = arguments.fallback>
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