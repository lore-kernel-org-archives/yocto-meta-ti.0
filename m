Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3978.1619143189544023554
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 18:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 64D8B40C1E;
	Fri, 23 Apr 2021 01:59:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AGSR6XLwsnQC; Fri, 23 Apr 2021 01:59:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 43DEF40BA9;
	Fri, 23 Apr 2021 01:59:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 93E6A1745CF; Thu, 22 Apr 2021 21:59:46 -0400 (EDT)
Date: Thu, 22 Apr 2021 21:59:46 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master PATCH 0/6] am65x/j7*: Remove non-existent 5.10.y dtb*
Message-ID: <20210423015946.GF15937@denix.org>
References: <20210415051105.1626-1-praneeth@ti.com>
 <a60cd66e-9b51-a710-6a1b-b7074bf8126f@ti.com>
 <20210415182431.GU15937@denix.org>
 <3d8c8160-aadc-5442-a38a-b5ff8b60d57c@ti.com>
 <167621ADFB287AF6.32252@lists.yoctoproject.org>
 <20210416173537.GZ15937@denix.org>
 <46ee0999-a7ba-0417-754c-102d1ddcd437@ti.com>
 <20210422204833.GW15937@denix.org>
 <eaa0f889-eede-969e-1635-40ff8c827ea2@ti.com>
MIME-Version: 1.0
In-Reply-To: <eaa0f889-eede-969e-1635-40ff8c827ea2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Praneeth,

On Thu, Apr 22, 2021 at 05:28:19PM -0500, Bajjuri, Praneeth wrote:
> On 4/22/2021 3:48 PM, Denys Dmytriyenko wrote:
> >>>>>>2. Do you think it's still premature to make 5.10 as a default in meta-ti
> >>>>>>dunfell branch? Since dunfell is kind of established stable (not a new LTS),
> >>>>>>anyone who updates meta-ti will go from fully working 5.4 to a very minimal
> >>>>>>and bare 5.10 - may be a bad user experience...
> >>>>>
> >>>>>Was thinking in similar line.
> >>>>>So, till the 5.10 baseline matures i will continue to use
> >>>>>dunfell-next to stage the patches and keep dunfell branch untouched
> >>>>>w.r.t merging 5.10 specific changes.
> >>>
> >>>Another approach could be to keep using core-next branding for a bit longer,
> >>>leaving 5.4 as a default, until 5.10 is ready.
> >>
> >>the final SDK release with 5.4 on dunfell has already been made so
> >>not aware of anyone using this combination for active development
> >>now.
> >>
> >>and 5.10 needs to be getting to a better shape soon.
> >>Thinking, it makes sense to switch to 5.10 and start addressing the
> >>regressions as we progress with development.
> >
> >I see dunfell has been merged with "empty" 5.10 which is the default.
> 
> Can you help here, didnot understand this "merged with "empty" 5.10
> which is the default"

Sorry, I meant barebone mainline 5.10 vs. TI-enhanced 5.4. Basically, anything 
that is not yet upstream, has to be re-added again to 5.10 - IPC/rpmsg, any 
advanced PM/thermal, secure device support, DT overlays, etc.


> >What happened to keeping this to dunfell-next for now? As you said above:
> >
> >| So, till the 5.10 baseline matures i will continue to use
> >| dunfell-next to stage the patches and keep dunfell branch untouched
> >| w.r.t merging 5.10 specific changes.
> >
> >While I understand the need to migrate from 5.4 to 5.10 and get developers
> >working on it, willingly introducing regressions into a stable branch is
> >quite undesirable. Anyone developing a product for a TI part with meta-ti
> >would normally pull the latest stable branch. And while last week it used
> >to work perfectly fine, providing full-featured 5.4 experience, this week
> >it appears to be very barebone and with limited features 5.10 experience by
> >default...
> 
> The 5.4 stability on dunfell took longer and also a need to making
> 5.10 migration ready on the same branch makes the ride not smoother
> too.
> 
> Few updates on the planned next steps (basically getting from
> barebone to complete features as per the product plan).
> 
> * non display overlays support will come in the next week.
> * display overlays will take more than few weeks as the migration
> for this on kernel side has not started either.
> * non-k3 devices fails to build today, but the fixes are in progress
> (testing them on dunfell-next branch now)
> * jailhouse has been disabled temporarily. This feature is in review
> to be completely descoped too as desired by product teams. depending
> on the direction closure worst case we might have to remove
> jailhouse completely from meta-ti/meta-arago on dunfell and master.
> 
> Not the best choice, but the reason i pulled dunfell-next to dunfell
> is to initiate the system test and other automation job/build
> dependencies to have those ready for 2021LTS baseline too.

Thank you for all the details! Much appreciate the visibility here.


> Have also kept -master untouched for this transitionary period. Will
> sync all patches to master once dunfell with 5.10 is featured.

Well, it usually works the other way around - it's Ok to break master, but not 
a stable or, even worse, an LTS branch... :) But hopefully we'll figure out 
the best process and eventually get there.


> >Will be needing to advise people to pin down to 07.03.00.005 tag and not rush
> >to the latest 2021.00.001 tag for now.
> 
> You are right, this is what i am advising the teams who need dunfell
> repository for more development on the top (Ex: processor-sdk) till
> 5.10 is completely ready on dunfell.
> 
> Both jacinto and sitara processor-sdk are using the pinned config
> and adding any further recipe updates in the meta-processor-sdk*
> layer on top for time being.

To be clear, I'm not referring to internal BU customers anymore. Instead, I'm 
worried how external customers and any OE-savvy consulting agency handles 
things. Very few will stick to an SDK release or corresponding tag. That is 
due to OE/Yocto recommendation to always pull latest from a stable/LTS branch, 
in order to pick up any security fixes...


> >>>>>Let me know if this a good approach, The only problem in that case
> >>>>>is the graphics update for 5.10 that i recently pulled to dunfell
> >>>>>branch. Need to revert it to keep 5.4 dunfell experience retained.
> >>>>
> >>>>Try those updates first with 5.4 before reverting them, mayve they'll work.
> >>>>
> >>>>
> >>>>>Any other ideas?

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
