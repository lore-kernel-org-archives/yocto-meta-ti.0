Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.31005.1623681839140210714
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 07:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CmxpNU9A;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15EEhs6X046298;
	Mon, 14 Jun 2021 09:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623681834;
	bh=TJ6q1Z/gTif0EXtmMAxs1DTmfa07zcNqzCwEwDH+Oo4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CmxpNU9ArgFxrDhN1+eeIJDRpsHNoIWwzd2sq19C6Rj65pSI3+Q+SgDHtLESDf68q
	 qpMhvlebeQsBxPOUwI+1rmdj681vYljPigll2WChb6qx5+SVPDxQ0Uz9iHmx2KOvqW
	 B7OkxEAtL75dSQwdNSJ3DmVIqW0XeCH+YciiJSvE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15EEhscX061476
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Jun 2021 09:43:54 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 14
 Jun 2021 09:43:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 14 Jun 2021 09:43:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15EEhrcD073983;
	Mon, 14 Jun 2021 09:43:53 -0500
Date: Mon, 14 Jun 2021 09:43:53 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: Tom Rini <tom.rini@gmail.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCHv2] conf: am335x-evm: Add extlinux.conf support
Message-ID: <20210614144353.oajmyqlnv4sjhyzf@reputably>
References: <16875AD11A54340A.8333@lists.yoctoproject.org>
 <20210612131331.13439-1-trini@konsulko.com>
 <20210613193641.GB1528@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210613193641.GB1528@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 15:36-20210613, Denys Dmytriyenko wrote:
> On Sat, Jun 12, 2021 at 09:13:31AM -0400, Tom Rini wrote:
> > To make use of the "generic distro boot" support in U-Boot, an
> > extlinux.conf file needs to be generated and reside in the extlinux
> > directory.  The extlinux.conf file will be parsed by U-Boot and the
> > "append" line will be evaluated and expanded and used entirely as the
> > bootargs passed to the kernel.  Our generated extlinux.conf states
> > that the kernel image and device trees live one level up (so the root
> > directory) from it, so populate that location with our kernel and device
> > trees.
> > 
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> 
> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
> 
> 
> > ---
> > Changes in v2:
> > - Elaborate on how this feature works in the commit message.
> > ---
> >  conf/machine/include/ti33x.inc | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> > index 6dfda754e9dd..35e057d57497 100644
> > --- a/conf/machine/include/ti33x.inc
> > +++ b/conf/machine/include/ti33x.inc
> > @@ -43,6 +43,15 @@ UBOOT_MACHINE = "am335x_evm_config"
> >  UBOOT_ENTRYPOINT = "0x80008000"
> >  UBOOT_LOADADDRESS = "0x80008000"
> >  
> > +# Generate an extlinux.conf file
> > +UBOOT_EXTLINUX = "1"
> > +UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
> > +UBOOT_EXTLINUX_BOOT_FILES = " \
> > +    extlinux.conf;extlinux/extlinux.conf \
> > +    ${KERNEL_IMAGETYPE} \
> > +    ${KERNEL_DEVICETREE} \
> > +"
> > +

Does it make better if we do this in ti-soc.inc ?

> >  SPL_BINARY = "MLO"
> >  UBOOT_SUFFIX = "img"
> >  
> > @@ -61,5 +70,5 @@ TI_PDK_LIMIT_BOARDS = "evmAM335x icev2AM335x iceAMIC110 bbbAM335x skAM335x"
> >  
> >  IMAGE_FSTYPES += "tar.xz wic.xz"
> >  WKS_FILE ?= "sdimage-2part.wks"
> > -IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
> > +IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
> >  do_image_wic[depends] += "virtual/bootloader:do_deploy"
> > -- 
> > 2.17.1
> > 

> 
> 
> 


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
