Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.5079.1645783716514860273
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 02:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xnCwZW23;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-m1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21PA8WLB070018;
	Fri, 25 Feb 2022 04:08:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645783712;
	bh=WHXtja4PzbQj16JMRNcp33Pt42jXVODFrETbzAyUFUI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xnCwZW23zaVe1k//9eRTl1dyXbxPYEZLg9peHHd5yGDZokEPY1RnAP1fQxfTduLbL
	 2gxQoshtNuZYd6wU1bk0Tw563mhkpzRCIYMi4cBQEVa2X0gENKpIFdcvj/bA9XAZuS
	 GStW/n/QdmkhjR66fkSl8gDx+hSqT4dhtyvNza2M=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21PA8WbR020819
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Feb 2022 04:08:32 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Feb 2022 04:08:31 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Feb 2022 04:08:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21PA8UaQ002009;
	Fri, 25 Feb 2022 04:08:31 -0600
Date: Fri, 25 Feb 2022 15:38:30 +0530
From: "Aparna M" <a-m1@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>,
        <nikhil.nd@ti.com>, <devarsht@ti.com>, <nsekhar@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH] conf: machine: am64xx-hs-evm: Fix naming of u-boot.img
Message-ID: <20220225100830.g7xa5qg7nyafix36@ti.com>
References: <20220221081331.11263-1-a-m1@ti.com>
 <20220222004145.GJ26229@denix.org>
MIME-Version: 1.0
In-Reply-To: <20220222004145.GJ26229@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 19:41-20220221, Denys Dmytriyenko wrote:
> On Mon, Feb 21, 2022 at 01:43:31PM +0530, Aparna M via lists.yoctoproject.org wrote:
> > All the HS platforms generate the u-boot binary as u-boot.img_HS
> > but the bootloader expects the binary to be named as u-boot.img
> > 
> > Due to this mismatch, script cannot find the required image to
> > be added in the WIC image. Fix this by overwriting the
> > UBOOT_IMAGE variable via conf file.
> 
> Can you please clarify which script cannot find the image? Thanks!

The wic file generation scripts that pick up files for the boot
partition from the IMAGE_BOOT_FILES variable is unable to find
u-boot.img. As a result, the generated wic image does not package the
uboot binary and fails.

> 
> Also, how does it work for am65xx HS, j721e HS, j7200 HS? Why only
> am64xx HS?

The previous releases for these three platforms did not include wic
images. I believe this issue might be present in these platforms as
well.

> 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > 
> > Signed-off-by: Aparna M <a-m1@ti.com>
> > ---
> >  conf/machine/am64xx-hs-evm.conf | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
> > index 44e81463..781b8318 100644
> > --- a/conf/machine/am64xx-hs-evm.conf
> > +++ b/conf/machine/am64xx-hs-evm.conf
> > @@ -17,6 +17,7 @@ UBOOT_DTBO_OFFSET =      "0x00010000"
> >  SPL_BINARY = "tispl.bin_HS"
> >  SPL_BINARYNAME = "tispl.bin"
> >  UBOOT_BINARY = "u-boot.img_HS"
> > -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> > +UBOOT_IMAGE = "u-boot.img"
> > +IMAGE_BOOT_FILES = "${UBOOT_IMAGE}"
> >  
> >  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> > -- 
> > 2.17.1
