Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7A3C7619A
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 00:25:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.147354.1680740713331603457
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 17:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 46CD940BE6;
	Thu,  6 Apr 2023 00:25:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3T3QSUldezl; Thu,  6 Apr 2023 00:25:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0EFC940027;
	Thu,  6 Apr 2023 00:25:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A16E51637F9; Wed,  5 Apr 2023 20:24:32 -0400 (EDT)
Date: Wed, 5 Apr 2023 20:24:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: alexandre.belloni@bootlin.com, Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] check-layer failures for meta-ti
Message-ID: <20230406002432.GM9226@denix.org>
References: <202304031348055bba498e@mail.local>
 <17532FE8A9EB3878.3578@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17532FE8A9EB3878.3578@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Apr 2023 00:25:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16302

On Wed, Apr 05, 2023 at 08:08:42PM -0400, Denys Dmytriyenko wrote:
> On Mon, Apr 03, 2023 at 03:48:05PM +0200, Alexandre Belloni via lists.yoctoproject.org wrote:
> > Hello,
> > 
> > meta-ti is currently failing check-layer-nightly:
> > 
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1272/steps/19/logs/stdio
> > 
> > AssertionError: Adding layer meta-ti-bsp changed signatures.
> > 10 signatures changed, initial differences (first hash before, second after):
> >    optee-client:do_prepare_recipe_sysroot: 3f4e44718ab8f2398d5cc145fcdd481d1813a7afb7d028aa5ff67617fec69885 -> 06b063bf17bd8534f2ffc2506780d02c221cca3273863d3ca2548f2031c3ff92
> >       bitbake-diffsigs --task optee-client do_prepare_recipe_sysroot --signature 3f4e44718ab8f2398d5cc145fcdd481d1813a7afb7d028aa5ff67617fec69885 06b063bf17bd8534f2ffc2506780d02c221cca3273863d3ca2548f2031c3ff92
> >       NOTE: Starting bitbake server...
> >       runtaskdeps changed:
> >       ['cmake/cmake-native_3.22.3.bb:do_populate_sysroot gcc/gcc-cross_11.3.bb:do_populate_sysroot gcc/gcc-runtime_11.3.bb:do_populate_sysroot glibc/glibc_2.35.bb:do_populate_sysroot ninja/ninja_1.10.2.bb:do_populate_sysroot:virtual:native optee/optee-client_3.16.0.bb:do_fetch', +pkgconfig/pkgconfig_git.bb:do_populate_sysroot:virtual:native, 'pseudo/pseudo_git.bb:do_populate_sysroot:virtual:native update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot']
> >       Number of task dependencies changed
> >       Dependency on task pkgconfig/pkgconfig_git.bb:do_populate_sysroot:virtual:native was added with hash cf8a9ff6ed2d492aeeeeeb3972365104425b5424377cf5e4a4fc76bb53a4f628
> 
> Alexandre,
> 
> Trying to push latest OPTEE updates to meta-arm now, so we can remove local 
> bbappends in meta-ti:
> 
> https://lists.yoctoproject.org/g/meta-arm/message/4556
> 
> 
> 
> > There as also this one over the week end:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1268/steps/20/logs/stdio
> > 
> > 
> > AssertionError: 3 != 0 : Found following patches with malformed or missing upstream status:
> > /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch
> > /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch
> > /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch
> 
> Ryan,
> 
> BTW, Upstream-Status: tag in local patches is now being checked as well, so we 
> should go over the above list and at least add "Pending" or "Inappropriate" 
> status now. Can you take care of these?

Ryan,

I'm sure you know this... But for everyone else on meta-ti list, here's a Wiki 
page detailing the Upstream-Status: tag use in OpenEmbedded (and by extension, 
the Yocto Project):

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status

The biggest issue people have when first confronted with this, is where to put 
it. And since they create a patch to submit to the mailing list, they add it 
to the commit log. This should rather go in the actual local *.patch file when 
one gets added to the layer. When preparing email to be sent to the meta-ti 
list, it should be in the inner patch, not the outer - when merged, it should 
not be in the commit log, but rather inside the actual *.patch file.

And since this is now a requirement to maintain Yocto Project compliance, you 
would have to enforce it going forward. Thanks.

-- 
Denys

