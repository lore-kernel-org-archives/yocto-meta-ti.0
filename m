Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2694.1619119372784492256
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 12:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ACF5140C46;
	Thu, 22 Apr 2021 19:22:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZyLPdnAhQP8p; Thu, 22 Apr 2021 19:22:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 921CF40B66;
	Thu, 22 Apr 2021 19:22:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EA3AA1745CD; Thu, 22 Apr 2021 15:22:49 -0400 (EDT)
Date: Thu, 22 Apr 2021 15:22:49 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sebastian <sebastian.krahl@lacon.de>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] Setting up Build-Environment for BeagleBone Black with meta-ti
Message-ID: <20210422192249.GU15937@denix.org>
References: <bjdh.1619081198829695553.NA6r@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <bjdh.1619081198829695553.NA6r@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, Sebastian,


On Thu, Apr 22, 2021 at 01:46:38AM -0700, Sebastian wrote:
> Hi,
> 
> I'm struggeling to get my BBB running with meta-ti. I have a build 
> environment setup with Ubuntu 18.04. I have started with plain yocto and 
> everything builds fine with beaglebone-yocto.
> 
> Now I want to get in touch with the pru-icss but that is available only in 
> meta-ti as I've read so far.
> 
> * I've cloned again poky, meta-ti and meta-arm. Into ~/yocto
> * Started with source poky/oe-build-environment build
> * Edited conf/local.conf
> 
> * added MACHINE ?= "am335x-evm"
> 
> * Added the layers:
> 
> * bitbake-layers add-layer ../meta-arm/meta-arm-toolchain
> * bitbake-layers add-layer ../meta-arm/meta-arm
> * bitbake-layers add-layer ../meta-ti
> 
> * Started the build bitbake core-image-base
> 
> What I've read so far was to use the ti2020.00 branch of meta-ti and the 
> yocto-3.2 branch of poky.

I'm not at all sure where you've read that, but it's very strange combination 
and is incorrect.

First, ti2020.00 wasn't even a production release, but it was made out of Zeus 
branch, i.e. 3.0 Yocto release.
Second, yocto-3.2 release corresponds to Gatesgarth and meta-ti has no support 
for it.

The best approach is to see where the latest release tags are being made in 
meta-ti, and/or stick to LTS releases of Yocto. In both cases that would be 
Dunfell. You might want to pin down meta-ti to 07.03.00.005 tag for now...


> The build completes without any error and I get the wic.zx, but when I take 
> the content and burn it onto my SD-Kart there is no dtb in the boot folder 
> and there is also no lifesign when I'm booting the BBB with S2 pressed.
> 
> Where is my mistake?
> 
> Regards,
> 
> Sebastian

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
