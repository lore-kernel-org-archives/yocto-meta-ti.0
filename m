Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21B7C636D4
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 21:50:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.7280.1676065828882370780
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 13:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D667440C13;
	Fri, 10 Feb 2023 21:50:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id albEAIbMjvt0; Fri, 10 Feb 2023 21:50:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A702640BA8;
	Fri, 10 Feb 2023 21:50:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 18D44163758; Fri, 10 Feb 2023 16:50:02 -0500 (EST)
Date: Fri, 10 Feb 2023 16:50:02 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/8] ti-rtos-firmware: Use
 ti-k3-secdev if TI_SECURE_DEV_PKG_K3 not defined
Message-ID: <20230210215002.GF22689@denix.org>
References: <20230207234239.30720-1-afd@ti.com>
 <20230210210203.GC22689@denix.org>
 <75bfdf24-ad9c-f778-0eb0-ea119c8c6917@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75bfdf24-ad9c-f778-0eb0-ea119c8c6917@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 21:50:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15809

On Fri, Feb 10, 2023 at 03:13:15PM -0600, Andrew Davis wrote:
> On 2/10/23 3:02 PM, Denys Dmytriyenko wrote:
> >On Tue, Feb 07, 2023 at 05:42:32PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> >>Use ti-k3-secdev native package to provide secure-binary-image.sh script
> >>when it is not passed on as an environment variable. This fixes and issue
> >
> >Fixes *an* issue
> >
> 
> ACK
> 
> >
> >>with AM64xx which is always HS but should not require TI_SECURE_DEV_PKG
> >>when building for HS-FS platforms.
> >
> >And GP?
> >
> 
> AM64 is HS-FS only :)

Don't we also have GP variant of AM64 covered in the configs?


> But yes, this fixes GP building too. Will add to the message.
> 
> >
> >>
> >>Signed-off-by: Andrew Davis <afd@ti.com>
> >>---
> >>  meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 9 ++++-----
> >>  1 file changed, 4 insertions(+), 5 deletions(-)
> >>
> >>diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> >>index 9a6da088..6c59b8ab 100644
> >>--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> >>+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> >>@@ -31,9 +31,11 @@ CLEANBROKEN = "1"
> >>  PR = "${INC_PR}.0"
> >>  # Secure Build
> >>+include recipes-ti/includes/ti-paths.inc
> >
> >Set TI_K3_SECDEV_INSTALL_DIR here instead of including ti-paths.inc?
> >
> 
> Sure, and if we really do not like this include I can drop it everywhere
> in the next spin.

Would be nice, thank you!


> >>  DEPENDS += "openssl-native"
> >>-
> >>-TI_SECURE_DEV_PKG ?= ""
> >>+DEPENDS:append = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
> >
> >Should probably use DEPENDS += here instead of a generic :append override.
> >As :append and :remove are almost impossible to fight/override downstream,
> >it is recommended to use += whenever possible, like in this case...
> >
> 
> I'm never really sure which is right, the docs all seem to say to use
> :append/:remove when possible, but I can see it being a pain to override later..

Hmm, can you point to such instances? That needs to get fixed...

In general, using :append/:remove is justifiable when used with another 
override, like VAR:append:k3 and such. Because you shouldn't mix += and 
an override.

The biggest obvious and documented difference between += and :append is that 
the first adds a whitespace and the other does not. BTW, there's .= that 
behaves like += but does not add a whitespace:
https://docs.yoctoproject.org/bitbake/2.2/bitbake-user-manual/bitbake-user-manual-metadata.html#appending-and-prepending-with-spaces
https://docs.yoctoproject.org/bitbake/2.2/bitbake-user-manual/bitbake-user-manual-metadata.html#appending-and-prepending-without-spaces

But the issue comes from the fact that :append and :remove are just special 
cases of regular overrides and get collected and processed at the very end of 
the parsing process (unlike += and .= which are processed on the spot). 
There's no implied order of the overrides, unfortunately...


> >>+TI_SECURE_DEV_PKG = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
> >>+export TI_SECURE_DEV_PKG
> >>  RTOS_ETH_FW_DIR = "${S}/ti-eth/${PLAT_SFX}"
> >>  RTOS_DM_FW_DIR = "${S}/ti-dm/${PLAT_SFX}"
> >>@@ -49,7 +51,6 @@ DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
> >>  # J721e HS support
> >>  do_install:prepend:j721e-hs-evm() {
> >>-        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> >>          ( cd ${RTOS_DM_FW_DIR}; \
> >>                  mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
> >>                  ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> >>@@ -80,7 +81,6 @@ do_install:prepend:j721e-hs-evm() {
> >>  # J7200 HS support
> >>  do_install:prepend:j7200-hs-evm() {
> >>-        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> >>          ( cd ${RTOS_DM_FW_DIR}; \
> >>                  mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
> >>                  ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> >>@@ -101,7 +101,6 @@ do_install:prepend:j7200-hs-evm() {
> >>  # J721s2 HS support
> >>  do_install:prepend:j721s2-hs-evm() {
> >>-        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> >>          ( cd ${RTOS_DM_FW_DIR}; \
> >>                  mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
> >>                  ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> >>-- 
> >>2.39.1

