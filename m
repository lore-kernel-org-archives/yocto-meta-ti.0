Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972FDC636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 19:47:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3102.1677095228349942318
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 11:47:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BC9E640C2E;
	Wed, 22 Feb 2023 19:47:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BAC0ICryinB5; Wed, 22 Feb 2023 19:47:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9714240AC9;
	Wed, 22 Feb 2023 19:47:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C7F3F163764; Wed, 22 Feb 2023 14:46:40 -0500 (EST)
Date: Wed, 22 Feb 2023 14:46:40 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH] ti-linux-fw: update to the
 latest
Message-ID: <20230222194640.GH22689@denix.org>
References: <20230221212943.19511-1-afd@ti.com>
 <1745F4DF785F96CD.676@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1745F4DF785F96CD.676@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 19:47:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15922

On Tue, Feb 21, 2023 at 04:40:48PM -0500, Denys Dmytriyenko wrote:
> On Tue, Feb 21, 2023 at 03:29:43PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> > While here update FW versions and remove those no longer used.
> 
> Thanks! I believe it should take care of those race conditions in the imggen.

Tested this patch together with Andrew's 15-patch v2 series and it sure helped 
with the race!


> > Signed-off-by: Andrew Davis <afd@ti.com>
> 
> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> > ---
> >  .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc      | 16 ++++++----------
> >  1 file changed, 6 insertions(+), 10 deletions(-)
> > 
> > diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> > index 0b2e8bd6..74c26707 100644
> > --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> > +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> > @@ -4,28 +4,24 @@ LICENSE = "TI-TFL"
> >  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> >  
> >  PV = "2022.01"
> > -INC_PR = "r3"
> > +INC_PR = "r4"
> >  
> >  # Firmware versions
> >  CORESDK_RTOS_VERSION = "08.02.00.04"
> > -SERDES_FW_VERSION = "3.3.0.2c"
> > -NETCP_SA_FW_VERSION = "1.0.0"
> > -NETCP_PA_FW_VERSION = "3.0.2.3"
> > -QMSS_PDSP_FW_VERSION = "1.0.0.9"
> >  PRUETH_FW_AM65X_VERSION = "08.00.00.20"
> > -PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.07"
> > +PRUETH_FW_AM65X_SR2_VERSION = "02.02.11.02"
> >  GOODIX_FW_VERSION = "1.0.0.0"
> > -CADENCE_MHDP_FW_VERSION = "1.2.17"
> > +CADENCE_MHDP_FW_VERSION = "2.1.0"
> >  IMG_DEC_FW_VERSION = "1.0"
> >  CNM_WAVE521_FW_VERSION = "1.0.00"
> > -TIFS_LPM_STUB_FW_VERSION = "08.03.02"
> > +TIFS_LPM_STUB_FW_VERSION = "08.06.04"
> >  
> > -TI_LINUX_FW_SRCREV ?= "7875237b357ecf27300658e65e9927cef7e299ed"
> > +TI_LINUX_FW_SRCREV ?= "340194800a581baf976360386dfc7b5acab8d948"
> >  SRCREV = "${TI_LINUX_FW_SRCREV}"
> >  
> >  BRANCH ?= "ti-linux-firmware"
> >  
> > -K3_IMAGE_GEN_SRCREV ?= "a9a43d5effcd17b4f3364cc7e6d483abd7f56e0f"
> > +K3_IMAGE_GEN_SRCREV ?= "ffae8800a5c81c149835ed1aa5e2fbbe65a49c0d"
> >  SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
> >  SRCREV_FORMAT = "imggen"
> >  
> > -- 
> > 2.39.1

