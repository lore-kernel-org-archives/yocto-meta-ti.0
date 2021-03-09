Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.4101.1615261472686509013
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Mar 2021 19:44:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 198.145.29.25, mailfrom: denis@denix.org)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id C72B438C04B3
	for <meta-ti@yoctoproject.org>; Tue,  9 Mar 2021 03:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C7D6740BE9;
	Tue,  9 Mar 2021 03:44:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ew9U5j5STcHh; Tue,  9 Mar 2021 03:44:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7329A40AB7;
	Tue,  9 Mar 2021 03:44:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C022F17452E; Mon,  8 Mar 2021 22:44:22 -0500 (EST)
Date: Mon, 8 Mar 2021 22:44:22 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Cc: meta-ti@yoctoproject.org, praneeth@ti.com, lokeshvutla@ti.com,
	kishon@ti.com, nsekhar@ti.com, hnagalla@ti.com,
	saurabhnarang@ti.com
Subject: Re: [meta-ti][PATCH] recipes-bsp: wl18xx-fw: update SRCREV to latest
Message-ID: <20210309034422.GF4892@denix.org>
References: <20210303180917.12872-1-nikhil.nd@ti.com>
 <20210303181749.GW4892@denix.org>
 <20210305095949.cjamdcgrdb267a2c@NiksLab>
MIME-Version: 1.0
In-Reply-To: <20210305095949.cjamdcgrdb267a2c@NiksLab>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 05, 2021 at 03:29:49PM +0530, Nikhil Devshatwar wrote:
> On 13:17-20210303, Denys Dmytriyenko wrote:
> > On Wed, Mar 03, 2021 at 11:39:17PM +0530, Nikhil Devshatwar via lists.yoctoproject.org wrote:
> > > Update the wl18xx firmware recipe to latest version 8.9.0.0.86
> > 
> > Do you also need to update the version from 8.7.3 to 8.9.x?
> 
> I am not sure how the recipe version is decided.
> Old commit ID had the firmware version 8.9.0.0.76 which is now
> changed to 8.9.0.0.86
> 
> I don't know how the recipe version is tied to the firmware version.
> Hari, Do you know?

Nikhil,

Originally, the recipe version was tied into the release tag (see below)


> > > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > > ---
> > >  recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > > index a52ec898..50b6c297 100644
> > > --- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > > +++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb

The filename sets 8.7.3 as the version.


> > > @@ -7,8 +7,7 @@ SRC_URI = " \
> > >  	file://0001-Add-Makefile-to-install-firmware-files.patch \
> > >  "
> > >  
> > > -# Tag: R8.7-SP3 (8.7.3)

Which corresponds to this tag ^^^


> > > -SRCREV = "f659be25473e4bde8dc790bff703ecacde6e21da"
> > > +SRCREV = "5ec05007f2662f460f881c5868311fd3ab7e6e71"
> > >  BRANCH = "master"
> > >  
> > >  S = "${WORKDIR}/git"
> > > -- 
> > > 2.17.1
