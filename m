Return-Path: <eballetbo@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1388FE0145C
	for <meta-ti@yoctoproject.org>; Wed,  3 Jul 2013 07:44:24 -0700 (PDT)
Received: by mail-wg0-f52.google.com with SMTP id b12so206098wgh.7
	for <meta-ti@yoctoproject.org>; Wed, 03 Jul 2013 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=40cifEiNyEk8C+f3/K+XP6o8YWIaIwbMCh+gCxJmoSw=;
	b=t9qsHhuaDm/gdfgopZ3asIu8DJSNp6QAyQdGW9HPuiQgqf8xfAUSNHK62WoVDHvFgV
	r6kj2BnAuVG6N0FHFTWAVrAjkgPjzgCfy8zVJA7pyFK3HplRyhB58HPIt0s2k9+I8ANq
	nIBdUexY53mhUxKzIVM+IS1pfH7vemYJlAtkhyw4G93TH5Rt5lKEXp5QLNYQdE7rUyr0
	3nz/jhAACefTV8u4hm4SWv15MgDQOMRUx15HUwgAEvfeNdGayY8dxeJLkXIAwnbVEwY0
	EZS6rUndaxrUl49Q9eZ2JdqevckjCxzKJrVwirhIVwzuDEwR9O9PtjjzP97Ly+VS7s+x
	1IPw==
MIME-Version: 1.0
X-Received: by 10.180.76.206 with SMTP id m14mr747618wiw.38.1372862663524;
	Wed, 03 Jul 2013 07:44:23 -0700 (PDT)
Received: by 10.194.104.65 with HTTP; Wed, 3 Jul 2013 07:44:23 -0700 (PDT)
In-Reply-To: <CAFqH_518YDzw43QM-hRmrQt7kCVOK1n_39MGQk8Fg-DUDZpDng@mail.gmail.com>
References: <prabu@ti.com> <1371057762-17055-1-git-send-email-prabu@ti.com>
	<20130620043900.GQ13356@edge>
	<CAFqH_518YDzw43QM-hRmrQt7kCVOK1n_39MGQk8Fg-DUDZpDng@mail.gmail.com>
Date: Wed, 3 Jul 2013 16:44:23 +0200
Message-ID: <CAFqH_51HO7Pe=QrRSQ_Hu0=2u+tBPpBVHQqevqS-6vw59YewtA@mail.gmail.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 0/9] Graphics SDK cleanup
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jul 2013 14:44:25 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

2013/7/3 Enric Balletbo Serra <eballetbo@gmail.com>:
> Hi all,
>
> 2013/6/20 Denys Dmytriyenko <denys@ti.com>:
>> Prabu,
>>
>> There were few issues I found when testing your patches, but I've been working
>> on the fixes past few days and should have it ready to be pushed shortly.
>>
>> Not to force you to re-send the patches again, but ligles-omap3-x11 was
>> actually missing. But even when added manually, it was causing conflicts with
>> no-X11 version, breaking the parsing for distros w/o X11. Moreover, as was
>> discussed long time ago, having both X11 and Raw variants of libraries and
>> apps built and installed together is very useful for all-inclusive distros, so
>> making those recipes conflict and replace each other is not a right way...
>>
>> Having said all the above, I've done the necessary mods and am testing
>> building different configurations at the moment. I'll let you know if I see
>> any other issues. Thanks.
>>
>> --
>> Denys
>>
>>
>> On Wed, Jun 12, 2013 at 10:52:33PM +0530, Prabindh Sundareson wrote:
>>> Patch-set removes unsupported features, and separates X11 and non-X11
>>> builds, and enables support for Qt5 builds. This patch-set also squashes 2
>>> commits together per discussion at
>>> https://lists.yoctoproject.org/pipermail/meta-ti/2013-May/002774.html
>>>
>>> Prabindh Sundareson (9):
>>>   libgles-omap3: Remove X11 related build and packaging
>>>   omap3-sgx-modules: Remove X11 related build and packaging
>>>   libgles-omap3: Remove unsupported core build option ES2.0
>>>   libgles-omap3: Remove OpenVG references
>>>   libgles-omap3: Remove copying of unused header files
>>>   libgles-omap3: Add missing RPROVIDES
>>>   libgles-omap3: Package files with right permission
>>>   libgles-omap3-x11: Separate X11 SGX driver package into new recipe
>>>   omap3-sgx-modules-x11: Separate X11 SGX driver package into new
>>>     recipe
>>>
>>>  .../Compile-fixes-for-38-kernel.patch              |  346 ++++++++++++++++++++
>>>  .../omap3-sgx-modules-x11/kernel-30.patch          |   38 +++
>>>  .../omap3-sgx-modules-x11_4.09.00.01.bb            |   74 +++++
>>>  .../omap3-sgx-modules_4.09.00.01.bb                |    9 +-
>>>  recipes-graphics/libgles/libgles-omap3-no-x.inc    |  318 ++++++++++++++++++
>>>  .../libgles/libgles-omap3-x11-4.09.00.01/rc.pvr    |  125 +++++++
>>>  .../libgles-omap3-x11-4.09.00.01/rc_dri.pvr        |  137 ++++++++
>>>  recipes-graphics/libgles/libgles-omap3-x11.inc     |  323 ++++++++++++++++++
>>>  .../libgles/libgles-omap3_4.09.00.01.bb            |   45 +---
>>>  9 files changed, 1365 insertions(+), 50 deletions(-)
>>>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11/Compile-fixes-for-38-kernel.patch
>>>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11/kernel-30.patch
>>>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
>>>  create mode 100644 recipes-graphics/libgles/libgles-omap3-no-x.inc
>>>  create mode 100644 recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc.pvr
>>>  create mode 100644 recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc_dri.pvr
>>>  create mode 100644 recipes-graphics/libgles/libgles-omap3-x11.inc
>>>
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>
>
> Shouldn't the libgles-omap3_4.09.00.01.bb depends on libdrm ? I get
> following error trying to create a image that installs libgles-omap3
> but not libdrm.
>
> | Computing transaction...error: Can't install
> libgles-omap3-es5-4.09.00.01-r35@armv7a_vfp_neon: no package provides
> libdrm.so.2
>
> Adding libdrm to the image solves the problem.
>
> Cheers,
>     Enric


Mmm, sorry I'm missing something...

As I understand the libgles-omap3 package is without X11 and the
libgles-omap3-x11 packages is with X11, then, why when I'm installing
libgles-omap3 (without X11) requires some X stuff like libdrm, libX11
and libXfixes.

Any idea ?

Thanks in advance,
    Enric

