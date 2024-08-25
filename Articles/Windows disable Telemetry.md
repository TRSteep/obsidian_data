#windows 

# Windows

# Firefox
- https://github.com/K3V1991/Disable-Firefox-Telemetry-and-Data-Collection
- `about:config`
	- False
		- browser.newtabpage.activity-stream.feeds.telemetry
		- browser.newtabpage.activity-stream.telemetry
		- browser.ping-centre.telemetry
		- datareporting.healthreport.uploadEnabled
		- datareporting.policy.dataSubmissionEnabled
		- toolkit.telemetry.archive.enabled
		- toolkit.telemetry.bhrPing.enabled
		- toolkit.telemetry.enabled
		- toolkit.telemetry.firstShutdownPing.enabled
		- toolkit.telemetry.newProfilePing.enabled
		- toolkit.telemetry.shutdownPingSender.enabled
		- toolkit.telemetry.unified
		- toolkit.telemetry.updatePing.enabled
	- Param
		- toolkit.telemetry.server
			- null
		- toolkit.telemetry.prompted
			- Number Value 2