Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.9144.1628696379245827896
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Aug 2021 08:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C621B40C8E;
	Wed, 11 Aug 2021 15:39:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5kz9KKkEZ3go; Wed, 11 Aug 2021 15:39:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA97240BEC;
	Wed, 11 Aug 2021 15:39:36 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 731D7174657; Wed, 11 Aug 2021 11:39:36 -0400 (EDT)
Date: Wed, 11 Aug 2021 11:39:36 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Michael <kakuschky@elbe-net.de>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] Building meta-ti with ti-sgx-ddk-km for Yocto dunfell Kernel 5.4 fails
Message-ID: <20210811153936.GR1528@denix.org>
References: <28423.1628672719851174184@lists.yoctoproject.org>
 <Groupsio.1.28423.1628672719851174184@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <Groupsio.1.28423.1628672719851174184@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Michael,

And by custom defconfig, do you mean you pass your own complete defconfig?
Any reason not to use supplied defconfig and adjust what you need with config 
fragments?


On Wed, Aug 11, 2021 at 02:05:19AM -0700, Michael wrote:
> [Edited Message Follows]
> 
> Hello Denys, I tried with 5.4 and 5.10 both run in the same problem when not 
> set CONFIG_DRM_LEGACY=y in custom defconfig. When open the original source 
> with
> 
> bitbake -c menuconfig virtual/kernel
> 
> the CONFIG_DRM_LEGACY option is unset.
> 
> git shows me the following branch
> 
> git describe --tags
> dunfell-23.0.8-49-g43060f59ba

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
