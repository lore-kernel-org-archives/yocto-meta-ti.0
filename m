Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752EAEB64DA
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 14:11:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.19526.1686838271145761728
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 07:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 28CFB40C2E;
	Thu, 15 Jun 2023 14:11:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mHm7jgrpl53z; Thu, 15 Jun 2023 14:11:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8C35640A2F;
	Thu, 15 Jun 2023 14:10:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A596D163A6A; Thu, 15 Jun 2023 10:10:55 -0400 (EDT)
Date: Thu, 15 Jun 2023 10:10:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Devarsh Thakkar <devarsht@ti.com>, meta-ti@lists.yoctoproject.org,
	praneeth@ti.com, denys@konsulko.com, nm@ti.com, vigneshr@ti.com,
	a-bhatia1@ti.com, j-luthra@ti.com, khasim@ti.com, nsekhar@ti.com,
	afd@ti.com, rs@ti.com, n-jain1@ti.com
Subject: Re: [meta-ti] [kirkstone] [PATCH v2 1/2]
 u-boot-ti-staging_2023.04: Copy bitmap file to boot partition for AM62x
Message-ID: <20230615141055.GB1518@denix.org>
References: <20230614143306.1502763-1-devarsht@ti.com>
 <20230614143306.1502763-2-devarsht@ti.com>
 <77b8b5bb-4c33-bfb9-3eab-0c73734b8638@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77b8b5bb-4c33-bfb9-3eab-0c73734b8638@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Jun 2023 14:11:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16733

On Thu, Jun 15, 2023 at 08:36:36AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 6/14/2023 9:33 AM, Devarsh Thakkar wrote:
> >Early splash screen support for AM62x has been enabled in u-boot
> >and it requires bitmap tarball to be present in boot partition
> >as per the default environment settings done in u-boot [1].
> >
> >Copy the ti logo bitmap tarball to boot partition of wic image in order
> >to enable out of box early display on AM62x.
> >
> >[1] https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62x/am62x.env
> >
> >Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> >---
> >V2: Rename ti logo tarball as per suggested changes (same is being
> >     done in ti-u-boot too)
> >---
> >  .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb      | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> >diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> >index e6da84cb..c948e1ed 100644
> >--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> >+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> >@@ -8,3 +8,12 @@ BRANCH = "ti-u-boot-2023.04"
> >  SRCREV = "1f510931dcc90e6f28f7fed757ad5000d4382e22"
> >+do_install:append:am62xx() {
> >+	install -d ${D}/boot
> >+	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
> >+}
> >+
> >+do_deploy:append:am62xx() {
> >+	install -d ${DEPLOYDIR}
> >+	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
> >+}
> 
> 
> Denys,
> 
> In the longer term, should this be in the u-boot.inc file and not in
> the recipe itself?  That's were all of the other do_* appends are...

In the longer term I was going to ask if this logo should be enabled for 
all TI platforms, instead of just am62x?

-- 
Denys

