Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.310.1628635734702173081
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Aug 2021 15:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0B62540C2A;
	Tue, 10 Aug 2021 22:48:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4a1EdtIuWTAE; Tue, 10 Aug 2021 22:48:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D41F740BEB;
	Tue, 10 Aug 2021 22:48:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 266EF174656; Tue, 10 Aug 2021 18:48:52 -0400 (EDT)
Date: Tue, 10 Aug 2021 18:48:52 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Michael <kakuschky@elbe-net.de>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] Building meta-ti with ti-sgx-ddk-km for Yocto dunfell Kernel 5.4 fails
Message-ID: <20210810224852.GL1528@denix.org>
References: <QWlz.1628602755891666140.xanL@lists.yoctoproject.org>
 <16327.1628633281888859859@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <16327.1628633281888859859@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 10, 2021 at 03:08:01PM -0700, Michael wrote:
> I found the solution by myself. the Kernel needs to be configured and build 
> with CONFIG_DRM_LEGACY option then ti-sgx-ddk-km will be build.

Michael,

Which kernel are you building? As linux-ti-staging kernel in meta-ti alredy 
enables DRM_LEGACY by default:

$ grep DRM_LEGACY arago-tmp-external-arm-glibc/work/am335x_evm-linux-gnueabi/linux-ti-staging/5.10.41+gitAUTOINC+4c2eade9f7-r22a.arago5/build/.config 
CONFIG_DRM_LEGACY=y

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
