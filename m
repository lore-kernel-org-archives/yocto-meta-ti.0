Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF87C77B7D
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 17:33:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1838.1684431206377643355
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 May 2023 10:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2F07540C5D;
	Thu, 18 May 2023 17:33:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kh8s0zN8w-hX; Thu, 18 May 2023 17:33:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E543D40C21;
	Thu, 18 May 2023 17:33:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 515D81638E4; Thu, 18 May 2023 13:32:36 -0400 (EDT)
Date: Thu, 18 May 2023 13:32:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: reatmon@ti.com, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][kirkstone][PATCH v2 2/2] linux-ti-staging: Use
 vendored kernel-devicetree.bbclass
Message-ID: <20230518173236.GQ9226@denix.org>
References: <20230518161519.16296-1-reatmon@ti.com>
 <20230518161519.16296-2-reatmon@ti.com>
 <f1a79a5e-f52a-7aab-8959-a776febc0e8e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1a79a5e-f52a-7aab-8959-a776febc0e8e@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 May 2023 17:33:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16560

On Thu, May 18, 2023 at 12:25:43PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> On 5/18/23 11:15 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >Change over to using the kernel_devicetree_vendor_dtb.bbclass to have
> >the DTBs installed into the same vendored subdirectory that is in the
> >kernel.
> >
> >Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >---
> >v2: - Fixed syntax of "1"
> >     - Fixed name of custom kernel class to match the other patch.
> >
> >  meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> >diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> >index cdee548f..7c992ac5 100644
> >--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> >+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> >@@ -3,7 +3,7 @@ SUMMARY = "Linux kernel for TI devices"
> >  LICENSE = "GPL-2.0-only"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> >-inherit kernel
> >+inherit kernel_vendor_dtb
> >  require recipes-kernel/linux/setup-defconfig.inc
> >  require recipes-kernel/linux/kernel-rdepends.inc
> >@@ -18,6 +18,9 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
> >  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
> >  		      ${EXTRA_DTC_ARGS}"
> >+KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtbs"
> >+KERNEL_DTBVENDORED = "1"
> >+
> 
> We will want this for all kernels, not just ti-6.1, is there a more
> common place to put these defines so we get the same for -next and
> -mainline too?

Only ti-kernel.inc is also included by -mainline and -next.

-- 
Denys

