Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.2.1621020376506012276
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 May 2021 12:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZYXRsiXV;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14EJQFoi071109;
	Fri, 14 May 2021 14:26:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621020375;
	bh=FK/uc73qAOOK9nWxmERammxJ9AP3DZyQ1QslLfQlTbU=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=ZYXRsiXVyfWmmNWC9hOLwviBBPJegm59dl1Wg5dogIzu3vfmEud9slDKWiwH+c8Y2
	 srD36BmmkKzhg7xInEltMen0cHhihP9WDsiFaMmJImoesrCXMyYW+U2E79Ma9WFj/F
	 8MiJflhhJTPzczjZTUZQqDkJp2jH2O8YZiDJNfzY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14EJQF2T023025
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 May 2021 14:26:15 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 14
 May 2021 14:26:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 14 May 2021 14:26:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14EJQF8C049192;
	Fri, 14 May 2021 14:26:15 -0500
Date: Fri, 14 May 2021 14:26:15 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denys@konsulko.com>, <praneeth@ti.com>
Subject: Re: [meta-ti][dunfell/master][PATCH] linux-ti-staging: Added DTC_FLAG to Kernel argument to build dtbs with symbols
Message-ID: <20210514192615.5fwrfs2muos5t2c3@ascertain>
References: <20210514012143.7094-1-yogeshs@ti.com>
 <167EFB30FCA6D486.24136@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <167EFB30FCA6D486.24136@lists.yoctoproject.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 11:18-20210514, Nishanth Menon via lists.yoctoproject.org wrote:
> On 20:21-20210513, Yogesh Siraswar wrote:

[...]

> 
> >  16 files changed, 137 insertions(+), 1 deletion(-)
> > 
> > diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
> > index 469c4d37..dc50e686 100644
> > --- a/conf/machine/am335x-evm.conf
> > +++ b/conf/machine/am335x-evm.conf
> > @@ -13,6 +13,15 @@ IMAGE_FSTYPES += "ubifs ubi"
> >  SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
> >  SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >  
> > +#Add DTC_FLAGS to compile DTB with symbols.
> > +#Weak assignment so that can be over-written with
> > +#EXTRA_DTC_FLAGS = "" in local.conf
> 
> We dont need this comment every where, do we?
> > +
> > +EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
> > +
> > +KERNEL_EXTRA_ARGS += "${EXTRA_DTC_FLAGS}"
> 
> Should'nt this be in a common file
> [...]


Thinking again - should we make this a little easier in case the future
dtc needs more flags?

a) KERNEL_HAS_OVERLAYS as a single variable defined in machine.confs
b) ti-kernel.inc which introduces KERNEL_EXTRA_ARGS in the style above
(extra_dtc_flags...)
c) include ti-kernel.inc in mainline-linux and linux-ti-staging?

[...]


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
