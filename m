Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81324C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:27:05 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.32553.1654525618926641834
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Jun 2022 07:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=i0fNo+Pi;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: m-chawdhry@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 256EQtYp029148;
	Mon, 6 Jun 2022 09:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654525615;
	bh=xes339yIOIQSEgw9TY4plVMod64tNVae2AJlZDFKqj0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=i0fNo+PiBOMOiRJIFOXqcapb8bfpgj0vIZ6GO2mTLlif0YlKkwA8s0XvIIHK9XknV
	 ZM8i2mR4/vdNCMcbJPkSHRn4ImQ8/qXcdS7jI64GMj+fCAZw+EeCVfCCfGpZPEpTt3
	 VsL2Bis81WowCdxLUqBuJ9bAK2h41OXUKJkSQJxE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 256EQtBX118733
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jun 2022 09:26:55 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 6
 Jun 2022 09:26:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 6 Jun 2022 09:26:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 256EQp1c028131;
	Mon, 6 Jun 2022 09:26:53 -0500
Date: Mon, 6 Jun 2022 19:56:51 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell][PATCH 1/2] conf: machine: wic: Fix HS image
 boot partition
Message-ID: <20220606142651.c5o5jycrzkpgscxp@ula0497581>
References: <20220602202448.18068-1-afd@ti.com>
 <20220603210158.GN9834@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220603210158.GN9834@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 06 Jun 2022 14:27:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14782

On 17:01-20220603, Denys Dmytriyenko wrote:
> On Thu, Jun 02, 2022 at 03:24:47PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> > From: Manorit Chawdhry <m-chawdhry@ti.com>
> > 
> > IMAGE_BOOT_FILES was being overwritten in the HS recipes leading to
> > incomplete binaries in /boot and the naming of the binaries were not
> > correct.
> > 
> > Fixes /boot partition for HS devices.
> > 
> > Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> > [afd: Extended fix to all HS platforms]
> > Signed-off-by: Andrew Davis <afd@ti.com>
> 
> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
> 
> 

Hi,

Running this patch on j721e-hsevm seems to break the secure boot mechanism on
u-boot stage. Will need fixes.

Regards,
Manorit

> > ---
> >  conf/machine/am64xx-hs-evm.conf | 4 +---
> >  conf/machine/am65xx-hs-evm.conf | 4 +---
> >  conf/machine/include/k3.inc     | 5 +++--
> >  conf/machine/j7-hs-evm.conf     | 4 +---
> >  conf/machine/j7200-hs-evm.conf  | 4 +---
> >  5 files changed, 7 insertions(+), 14 deletions(-)
> > 
> > diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
> > index 44e81463..c0d904e1 100644
> > --- a/conf/machine/am64xx-hs-evm.conf
> > +++ b/conf/machine/am64xx-hs-evm.conf
> > @@ -15,8 +15,6 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
> >  UBOOT_DTBO_OFFSET =      "0x00010000"
> >  
> >  SPL_BINARY = "tispl.bin_HS"
> > -SPL_BINARYNAME = "tispl.bin"
> > -UBOOT_BINARY = "u-boot.img_HS"
> > -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> > +UBOOT_IMAGE = "u-boot.img_HS"
> >  
> >  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> > diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
> > index e4eebb6a..a7514663 100644
> > --- a/conf/machine/am65xx-hs-evm.conf
> > +++ b/conf/machine/am65xx-hs-evm.conf
> > @@ -15,8 +15,6 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
> >  UBOOT_DTBO_OFFSET =      "0x00010000"
> >  
> >  SPL_BINARY = "tispl.bin_HS"
> > -SPL_BINARYNAME = "tispl.bin"
> > -UBOOT_BINARY = "u-boot.img_HS"
> > -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> > +UBOOT_IMAGE = "u-boot.img_HS"
> >  
> >  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> > diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> > index e0970698..f85e6b98 100644
> > --- a/conf/machine/include/k3.inc
> > +++ b/conf/machine/include/k3.inc
> > @@ -22,6 +22,7 @@ UBOOT_ENTRYPOINT = "0x80008000"
> >  UBOOT_LOADADDRESS = "0x80008000"
> >  
> >  SPL_BINARY = "tispl.bin"
> > +SPL_BINARYNAME = "tispl.bin"
> >  UBOOT_SUFFIX = "img"
> >  
> >  EXTRA_IMAGEDEPENDS += "virtual/bootloader"
> > @@ -40,8 +41,8 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet pci"
> >  
> >  IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
> >  
> > -IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
> > -IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
> > +IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
> > +IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
> >  
> >  IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
> >  
> > diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
> > index f2e3ccf5..629a5ccd 100644
> > --- a/conf/machine/j7-hs-evm.conf
> > +++ b/conf/machine/j7-hs-evm.conf
> > @@ -15,9 +15,7 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
> >  UBOOT_DTBO_OFFSET =      "0x00010000"
> >  
> >  SPL_BINARY = "tispl.bin_HS"
> > -SPL_BINARYNAME = "tispl.bin"
> > -UBOOT_BINARY = "u-boot.img_HS"
> > -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> > +UBOOT_IMAGE = "u-boot.img_HS"
> >  
> >  BBMULTICONFIG += "k3r5-sr1-1"
> >  
> > diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-evm.conf
> > index a5bd637e..54b7906f 100644
> > --- a/conf/machine/j7200-hs-evm.conf
> > +++ b/conf/machine/j7200-hs-evm.conf
> > @@ -15,8 +15,6 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
> >  UBOOT_DTBO_OFFSET =      "0x00010000"
> >  
> >  SPL_BINARY = "tispl.bin_HS"
> > -SPL_BINARYNAME = "tispl.bin"
> > -UBOOT_BINARY = "u-boot.img_HS"
> > -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> > +UBOOT_IMAGE = "u-boot.img_HS"
> >  
> >  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> > -- 
> > 2.36.1
> > 

