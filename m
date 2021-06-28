Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.313.1624910057951447613
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 12:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F013640CA0;
	Mon, 28 Jun 2021 19:54:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bfpkf3RBP89x; Mon, 28 Jun 2021 19:54:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A961240BA9;
	Mon, 28 Jun 2021 19:54:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6D08A17461A; Mon, 28 Jun 2021 15:54:11 -0400 (EDT)
Date: Mon, 28 Jun 2021 15:54:11 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
	meta-ti@lists.yoctoproject.org, Lokesh Vutla <lokeshvutla@ti.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH 1/2] prusw-fw: Update switch firmwares to 3.2.9 version
Message-ID: <20210628195411.GW1528@denix.org>
References: <20210628144805.16996-1-vigneshr@ti.com>
 <5df72a60-9793-04b2-bae9-5164b510ee02@ti.com>
MIME-Version: 1.0
In-Reply-To: <5df72a60-9793-04b2-bae9-5164b510ee02@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 28, 2021 at 12:40:22PM -0500, Bajjuri, Praneeth wrote:
> Yogesh,Vignesh,
> 
> On 6/28/2021 9:48 AM, Vignesh Raghavendra wrote:
> >From: Lokesh Vutla <lokeshvutla@ti.com>
> >
> >Update prueth switch firmwares to 3.2.9 version
> >
> >Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> >---
> >  recipes-bsp/prusw-fw/{prusw-fw_3.2.7.bb => prusw-fw_3.2.9.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename recipes-bsp/prusw-fw/{prusw-fw_3.2.7.bb => prusw-fw_3.2.9.bb} (94%)
> >
> >diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.2.7.bb b/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> >similarity index 94%
> >rename from recipes-bsp/prusw-fw/prusw-fw_3.2.7.bb
> >rename to recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> >index 17de58c2..3f5ef7e7 100644
> >--- a/recipes-bsp/prusw-fw/prusw-fw_3.2.7.bb
> >+++ b/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> >@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >-SRCREV = "0038ff0ecda8dae83c65d454c85776c6a4ef8e63"
> >+SRCREV = "dccfb2328354be2933a5a179b528ec8a18b92d3a"
> 
> Can we have once central recipe for ti-linux-firmware to pick the
> right SRCREV when firmware is integrated
> recipe-bsp/ti-linux-fw*/*.bb something like that, Instead of
> pointing to a different SRCREV in different bb recipe ?
> 
> I see 9 different recipe-bsp/<>/ locations potentially pointing to
> different SRCREV.

Individual FW recipes in meta-ti evolved over long time, being added one by 
one, as they were coming from different places and not necessarily hosted in 
a single repo in the beginning...


Has anyone looked at upstreaming those FW images to main linux-firmware at 
kernel.org?

There's a recipe for the upstream linux-firmware bundle in oe-core that 
resides in recipes-kernel/linux-firmware/.

Until fully upstreamed, it might be possible to bbappend that recipe from 
oe-core in meta-ti. But it tries to split up as much of individual FW images 
as possible. That way one recipe with a single SRCREV produces multiple binary 
packages that can be pulled into the image individually.


> >  BRANCH ?= "ti-linux-firmware"
> >  SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> >
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
