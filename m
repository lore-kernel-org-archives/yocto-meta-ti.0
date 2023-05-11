Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27ABDC77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 19:50:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6599.1683834641240145816
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 12:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 45CD840C98;
	Thu, 11 May 2023 19:50:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uDSwKPYTI4Z7; Thu, 11 May 2023 19:50:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 177D440C81;
	Thu, 11 May 2023 19:50:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5B56B1638CA; Thu, 11 May 2023 15:49:54 -0400 (EDT)
Date: Thu, 11 May 2023 15:49:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH 2/2] trusted-firmware-a:
 only activate customizations for TI platforms
Message-ID: <20230511194954.GC9226@denix.org>
References: <20230511184301.1075335-1-denis@denix.org>
 <20230511184301.1075335-2-denis@denix.org>
 <9470a393-2241-bf48-41cf-77d14ec79ae7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9470a393-2241-bf48-41cf-77d14ec79ae7@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 19:50:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16522

Sorry about all that - I can resend everything specifically for kirkstone

On Thu, May 11, 2023 at 02:46:11PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> This does not apply against kirkstone cleanly because of a patch
> applied to the master recipe that is not in kirkstone.  I'll fix it
> as I apply the patch, but I wanted to inform anyone trying it
> themselves.
> 
> 
> On 5/11/2023 1:43 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >Avoid inheriting ti-secdev class and adding unconditional dependency
> >on TI_SECURE_DEV_PKG and other variables, when meta-ti-bsp is in the
> >bblayers.conf stack, but not building for TI platforms. This solves
> >yocto-check-layer signature test for Yocto Project compliance.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >  ...a_%.bbappend => trusted-firmware-a-ti.inc} |  0
> >  .../trusted-firmware-a_%.bbappend             | 72 +------------------
> >  2 files changed, 3 insertions(+), 69 deletions(-)
> >  copy meta-ti-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_%.bbappend => trusted-firmware-a-ti.inc} (100%)
> >
> >diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> >similarity index 100%
> >copy from meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> >copy to meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> >diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> >index 4ea63205..00d08a51 100644
> >--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> >+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> >@@ -1,70 +1,4 @@
> >-PV:k3 = "2.8+git${SRCPV}"
> >-SRCREV_tfa:k3 = "2fcd408bb3a6756767a43c073c597cef06e7f2d5"
> >-SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
> >-COMPATIBLE_MACHINE:k3 = "k3"
> >-TFA_BUILD_TARGET:k3 = "all"
> >-TFA_INSTALL_TARGET:k3 = "bl31"
> >-TFA_SPD:k3 = "opteed"
> >+TFA_TI = ""
> >+TFA_TI:k3 = "trusted-firmware-a-ti.inc"
> >-SRC_URI:append:k3 = " file://rwx-segments-ti.patch"
> >-FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
> >-
> >-# Use TI SECDEV for signing
> >-inherit ti-secdev
> >-
> >-EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
> >-EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
> >-
> >-# Signing procedure for K3 HS devices
> >-tfa_sign_k3hs() {
> >-	mv ${BUILD_DIR}/bl31.bin ${BUILD_DIR}/bl31.bin.unsigned
> >-	${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${BUILD_DIR}/bl31.bin.unsigned ${BUILD_DIR}/bl31.bin
> >-}
> >-
> >-do_compile:append:am65xx-hs-evm() {
> >-    tfa_sign_k3hs
> >-}
> >-
> >-do_compile:append:am64xx-evm() {
> >-    tfa_sign_k3hs
> >-}
> >-
> >-do_compile:append:am62xx-evm() {
> >-    tfa_sign_k3hs
> >-}
> >-
> >-do_compile:append:am62xx-lp-evm() {
> >-    tfa_sign_k3hs
> >-}
> >-
> >-do_compile:append:am62axx-evm() {
> >-    tfa_sign_k3hs
> >-}
> >-
> >-do_compile:append:j721e-hs-evm() {
> >-    tfa_sign_k3hs
> >-}
> >-
> >-do_compile:append:j7200-hs-evm() {
> >-    tfa_sign_k3hs
> >-}
> >-
> >-do_compile:append:j721s2-hs-evm() {
> >-    tfa_sign_k3hs
> >-}
> >-
> >-do_compile:append:j784s4-hs-evm() {
> >-    tfa_sign_k3hs
> >-}
> >-
> >-do_install:append:k3() {
> >-    if [ -f ${BUILD_DIR}/bl31.bin.unsigned ]; then
> >-        echo "Install bl31.bin.unsigned"
> >-        install -m 0644 ${BUILD_DIR}/bl31.bin.unsigned \
> >-        ${D}/firmware/bl31.bin.unsigned
> >-    else
> >-        echo "Install bl31.bin.unsigned"
> >-        install -m 0644 ${BUILD_DIR}/bl31.bin \
> >-        ${D}/firmware/bl31.bin.unsigned
> >-    fi
> >-}
> >+require ${TFA_TI}
> >
> >
> >
> >
> >
> 
> -- 
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16521): https://lists.yoctoproject.org/g/meta-ti/message/16521
> Mute This Topic: https://lists.yoctoproject.org/mt/98834090/3617104
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/6695352/3617104/1311934448/xyzzy [denis@denix.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

