Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A8EC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 19:23:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1647.1654716204416923162
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 12:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8209740CC3;
	Wed,  8 Jun 2022 19:23:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PxQbMJz7q_NH; Wed,  8 Jun 2022 19:23:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4EC2140C4E;
	Wed,  8 Jun 2022 19:23:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 136E4174968; Wed,  8 Jun 2022 15:23:18 -0400 (EDT)
Date: Wed, 8 Jun 2022 15:23:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: nm@ti.com
Cc: j-choudhary@ti.com, meta-ti@lists.yoctoproject.org, afd@ti.com,
	praneeth@ti.com, reatmon@ti.com
Subject: Re: [meta-ti] [dunfell PATCH v2 4/5] ti-graphics: Add
 j721s2-hs-evm as a compatible machine
Message-ID: <20220608192318.GX9834@denix.org>
References: <20220607103529.13068-1-j-choudhary@ti.com>
 <20220607103529.13068-5-j-choudhary@ti.com>
 <20220608180921.gdqvowmqs6hln7t7@ritzy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608180921.gdqvowmqs6hln7t7@ritzy>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jun 2022 19:23:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14802

On Wed, Jun 08, 2022 at 01:09:21PM -0500, Nishanth Menon via lists.yoctoproject.org wrote:
> On 16:05-20220607, Jayesh Choudhary via lists.yoctoproject.org wrote:
> > Add HS platform to the list of compatible machines.
> > 
> > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> > ---
> >  .../powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb       | 4 +++-
> >  recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb  | 3 ++-
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> > index 718c7845..3a20d809 100644
> > --- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> > +++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> > @@ -11,7 +11,7 @@ MACHINE_KERNEL_PR_append = "b"
> >  PR = "${MACHINE_KERNEL_PR}"
> >  
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > -COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|am62xx"
> > +COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|am62xx"
> >  
> >  DEPENDS = "virtual/kernel"
> >  
> > @@ -31,10 +31,12 @@ SRCREV = "6d3d62a15ceb85b719c35f34c6c9e35f556b406b"
> >  TARGET_PRODUCT_j7-evm = "j721e_linux"
> >  TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
> >  TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
> > +TARGET_PRODUCT_j721s2-hs-evm = "j721s2_linux"
> 
> ^^ DDK km build does'nt again change based on board.. so why are we
> doint this based on board?

Platform and DDK cleanup went into kirkstone/master, but not dunfell.


> >  TARGET_PRODUCT_am62xx = "am62_linux"
> >  TARGET_BVNC_j7-evm = "22.104.208.318"
> >  TARGET_BVNC_j7-hs-evm = "22.104.208.318"
> >  TARGET_BVNC_j721s2-evm = "36.53.104.796"
> > +TARGET_BVNC_j721s2-hs-evm = "36.53.104.796"
> 
> BVNC does'nt change based on evm - so why are we do it based on board?
> 
> >  TARGET_BVNC_am62xx = "33.15.11.3"
> >  PVR_BUILD = "release"
> >  PVR_WS = "wayland"
> > diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> > index 1bfb2b93..7921d17b 100644
> > --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> > +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> > @@ -8,7 +8,7 @@ inherit features_check
> >  REQUIRED_MACHINE_FEATURES = "gpu"
> >  
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > -COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|am62xx"
> > +COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|am62xx"
> >  
> >  PR = "r2"
> >  
> > @@ -20,6 +20,7 @@ SRCREV = "fba0c770b712640ab3761dbe8369d43f89f616ed"
> >  TARGET_PRODUCT_j7-evm = "j721e_linux"
> >  TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
> >  TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
> > +TARGET_PRODUCT_j721s2-hs-evm = "j721s2_linux"
> 
> ^^ Same question here as well.. am62xx seems to have done it right.
> 
> >  TARGET_PRODUCT_am62xx = "am62_linux"
> >  PVR_BUILD ?= "release"
> >  PVR_WS = "wayland"
> > -- 
> > 2.17.1

