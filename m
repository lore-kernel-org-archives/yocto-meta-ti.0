Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1CEC4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 08:00:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.17552.1665561647254481882
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Oct 2022 01:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Dy+D6p2W;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: m-chawdhry@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29C80koE020707
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Oct 2022 03:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665561646;
	bh=hY3WKy4RPXshPVS8kE1YdAFM9Pf9BYS8nF+loRNlHlY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Dy+D6p2WSsg5ntFXPddY+7rK5DTAa1RqNHIczzMQMGK09wR+PFG+5sXB7ABevCWBE
	 zW9CSBdfgVeEXG6WxvAdmBEhQDBAG7quhlZKqiA9yJ2SL/n9xrqBCLUo5zPKMOVnjI
	 C1EHiwtc5dN9IBE/RO+edC4/ZcE5l9s1RAi/+CFk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29C80kbL025277
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Oct 2022 03:00:46 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 12
 Oct 2022 03:00:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 12 Oct 2022 03:00:46 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29C80jbD067730;
	Wed, 12 Oct 2022 03:00:45 -0500
Date: Wed, 12 Oct 2022 13:30:44 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: Andrew Davis <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][RFC dunfell][PATCH 1/6] conf: machine: Add J784S4 hs
 platform
Message-ID: <20221012080044.35wt5j74ofeiogk4@ula0497581>
References: <20221011091839.1337077-1-m-chawdhry@ti.com>
 <20221011091839.1337077-2-m-chawdhry@ti.com>
 <c92fca84-4dbf-e466-eafc-2c9701e4887a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c92fca84-4dbf-e466-eafc-2c9701e4887a@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Oct 2022 08:00:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15148

On 09:07-20221011, Andrew Davis wrote:
> On 10/11/22 4:18 AM, Manorit Chawdhry wrote:
> > Machine conf for J784S4 HS platform.
> > Used J721S2 hs as reference.
> > 
> > Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> > ---
> >   conf/machine/j784s4-hs-evm-k3r5.conf | 11 +++++++++++
> >   conf/machine/j784s4-hs-evm.conf      | 19 +++++++++++++++++++
> >   2 files changed, 30 insertions(+)
> >   create mode 100644 conf/machine/j784s4-hs-evm-k3r5.conf
> >   create mode 100644 conf/machine/j784s4-hs-evm.conf
> > 
> > diff --git a/conf/machine/j784s4-hs-evm-k3r5.conf b/conf/machine/j784s4-hs-evm-k3r5.conf
> > new file mode 100644
> > index 00000000..b6f2f6f9
> > --- /dev/null
> > +++ b/conf/machine/j784s4-hs-evm-k3r5.conf
> > @@ -0,0 +1,11 @@
> > +#@TYPE: Machine
> > +#@NAME: J784S4 HS EVM (R5F)
> > +#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM (R5F core)
> > +
> > +require conf/machine/include/k3r5.inc
> > +
> > +SYSFW_SOC = "j784s4"
> > +SYSFW_CONFIG = "evm"
> > +SYSFW_SUFFIX = "hs"
> > +
> > +UBOOT_MACHINE = "j784s4_hs_evm_r5_defconfig"
> > diff --git a/conf/machine/j784s4-hs-evm.conf b/conf/machine/j784s4-hs-evm.conf
> > new file mode 100644
> > index 00000000..41fe26b5
> > --- /dev/null
> > +++ b/conf/machine/j784s4-hs-evm.conf
> > @@ -0,0 +1,19 @@
> > +#@TYPE: Machine
> > +#@NAME: J784S4 HS EVM
> > +#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
> > +
> > +require conf/machine/j784s4-evm.conf
> > +
> > +UBOOT_MACHINE = "j784s4_hs_evm_a72_defconfig"
> > +
> > +UBOOT_ENTRYPOINT =       "0x80080000"
> > +UBOOT_LOADADDRESS =      "0x80080000"
> > +UBOOT_RD_LOADADDRESS =   "0x84000000"
> > +UBOOT_RD_ENTRYPOINT =    "0x84000000"
> > +UBOOT_DTB_LOADADDRESS =  "0x83000000"
> > +UBOOT_DTBO_LOADADDRESS = "0x83080000"
> > +UBOOT_DTBO_OFFSET =      "0x00010000"
> > +
> 
> Are any of the above needed anymore? These might be just leftover
> from legacy platforms..
> 
> Andrew
> 

Yeah, just tested after removing these. Seemed to boot fine. Will remove
them.

Manorit

> > +SPL_BINARY = "tispl.bin_HS"
> > +UBOOT_BINARY = "u-boot.img_HS"
> > +UBOOT_SYMLINK = "u-boot.img"

