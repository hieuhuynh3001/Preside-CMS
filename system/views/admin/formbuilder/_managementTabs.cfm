<cfscript>
	activeTab       = args.activeTab ?: "manage";
	canEdit         = IsTrue( args.canEdit ?: "" );
	tabs            = [];
	formId          = rc.id ?: "";
	submissionCount = args.submissionCount ?: 0;

	tabs.append({
		  icon   = "fa-reorder"
		, active = ( activeTab == "manage" )
		, link   = event.buildAdminLink( linkto="formbuilder.manageform", queryString="id=#formId#" )
		, title  = translateResource( "formbuilder:management.tabs.fields.title" )
	});

	tabs.append({
		  icon   = "fa-users"
		, active = ( activeTab == "submissions" )
		, link   = event.buildAdminLink( linkto="formbuilder.submissions", queryString="id=#formId#" )
		, title  = translateResource( uri="formbuilder:management.tabs.submissions.title", data=[ submissionCount ] )
	});

	if ( canEdit ) {
		tabs.append({
			  icon   = "fa-cog"
			, active = ( activeTab == "settings" )
			, link   = event.buildAdminLink( linkto="formbuilder.editForm", queryString="id=#formId#" )
			, title  = translateResource( "formbuilder:management.tabs.settings.title" )
		});
	}
</cfscript>

<cfoutput>
	<ul class="nav nav-tabs">
		<cfloop array="#tabs#" item="tab" index="i">
			<li<cfif tab.active> class="active"</cfif>>
				<a<cfif !tab.active> href="#tab.link#"</cfif>>
					<i class="fa fa-fw #tab.icon#"></i>
					#tab.title#
				</a>
			</li>
		</cfloop>
	</ul>
</cfoutput>