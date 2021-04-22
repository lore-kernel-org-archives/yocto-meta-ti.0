Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.291.1619124516137470763
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 13:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 82F1C40C46;
	Thu, 22 Apr 2021 20:48:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doxwCRaeG8BH; Thu, 22 Apr 2021 20:48:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 61D4240429;
	Thu, 22 Apr 2021 20:48:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BB8321745CF; Thu, 22 Apr 2021 16:48:33 -0400 (EDT)
Date: Thu, 22 Apr 2021 16:48:33 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master PATCH 0/6] am65x/j7*: Remove non-existent 5.10.y dtb*
Message-ID: <20210422204833.GW15937@denix.org>
References: <20210415051105.1626-1-praneeth@ti.com>
 <a60cd66e-9b51-a710-6a1b-b7074bf8126f@ti.com>
 <20210415182431.GU15937@denix.org>
 <3d8c8160-aadc-5442-a38a-b5ff8b60d57c@ti.com>
 <167621ADFB287AF6.32252@lists.yoctoproject.org>
 <20210416173537.GZ15937@denix.org>
 <46ee0999-a7ba-0417-754c-102d1ddcd437@ti.com>
MIME-Version: 1.0
In-Reply-To: <46ee0999-a7ba-0417-754c-102d1ddcd437@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Praneeth,

On Sun, Apr 18, 2021 at 11:51:06PM -0500, praneeth via lists.yoctoproject.org wrote:
> On 4/16/2021 12:35 PM, Denys Dmytriyenko wrote:
> >On Thu, Apr 15, 2021 at 04:22:20PM -0400, Denys Dmytriyenko wrote:
> >>On Thu, Apr 15, 2021 at 02:00:31PM -0500, Bajjuri, Praneeth wrote:
> >>>On 4/15/2021 1:24 PM, Denys Dmytriyenko wrote:
> >>>>On Thu, Apr 15, 2021 at 12:07:05PM -0500, praneeth via lists.yoctoproject.org wrote:
> >>>>>Denys,
> >>>>>
> >>>>>On 4/15/2021 12:10 AM, praneeth@ti.com wrote:
> >>>>>>From: Praneeth Bajjuri <praneeth@ti.com>
> >>>>>>
> >>>>>>The current ti-linux-5.10.y integration branch doesnt have support for
> >>>>>>non base board dtb/o form the primary latest processor board on am65 and
> >>>>>>j7* evms yet.
> >>>>>>
> >>>>>>Removing these dtb/o for enabling the builds to continue.
> >>>>>>Plan to add these blob and overlays back once the equivalent support is
> >>>>>>added in the integrated ti-linux-5.10.y kernel.
> >>>>>>
> >>>>>
> >>>>>Need your recommendation if this is the right approach to enable the
> >>>>>builds at this early stage of LTS migration (and re-enable the
> >>>>>overlays once the support is added in kernel).
> >>>>
> >>>>That's kind of normal to start a new LTS with bare minimum of dtb/o support.
> >>>>
> >>>>But I have 2 concerns:
> >>>>
> >>>>1. Maybe better to just push commit with removal, instead of reverting old
> >>>>commits - it may get quite confusing soon with reverts of reverts...
> >>>
> >>>makes sense. will squash in v2.
> >>>
> >>>>
> >>>>2. Do you think it's still premature to make 5.10 as a default in meta-ti
> >>>>dunfell branch? Since dunfell is kind of established stable (not a new LTS),
> >>>>anyone who updates meta-ti will go from fully working 5.4 to a very minimal
> >>>>and bare 5.10 - may be a bad user experience...
> >>>
> >>>Was thinking in similar line.
> >>>So, till the 5.10 baseline matures i will continue to use
> >>>dunfell-next to stage the patches and keep dunfell branch untouched
> >>>w.r.t merging 5.10 specific changes.
> >
> >Another approach could be to keep using core-next branding for a bit longer,
> >leaving 5.4 as a default, until 5.10 is ready.
> 
> the final SDK release with 5.4 on dunfell has already been made so
> not aware of anyone using this combination for active development
> now.
> 
> and 5.10 needs to be getting to a better shape soon.
> Thinking, it makes sense to switch to 5.10 and start addressing the
> regressions as we progress with development.

I see dunfell has been merged with "empty" 5.10 which is the default.
What happened to keeping this to dunfell-next for now? As you said above:

| So, till the 5.10 baseline matures i will continue to use
| dunfell-next to stage the patches and keep dunfell branch untouched
| w.r.t merging 5.10 specific changes.

While I understand the need to migrate from 5.4 to 5.10 and get developers 
working on it, willingly introducing regressions into a stable branch is 
quite undesirable. Anyone developing a product for a TI part with meta-ti 
would normally pull the latest stable branch. And while last week it used 
to work perfectly fine, providing full-featured 5.4 experience, this week 
it appears to be very barebone and with limited features 5.10 experience by 
default...

Will be needing to advise people to pin down to 07.03.00.005 tag and not rush 
to the latest 2021.00.001 tag for now.


> >>>Let me know if this a good approach, The only problem in that case
> >>>is the graphics update for 5.10 that i recently pulled to dunfell
> >>>branch. Need to revert it to keep 5.4 dunfell experience retained.
> >>
> >>Try those updates first with 5.4 before reverting them, mayve they'll work.
> >>
> >>
> >>>Any other ideas?
