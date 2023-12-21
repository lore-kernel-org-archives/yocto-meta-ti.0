Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C792BC46CCD
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 23:25:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.7661.1703201093145018472
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 15:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 122ED40CB2;
	Thu, 21 Dec 2023 23:24:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HFomEK4gCF0o; Thu, 21 Dec 2023 23:24:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 27AEB40C24;
	Thu, 21 Dec 2023 23:24:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5F0A4163DD1; Thu, 21 Dec 2023 18:24:47 -0500 (EST)
Date: Thu, 21 Dec 2023 18:24:47 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][RFC] meta-ti-bsp: Build R5
 bootloader without multiconfig
Message-ID: <20231221232447.GK11745@denix.org>
References: <20231220160737.40535-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231220160737.40535-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Dec 2023 23:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17366

This feels like a step backwards... I like the simplification side of this 
change. I also realize the complexities that multiconfig brings. But the 
alternative is rather a hack and has other issues - let me explain.

We used this approach of using binary compilers masquerading as -native tools 
(instead of proper -cross ones) to build different firmware images quite often 
in the past. Initial K3 support also used it, before I converted that to 
multiconfig.


> The R5 SPL bootloader is the only software we build using the R5 (arm32)
> multiconfig environment.

Yeah, times are changing. With a recent switch to U-boot binman handling 
building and managing R5 firmwares behing the scenes, R5 SPL tiboot3.bin 
became the only arm32 component. But we used to also build k3-image-gen and 
package it with SYSFW into an .itb FIT image for the first 2 K3 platforms.

Back then we used prebuilt external toolchains and a binary compiler 
masquerading as -native tool is just a simplified version of such external 
toolchain. But we always wanted to get rid of external toolchains due to 
maintenance overhead.

Along with another requirement at that time to compile everything from 
sources, including FW for R5 cores, it was an obvious choice to build a 
proper secondary arm32 cross toolchain for R5 cores using multiconfig.

I know building FW images from sources is no longer a requirement, but the 
long-term plan then was to eventually cover other cores and HW accelerators 
too, building corresponding cross-compilers for them from the same set of 
sources. As external toolchains tend to fall behind with updates - e.g. 
binary gcc in kirkstone is 10.3, while the one built from sources is 11.4


> Using multiconfig pulls in a large number of
> build dependencies (see the -native environment in baremetal tmp dir)
> this increases build time and space.

Yes, building a toolchain from sources pulls some amount of dependencies. 
Of course, gcc-cross and binutils-cross are the main two, but they pull 
compiler libs like gmp, mpc, pcre, autotools, build tools, compression 
and crypto libs, utils and even some python modules...


> Using multiconfig for a deploy target also leads to several oddities in
> the bitbake build system forcing use of a non-standard deploy directory
> and careful checks that no recipe built in both configuration deploy
> the same files.

Sigh, this was a rocky journey! At least it seems to be now mostly resolved 
in master to avoid internal file conflicts. Yes, can't deploy the same file 
to a common deploy from different multiconfigs. As of non-standard deploy 
location - it was quite a surprise that everyone just hardcodes the location 
to alway be in the main tmp/ dir - but we can move it back there now as that 
part got fixed.


> While I believe we will get more use out of multiconfig for future
> devices, today let's simplify the K3 build infrastructure here by
> building R5 SPL like a normal firmware using a foreign targeting cross
> compiler. This is the technique meta-arm uses to build firmware (see
> scp-firmware and trusted-firmware-m recipes). Add a new tiboot3 firmware
> recipe here.

Yes, meta-arm uses non-standard binary compilers for couple firmware recipes. 
Other BSPs might use them here and there as well. And meta-ti used to do that 
a lot in the past, as I mentioned. But it is rather a hack. I've discussed 
this with Ross in the past and he was interested in possibly adopting 
multiconfig approach in meta-arm for proper cross-compiler use to build 
firmware images.

On the other hand, to promote and ease the initial adoption of SystemReady 
support for generic arm64 in the next LTS, we at the Yocto TSC agreed to 
completely skip building any boot firmware in OE-Core and simply consume 
corresponding prebuilt binaries - a simplified reference approach with the 
assumption that those FW binaries will be properly built from sources in 
their corresponding BSPs.

As I mentioned above, these hacky native binary compilers are just stripped 
down external toolchains, but they lack proper packaging and aren't suited 
for all the use cases and work flows, namely the SDK side of things. While 
those recipes extend to nativesdk, they don't integrate fully with the SDK 
and its sysroots, as far as I recall.


> With that we can also drop all the related k3r5 multiconfig files and
> definitions. Do that here.

And one more point - there's currently work in progress to add support for 
building and packaging multiple variants of the same platform, e.g. am62x, 
where we produce multiple configurations of the bootloader, FW images and 
rootfs, which can then be mix-and-matched into a final set of images. It's 
still very early in prototyping, but there are chances it could use and build 
on top of the current k3r5 multiconfig functionality...

-- 
Denys

