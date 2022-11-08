Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B340EC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 05:13:57 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.4565.1667884427143271022
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 21:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hPITxbsZ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A85DkV5110945
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Nov 2022 23:13:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1667884426;
	bh=qTPXl/rYHh3Ez0w+f/NYl8UJIkVCyLahF7GaoSPC+ow=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=hPITxbsZdHR9g57wR9cEB1lQTCGc8ai2wBBbFKRdDd7HVHeO5BwKL1QAu1CwZwM3Z
	 YCMxEeDDh6ZWIiSCfCEqLNxV+q9mSc2J0CZkhuvP9aCFaM2rHOKC5LAaZjYj/4nQQp
	 kn1O1U1C1U5IfovR4wowx8HMde5UkdWH4DfgXZ2s=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A85Dk2q042916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Nov 2022 23:13:46 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 7 Nov
 2022 23:13:45 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 7 Nov 2022 23:13:45 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A85DiPA018959;
	Mon, 7 Nov 2022 23:13:45 -0600
Date: Tue, 8 Nov 2022 10:43:44 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Andrew Davis <afd@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH v4 1/6] conf: machine: Add J784S4 hs
 platform
Message-ID: <20221108051344.q4ipocwspyvqpb5q@ula0497581>
References: <20221107092048.555881-1-m-chawdhry@ti.com>
 <20221107092048.555881-2-m-chawdhry@ti.com>
 <60ee6c35-5f80-212c-126f-240ffe635193@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <60ee6c35-5f80-212c-126f-240ffe635193@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Nov 2022 05:13:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15335

On 20:02-20221107, Ryan Eatmon wrote:
> 
> 
> On 11/7/2022 3:20, Manorit Chawdhry wrote:
> > Machine conf for J784S4 HS platform.
> > Used J721S2 hs as reference.
> > 
> > Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> > ---
> >   conf/machine/j784s4-hs-evm-k3r5.conf | 11 +++++++++++
> >   conf/machine/j784s4-hs-evm.conf      | 11 +++++++++++
> >   2 files changed, 22 insertions(+)
> >   create mode 100644 conf/machine/j784s4-hs-evm-k3r5.conf
> >   create mode 100644 conf/machine/j784s4-hs-evm.conf
> > 
> > diff --git a/conf/machine/j784s4-hs-evm-k3r5.conf b/conf/machine/j784s4-hs-evm-k3r5.conf
> > new file mode 100644
> > index 00000000..80a228a0
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
> > +UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
> 
> All of the previous RFC versions had the string
> "j784s4_hs_evm_r5_defconfig", but here it is changed...  And all of the
> other HS platforms include the _hs_ in the string.  Was this intentional?
> 

Ah yes, sorry for not putting it in the changelog. The yocto patches had
dependency on the uboot patches that's why this also had to changed
based on the reviews there. This is intentional as we are trying to
combine the hs and gp builds for evms using a single defconfig.

Manorit

> 
> > diff --git a/conf/machine/j784s4-hs-evm.conf b/conf/machine/j784s4-hs-evm.conf
> > new file mode 100644
> > index 00000000..62357d62
> > --- /dev/null
> > +++ b/conf/machine/j784s4-hs-evm.conf
> > @@ -0,0 +1,11 @@
> > +#@TYPE: Machine
> > +#@NAME: J784S4 HS EVM
> > +#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
> > +
> > +require conf/machine/j784s4-evm.conf
> > +
> > +UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
> 
> Same comment.
> 
> 
> > +SPL_BINARY = "tispl.bin_HS"
> > +UBOOT_BINARY = "u-boot.img_HS"
> > +UBOOT_SYMLINK = "u-boot.img"
> 
> -- 
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS

