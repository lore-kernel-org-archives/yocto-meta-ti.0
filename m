Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA56C77B7F
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 19:38:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.33893.1683920292309491175
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 May 2023 12:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9307540C81;
	Fri, 12 May 2023 19:38:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DFhMXoF4ZFxz; Fri, 12 May 2023 19:38:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5F05340A77;
	Fri, 12 May 2023 19:38:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3E9C11638C9; Fri, 12 May 2023 15:37:25 -0400 (EDT)
Date: Fri, 12 May 2023 15:37:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Randolph Sapp <rs@ti.com>
Cc: meta-ti@lists.yoctoproject.org, afd@ti.com,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [EXTERNAL] [master/kirkstone][PATCH] mesa-pvr: convert
 bbappend into standalone alternative provider
Message-ID: <20230512193725.GG9226@denix.org>
References: <20230511184049.1074923-1-denis@denix.org>
 <c4eda7bb-d42d-e3e8-b936-306b2ce5e525@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4eda7bb-d42d-e3e8-b936-306b2ce5e525@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 May 2023 19:38:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16530

On Fri, May 12, 2023 at 01:17:38PM -0500, Randolph Sapp wrote:
> On 5/11/23 13:40, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >There are some unobvious issues with adding PVR support to Mesa
> >via a bbappend:
> >
> >1. We need to mark mesa package as machine-specific, due to
> >differences in builds between SGX, Rogue and software-rendering
> >
> >2. We also need to then mark mesa package as providing safe
> >ABIs (EGL/GLES/GBM) in order for all generic dependent packages
> >to not be treated as machine-specific, allowing their re-use
> >across different machines of the same architecture
> >
> >But doing the above alters the upstream mesa package and changes
> >its signatures even when not building for TI platforms, which is
> >a Yocto Project compliance violation.
> >
> >In order to resolve this issue, convert Mesa bbappend, that adds
> >PVR support, into its own standalone alternative provider, called
> >mesa-pvr and allow selecting it with PREFERRED_PROVIDER settings.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >  meta-ti-bsp/conf/layer.conf                            |  2 +-
> >  meta-ti-bsp/conf/machine/beagleplay.conf               |  1 +
> >  meta-ti-bsp/conf/machine/include/am62xx.inc            |  1 +
> >  meta-ti-bsp/conf/machine/include/am65xx.inc            |  1 +
> >  meta-ti-bsp/conf/machine/include/j721e.inc             |  1 +
> >  meta-ti-bsp/conf/machine/include/j721s2.inc            |  1 +
> >  meta-ti-bsp/conf/machine/include/j784s4.inc            |  1 +
> >  meta-ti-bsp/conf/machine/include/mesa-pvr.inc          |  8 ++++++++
> >  meta-ti-bsp/conf/machine/include/omap-a15.inc          |  1 +
> >  meta-ti-bsp/conf/machine/include/ti33x.inc             |  1 +
> >  meta-ti-bsp/conf/machine/include/ti43x.inc             |  1 +
> >  .../recipes-graphics/mesa/mesa-gl_23.%.bbappend        |  1 -
> >  .../mesa/{pvr-mesa.inc => mesa-pvr_22.3.5.bb}          | 10 ++++++----
> >  meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend   |  1 -
> >  14 files changed, 24 insertions(+), 7 deletions(-)
> >  create mode 100644 meta-ti-bsp/conf/machine/include/mesa-pvr.inc
> >  delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
> >  rename meta-ti-bsp/recipes-graphics/mesa/{pvr-mesa.inc => mesa-pvr_22.3.5.bb} (88%)
> >  delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend
> >
> >diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> >index 5520c7c2..bb286c2b 100644
> >--- a/meta-ti-bsp/conf/layer.conf
> >+++ b/meta-ti-bsp/conf/layer.conf
> >@@ -19,7 +19,7 @@ LAYERDEPENDS_meta-ti-bsp = " \
> >  "
> >  SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> >-    mesa \
> >+    mesa-pvr \
> >  "
> >  HOSTTOOLS_NONFATAL += "truncate xxd comm"
> >diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
> >index e8d25cd9..c7b1414a 100644
> >--- a/meta-ti-bsp/conf/machine/beagleplay.conf
> >+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
> >@@ -10,6 +10,7 @@ MACHINE_FEATURES += "screen gpu"
> >  SERIAL_CONSOLES = "115200;ttyS2"
> >  SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >+require conf/machine/include/mesa-pvr.inc
> >  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> >  TFA_BOARD = "lite"
> >diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
> >index 623d90eb..c4582c13 100644
> >--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
> >+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
> >@@ -3,6 +3,7 @@ SOC_FAMILY:append = ":am62xx"
> >  MACHINE_FEATURES += "screen gpu"
> >+require conf/machine/include/mesa-pvr.inc
> >  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> >  # Default tiboot3.bin on AM62x is for HS-FS
> >diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
> >index 9fe851f4..9cbce243 100644
> >--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
> >+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
> >@@ -3,6 +3,7 @@ SOC_FAMILY:append = ":am65xx"
> >  MACHINE_FEATURES += "screen touchscreen gpu"
> >+require conf/machine/include/mesa-pvr.inc
> >  PREFERRED_PROVIDER_virtual/gpudriver ?= ""
> >  KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
> >diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
> >index 5e325ffe..f707cf26 100644
> >--- a/meta-ti-bsp/conf/machine/include/j721e.inc
> >+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> >@@ -3,6 +3,7 @@ SOC_FAMILY:append = ":j721e"
> >  MACHINE_FEATURES += "screen gpu"
> >+require conf/machine/include/mesa-pvr.inc
> >  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> >  # On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
> >diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
> >index 70569a16..98cc611f 100644
> >--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
> >+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
> >@@ -3,6 +3,7 @@ SOC_FAMILY:append = ":j721s2"
> >  MACHINE_FEATURES += "screen gpu"
> >+require conf/machine/include/mesa-pvr.inc
> >  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> >  TFA_BOARD = "generic"
> >diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
> >index d03ee4a4..de207687 100644
> >--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
> >+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
> >@@ -3,6 +3,7 @@ SOC_FAMILY:append = ":j784s4"
> >  MACHINE_FEATURES += "screen gpu"
> >+require conf/machine/include/mesa-pvr.inc
> >  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> >  TFA_BOARD = "j784s4"
> >diff --git a/meta-ti-bsp/conf/machine/include/mesa-pvr.inc b/meta-ti-bsp/conf/machine/include/mesa-pvr.inc
> >new file mode 100644
> >index 00000000..d5581315
> >--- /dev/null
> >+++ b/meta-ti-bsp/conf/machine/include/mesa-pvr.inc
> >@@ -0,0 +1,8 @@
> >+PREFERRED_PROVIDER_virtual/mesa ?= "mesa-pvr"
> >+PREFERRED_PROVIDER_virtual/egl ?= "mesa-pvr"
> >+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-pvr"
> >+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-pvr"
> >+PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa-pvr"
> >+PREFERRED_PROVIDER_virtual/libgbm ?= "mesa-pvr"
> >+PREFERRED_PROVIDER_virtual/libglx ?= "mesa-pvr"
> >+PREFERRED_PROVIDER_virtual/libgl ?= "mesa-pvr"
> 
> [snip]
> 
> I'm concerned a potential version drift between mesa-native packages
> and mesa-target packages in this configuration, but otherwise this
> doesn't appear to cause any issues with target packages or
> dependency chains at the moment.

I have also successfully tested with these extra 2 lines:

PREFERRED_PROVIDER_virtual/libgl-native ?= "mesa-pvr-native"
PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa-pvr"

We can add them back into conf/machine/include/mesa-pvr.inc

-- 
Denys

