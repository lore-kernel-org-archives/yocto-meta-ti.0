Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BB9C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 21:58:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.7498.1676066323287405165
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 13:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5267140C13;
	Fri, 10 Feb 2023 21:58:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mz4LR18m5Xp8; Fri, 10 Feb 2023 21:58:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2032840BA8;
	Fri, 10 Feb 2023 21:58:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 89ED4163758; Fri, 10 Feb 2023 16:58:16 -0500 (EST)
Date: Fri, 10 Feb 2023 16:58:16 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/4] trusted-firmware-a: Use
 ti-k3-secdev if TI_SECURE_DEV_PKG_K3 is not defined
Message-ID: <20230210215816.GG22689@denix.org>
References: <20230208231031.16363-1-afd@ti.com>
 <20230210185139.GW22689@denix.org>
 <23124d98-58b3-1cfa-7f3d-8c286638d099@ti.com>
 <20230210190508.GZ22689@denix.org>
 <b359a2d1-99ea-06e5-ef8e-3523c75b9a14@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b359a2d1-99ea-06e5-ef8e-3523c75b9a14@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 21:58:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15810

On Fri, Feb 10, 2023 at 01:55:24PM -0600, Andrew Davis wrote:
> On 2/10/23 1:05 PM, Denys Dmytriyenko wrote:
> >On Fri, Feb 10, 2023 at 12:56:20PM -0600, Andrew Davis wrote:
> >>On 2/10/23 12:51 PM, Denys Dmytriyenko wrote:
> >>>On Wed, Feb 08, 2023 at 05:10:28PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> >>>>Use the new ti-k3-secdev package to pull in the signing tools if they are
> >>>>not provided by the environment. This allows us to use these tools
> >>>>unconditionally. Remove the checks for the script and do the signing
> >>>>for all K3 machines. The signature is automatically stripped from
> >>>>the binaries on non-HS devices at boot time as needed so this change
> >>>>is harmless for GP devices.
> >>>>
> >>>>Signed-off-by: Andrew Davis <afd@ti.com>
> >>>>---
> >>>>  .../trusted-firmware-a_%.bbappend             | 43 ++++++-------------
> >>>>  1 file changed, 12 insertions(+), 31 deletions(-)
> >>>>
> >>>>diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> >>>>index 5acc5c2e..95f1d2d9 100644
> >>>>--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> >>>>+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> >>>>@@ -6,39 +6,20 @@ TFA_BUILD_TARGET:k3 = "all"
> >>>>  TFA_INSTALL_TARGET:k3 = "bl31"
> >>>>  TFA_SPD:k3 = "opteed"
> >>>>+# Use default package TI SECDEV is one is not provided
> >>>
> >>>typo - *if* one is not provided
> >>>
> >>
> >>Good catch
> >>
> >>>
> >>>>+DEPENDS:append:k3 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
> >>>>+
> >>>>+# Set a default value for TI_K3_SECDEV_INSTALL_DIR
> >>>>+export TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
> >>>>+include recipes-ti/includes/ti-paths.inc
> >>>
> >>>If you set TI_K3_SECDEV_INSTALL_DIR explicitly, why do you need to include
> >>>ti-paths.inc here?
> >>>
> >>
> >>ti-paths.inc is part of meta-ti-extras which might not be included in one's layer stack.
> >>If not, this is a sane default, but ti-paths.inc can still override that path if available.
> >
> >No, we shouldn't be using ti-paths.inc here at all. The file was mostly used
> >by RTOS components back when they were built from sources. That is now only
> >used on some legacy platforms. Eventually it will be removed, no reason to
> >start using the file for K3 SECDEV. Just come up with the proper default
> >(something other than ${datadir}...) and be done with it, right?
> >
> 
> I'm thinking ${datadir} is the right spot, do you have another spot in mind?

Hmm, I don't oppose that heavily against ${datadir}... I guess if we were 
introducing SECDEV for the first time, I'd argue we should install scripts 
into ${bindir} and everything else into ${datadir} or something more FHS 
complieant? But I guess in order to keep the legacy setup of TI_SECURE_DEV_PKG 
passed through environment working as is, changing directory structure is out 
of the question now.

-- 
Denys

