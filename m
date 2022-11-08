Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B9CC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 18:34:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.869.1667932471582976418
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Nov 2022 10:34:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BC97640D90;
	Tue,  8 Nov 2022 18:34:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2JW5uxOmNDn; Tue,  8 Nov 2022 18:34:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 920A240D8F;
	Tue,  8 Nov 2022 18:34:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 80B2E16367A; Tue,  8 Nov 2022 13:34:21 -0500 (EST)
Date: Tue, 8 Nov 2022 13:34:21 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: m-chawdhry@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org,
	Andrew Davis <afd@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH v4 1/6] conf: machine: Add J784S4 hs
 platform
Message-ID: <20221108183421.GI22689@denix.org>
References: <20221107092048.555881-1-m-chawdhry@ti.com>
 <20221107092048.555881-2-m-chawdhry@ti.com>
 <60ee6c35-5f80-212c-126f-240ffe635193@ti.com>
 <20221108051344.q4ipocwspyvqpb5q@ula0497581>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108051344.q4ipocwspyvqpb5q@ula0497581>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Nov 2022 18:34:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15336

On Tue, Nov 08, 2022 at 10:43:44AM +0530, Manorit Chawdhry via lists.yoctoproject.org wrote:
> On 20:02-20221107, Ryan Eatmon wrote:
> > 
> > 
> > On 11/7/2022 3:20, Manorit Chawdhry wrote:
> > > Machine conf for J784S4 HS platform.
> > > Used J721S2 hs as reference.
> > > 
> > > Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> > > ---
> > >   conf/machine/j784s4-hs-evm-k3r5.conf | 11 +++++++++++
> > >   conf/machine/j784s4-hs-evm.conf      | 11 +++++++++++
> > >   2 files changed, 22 insertions(+)
> > >   create mode 100644 conf/machine/j784s4-hs-evm-k3r5.conf
> > >   create mode 100644 conf/machine/j784s4-hs-evm.conf
> > > 
> > > diff --git a/conf/machine/j784s4-hs-evm-k3r5.conf b/conf/machine/j784s4-hs-evm-k3r5.conf
> > > new file mode 100644
> > > index 00000000..80a228a0
> > > --- /dev/null
> > > +++ b/conf/machine/j784s4-hs-evm-k3r5.conf
> > > @@ -0,0 +1,11 @@
> > > +#@TYPE: Machine
> > > +#@NAME: J784S4 HS EVM (R5F)
> > > +#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM (R5F core)
> > > +
> > > +require conf/machine/include/k3r5.inc
> > > +
> > > +SYSFW_SOC = "j784s4"
> > > +SYSFW_CONFIG = "evm"
> > > +SYSFW_SUFFIX = "hs"
> > > +
> > > +UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
> > 
> > All of the previous RFC versions had the string
> > "j784s4_hs_evm_r5_defconfig", but here it is changed...  And all of the
> > other HS platforms include the _hs_ in the string.  Was this intentional?
> > 
> 
> Ah yes, sorry for not putting it in the changelog. The yocto patches had
> dependency on the uboot patches that's why this also had to changed
> based on the reviews there. This is intentional as we are trying to
> combine the hs and gp builds for evms using a single defconfig.

Should this be done through multiconfig then? Like am64xx-evm that supports 
GP, HS-FS and HS-SE.

-- 
Denys

