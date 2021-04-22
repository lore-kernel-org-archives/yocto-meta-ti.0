Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2763.1619119688512017058
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 12:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E001840BEA;
	Thu, 22 Apr 2021 19:28:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c9IXBS6o6CVp; Thu, 22 Apr 2021 19:28:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C415040B66;
	Thu, 22 Apr 2021 19:28:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 858101745CD; Thu, 22 Apr 2021 15:28:06 -0400 (EDT)
Date: Thu, 22 Apr 2021 15:28:06 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sebastian <sebastian.krahl@lacon.de>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] Setting up Build-Environment for BeagleBone Black with meta-ti
Message-ID: <20210422192806.GV15937@denix.org>
References: <bjdh.1619081198829695553.NA6r@lists.yoctoproject.org>
 <25213.1619098225434298363@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <25213.1619098225434298363@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 22, 2021 at 06:30:25AM -0700, Sebastian wrote:
> After a second, clean run it now works for the MACHINE ?= "beaglebone".
> 
> The first run was on master for meta-ti and poky. It seems to be necessary 
> to know witch meta-ti version is related to witch poky version because 
> yocto-3.2 is not telling anything about the year of creation.

OpenEmbedded and the Yocto Project use codenames to name releases. Everyone 
knows what for example Dunfell means, but very few actually remember which 
number it corresponds to, e.g. 3.1 in this case for Dunfell, which is LTS.

https://wiki.yoctoproject.org/wiki/Releases

So, when you say yocto-3.2, I actually have to look it up in the list above 
to figure out which release or branch it corresponds to, before saying that 
meta-ti has no official support for Gatesgarth.

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
