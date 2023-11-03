Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BCBC4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:05:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.64190.1699041927316981168
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 13:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F239140CD3;
	Fri,  3 Nov 2023 20:05:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8njiXjGFSIEq; Fri,  3 Nov 2023 20:05:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 651BE40CC3;
	Fri,  3 Nov 2023 20:05:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BFEB9163D43; Fri,  3 Nov 2023 16:05:20 -0400 (EDT)
Date: Fri, 3 Nov 2023 16:05:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Massimiliano Minella <massimiliano.minella@gmail.com>,
	meta-ti@lists.yoctoproject.org,
	Massimiliano Minella <massimiliano.minella@se.com>
Subject: Re: [meta-ti] [kirkstone][PATCH] k3r5: Use the ?= default
 assignment to allow for overrides
Message-ID: <20231103200520.GN2408@denix.org>
References: <20231102104828.100681-1-massimiliano.minella@gmail.com>
 <20231103010853.GK2408@denix.org>
 <2e63846f-641d-42aa-b911-34445bd8fed6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e63846f-641d-42aa-b911-34445bd8fed6@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Nov 2023 20:05:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17237

On Fri, Nov 03, 2023 at 11:23:47AM -0500, Ryan Eatmon wrote:
> 
> 
> On 11/2/2023 8:08 PM, Denys Dmytriyenko wrote:
> >On Thu, Nov 02, 2023 at 11:48:28AM +0100, Massimiliano Minella wrote:
> >>From: Ryan Eatmon <reatmon@ti.com>
> >>
> >>Move to setting the values for PREFERRED_PROVIDER using the
> >>?= default assignment so that we can override the setting if
> >>we would like to.
> >>
> >>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
> >>---
> >>  meta-ti-bsp/conf/machine/include/k3r5.inc | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >>diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/machine/include/k3r5.inc
> >>index c5c03cbf..184d3a09 100644
> >>--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
> >>+++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
> >>@@ -11,9 +11,9 @@ require conf/machine/include/arm/armv7a/tune-cortexa8.inc
> >>  # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/j721e_evm.rst
> >>  # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/am62x_sk.rst
> >>  # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/k3.rst
> >>-PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
> >>-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
> >>-PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
> >>+PREFERRED_PROVIDER_virtual/kernel ?= "linux-dummy"
> >>+PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
> >>+PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
> >
> >Being able to override u-boot for k3r5 makes sense.
> >
> >But allowing to change the kernel for k3r5 multiconfig that is now marked as
> >baremetal is rather dubious...
> >
> >What kind of use-case requires it?
> 
> I think the the use case that I created the original patch for was
> the upstream testing.  We need to be able to change the kernel and
> uboot versions for the testing not having the ?= was causing issues.

Please note this is specifically for k3r5, a baremetal config, where 
kernel is "neutered" by setting it to "linux-dummy". There are tons of 
implicit dependencies deep inside the OE on the kernel and all its pieces, 
modules, packages, and supporting components, which linux-dummy cuts out, 
making it a NOP.

There's no reason to ever change it even for upstream builds and testing. 
Not allowing it to be changed is a safeguard of sorts.

And since it is now being requested for backporting by Massimiliano, hence 
my question about the use-case...


> And since this patch is on master and thus will be coming to the
> upcoming scarthgap branch shortly, I see no reason to not take it
> for kirkstone.
> 
> But if we want to rethink all of this, I'm not opposed.
> 
> >
> >>  SPL_SUFFIX = "bin"
> >>  SPL_BINARY = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${SPL_SUFFIX}"
> >>-- 
> >>2.42.0

