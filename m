Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.4139.1615261720510196613
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Mar 2021 19:48:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 198.145.29.25, mailfrom: denis@denix.org)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 2B22738C052B
	for <meta-ti@yoctoproject.org>; Tue,  9 Mar 2021 03:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 969BC40BE9;
	Tue,  9 Mar 2021 03:48:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dm5MGU1MLav7; Tue,  9 Mar 2021 03:48:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3E46440AB7;
	Tue,  9 Mar 2021 03:48:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0222817452E; Mon,  8 Mar 2021 22:48:31 -0500 (EST)
Date: Mon, 8 Mar 2021 22:48:31 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Cc: meta-ti@yoctoproject.org, praneeth@ti.com, lokeshvutla@ti.com,
	kishon@ti.com, nsekhar@ti.com, hnagalla@ti.com,
	saurabhnarang@ti.com
Subject: Re: [meta-ti][PATCH] recipes-bsp: wl18xx-fw: update SRCREV to latest
Message-ID: <20210309034831.GG4892@denix.org>
References: <20210303180917.12872-1-nikhil.nd@ti.com>
 <20210303181749.GW4892@denix.org>
 <166969EA2A6821A6.22430@lists.yoctoproject.org>
 <20210305103055.3uf5ypbaxsx2yezb@NiksLab>
MIME-Version: 1.0
In-Reply-To: <20210305103055.3uf5ypbaxsx2yezb@NiksLab>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 05, 2021 at 04:00:55PM +0530, Nikhil Devshatwar wrote:
> On 15:29-20210305, Nikhil Devshatwar via lists.yoctoproject.org wrote:
> > On 13:17-20210303, Denys Dmytriyenko wrote:
> > > On Wed, Mar 03, 2021 at 11:39:17PM +0530, Nikhil Devshatwar via lists.yoctoproject.org wrote:
> > > > Update the wl18xx firmware recipe to latest version 8.9.0.0.86
> > > 
> > > Do you also need to update the version from 8.7.3 to 8.9.x?
> > 
> > I am not sure how the recipe version is decided.
> > Old commit ID had the firmware version 8.9.0.0.76 which is now
> > changed to 8.9.0.0.86
> > 
> > I don't know how the recipe version is tied to the firmware version.
> > Hari, Do you know?
> 
> I looked at the git history of the firmware and the last commit was
> tagged with R8.7_SP3 Maybe this is used to derive the firmware version
> 8.7.3

Correct.


> But since the last tag in 2017, there haven't been new tags but the
> firmware has been updated 7 times.
> 
> In this case, the recipe is adding only a single file, so let's just use
> the firmware version in the recipe rather than using tags from the repo.

If there's a version embedded in the firmware, that makes things easier and 
more reliable.


> While at it, maybe it does not make sense to keep renaming the file for
> every version change, so we just make it _git.bb and set
> PV += "8.9.0.0.86"

It's been 4 years since last release/update. With such infrequent updates it's 
better to keep the version in the filename.

You want to name the recipe with _git and set PV inside when you have frequent 
updates and also versions in-between releases.


> > > > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > > > ---
> > > >  recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > 
> > > > diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > > > index a52ec898..50b6c297 100644
> > > > --- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > > > +++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > > > @@ -7,8 +7,7 @@ SRC_URI = " \
> > > >  	file://0001-Add-Makefile-to-install-firmware-files.patch \
> > > >  "
> > > >  
> > > > -# Tag: R8.7-SP3 (8.7.3)
> > > > -SRCREV = "f659be25473e4bde8dc790bff703ecacde6e21da"
> > > > +SRCREV = "5ec05007f2662f460f881c5868311fd3ab7e6e71"
> > > >  BRANCH = "master"
> > > >  
> > > >  S = "${WORKDIR}/git"
> > > > -- 
> > > > 2.17.1
