Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69354C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 19:51:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.47990.1741636261191858883
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Mar 2025 12:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4DD7840C82;
	Mon, 10 Mar 2025 19:51:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B0gTxEU82B2b; Mon, 10 Mar 2025 19:51:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1C53740C61;
	Mon, 10 Mar 2025 19:50:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 413611642DE; Mon, 10 Mar 2025 15:50:56 -0400 (EDT)
Date: Mon, 10 Mar 2025 15:50:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: b-brnich@ti.com
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Darren Etheridge <detheridge@ti.com>
Subject: Re: [meta-ti] [scarthgap][PATCH 1/2] ti-bsp: ti-img-encode-decode:
 Add Recipe for Building VXE-VXD Out-of-Tree Module
Message-ID: <20250310195056.GR1879@denix.org>
References: <20250306203749.794759-1-b-brnich@ti.com>
 <182A59C7642211D5.31492@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <182A59C7642211D5.31492@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Mar 2025 19:51:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18364

On Thu, Mar 06, 2025 at 06:15:13PM -0500, Denys Dmytriyenko wrote:
> On Thu, Mar 06, 2025 at 02:37:48PM -0600, Brandon Brnich via lists.yoctoproject.org wrote:
> > During 10.0 LTS bringup, the decision was made that it would be the last LTS
> > that carried the IMG VXE and VXD driver in tree. Driver is now hosted on
> > git.ti.com. This recipe is responsible for pulling in the driver,
> > building it, and packaging it within the J721e SDK.
> > 
> > Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> > ---
> > 
> > This build was tested by changing the kernel to point towards latest
> > head that has relevant device tree changes and config options. Build is
> > successful with those changes and no warnings are present.
> > 
> >  .../ti-vxe-vxd-driver_6.12.bb                 | 23 +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100644 meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
> > 
> > diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
> > new file mode 100644
> > index 00000000..fa2d3792
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
> > @@ -0,0 +1,23 @@
> > +DESCRIPTION =  "Kernel drivers for the VXE384 and D5500 Video Accelerators found in the J721E TI SoC"
> 
> Shorter SUMMARY is missing?
> 
> 
> > +LICENSE = "GPL-2.0-only"
> > +LIC_FILES_CHKSUM = "file://README;beginline=11;endline=12;md5=ad10b552e357ac443ec5dd2e02912b1b"
> > +
> > +inherit module
> > +
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +
> > +COMPATIBLE_MACHINE = "j721e"
> > +
> > +DEPENDS += "virtual/kernel"
> > +
> > +BRANCH = "scarthgap/k${PV}"
> > +
> > +SRC_URI = "git://git.ti.com/multimedia/img-vxe-vxd.git;protocol=https;branch=${BRANCH}"

Also, SRC_URI is incorrect - should be git://git.ti.com/git/multimedia/... for 
https access (i.e. one level of /git/ is missing):

WARNING: ti-vxe-vxd-driver-6.12-r0 do_fetch: Failed to fetch URL git://git.ti.com/multimedia/img-vxe-vxd.git;protocol=https;branch=scarthgap/k6.12, attempting MIRRORS if available

Just do this to see other examples in meta-ti:

$ grep 'git://git.ti.com' * -r


> > +
> > +SRCREV = "99d063aa0ef53633057042570411b84bd967624b"
> > +
> > +TARGET_PRODUCT:j721e = "j721e_linux"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +EXTRA_OEMAKE += 'KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
> > -- 
> > 2.34.1

