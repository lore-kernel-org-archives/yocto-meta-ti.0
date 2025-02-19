Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36334C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 22:53:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.36661.1740005610304059455
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Feb 2025 14:53:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4A633411EB;
	Wed, 19 Feb 2025 22:53:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id reKBtpGD56lw; Wed, 19 Feb 2025 22:53:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 23CDD40DD4;
	Wed, 19 Feb 2025 22:53:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 85AA016426E; Wed, 19 Feb 2025 17:53:26 -0500 (EST)
Date: Wed, 19 Feb 2025 17:53:26 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master/scarthgap][PATCH] trusted-firmware-a:
 simplify TI customizations
Message-ID: <20250219225326.GA1879@denix.org>
References: <20250219214801.2239589-1-denis@denix.org>
 <d486a357-8b00-4399-ad57-03007591743a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d486a357-8b00-4399-ad57-03007591743a@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Feb 2025 22:53:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18329

On Wed, Feb 19, 2025 at 04:23:55PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 2/19/2025 3:48 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >The original .bbappend started with just a few customizations behind
> >a :k3 SoC override, but eventually grew in size. It got converted into
> >a .inc file, which is behind the same SoC override and hence it gets
> >included by .bbappend only for K3 platforms:
> >https://git.yoctoproject.org/meta-ti/commit/?id=389f9a8b726868768a8bed6cbe0b2a1f18c05410
> >
> >It doesn't make sense to use the same :k3 override inside this .inc
> >file for every variable. Moreover, it makes it harder to change
> >those variables downstream for any derivative platform or even for
> >upstream testing.
> >
> >This change drops redundant :k3 SoC overrides, w/o changing existing
> >behavior. It allows easier modifications of such customizations from
> >downstream layers or a local.conf, e.g. SRC_URI_TRUSTED_FIRMWARE_A
> >
> >Note that SRC_URI is set exactly the same as in upstream base .inc
> >file, but version-specific recipes in meta-arm tend to add extra
> >patches directly to SRC_URI, which is undesirable here. Thus, reset
> >SRC_URI back to its default.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >  .../trusted-firmware-a-ti.inc                 | 26 ++++++++++++-------
> >  1 file changed, 16 insertions(+), 10 deletions(-)
> >
> >diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> >index 9971e960..21aef489 100644
> >--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> >+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> >@@ -1,14 +1,20 @@
> >-PV:k3 = "2.12+git"
> >-SRCREV_tfa:k3 = "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
> >-LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
> >-SRC_URI:k3 = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https;name=tfa;branch=ti-master"
> >-COMPATIBLE_MACHINE:k3 = "k3"
> >-TFA_BUILD_TARGET:k3 = "all"
> >-TFA_INSTALL_TARGET:k3 = "bl31"
> >-TFA_SPD:k3 = "opteed"
> >+# NOTE: This .inc file with customizations only gets included for K3 platforms
> >+
> >+PV = "2.12+git"
> >+SRCREV_tfa = "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
> >+SRC_URI_TRUSTED_FIRMWARE_A = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
> >+SRCBRANCH = "ti-master"
> >+SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH}"
> 
> I think this is already the value of SRC_URI from the main recipe...
> so we shouldn't need to override it here if we are redefining the
> SRC_URI_TRUSTED_FIRMWARE_A variable.

It was actually explained in the commit log above...


> >+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
> >+COMPATIBLE_MACHINE = "k3"
> >+
> >+TFA_BUILD_TARGET = "all"
> >+TFA_INSTALL_TARGET = "bl31"
> >+TFA_SPD = "opteed"
> >  # For am62lxx, install bl1 & bl31 using TFA_INSTALL_TARGET
> >  TFA_INSTALL_TARGET:am62lxx = "bl31 bl1"
> >-EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
> >-EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
> >+EXTRA_OEMAKE += "${@ 'K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
> >+EXTRA_OEMAKE += "${@ 'K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"

