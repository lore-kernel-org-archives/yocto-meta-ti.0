Return-Path: <s-vadapalli@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5BFC2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 04:06:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.5277.1720497970654827365
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Jul 2024 21:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TmEa4iLh;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: s-vadapalli@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 469469iE111286;
	Mon, 8 Jul 2024 23:06:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720497969;
	bh=N/ukM+MuaysNsl66o4MCWPUIxuV72nd2mVb6A9ED9jA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TmEa4iLhh/3wlxqlHNpzMWf3jDC7UlnQsFkV/+L+puS3zPYeuJHi4LUZ94zfvi17c
	 DSvJlkcwu+3tQ0L/H2pS8jDM1GCbPpw27Ipawaz8c3WmIa6SqXrbzlM/r8TVq0N0eD
	 DA5FGH2bwhEDwQ+D7jnMDdTZMHIvd3KCSy08VwJg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 469469tu065194
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jul 2024 23:06:09 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jul 2024 23:06:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jul 2024 23:06:08 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 469467QH063566;
	Mon, 8 Jul 2024 23:06:08 -0500
Date: Tue, 9 Jul 2024 09:36:07 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <praneeth@ti.com>,
        <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <c-shilwant@ti.com>, <vigneshr@ti.com>, <danishanwar@ti.com>,
        <srk@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH v3] conf: machine:
 am62*-evm-k3r5.conf: apply fragment for enabling USB DFU
Message-ID: <297d188e-1904-4c4f-9e2f-a4b13a0eb367@ti.com>
References: <20240708123653.2200919-1-s-vadapalli@ti.com>
 <390e677c-5027-4d0b-bf7c-78664ea12d88@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <390e677c-5027-4d0b-bf7c-78664ea12d88@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jul 2024 04:06:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17835

On Mon, Jul 08, 2024 at 09:04:43AM -0500, Ryan Eatmon wrote:
> 
> 
> On 7/8/2024 7:36 AM, Siddharth Vadapalli wrote:

[...]

> > diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
> > index 2af3317e..5ba8c27e 100644
> > --- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
> > +++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
> > @@ -9,3 +9,4 @@ SYSFW_CONFIG = "evm"
> >   SYSFW_SUFFIX = "hs-fs"
> >   UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
> > +UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
> 
> This will not work with the new BSP system we have in meta-ti.  Since we are
> trying to have support for multiple kernel/uboot/graphics combinations we
> need to be aware of which of those other combinations that are present in
> the BSP file will or wont work with the setting we are trying to do.
> 
> In this case, I see am62x_r5_usbdfu.config in ti-u-boot-2024.04 and in
> upstream, but I do not see it in ti-u-boot-2023.04.  So the correct setting
> here would be:
> 
> UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
> UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = ""

So I have to set "bsp-ti-6_1" to the empty string to indicate that the
CONFIG_FRAGMENT is not applicable to it. I wasn't aware of this. Thank you
for reviewing the patch and pointing this out.

> 
> 
> > diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
> > index 36915381..9b68e626 100644
> > --- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
> > +++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
> > @@ -10,3 +10,4 @@ SYSFW_CONFIG = "evm"
> >   SYSFW_SUFFIX = "hs-fs"
> >   UBOOT_MACHINE = "am62px_evm_r5_defconfig"
> > +UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
> For this one, there are already UBOOT_CONFIG_FRAGMENTS later in the file
> that you are not taking into account by just setting the variable.  This
> file is going to be a little more difficult to do correctly.
> 
> Since we already have a setting with an override, I think the best plan
> would be to rework the existing logic while adding your changes.  Add some
> intermediate variables to construct the final value.  Something like this:
> 
> BASE_FRAGMENTS = "am62x_r5_usbdfu.config"
> BASE_FRAGMENTS:ti-bsp-6_1 = ""
> 
> # UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has
> to be build
> # along with the base defconfig mentioned in UBOOT_MACHINE. Refer
> u-boot-mergeconfig.inc
> # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
> # For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
> # Hence, disable the A53 based splash screen using the
> am62x_evm_prune_splashscreen.config fragment present in ti-u-boot tree
> PRUNE_SPLASHSCREEN_FRAGMENT =
> "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1',
> 'am62x_evm_prune_splashscreen.config', '', d)}"
> PRUNE_SPLASHSCREEN_FRAGMENT :bsp-ti-6_1 =
> "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1',
> 'am62px_evm_prune_splashscreen.config', '', d)}"
> 
> UBOOT_CONFIG_FRAGMENTS = " $(BASE_FRAGMENTS) $(PRUNE_SPLASHSCREEN_FRAGMENT)"

Since USB DFU is independent of Splash Screen, I agree that the above
approach you have suggested is the right way to implement this. I will
implement your suggestion in the v4 patch.

> 
> 
> > diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> > index 548369ca..85c48334 100644
> > --- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> > +++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> > @@ -10,3 +10,4 @@ SYSFW_CONFIG = "evm"
> >   SYSFW_SUFFIX = "hs-fs"
> >   UBOOT_MACHINE = "am62x_evm_r5_defconfig"
> > +UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
> 
> Same as the first comment.

I will fix this.

> 
> > diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> > index 52b69a72..24f96858 100644
> > --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> > +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> > @@ -10,3 +10,4 @@ SYSFW_CONFIG = "evm"
> >   SYSFW_SUFFIX = "hs-fs"
> >   UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
> > +UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
> 
> Same as the first comment.

Will fix this too.

> 
> > diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> > index 55bc530b..b6045d89 100644
> > --- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> > +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> > @@ -13,3 +13,4 @@ UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
> >   UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
> >   UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am62xsip_sk_r5.config"
> > +UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
> 
> For this one there is already a setting for bsp-ti-6_1 so this is
> technically ok.  But in general we should try and have the variables in
> "correct" order.  The setting of the default, followed by the overrides of
> the variable.  So:
> 
> UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
> UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am62xsip_sk_r5.config"

I understand. I will fix the ordering. Thank you for reviewing the patch
and providing your valuable feedback.

Regards,
Siddharth.

