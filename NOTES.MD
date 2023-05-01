1. TIMEZONE for the Django settings has to match whatever timezone the user is from. The ATF portal looks at the EFT creation date and doesn't care about timezone.
   So if the EFT was created on April 30th 11PM EST, the EFT file will have a timestamp of May 1st 3AM UTC. 
   I'm not sure if the ATF portal uses the browsers timezone or whatever their servers are set too. But an EFT generated and uploaded in an EST timezone was accepted by the ATF portal. 

2. The NBIS packages need to be compiled using GCC v7.5. Looks like an update made to GCC regarding symbol visibility? (On-going investigation. Would like to compile on modern OS if possible.)