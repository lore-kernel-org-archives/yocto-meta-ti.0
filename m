Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FE8C25B46
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 19:04:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.129816.1698087833187357407
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 12:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 64D1140CD0;
	Mon, 23 Oct 2023 19:03:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_8VnVa0zlxQ; Mon, 23 Oct 2023 19:03:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 36F0340CCA;
	Mon, 23 Oct 2023 19:03:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3A266163D10; Mon, 23 Oct 2023 15:03:49 -0400 (EDT)
Date: Mon, 23 Oct 2023 15:03:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH 5/5] conf: beagle*:
 recommend essential FW images for Beagle devices
Message-ID: <20231023190349.GV2408@denix.org>
References: <20231020204458.546852-1-denis@denix.org>
 <20231020204458.546852-5-denis@denix.org>
 <190bcd54-29fd-4c2c-a39e-18e7fe42c4bd@ti.com>
 <20231023165614.GR2408@denix.org>
 <840ea77f-0e90-4422-afb8-07d3a4123eb0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <840ea77f-0e90-4422-afb8-07d3a4123eb0@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Oct 2023 19:04:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17178

On Mon, Oct 23, 2023 at 12:18:18PM -0500, Andrew Davis wrote:
> On 10/23/23 11:56 AM, Denys Dmytriyenko wrote:
> >On Mon, Oct 23, 2023 at 10:50:43AM -0500, Andrew Davis wrote:
> >>On 10/20/23 3:44 PM, Denys Dmytriyenko wrote:
> >>>From: Denys Dmytriyenko <denys@konsulko.com>
> >>>
> >>>Set MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS per platform to list recommended
> >>>essential FW images to be added to rootfs by default.
> >>>
> >>>Correct beagle-x15 to pull devicetrees and kernel image as well.
> >>>
> >>
> >>Would it be better to have the bb.org kernel pull in `kernel-rdepends.inc` like
> >>the other kernels and get all these RDEPENDS/RRECOMMENDS from that?
> >
> >No, I was actually working on the opposite - moving those to corresponding
> >machine/SoC configs and removing kernel-rdepends.inc
> >
> >MACHINE_ESSENTIAL_EXTRA_RDEPENDS and MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS are
> >a proper way to express such dependencies for things like FW images to be
> >pulled into an image, instead of making kernel RDEPENDS on them. And it is
> >not specific to a particular kernel, so you don't need to keep including that
> >kernel-rdepends.inc from every kernel recipe.
> >
> 
> If you are going to do it this way for all platforms, then you should
> be able to do this in the machine/include/*.inc files vs out here
> in each and every machine.

Yes, that's what I said above - "corresponding machine/SoC configs".
See the RFC patch I just sent to the list a bit earlier.


> So my question would be, if this is the right
> direction, why only the Beagle plats in this patch?

The main reason was Ravi's multiple revisions trying to remove PRU Eth 
firmware images from kernel-rdepends.inc - didn't want to step over that and 
require even more iterations... Now that it is dropped, this is no longer a 
blocker.


> >>>Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >>>---
> >>>  meta-ti-bsp/conf/machine/beagle-x15.conf      | 2 ++
> >>>  meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 3 +++
> >>>  meta-ti-bsp/conf/machine/beaglebone.conf      | 2 ++
> >>>  meta-ti-bsp/conf/machine/beagleplay.conf      | 3 +++
> >>>  4 files changed, 10 insertions(+)
> >>>
> >>>diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
> >>>index be27705c..3b857165 100644
> >>>--- a/meta-ti-bsp/conf/machine/beagle-x15.conf
> >>>+++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
> >>>@@ -19,3 +19,5 @@ MACHINE_GUI_CLASS = "bigscreen"
> >>>  SERIAL_CONSOLES = "115200;ttyS2"
> >>>  UBOOT_MACHINE = "am57xx_evm_config"
> >>>+
> >>>+MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-zimage"
> >>>diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> >>>index 2f9c7288..3f5a027e 100644
> >>>--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> >>>+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> >>>@@ -24,4 +24,7 @@ ti/k3-j721e-sk.dtb \
> >>>  "
> >>>  MACHINE_GUI_CLASS = "bigscreen"
> >>>+
> >>>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-image"
> >>>+
> >>>+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw vxd-dec-fw"
> >>>diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/machine/beaglebone.conf
> >>>index 2d811d0d..45944ce8 100644
> >>>--- a/meta-ti-bsp/conf/machine/beaglebone.conf
> >>>+++ b/meta-ti-bsp/conf/machine/beaglebone.conf
> >>>@@ -23,3 +23,5 @@ MACHINE_FEATURES += "screen"
> >>>  SERIAL_CONSOLES = "115200;ttyS0"
> >>>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-zimage"
> >>>+
> >>>+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "amx3-cm3"
> >>>diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
> >>>index 6a0f697f..4dd550a1 100644
> >>>--- a/meta-ti-bsp/conf/machine/beagleplay.conf
> >>>+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
> >>>@@ -42,4 +42,7 @@ ti/k3-am625-sk-rpi-hdr-pwm.dtbo \
> >>>  "
> >>>  MACHINE_GUI_CLASS = "bigscreen"
> >>>+
> >>>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-image"
> >>>+
> >>>+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += ""

