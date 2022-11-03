Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794A0C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 19:26:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2760.1667503575328157298
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 03 Nov 2022 12:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6AD2040D0B;
	Thu,  3 Nov 2022 19:26:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O63iyZe93s3r; Thu,  3 Nov 2022 19:26:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3AC6940D08;
	Thu,  3 Nov 2022 19:26:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4BDAC16367A; Thu,  3 Nov 2022 15:26:06 -0400 (EDT)
Date: Thu, 3 Nov 2022 15:26:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Paul Barker <paul.barker@sancloud.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
Message-ID: <20221103192606.GG22689@denix.org>
References: <17190C28A5DB5EE8.9603@lists.yoctoproject.org>
 <73652b02-aef1-0dfe-b1a7-d53acb284484@sancloud.com>
 <885b0468-d6ce-51ec-b614-620c7cba9fcb@ti.com>
 <74d40ad2-f2f4-061a-f49b-6311e52498ed@sancloud.com>
 <c36e7e4d-2ed2-f8eb-0184-1988871d9e4e@ti.com>
 <1721551A6FBDDE25.26638@lists.yoctoproject.org>
 <1326f4e6-d6bd-3313-a0c9-746895864502@sancloud.com>
 <CAB2aN6P44KSxngO4JNaCe9df5Bqjh1v0eDFCHZ5FAOn+JK9LnA@mail.gmail.com>
 <e563bce4-c0e9-d75a-f602-45f877e9ed99@sancloud.com>
 <a302ddb2-7f7e-7388-60b4-3cd1c9bba96f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a302ddb2-7f7e-7388-60b4-3cd1c9bba96f@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 03 Nov 2022 19:26:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15221

On Thu, Nov 03, 2022 at 11:21:21AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> On 11/1/22 11:49 AM, Paul Barker wrote:
> >On 26/10/2022 16:12, Denys Dmytriyenko wrote:
> >>Weston 10 build failure is known and is being worked on.
> >>
> >>For details and a temporary workaround see this:
> >>
> >>https://patchwork.yoctoproject.org/project/arago/patch/20220329053703.2367559-1-denis@denix.org/ <https://patchwork.yoctoproject.org/project/arago/patch/20220329053703.2367559-1-denis@denix.org/>
> >
> >Hi Denys,
> >
> >I've tried the patch included in the linked email. It allows successful
> >build of core-image-weston & tisdk-default-image. However, it does not
> >work for AGL builds as weston 10 is required there:
> >
> >| Run-time dependency libweston-10 found: NO (tried pkgconfig)
> >|
> >| ../git/meson.build:154:0: ERROR: Dependency "libweston-10" not found, tried pkgconfig
> >|
> >| A full log can be found at /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/build/meson-logs/meson-log.txt
> >| ERROR: meson failed
> >| WARNING: /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/temp/run.do_configure.3204250:184 exit 1 from 'exit 1'
> >| WARNING: Backtrace (BB generated script):
> >|       #1: bbfatal_log, /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/temp/run.do_configure.3204250, line 184
> >|       #2: meson_do_configure, /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/temp/run.do_configure.3204250, line 173
> >|       #3: do_configure, /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/temp/run.do_configure.3204250, line 149
> >|       #4: main, /workdir/build/tmp/work/armv7at2hf-neon-agl-linux-gnueabi/agl-compositor/0.0.10+gitAUTOINC+924473ef01-r0/temp/run.do_configure.3204250, line 197
> >ERROR: Task (/workdir/meta-agl/meta-agl-core/recipes-graphics/wayland/agl-compositor_git.bb:do_configure) failed with exit code '1'
> >
> >Is there any way forward here or do we need to wait for Weston 10
> >support from TI?
> >
> 
> I'd recommend waiting for Weston 10 support. There are a couple
> more patches that need forward ported from Dunfell to Kirkstone
> still, then we can add on the GPU patches. No no guarantees but
> I'd guess support is only a week or so away at this time.

I don't think there's any dependency between those 2 items - porting latest 
changes from Dunfell to Kirkstone is all about K3 platforms (TI-SCI cleanup, 
HS unification and new J7 platforms), which shouldn't block any graphics 
updates, especially for legacy SGX and Beaglebone breakage mentioned here...

-- 
Denys

