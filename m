Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.9101.1614931573269882145
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 00:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 198.145.29.25, mailfrom: denis@denix.org)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 37D0538C0655
	for <meta-ti@yoctoproject.org>; Fri,  5 Mar 2021 08:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3516640BEC;
	Fri,  5 Mar 2021 08:06:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQwabEcrbh4g; Fri,  5 Mar 2021 08:06:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0961D407E5;
	Fri,  5 Mar 2021 08:06:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5B9A4174524; Fri,  5 Mar 2021 03:06:08 -0500 (EST)
Date: Fri, 5 Mar 2021 03:06:08 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: meta-ti <meta-ti@yoctoproject.org>,
	"Bajjuri, Praneeth" <praneeth@ti.com>
Subject: Re: [PATCH dunfell] ti-rtos: Fix J7200 builds by dropping evm
Message-ID: <20210305080608.GR4892@denix.org>
References: <20210305064155.5125-1-nm@ti.com>
 <20210305064553.3pc6etlxil5noztr@collide>
MIME-Version: 1.0
In-Reply-To: <20210305064553.3pc6etlxil5noztr@collide>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 05, 2021 at 12:45:53AM -0600, Nishanth Menon wrote:
> On 00:41-20210305, Nishanth Menon wrote:
> > "evm" prefix messes up the pattern matchup for J7200 and falls back into
> > default, as a result, we attempt to pull [1] instead of [2].
> > 
> > [1] https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/07_03_00_12/coresdk_rtos_j7200_07_03_00_12_firmware.tar.xz
> > [2] https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/07_03_00_10/coresdk_rtos_j7200_07_03_00_12_firmware.tar.xz
> 
> ^^ above link should have been:
> https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/07_03_00_10/coresdk_rtos_j7200_07_03_00_10_firmware.tar.xz
> 
> if you need me to send a v2 with fixups, i can.. or if that is the only
> comment, then might be helpful to get a fixup while applying..

I'm failing to see the issue here...

Of course, using "_j7200" instead of "_j7200-evm" is more preferred to cover 
other variants, like potential "j7200-hs-evm", but when building for j7200-evm 
should result in the same output. I would need to reproduce it - any another 
pointers?


> > Fixes: 77cdfa9f6560 ("ti-rtos: Update metadata and versions for RTOS firmware")
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > ---
> >  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> > index ed62b876e4db..dffd51abda66 100644
> > --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> > +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> > @@ -31,7 +31,7 @@ DEFAULT_RTOS_VERSION_DOT_am65xx = "07.03.00.10"
> >  
> >  DEFAULT_RTOS_SOC = "undefined"
> >  DEFAULT_RTOS_SOC_j7 = "j721e"
> > -DEFAULT_RTOS_SOC_j7200-evm = "j7200"
> > +DEFAULT_RTOS_SOC_j7200 = "j7200"
> >  DEFAULT_RTOS_SOC_am65xx = "am65xx"
> >  DEFAULT_RTOS_SOC_am64xx = "am64x"
> >  
> > @@ -47,7 +47,7 @@ DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
> >  
> >  DEFAULT_FIRMWARE_SHA256SUM = "unknown"
> >  DEFAULT_FIRMWARE_SHA256SUM_j7 = "69cc16c30c895fe813002bd7bdb3d30e6ca622d86b008a6bf6e2a24b86550969"
> > -DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "a16865d928b2b00bfca64e0c41b02dcfc0ac8ec1ce125fbfd3581a1c610847f8"
> > +DEFAULT_FIRMWARE_SHA256SUM_j7200 = "a16865d928b2b00bfca64e0c41b02dcfc0ac8ec1ce125fbfd3581a1c610847f8"
> >  DEFAULT_FIRMWARE_SHA256SUM_am65xx = "aa121c10d3099dd61ef898717245ecee25b501170607c9a95afd741e05783a5d"
> >  DEFAULT_FIRMWARE_SHA256SUM_am64xx = "9e9efeef0b1dbb101de97e58cfda8bf052a697f2ea635fdf6ca5158fffdc212b"
> >  
> > -- 
> > 2.25.1.377.g2d2118b814c1
> > 
> 
> -- 
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
