Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.2663.1645823870987535419
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 13:17:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 86E3840AE9;
	Fri, 25 Feb 2022 21:17:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lmn48Q-tarNj; Fri, 25 Feb 2022 21:17:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4D79D40A46;
	Fri, 25 Feb 2022 21:17:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 82CBF1747B1; Fri, 25 Feb 2022 16:17:42 -0500 (EST)
Date: Fri, 25 Feb 2022 16:17:42 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: a-m1@ti.com
Cc: meta-ti@lists.yoctoproject.org, praneeth@ti.com, reatmon@ti.com,
	nikhil.nd@ti.com, devarsht@ti.com, nsekhar@ti.com
Subject: Re: [meta-ti][dunfell][PATCH] conf: machine: am64xx-hs-evm: Fix naming of u-boot.img
Message-ID: <20220225211742.GZ26229@denix.org>
References: <20220221081331.11263-1-a-m1@ti.com>
 <20220222004145.GJ26229@denix.org>
 <20220225100830.g7xa5qg7nyafix36@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220225100830.g7xa5qg7nyafix36@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 25, 2022 at 03:38:30PM +0530, Aparna M via lists.yoctoproject.org wrote:
> On 19:41-20220221, Denys Dmytriyenko wrote:
> > On Mon, Feb 21, 2022 at 01:43:31PM +0530, Aparna M via lists.yoctoproject.org wrote:
> > > All the HS platforms generate the u-boot binary as u-boot.img_HS
> > > but the bootloader expects the binary to be named as u-boot.img
> > > 
> > > Due to this mismatch, script cannot find the required image to
> > > be added in the WIC image. Fix this by overwriting the
> > > UBOOT_IMAGE variable via conf file.
> > 
> > Can you please clarify which script cannot find the image? Thanks!
> 
> The wic file generation scripts that pick up files for the boot
> partition from the IMAGE_BOOT_FILES variable is unable to find
> u-boot.img. As a result, the generated wic image does not package the
> uboot binary and fails.

I don't see the failure. wic image picks up everything listed in 
IMAGE_BOOT_FILES variable and it is set right there to contain UBOOT_BINARY, 
which is set to u-boot.img_HS

HS platforms boot differently and they use FIT image along with other 
artifacts. I don't believe wic image was ever used for HS platforms...

So, I believe you have some other problem and this is not the right fix for 
it.


> > Also, how does it work for am65xx HS, j721e HS, j7200 HS? Why only
> > am64xx HS?
> 
> The previous releases for these three platforms did not include wic
> images. I believe this issue might be present in these platforms as
> well.
> 
> > 
> > > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > > 
> > > Signed-off-by: Aparna M <a-m1@ti.com>
> > > ---
> > >  conf/machine/am64xx-hs-evm.conf | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
> > > index 44e81463..781b8318 100644
> > > --- a/conf/machine/am64xx-hs-evm.conf
> > > +++ b/conf/machine/am64xx-hs-evm.conf
> > > @@ -17,6 +17,7 @@ UBOOT_DTBO_OFFSET =      "0x00010000"
> > >  SPL_BINARY = "tispl.bin_HS"
> > >  SPL_BINARYNAME = "tispl.bin"
> > >  UBOOT_BINARY = "u-boot.img_HS"
> > > -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> > > +UBOOT_IMAGE = "u-boot.img"
> > > +IMAGE_BOOT_FILES = "${UBOOT_IMAGE}"
> > >  
> > >  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> > > -- 
> > > 2.17.1
