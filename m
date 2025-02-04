Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9CDC02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 19:16:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.125345.1738696611301765984
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 11:16:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BB6DF40C88;
	Tue,  4 Feb 2025 19:16:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BUD3hEr-pDZe; Tue,  4 Feb 2025 19:16:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8EC66407E5;
	Tue,  4 Feb 2025 19:16:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 470F0164201; Tue,  4 Feb 2025 14:16:47 -0500 (EST)
Date: Tue, 4 Feb 2025 14:16:47 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: c-shilwant@ti.com, meta-ti@lists.yoctoproject.org,
	Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH 1/3] trusted-firmware-a:
 Switch TFA to TI fork
Message-ID: <20250204191647.GJ21608@denix.org>
References: <20250204134925.968150-1-c-shilwant@ti.com>
 <20250204134925.968150-2-c-shilwant@ti.com>
 <11d39f7d-7b08-42e0-87a5-0b4380859706@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11d39f7d-7b08-42e0-87a5-0b4380859706@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Feb 2025 19:16:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18267

On Tue, Feb 04, 2025 at 10:25:14AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> On 2/4/25 7:49 AM, Chirag Shilwant via lists.yoctoproject.org wrote:
> >- While TFA patches for K3-based AM62L platform are under
> >review upstream, temporarily switch to TI's GitHub fork
> >for all K3 platforms to prevent disruptions and ensure timely bringup
> >
> >- Also update the PV & LIC_FILES_CHKSUM as well
> 
> The license change isn't something we did as part of our fork ti-atf.
> Maybe you could split this into two to make that clear,
> 
>  * Update to upstream 2.12 + license fix
>  * Patch that only deals with switching to ti-atf.

Andrew,

Any downside to switching from upstream tfa to ti-tfa?

Is the only change to support non-R5 platform and won't affect other K3 
devices?


> >Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> >---
> >  .../trusted-firmware-a/trusted-firmware-a-ti.inc         | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> >diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> >index ebb13bbd..e4a9c49b 100644
> >--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> >+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> >@@ -1,7 +1,8 @@
> >-PV:k3 = "2.11+git"
> >-SRCREV_tfa:k3 = "58b25570c9ef91753b14c2103f45f4be9dddb696"
> >-LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=83b7626b8c7a37263c6a58af8d19bee1"
> >-SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
> >+PV:k3 = "2.12+git"
> >+SRCREV_tfa:k3 = "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
> >+LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
> >+SRC_URI:k3 = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https;name=tfa;branch=ti-master"
> >+
> >  COMPATIBLE_MACHINE:k3 = "k3"
> >  TFA_BUILD_TARGET:k3 = "all"
> >  TFA_INSTALL_TARGET:k3 = "bl31"

