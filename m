Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1935.1607645730164073648
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 16:15:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 901FC40BDC;
	Fri, 11 Dec 2020 00:15:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LbqYkZtgqAUe; Fri, 11 Dec 2020 00:15:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4796F40951;
	Fri, 11 Dec 2020 00:15:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0C0FB174507; Thu, 10 Dec 2020 19:15:24 -0500 (EST)
Date: Thu, 10 Dec 2020 19:15:24 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: meta-ti@lists.yoctoproject.org, praneeth@ti.com, d-gerlach@ti.com,
	s-anna@ti.com, dmurphy@ti.com
Subject: Re: [dunfell/master PATCH V4] trusted-firmware-a: Update to v2.4 merge
Message-ID: <20201211001524.GC24670@denix.org>
References: <20201210234957.9412-1-nm@ti.com>
 <20201211000015.GB24670@denix.org>
 <20201211000418.daqqo6qhmnqtoxf5@kahuna>
MIME-Version: 1.0
In-Reply-To: <20201211000418.daqqo6qhmnqtoxf5@kahuna>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 10, 2020 at 06:04:18PM -0600, Nishanth Menon wrote:
> On 19:00-20201210, Denys Dmytriyenko wrote:
> > On Thu, Dec 10, 2020 at 05:49:57PM -0600, Nishanth Menon wrote:
> > > Update to v2.4 tag merge from upstream to keep TF-A in sync.
> > > 
> > > For major changes in trusted-firmware-a, See:
> > > https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-2-4
> > > 
> > > TI specific fixups include:
> > >  - stub for shutdown (CPUs enter wfi)
> > >  - uart console is now configurable.
> > > 
> > > While at it, update to include PV_k3 as 2.4 and provide the license file
> > > checksum.
> > > 
> > > NOTE: We use PV_k3 instead of PV since this allows meta-ti to not
> > > affect other platforms esp in a multi-BSP configuration.
> > > 
> > > Suggested-by: Dan Murphy <dmurphy@ti.com>
> > > Signed-off-by: Nishanth Menon <nm@ti.com>
> > 
> > Reviewed-by: Denys Dmytriyenko <denis@denix.org>
> > 
> > Nice-to-have would be to explain the license checksum change and whether it 
> > affects the actual license. The checksum there is specifically to catch any 
> > changes to the license file and prevent re-licensing to pass unnoticed...
> > 
> 
> Hmm.. good idea.. but it was'nt present before.. so i could state
> something as follows in the commit message:
> 
> ----
> 
> While at it, update to include PV_k3 as 2.4. We use PV_k3 instead of
> PV since this allows meta-ti to not affect other platforms esp in a
> multi-BSP configuration.
> 
> We also add LIC_FILES_CHKSUM_k3 to make sure that we don't let any
> re-licensing in the project pass through unnoticed as that has to
> be carefully examined for making sure we have all the right legal
> compliance.

Right, but you don't explain what actually changed to cause the checksum 
update...

E.g.: "checksum changed due to upstream commit XYZ to update the year, the 
license itself is the same" or "checksum changed due to addition on SPDX 
header in commit XYZ, no license change"

But you need to examine it yourself. Otherwise it could be: "the license has 
changed from GPLv2 to GPLv3" and also update the actual LICENSE_k3 variable.


> ----
> 
> If good, I can repost with your reviewed-by plucked up..
> 
> -- 
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
