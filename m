Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.323.1643068081377707403
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 15:48:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZkEt6JQh;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20ONluqV076603;
	Mon, 24 Jan 2022 17:47:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643068076;
	bh=h7AbUweJqMXeyozL3dkSl63pgLkYWCvGFute66QsiL4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZkEt6JQhbR0imDf3KMVkM/8Hy8FHIOsrjjcFtORjIkyd3stscZAxS1fMvvwjT4nl9
	 foI82HTjGzfCIqh5SXmo3CM9hMKWjCBpUtyXlD0M92/8HTI9uIxofkyWeXPh9/HKck
	 mYCgbkFS8wef0oEu0eX9G4ATMRhiPXUrGTD+OCWI=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20ONlu6W045251
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Jan 2022 17:47:56 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 24
 Jan 2022 17:47:56 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 24 Jan 2022 17:47:55 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20ONltmR130830;
	Mon, 24 Jan 2022 17:47:55 -0600
Date: Mon, 24 Jan 2022 17:47:55 -0600
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell][PATCH] machine: Add j721s2 evm configuration
Message-ID: <20220124234755.rzdk3tzgnmdgihjy@exuberant>
References: <20220124151413.3861-1-reatmon@ti.com>
 <20220124172421.GT26229@denix.org>
MIME-Version: 1.0
In-Reply-To: <20220124172421.GT26229@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 12:24-20220124, Denys Dmytriyenko wrote:
> On Mon, Jan 24, 2022 at 09:14:13AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> > From: Nishanth Menon <nm@ti.com>
> > 

Needs a commit message please.

> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > ---
> >  conf/machine/j721s2-evm-k3r5.conf      | 11 +++++++++++
> >  conf/machine/j721s2-evm.conf           | 22 ++++++++++++++++++++++
> >  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 23 +++++++++++++++++++++--
> >  recipes-bsp/u-boot/u-boot-ti.inc       |  6 ++++++
> >  4 files changed, 60 insertions(+), 2 deletions(-)
> >  create mode 100644 conf/machine/j721s2-evm-k3r5.conf
> >  create mode 100644 conf/machine/j721s2-evm.conf
> > 
> > diff --git a/conf/machine/j721s2-evm-k3r5.conf b/conf/machine/j721s2-evm-k3r5.conf
> > new file mode 100644
> > index 00000000..508e96e5
> > --- /dev/null
> > +++ b/conf/machine/j721s2-evm-k3r5.conf
> > @@ -0,0 +1,11 @@
> > +#@TYPE: Machine
> > +#@NAME: J721S2 EVM (R5F)
> > +#@DESCRIPTION: Machine configuration for the TI J721S2 EVM (R5F core)
> > +
> > +require conf/machine/include/k3r5.inc
> > +
> > +SYSFW_SOC = "j721s2"
> > +SYSFW_CONFIG = "evm"
> > +SYSFW_SUFFIX = "gp"
> > +
> > +UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
> > diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> > new file mode 100644
> > index 00000000..82fd33da
> > --- /dev/null
> > +++ b/conf/machine/j721s2-evm.conf
> > @@ -0,0 +1,22 @@
> > +#@TYPE: Machine
> > +#@NAME: J721S2 EVM
> > +#@DESCRIPTION: Machine configuration for the TI J721S2 EVM
> > +
> > +require conf/machine/include/j7.inc
> > +
> > +SERIAL_CONSOLES = "115200;ttyS10"


See https://lore.kernel.org/all/20211223121650.26868-3-vigneshr@ti.com/

The intent is to go with ttyS2 using aliases, however, will use
main_usart8 (traditionally ttyS10).


> > +SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> 
> 
> > +TFA_K3_USART = "0x8"
> > +OPTEE_K3_USART = "0x8"
> 
> Are these new variables? Where are they coming from?

Correct, there are patches before this that needs to be included as well.

A single patch does'nt suffice the needs to j721s2.

https://gist.github.com/nmenon/5e0d1125bb71f1575123ec9869f8693c are
probably the preceding  patches - they need to be reviewed to make sure
this is the correct way to do things.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
