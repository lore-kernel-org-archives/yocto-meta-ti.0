Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.11946.1628708622195262286
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Aug 2021 12:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 80A0A40C8E;
	Wed, 11 Aug 2021 19:03:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B5_8uY3f2oJ1; Wed, 11 Aug 2021 19:03:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 641A440BEC;
	Wed, 11 Aug 2021 19:03:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 22AA6174657; Wed, 11 Aug 2021 15:03:40 -0400 (EDT)
Date: Wed, 11 Aug 2021 15:03:40 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Michael <kakuschky@elbe-net.de>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] Building meta-ti with ti-sgx-ddk-km for Yocto dunfell Kernel 5.4 fails
Message-ID: <20210811190340.GU1528@denix.org>
References: <20210811153936.GR1528@denix.org>
 <17596.1628708266928694447@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <17596.1628708266928694447@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 11, 2021 at 11:57:46AM -0700, Michael wrote:
> Hello Denys, yes I have my own defconfig derived from the original kernel 
> settings.But I will do what you mention and use a .config for the settings I 
> change. Maybe that works better. I let you know.
> 
> By the way, does somebody has a working parameter set for the combination of 
> poky-dunfell, linux-ti-staging 5.10, ti-sgx-ddk-km and the BeagleBone?

Michael,

Sure, you can list extra config fragments via KERNEL_CONFIG_FRAGMENTS variable 
to pass to linux-ti-staging.

As of working SGX - as Nishanth mentioned, 5.10 might not have everything 
ported from 5.4 yet...

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
