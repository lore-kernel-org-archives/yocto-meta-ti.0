Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEDCC4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 07:30:28 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.747.1667979022739066433
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Nov 2022 23:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=g4FJDFzD;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A97UHUT041761;
	Wed, 9 Nov 2022 01:30:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1667979017;
	bh=UqWA443YvWeibostxfGizo3cuQtMzcWza192+2msL00=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=g4FJDFzDWsIqYjWNCTuH3niIRSdPyszANbP9RIW83hNvuM49QEIb0SZe1TzJ7MVhm
	 GtjcyfvlLzFdMnm01scjmbjQISoH/PM8xy8A0brWuR9Lw55ZtgfgiMjykqme5ErLvO
	 a4ZP8Ase3//CByDThmhE7IhdOaiTluCLZyhn+3OE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A97UHZP110056
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Nov 2022 01:30:17 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 9 Nov
 2022 01:30:17 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 9 Nov 2022 01:30:17 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A97UGea019370;
	Wed, 9 Nov 2022 01:30:17 -0600
Date: Wed, 9 Nov 2022 13:00:15 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Andrew
 Davis <afd@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH v4 1/6] conf: machine: Add J784S4 hs
 platform
Message-ID: <20221109073015.vhbro5e2kxzu3lgu@ula0497581>
References: <20221107092048.555881-1-m-chawdhry@ti.com>
 <20221107092048.555881-2-m-chawdhry@ti.com>
 <60ee6c35-5f80-212c-126f-240ffe635193@ti.com>
 <20221108051344.q4ipocwspyvqpb5q@ula0497581>
 <20221108183421.GI22689@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221108183421.GI22689@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 09 Nov 2022 07:30:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15337

On 13:34-20221108, Denys Dmytriyenko wrote:
> On Tue, Nov 08, 2022 at 10:43:44AM +0530, Manorit Chawdhry via lists.yoctoproject.org wrote:
> > On 20:02-20221107, Ryan Eatmon wrote:
> > > 
> > > 
> > > On 11/7/2022 3:20, Manorit Chawdhry wrote:
> > > > Machine conf for J784S4 HS platform.
> > > > Used J721S2 hs as reference.
> > > > 
> > > > Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> > > > ---
> > > >   conf/machine/j784s4-hs-evm-k3r5.conf | 11 +++++++++++
> > > >   conf/machine/j784s4-hs-evm.conf      | 11 +++++++++++
> > > >   2 files changed, 22 insertions(+)
> > > >   create mode 100644 conf/machine/j784s4-hs-evm-k3r5.conf
> > > >   create mode 100644 conf/machine/j784s4-hs-evm.conf
> > > > 
> > > > diff --git a/conf/machine/j784s4-hs-evm-k3r5.conf b/conf/machine/j784s4-hs-evm-k3r5.conf
> > > > new file mode 100644
> > > > index 00000000..80a228a0
> > > > --- /dev/null
> > > > +++ b/conf/machine/j784s4-hs-evm-k3r5.conf
> > > > @@ -0,0 +1,11 @@
> > > > +#@TYPE: Machine
> > > > +#@NAME: J784S4 HS EVM (R5F)
> > > > +#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM (R5F core)
> > > > +
> > > > +require conf/machine/include/k3r5.inc
> > > > +
> > > > +SYSFW_SOC = "j784s4"
> > > > +SYSFW_CONFIG = "evm"
> > > > +SYSFW_SUFFIX = "hs"
> > > > +
> > > > +UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
> > > 
> > > All of the previous RFC versions had the string
> > > "j784s4_hs_evm_r5_defconfig", but here it is changed...  And all of the
> > > other HS platforms include the _hs_ in the string.  Was this intentional?
> > > 
> > 
> > Ah yes, sorry for not putting it in the changelog. The yocto patches had
> > dependency on the uboot patches that's why this also had to changed
> > based on the reviews there. This is intentional as we are trying to
> > combine the hs and gp builds for evms using a single defconfig.
> 
> Should this be done through multiconfig then? Like am64xx-evm that supports 
> GP, HS-FS and HS-SE.
> 

AHP supports only HS-SE and GP uptil now so I don't think it should be required at
this point, we can still continue with j784s4-hs-evm and j784s4-evm for
the builds respectively. I have tested both ( with my local uboot ) and they seem to
be booting fine after flashing the wics.

Manorit

> -- 
> Denys

