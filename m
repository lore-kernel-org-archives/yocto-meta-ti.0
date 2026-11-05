Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38389.1793895680779988996
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 08:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9EA234074B;
	Thu,  5 Nov 2026 16:21:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fNHGC_3XaYT0; Thu,  5 Nov 2026 16:21:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6315F40748;
	Thu,  5 Nov 2026 16:21:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5EDAF17EF0B; Thu,  5 Nov 2026 11:21:17 -0500 (EST)
Date: Thu, 5 Nov 2026 11:21:17 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Theodore A. Roth" <troth@openavr.org>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] Unable to clone or fetch from git.ti.com
Message-ID: <20261105162117.GA4190@denix.org>
References: <CAFMvBt0wRnyFses6F3WNhSmxzNP-GvTi5tY3DgKCbVRTfMVcDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFMvBt0wRnyFses6F3WNhSmxzNP-GvTi5tY3DgKCbVRTfMVcDA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 05 Nov 2026 16:21:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20508

Yes, git.ti.com is periodically under heavy AI bot crawlers attack and 
sometimes goes down.

But meta-ti-bsp already sets up MIRRORS to point to github, where TI core 
repos, like kernel and u-boot, are mirrored. This works for most users 
automatically and doesn't break.

The error you are seeing is because you heve your own PREMIRRORS (e.g. using 
own-mirrors.bbclass), which contains an older clones of those repos and hence 
bitbake tries to use those, instead of falling back to MIRRORS, and can't find 
the required SRCREV:

| Error: UnpackError('No up to date source found: clone directory not available or not up to date:
| /home/troth/Yocto/Downloads/git2/git.ti.com.git.ti-linux-kernel.ti-linux-kernel.git


You can disable your PREMIRRORS temporarily and re-fetch affected components, 
then you can re-enable it back.

Please note that there are a few other TI repos, mostly used in meta-ti-extras 
and meta-ti-tests, which are not mirrored on github, but they haven't been 
updated in a while, so your existing copies from your PREMIRRORS should be 
fine.


On Thu, Nov 05, 2026 at 07:47:28AM -0700, Theodore A. Roth wrote:
> Hi All,
> 
> We started seeing errors in our yocto builds using meta-ti when
> building the latest linux-ti-staging-6.18.59+git-r0 from wrynose.
> 
> It appears that we can't clone or fetch from git.ti.com:
> 
>     $ git clone https://git.ti.com/git/ti-u-boot/ti-u-boot.git
>     Cloning into 'ti-u-boot'...
>     error: RPC failed; HTTP 501 curl 22 The requested URL returned error: 501
>     fatal: expected 'packfile'
> 
>     $ git clone https://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git
>     Cloning into 'ti-linux-kernel'...
>     error: RPC failed; HTTP 501 curl 22 The requested URL returned error: 501
>    fatal: expected 'packfile'
> 
> I have tried this both at home and in our offices (to check that corp
> firewall is not the issue).
> 
> Here's the relevant output from bitbake:
> 
>     $ bitbake virtual/kernel
>     ...
>     Build Configuration:
>     BB_VERSION           = "2.18.0"
>     BUILD_SYS            = "x86_64-linux"
>     NATIVELSBSTRING      = "universal"
>     TARGET_SYS           = "arm-trimble-linux-gnueabi"
>     MACHINE              = "judo-hs-prod"
>     SDKMACHINE           = "x86_64"
>     DISTRO               = "trmb-judo"
>     DISTRO_VERSION       = "1.1.1.dev20261104171417"
>     TUNE_FEATURES        = "arm armv7a vfp thumb neon callconvention-hard"
>     meta                 = "HEAD:ae5a301091f5b0574ea7444aab40b309b6d9f3f2"
>     meta-poky            = "HEAD:79b6d87030178bed0088ad3b00aa6dfbabac37c4"
>     meta-oe
>     meta-initramfs
>     meta-filesystems
>     meta-python
>     meta-networking
>     meta-webserver       = "HEAD:c734c2cb9713dbd6d50697a9f6c25ebdf3ae589e"
>     meta-virtualization  = "HEAD:18d58082b2458cf85438ac6e0f2f1fd0153318cb"
>     meta-arm-toolchain
>     meta-arm             = "HEAD:673e8d7c5dcd14de58092eb73e6ecc5eee5c1735"
>     meta-ti-bsp
>     meta-ti-extras       = "HEAD:066a7c440c0b241bca045133ec8cb5e506d49d98"
>     meta-clang           = "HEAD:ef0d22f21910a0c30c967eeb17d8f209806e2d81"
>     meta-rauc            = "HEAD:38da0e5866a953e664001ba90b5edad68d68cd5d"
>     meta-bedrock
>     meta-bedrock-rauc
>     meta-bedrock-yubi    = "HEAD:6c7b0bafe7b7d0871eb8c67ad467c845ccf6b1b9"
>     meta-judo            = "HEAD:d32ad65582a763e9a682d19d0c6e6f93e9233c1a"
>     meta-judo-bsp        = "HEAD:5dee33952a5fcb456045fb0598f3af59c66b65e6"
>     meta-judo-proprietary = "HEAD:75867ed0ea3fdf9943ec4bc9346835c6d099e119"
> 
>     Sstate summary: Wanted 110 Local 3 Mirrors 0 Missed 107 Current
> 167 (2% match, 61% complete)
>     ...
>     NOTE: Executing Tasks
>     WARNING: linux-ti-staging-6.18.59+git-r0 do_fetch: Failed to fetch
> URL git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git;protocol=https;branch=ti-linux-6.18.y,
> attempting MIRRORS if available
>     ERROR: linux-ti-staging-6.18.59+git-r0 do_unpack: Bitbake Fetcher
> Error: UnpackError('No up to date source found: clone directory not
> available or not up to date: \
>     /home/troth/Yocto/Downloads/git2/git.ti.com.git.ti-linux-kernel.ti-linux-kernel.git;
> shallow clone not enabled',
> 'git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git;protocol=https;branch=ti-linux-6.18.y')
>     ERROR: Logfile of failure stored in:
> /home/troth/work/judo/judo-main-next/build-hs-prod/tmp/work/judo_hs_prod-trimble-linux-gnueabi/linux-ti-staging/6.18.59+git/temp/log.do_unpack.517414
>     ERROR: Task
> (/home/troth/work/judo/judo-main-next/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb:do_unpack)
> failed with exit code '1'
> 
>     Summary: 1 task failed:
>       /home/troth/work/judo/judo-main-next/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb:do_unpack
>         log: /home/troth/work/judo/judo-main-next/build-hs-prod/tmp/work/judo_hs_prod-trimble-linux-gnueabi/linux-ti-staging/6.18.59+git/temp/log.do_unpack.517414
>     Summary: There was 1 WARNING message.
>     Summary: There was 1 ERROR message, returning a non-zero exit code.
> 
> Wondering if anyone else is seeing this.
> 
> The only workaround I have at the moment is to use the github mirror:
> 
>     https://github.com/TexasInstruments/ti-linux-kernel.git
> 
> Thanks,
> 
> Ted Roth
