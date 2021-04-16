Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.14.1618594542969751496
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 10:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1406140C81;
	Fri, 16 Apr 2021 17:35:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C0HqzehDxkuj; Fri, 16 Apr 2021 17:35:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C9EBA409E0;
	Fri, 16 Apr 2021 17:35:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 289C21745B3; Fri, 16 Apr 2021 13:35:37 -0400 (EDT)
Date: Fri, 16 Apr 2021 13:35:37 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Lokesh Vutla <lokeshvutla@ti.com>,
	Nikhil Devshatwar <nikhil.nd@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master PATCH 0/6] am65x/j7*: Remove non-existent 5.10.y dtb*
Message-ID: <20210416173537.GZ15937@denix.org>
References: <20210415051105.1626-1-praneeth@ti.com>
 <a60cd66e-9b51-a710-6a1b-b7074bf8126f@ti.com>
 <20210415182431.GU15937@denix.org>
 <3d8c8160-aadc-5442-a38a-b5ff8b60d57c@ti.com>
 <167621ADFB287AF6.32252@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <167621ADFB287AF6.32252@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 15, 2021 at 04:22:20PM -0400, Denys Dmytriyenko wrote:
> On Thu, Apr 15, 2021 at 02:00:31PM -0500, Bajjuri, Praneeth wrote:
> > 
> > 
> > On 4/15/2021 1:24 PM, Denys Dmytriyenko wrote:
> > >On Thu, Apr 15, 2021 at 12:07:05PM -0500, praneeth via lists.yoctoproject.org wrote:
> > >>Denys,
> > >>
> > >>On 4/15/2021 12:10 AM, praneeth@ti.com wrote:
> > >>>From: Praneeth Bajjuri <praneeth@ti.com>
> > >>>
> > >>>The current ti-linux-5.10.y integration branch doesnt have support for
> > >>>non base board dtb/o form the primary latest processor board on am65 and
> > >>>j7* evms yet.
> > >>>
> > >>>Removing these dtb/o for enabling the builds to continue.
> > >>>Plan to add these blob and overlays back once the equivalent support is
> > >>>added in the integrated ti-linux-5.10.y kernel.
> > >>>
> > >>
> > >>Need your recommendation if this is the right approach to enable the
> > >>builds at this early stage of LTS migration (and re-enable the
> > >>overlays once the support is added in kernel).
> > >
> > >That's kind of normal to start a new LTS with bare minimum of dtb/o support.
> > >
> > >But I have 2 concerns:
> > >
> > >1. Maybe better to just push commit with removal, instead of reverting old
> > >commits - it may get quite confusing soon with reverts of reverts...
> > 
> > makes sense. will squash in v2.
> > 
> > >
> > >2. Do you think it's still premature to make 5.10 as a default in meta-ti
> > >dunfell branch? Since dunfell is kind of established stable (not a new LTS),
> > >anyone who updates meta-ti will go from fully working 5.4 to a very minimal
> > >and bare 5.10 - may be a bad user experience...
> > 
> > Was thinking in similar line.
> > So, till the 5.10 baseline matures i will continue to use
> > dunfell-next to stage the patches and keep dunfell branch untouched
> > w.r.t merging 5.10 specific changes.

Another approach could be to keep using core-next branding for a bit longer, 
leaving 5.4 as a default, until 5.10 is ready.


> > Let me know if this a good approach, The only problem in that case
> > is the graphics update for 5.10 that i recently pulled to dunfell
> > branch. Need to revert it to keep 5.4 dunfell experience retained.
> 
> Try those updates first with 5.4 before reverting them, mayve they'll work.
> 
> 
> > Any other ideas?
> > 
> > >
> > >
> > >>>Praneeth Bajjuri (6):
> > >>>   Revert "conf: j7-evm: Add jailhouse dtbo"
> > >>>   Revert "j7-evm: add new k3-j721e-proc-board-tps65917.dtb"
> > >>>   Revert "j7-evm: add new infotainment DTBO file"
> > >>>   Revert "j7-evm: add k3-j721e-pcie-backplane.dtbo"
> > >>>   Revert "conf: machine: j7200-evm: Add Jailhouse overlay"
> > >>>   conf/machine: am65xx: Remove non-existent dtb* from 5.10
> > >>>
> > >>>  conf/machine/include/am65xx.inc | 11 -----------
> > >>>  conf/machine/j7-evm.conf        |  4 ----
> > >>>  conf/machine/j7200-evm.conf     |  1 -
> > >>>  3 files changed, 16 deletions(-)
> > >>>
> > >

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
