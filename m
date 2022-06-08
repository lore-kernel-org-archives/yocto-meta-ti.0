Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A2AC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 19:28:47 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1754.1654716521435431154
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 12:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8039D40CC3;
	Wed,  8 Jun 2022 19:28:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4VJS_Vw8qGi5; Wed,  8 Jun 2022 19:28:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4720640031;
	Wed,  8 Jun 2022 19:28:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 04041174968; Wed,  8 Jun 2022 15:28:34 -0400 (EDT)
Date: Wed, 8 Jun 2022 15:28:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: nm@ti.com
Cc: j-choudhary@ti.com, meta-ti@lists.yoctoproject.org, afd@ti.com,
	praneeth@ti.com, reatmon@ti.com
Subject: Re: [meta-ti] [dunfell PATCH v2 1/5] conf: machine: Add j721s2 hs
 platform
Message-ID: <20220608192834.GY9834@denix.org>
References: <20220607103529.13068-1-j-choudhary@ti.com>
 <20220607103529.13068-2-j-choudhary@ti.com>
 <20220608181153.dbe6e3pu5q7kqncp@bobbed>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608181153.dbe6e3pu5q7kqncp@bobbed>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jun 2022 19:28:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14803

On Wed, Jun 08, 2022 at 01:11:53PM -0500, Nishanth Menon via lists.yoctoproject.org wrote:
> On 16:05-20220607, Jayesh Choudhary via lists.yoctoproject.org wrote:
> > Machine conf for J721S2 HS platform.
> > Used j7200 hs as reference.
> > 
> > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> > ---
> >  conf/machine/j721s2-hs-evm-k3r5.conf | 13 +++++++++++++
> >  conf/machine/j721s2-hs-evm.conf      | 22 ++++++++++++++++++++++
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 conf/machine/j721s2-hs-evm-k3r5.conf
> >  create mode 100644 conf/machine/j721s2-hs-evm.conf
> > 
> > diff --git a/conf/machine/j721s2-hs-evm-k3r5.conf b/conf/machine/j721s2-hs-evm-k3r5.conf
> > new file mode 100644
> > index 00000000..ac4df86e
> > --- /dev/null
> > +++ b/conf/machine/j721s2-hs-evm-k3r5.conf
> > @@ -0,0 +1,13 @@
> > +#@TYPE: Machine
> > +#@NAME: J721S2 HS EVM (R5F)
> > +#@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM (R5F core)
> > +
> > +require conf/machine/include/k3r5.inc
> > +
> > +SYSFW_SOC = "j721s2"
> > +SYSFW_CONFIG = "evm"
> > +SYSFW_SUFFIX = "hs"
> > +
> > +UBOOT_MACHINE = "j721s2_hs_evm_r5_defconfig"
> > +
> > +TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> > diff --git a/conf/machine/j721s2-hs-evm.conf b/conf/machine/j721s2-hs-evm.conf
> > new file mode 100644
> > index 00000000..43fb2ebc
> > --- /dev/null
> > +++ b/conf/machine/j721s2-hs-evm.conf
> > @@ -0,0 +1,22 @@
> > +#@TYPE: Machine
> > +#@NAME: J721S2 HS EVM
> > +#@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM
> > +
> > +require conf/machine/j721s2-evm.conf
> > +
> > +UBOOT_MACHINE = "j721s2_hs_evm_a72_defconfig"
> > +
> > +UBOOT_ENTRYPOINT =       "0x80080000"
> > +UBOOT_LOADADDRESS =      "0x80080000"
> > +UBOOT_RD_LOADADDRESS =   "0x84000000"
> > +UBOOT_RD_ENTRYPOINT =    "0x84000000"
> > +UBOOT_DTB_LOADADDRESS =  "0x83000000"
> > +UBOOT_DTBO_LOADADDRESS = "0x83080000"
> > +UBOOT_DTBO_OFFSET =      "0x00010000"
> 
> Is there any way we can get rid of addresses from recipes?

These are addresses to be used inside FIT image for HS devices and they go 
into machine configs for each platform.

Are there sane defaults in U-boot? If so, we can drop these from generated FIT 
image .its file a let U-boot handle it?


> > +
> > +SPL_BINARY = "tispl.bin_HS"
> > +SPL_BINARYNAME = "tispl.bin"
> > +UBOOT_BINARY = "u-boot.img_HS"
> > +IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> > +
> > +TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> > -- 
> > 2.17.1
> > 

