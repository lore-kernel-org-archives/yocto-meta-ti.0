Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43239ECAAA4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 17:54:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1409.1661795680162990064
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 10:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2A5A540CF1;
	Mon, 29 Aug 2022 17:54:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Pq6GqqIf2f4; Mon, 29 Aug 2022 17:54:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D13E940CED;
	Mon, 29 Aug 2022 17:54:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0DA531749C8; Mon, 29 Aug 2022 13:54:31 -0400 (EDT)
Date: Mon, 29 Aug 2022 13:54:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: gadiyar@ti.com
Cc: "Eatmon, Ryan" <reatmon@ti.com>,
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
	Denys Dmytriyenko <denys@konsulko.com>,
	"Nagalla, Hari" <hnagalla@ti.com>, "Davis, Andrew" <afd@ti.com>,
	"Bajjuri, Praneeth" <praneeth@ti.com>
Subject: Re: [meta-ti] [dunfell][PATCH] machine: add am62xx-lp-skevm
 configuration
Message-ID: <20220829175430.GJ18429@denix.org>
References: <20220826185638.1030640-1-gadiyar@ti.com>
 <c69f0615-a9a8-b4da-a006-62c68f66396f@ti.com>
 <45f59672c0db48988d35339976be43f6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45f59672c0db48988d35339976be43f6@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Aug 2022 17:54:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14978

On Mon, Aug 29, 2022 at 04:50:00PM +0000, Anand Gadiyar via lists.yoctoproject.org wrote:
> > From: Eatmon, Ryan <reatmon@ti.com>
> > 
> > 
> > On 8/26/2022 13:56, Anand Gadiyar wrote:
> > > This platform is similar to the currently supported am62xx-evm, except
> > > that we currently need new defconfigs for u-boot and new dtbs in the
> > > filesystem.
> > >
> > > Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
> > > Cc: Hari Nagalla <hnagalla@ti.com>
> > > Cc: Andrew Davis <afd@ti.com>
> > > Cc: Praneeth Bajjuri <praneeth@ti.com>
> > > Cc: Ryan Eatmon <reatmon@ti.com>
> > > ---
> > > For yocto purposes, this machine is nearly identical to the AM62x SK,
> > > and we will have more similar machines in the future.
> > >
> > > Mainly, we just need to add more dtbs in the filesystem and to build
> > > u-boot/spl/tiboot3.bin with different defconfigs than the AM62x SK.
> > >
> > > If there's a better way to add support for this, let me know. Now's a
> > > better time than later.

Adding new DTBs to the existing am62xx-evm shouldn't be a problem:
https://git.yoctoproject.org/meta-ti/tree/conf/machine/include/ti33x.inc?h=dunfell#n29

As of 2 different defconfigs in U-boot - it sounded like it is a temporary 
situation. If the plan is to have the same defconfig and U-boot tiboot3.bin 
binary for both AM62 and AM62 LP at some point, it is probably better to go 
that route and keep a single am62xx-evm machine config, instead of duplicating 
almost identical platforms...


> > Even though the first board that came out was an SK board, in the long
> > run the boards will eventually be called EVM boards.  We typically pick
> > the names for the long run, and not the short term.  Please change the
> > name of the platform to am62xx-lp-evm (remove the sk).
> > 
> > This means changing the name of the conf files, and the various places
> > in the other files that reference the machine name in variable settings.
> > 
> > So to restate:
> > 
> > am62xx-lp-skevm --> am62xx-lp-evm
> 
> Done - changed in v2.
> 
> 
> > >   conf/machine/am62xx-lp-skevm-k3r5.conf         | 11 +++++++++++
> > >   conf/machine/am62xx-lp-skevm.conf              | 16 ++++++++++++++++
> > >   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb         |  1 +
> > >   recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb |  2 +-
> > >   recipes-kernel/linux/kernel-rdepends.inc       |  1 +
> > >   recipes-security/optee/optee-os_%.bbappend     |  1 +
> > >   6 files changed, 31 insertions(+), 1 deletion(-)
> > >   create mode 100644 conf/machine/am62xx-lp-skevm-k3r5.conf
> > >   create mode 100644 conf/machine/am62xx-lp-skevm.conf
> > >
> > > diff --git a/conf/machine/am62xx-lp-skevm-k3r5.conf b/conf/machine/am62xx-lp-skevm-k3r5.conf
> > > new file mode 100644
> > > index 00000000..8e3b04d0
> > > --- /dev/null
> > > +++ b/conf/machine/am62xx-lp-skevm-k3r5.conf
> > > @@ -0,0 +1,11 @@
> > > +#@TYPE: Machine
> > > +#@NAME: AM62XX EVM (R5F)
> > > +#@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
> > 
> > Copy paste error?  Need to add LP to the description?
> > 
> >  > +
> > > +require conf/machine/include/k3r5.inc
> > > +
> > > +SYSFW_SOC = "am62x"
> > > +SYSFW_CONFIG = "evm"
> > > +SYSFW_SUFFIX = "gp"
> > > +
> > > +UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
> > > diff --git a/conf/machine/am62xx-lp-skevm.conf b/conf/machine/am62xx-lp-skevm.conf
> > > new file mode 100644
> > > index 00000000..1bed1ff0
> > > --- /dev/null
> > > +++ b/conf/machine/am62xx-lp-skevm.conf
> > > @@ -0,0 +1,16 @@
> > > +#@TYPE: Machine
> > > +#@NAME: AM62XX EVM
> > > +#@DESCRIPTION: Machine configuration for the TI AM62XX EVM
> > 
> > 
> > Copy paste error?  Need to add LP to the description?
> 
> Thanks! Fixed in both places in v2.

