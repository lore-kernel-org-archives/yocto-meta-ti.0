Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.9836.1646309109968843349
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 04:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wVk9UfTu;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-m1@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 223C55sl072683;
	Thu, 3 Mar 2022 06:05:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646309105;
	bh=Qi0iCxv39spJZiw5I8VYDzJHlS7og8KHEJ1Kx9/lEg0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=wVk9UfTui5XMyw/Vz6oBEVTy1FuVZBv1MNEhOXfByiofzHm8x+x2s4KAQ2thlg+ix
	 HKP6c85l8sxK9a/FyWc9cPp2AIVPD5NhowJWoCXXFzm8yz4CCJZTa+zKxnQQZdb37F
	 q1kAz/sge4ozms2mNy5kmPINKqhJ79ZitEBg5GYY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 223C55eS041081
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 3 Mar 2022 06:05:05 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 3
 Mar 2022 06:05:05 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 3 Mar 2022 06:05:05 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 223C5490090655;
	Thu, 3 Mar 2022 06:05:05 -0600
Date: Thu, 3 Mar 2022 17:35:04 +0530
From: "Aparna M" <a-m1@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>,
        <devarsht@ti.com>, <nikhil.nd@ti.com>, <nsekhar@ti.com>, <nm@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH] conf: machine: am64xx-hs-evm: Include required boot binaries in wic image
Message-ID: <20220303120436.prppzxivlgkskvse@ti.com>
References: <20220302000857.28932-1-a-m1@ti.com>
 <20220302001743.GJ1766@denix.org>
MIME-Version: 1.0
In-Reply-To: <20220302001743.GJ1766@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 19:17-20220301, Denys Dmytriyenko wrote:
Hi Denys,

Yes, the wic image was tested on the HS platform and the boot works.
This should give you an idea about the boot flow :
https://software-dl.ti.com/processor-sdk-linux/esd/AM65X/08_01_00_01/exports/docs/linux/Foundational_Components/U-Boot/UG-General-Info.html#boot-flow
Boot images are x509 cert signed and the fitImage and DTBs are present 
in /boot in the rootfs partition of the wic image. Also, yes, I
believe the other K3 HS platforms need similar fixes.

> Thanks, Aparna.
> 
> Was this tested on the actual HS platform?
> Can you describe the boot flow briefly?
> Where does fitImage with the kernel and DTBs go? I don't see it in wic.
> Also, what about other K3 HS platforms? Should they be updated similarly?
> Thanks.
> 
> 
> On Wed, Mar 02, 2022 at 05:38:57AM +0530, Aparna M wrote:
> > The wic image generated for HS platforms do not contain all required
> > boot files. This happens because the IMAGE_BOOT_FILES variable that
> > contains boot binaries to be included in the wic image is not set
> > correctly. Populate this variable to include all boot binaries required.
> > 
> > All the HS platforms generate the u-boot binary as u-boot.img_HS but the
> > bootloader expects the binary to be named as u-boot.img. Use UBOOT_IMAGE
> > variable to include the binary as u-boot.img in the wic image.
> > 
> > Signed-off-by: Aparna M <a-m1@ti.com>
> > ---
> >  conf/machine/am64xx-hs-evm.conf | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
> > index 44e81463..960f63cf 100644
> > --- a/conf/machine/am64xx-hs-evm.conf
> > +++ b/conf/machine/am64xx-hs-evm.conf
> > @@ -17,6 +17,7 @@ UBOOT_DTBO_OFFSET =      "0x00010000"
> >  SPL_BINARY = "tispl.bin_HS"
> >  SPL_BINARYNAME = "tispl.bin"
> >  UBOOT_BINARY = "u-boot.img_HS"
> > -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> > +UBOOT_IMAGE = "u-boot.img"
> > +IMAGE_BOOT_FILES = "tiboot3.bin ${SPL_BINARYNAME} ${UBOOT_IMAGE}"
> >  
> >  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> > -- 
> > 2.17.1
> > 
> 
> -- 
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
