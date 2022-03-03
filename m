Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1050.1646349641229331413
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 15:20:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3814D40C1E;
	Thu,  3 Mar 2022 23:20:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z62QIN5e1eoq; Thu,  3 Mar 2022 23:20:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F23A6407FE;
	Thu,  3 Mar 2022 23:20:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 34C241747C6; Thu,  3 Mar 2022 18:20:32 -0500 (EST)
Date: Thu, 3 Mar 2022 18:20:32 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Aparna M <a-m1@ti.com>
Cc: meta-ti@lists.yoctoproject.org, praneeth@ti.com, reatmon@ti.com,
	devarsht@ti.com, nikhil.nd@ti.com, nsekhar@ti.com, nm@ti.com
Subject: Re: [meta-ti][dunfell][PATCH] conf: machine: am64xx-hs-evm: Include required boot binaries in wic image
Message-ID: <20220303232032.GO1766@denix.org>
References: <20220302000857.28932-1-a-m1@ti.com>
 <20220302001743.GJ1766@denix.org>
 <20220303120436.prppzxivlgkskvse@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220303120436.prppzxivlgkskvse@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 03, 2022 at 05:35:04PM +0530, Aparna M wrote:
> On 19:17-20220301, Denys Dmytriyenko wrote:
> Hi Denys,
> 
> Yes, the wic image was tested on the HS platform and the boot works.
> This should give you an idea about the boot flow :
> https://software-dl.ti.com/processor-sdk-linux/esd/AM65X/08_01_00_01/exports/docs/linux/Foundational_Components/U-Boot/UG-General-Info.html#boot-flow

Yeah, I'm well aware of the K3 GP boot flow. I was asking about the same for 
K3 HS, as few things aren't that clear. E.g. in legacy HS devices OPTEE was 
part of FIT image loaded by U-boot. Now OPTEE loads much earlier. I was trying 
to clarify few things like that and how certs and validation are handled...


> Boot images are x509 cert signed and the fitImage and DTBs are present 
> in /boot in the rootfs partition of the wic image. Also, yes, I

Ah, right, see that now.


> believe the other K3 HS platforms need similar fixes.

Do you plan to submit similar patches for those platforms?

Thanks.


> > Thanks, Aparna.
> > 
> > Was this tested on the actual HS platform?
> > Can you describe the boot flow briefly?
> > Where does fitImage with the kernel and DTBs go? I don't see it in wic.
> > Also, what about other K3 HS platforms? Should they be updated similarly?
> > Thanks.
> > 
> > 
> > On Wed, Mar 02, 2022 at 05:38:57AM +0530, Aparna M wrote:
> > > The wic image generated for HS platforms do not contain all required
> > > boot files. This happens because the IMAGE_BOOT_FILES variable that
> > > contains boot binaries to be included in the wic image is not set
> > > correctly. Populate this variable to include all boot binaries required.
> > > 
> > > All the HS platforms generate the u-boot binary as u-boot.img_HS but the
> > > bootloader expects the binary to be named as u-boot.img. Use UBOOT_IMAGE
> > > variable to include the binary as u-boot.img in the wic image.
> > > 
> > > Signed-off-by: Aparna M <a-m1@ti.com>
> > > ---
> > >  conf/machine/am64xx-hs-evm.conf | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
> > > index 44e81463..960f63cf 100644
> > > --- a/conf/machine/am64xx-hs-evm.conf
> > > +++ b/conf/machine/am64xx-hs-evm.conf
> > > @@ -17,6 +17,7 @@ UBOOT_DTBO_OFFSET =      "0x00010000"
> > >  SPL_BINARY = "tispl.bin_HS"
> > >  SPL_BINARYNAME = "tispl.bin"
> > >  UBOOT_BINARY = "u-boot.img_HS"
> > > -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> > > +UBOOT_IMAGE = "u-boot.img"
> > > +IMAGE_BOOT_FILES = "tiboot3.bin ${SPL_BINARYNAME} ${UBOOT_IMAGE}"
> > >  
> > >  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> > > -- 
> > > 2.17.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
