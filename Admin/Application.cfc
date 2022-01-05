<cfif not structKeyExists(application, "initialized")>
    <cfset application.datasource = "my_datasource">
    <cfset application.initialized = now()>
</cfif>
