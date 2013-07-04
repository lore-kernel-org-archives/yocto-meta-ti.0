Return-Path: <eballetbo@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85108E01482
	for <meta-ti@yoctoproject.org>; Thu,  4 Jul 2013 08:53:52 -0700 (PDT)
Received: by mail-wg0-f43.google.com with SMTP id z11so1271070wgg.10
	for <meta-ti@yoctoproject.org>; Thu, 04 Jul 2013 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jbxdUEFUAgt/aYJyqFkg3jZcg1F9CjkUUQx88Q84Lqo=;
	b=XI4v27fgVeRcPSBQpLuCZnuxbv5rLoAcSJGovq2fyyekn4O+cK/HStgzll9SxIBnIF
	bFaBP5+cEuivq+w6kRRd1MrxeR/vYQx+lQdxVYiKyMbNCx+0faB6ZcpZ8dGRgXlAcMd0
	XFm0PXj+W/yFu+Ql2Nm4Wf3nCD5tSvbP1LcNMP9CSo+KxD5a8JOvqfFeTy68nO8FseKu
	APfWD++T9UVvf2lEcXL1YLZ1XQiOKDUrCClHPgSoN98NGeK+gdK99M9myuOu91OGBp0T
	xIctzLWoxNZbb0TSBwFs7SdUucZ1Etw/pZFLKWmP7Y9LnpKtZy1WrhyBxY7/kVCW3vrk
	9F7w==
MIME-Version: 1.0
X-Received: by 10.180.98.233 with SMTP id el9mr3669508wib.54.1372953231494;
	Thu, 04 Jul 2013 08:53:51 -0700 (PDT)
Received: by 10.194.104.65 with HTTP; Thu, 4 Jul 2013 08:53:51 -0700 (PDT)
In-Reply-To: <CAFqH_52LYwT-FyYx0t9NAp5OPVxn4O2ZpSfz6+c-BfT_3agmxg@mail.gmail.com>
References: <prabu@ti.com> <1371057762-17055-1-git-send-email-prabu@ti.com>
	<20130620043900.GQ13356@edge>
	<CAFqH_518YDzw43QM-hRmrQt7kCVOK1n_39MGQk8Fg-DUDZpDng@mail.gmail.com>
	<CAFqH_51HO7Pe=QrRSQ_Hu0=2u+tBPpBVHQqevqS-6vw59YewtA@mail.gmail.com>
	<20130703155932.GD8850@edge>
	<CAFqH_52LYwT-FyYx0t9NAp5OPVxn4O2ZpSfz6+c-BfT_3agmxg@mail.gmail.com>
Date: Thu, 4 Jul 2013 17:53:51 +0200
Message-ID: <CAFqH_50tqO765pwsDPtR6kWgRBEtm-okL1Oe-2xERHP=55TAqw@mail.gmail.com>
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
X-List-Received-Date: Thu, 04 Jul 2013 15:53:53 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

2013/7/3 Enric Balletbo Serra <eballetbo@gmail.com>:
> Hi Denys,
>
> 2013/7/3 Denys Dmytriyenko <denys@ti.com>:
>> On Wed, Jul 03, 2013 at 04:44:23PM +0200, Enric Balletbo Serra wrote:
>>> Hi,
>>>
>>> 2013/7/3 Enric Balletbo Serra <eballetbo@gmail.com>:
>>> > Hi all,
>>> >
>>> > 2013/6/20 Denys Dmytriyenko <denys@ti.com>:
>>> >> Prabu,
>>> >>
>>> >> There were few issues I found when testing your patches, but I've been working
>>> >> on the fixes past few days and should have it ready to be pushed shortly.
>>> >>
>>> >> Not to force you to re-send the patches again, but ligles-omap3-x11 was
>>> >> actually missing. But even when added manually, it was causing conflicts with
>>> >> no-X11 version, breaking the parsing for distros w/o X11. Moreover, as was
>>> >> discussed long time ago, having both X11 and Raw variants of libraries and
>>> >> apps built and installed together is very useful for all-inclusive distros, so
>>> >> making those recipes conflict and replace each other is not a right way...
>>> >>
>>> >> Having said all the above, I've done the necessary mods and am testing
>>> >> building different configurations at the moment. I'll let you know if I see
>>> >> any other issues. Thanks.
>>> >>
>>> >> --
>>> >> Denys
>>> >>
>>> >>
>>> >> On Wed, Jun 12, 2013 at 10:52:33PM +0530, Prabindh Sundareson wrote:
>>> >>> Patch-set removes unsupported features, and separates X11 and non-X11
>>> >>> builds, and enables support for Qt5 builds. This patch-set also squashes 2
>>> >>> commits together per discussion at
>>> >>> https://lists.yoctoproject.org/pipermail/meta-ti/2013-May/002774.html
>>> >>>
>>> >>> Prabindh Sundareson (9):
>>> >>>   libgles-omap3: Remove X11 related build and packaging
>>> >>>   omap3-sgx-modules: Remove X11 related build and packaging
>>> >>>   libgles-omap3: Remove unsupported core build option ES2.0
>>> >>>   libgles-omap3: Remove OpenVG references
>>> >>>   libgles-omap3: Remove copying of unused header files
>>> >>>   libgles-omap3: Add missing RPROVIDES
>>> >>>   libgles-omap3: Package files with right permission
>>> >>>   libgles-omap3-x11: Separate X11 SGX driver package into new recipe
>>> >>>   omap3-sgx-modules-x11: Separate X11 SGX driver package into new
>>> >>>     recipe
>>> >>>
>>> >>>  .../Compile-fixes-for-38-kernel.patch              |  346 ++++++++++++++++++++
>>> >>>  .../omap3-sgx-modules-x11/kernel-30.patch          |   38 +++
>>> >>>  .../omap3-sgx-modules-x11_4.09.00.01.bb            |   74 +++++
>>> >>>  .../omap3-sgx-modules_4.09.00.01.bb                |    9 +-
>>> >>>  recipes-graphics/libgles/libgles-omap3-no-x.inc    |  318 ++++++++++++++++++
>>> >>>  .../libgles/libgles-omap3-x11-4.09.00.01/rc.pvr    |  125 +++++++
>>> >>>  .../libgles-omap3-x11-4.09.00.01/rc_dri.pvr        |  137 ++++++++
>>> >>>  recipes-graphics/libgles/libgles-omap3-x11.inc     |  323 ++++++++++++++++++
>>> >>>  .../libgles/libgles-omap3_4.09.00.01.bb            |   45 +---
>>> >>>  9 files changed, 1365 insertions(+), 50 deletions(-)
>>> >>>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11/Compile-fixes-for-38-kernel.patch
>>> >>>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11/kernel-30.patch
>>> >>>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
>>> >>>  create mode 100644 recipes-graphics/libgles/libgles-omap3-no-x.inc
>>> >>>  create mode 100644 recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc.pvr
>>> >>>  create mode 100644 recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc_dri.pvr
>>> >>>  create mode 100644 recipes-graphics/libgles/libgles-omap3-x11.inc
>>> >>>
>>> >>> _______________________________________________
>>> >>> meta-ti mailing list
>>> >>> meta-ti@yoctoproject.org
>>> >>> https://lists.yoctoproject.org/listinfo/meta-ti
>>> >> _______________________________________________
>>> >> meta-ti mailing list
>>> >> meta-ti@yoctoproject.org
>>> >> https://lists.yoctoproject.org/listinfo/meta-ti
>>> >
>>> >
>>> > Shouldn't the libgles-omap3_4.09.00.01.bb depends on libdrm ? I get
>>> > following error trying to create a image that installs libgles-omap3
>>> > but not libdrm.
>>> >
>>> > | Computing transaction...error: Can't install
>>> > libgles-omap3-es5-4.09.00.01-r35@armv7a_vfp_neon: no package provides
>>> > libdrm.so.2
>>> >
>>> > Adding libdrm to the image solves the problem.
>>> >
>>> > Cheers,
>>> >     Enric
>>>
>>>
>>> Mmm, sorry I'm missing something...
>>>
>>> As I understand the libgles-omap3 package is without X11 and the
>>> libgles-omap3-x11 packages is with X11, then, why when I'm installing
>>> libgles-omap3 (without X11) requires some X stuff like libdrm, libX11
>>> and libXfixes.
>>>
>>> Any idea ?
>>
>> Which branch are you using?
>
> I'm using master branch, with libgles-omap3_4.09.00.01 and
> omap3-sgx-modules_4.09.00.01.bb set as DEFAULT_PREFERENCE
>
>> What is your setup/configuration/machine/target?
>
> My machine is a custom machine based on AM335x processor, and the
> image, is also custom, but basically I install some console stuff and
> libgles-omap3. If you want I can try to reproduce creating a minimal
> image for beaglebone.
>

I modified the package to do not install the libraries that depends on
libdrm (pvr_drv.so libpvrPVR2D_DRIWSEGL.so libsrv_um_dri.so). Now I've
following error loading running the pvr-init script:

ioctl FBIOPUT_VSCREENINFO: Invalid argument
Starting PVR
[   11.968592] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
[   11.977139] pgd = de560000
[   11.979994] [00000000] *pgd=9e5f9831, *pte=00000000, *ppte=00000000
[   11.986641] Internal error: Oops: 17 [#1] SMP ARM
[   11.991568] Modules linked in: omaplfb(O+) pvrsrvkm(O)
[   11.996971] CPU: 0    Tainted: G           O  (3.8.13+ #1)
[   12.002840] PC is at AllocateDeviceID+0x0/0x48 [pvrsrvkm]
[   12.008525] LR is at PVRSRVRegisterDCDeviceKM+0xf0/0x178 [pvrsrvkm]
[   12.015091] pc : [<bf0063f0>]    lr : [<bf0026b4>]    psr: 40000013
[   12.015091] sp : de565e18  ip : de0d0398  fp : 0000001c
[   12.027115] r10: 00000001  r9 : 00000000  r8 : 000a8c00
[   12.032586] r7 : df6ae898  r6 : 00000000  r5 : df6ae804  r4 : 00000000
[   12.039422] r3 : de0d02c0  r2 : 00000001  r1 : de0d02c8  r0 : 00000000
[   12.046260] Flags: nZcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
[   12.053734] Control: 10c5387d  Table: 9e560019  DAC: 00000015
[   12.059752] Process modprobe (pid: 600, stack limit = 0xde564240)
[   12.066133] Stack: (0xde565e18 to 0xde566000)
[   12.074104] 5e00:
    de2389c0 de0d02c0
[   12.083159] 5e20: 00000032 df6ae800 00000000 00000000 000b4000
bf03ac64 c0969874 ffffffff
[   12.092276] 5e40: bf03bd54 00000001 00000001 bf03bd54 de565f58
00000000 00000001 bf03bd9c
[   12.101149] 5e60: bf03e000 bf03e008 de564000 c0008890 bf03e000
00000000 00000001 bf03bd54
[   12.110275] 5e80: bf03bd54 de565f58 00000000 00000001 bf03bd9c
00000001 de35ef80 c008a57c
[   12.119290] 5ea0: bf03bd60 00007fff c008648c 00000010 c0087a74
00000028 00000000 bf03bd60
[   12.128214] 5ec0: bf03bea8 000000c7 c0624424 e09e91f4 de565eec
4bc984d8 20000013 c087b058
[   12.137101] 5ee0: de565f1c c0619ad8 e09eb000 b6e75000 00000acd
00000000 00000000 00000000
[   12.147911] 5f00: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[   12.156627] 5f20: 00000000 00000000 00000000 00000000 000000d2
b6e6d000 00008b4d 4bc984d8
[   12.168231] 5f40: 00000080 c000dac4 de564000 00000000 00000000
c008a8f8 e09e3000 00008b4d
[   12.177017] 5f60: e09e8bdc e09e8a2c e09eb37c 00001ec4 00002684
00000000 00000000 00000000
[   12.185757] 5f80: 00000027 00000028 00000015 00000019 00000012
00000000 4bc9925c 00000000
[   12.194483] 5fa0: 00022db0 c000d940 4bc9925c 00000000 b6e6d000
00008b4d 4bc984d8 00022db0
[   12.203203] 5fc0: 4bc9925c 00000000 00022db0 00000080 00022ec0
00008b4d 4bc984d8 00000000
[   12.211919] 5fe0: 4bca1b78 bea0a9a8 4bc90790 4bba7770 60000010
b6e6d000 00105b04 20230200
[   12.220696] [<bf0063f0>] (AllocateDeviceID+0x0/0x48 [pvrsrvkm])
from [<bf0026b4>] (PVRSRVRegisterDCDeviceKM+0xf0/0x178 [pvrsrvkm])
[   12.233166] [<bf0026b4>] (PVRSRVRegisterDCDeviceKM+0xf0/0x178
[pvrsrvkm]) from [<bf03ac64>] (OMAPLFBInit+0x3e0/0x548 [omaplfb])
[   12.245248] [<bf03ac64>] (OMAPLFBInit+0x3e0/0x548 [omaplfb]) from
[<bf03e008>] (OMAPLFB_Init+0x8/0x2c [omaplfb])
[   12.255952] [<bf03e008>] (OMAPLFB_Init+0x8/0x2c [omaplfb]) from
[<c0008890>] (do_one_initcall+0x90/0x160)
[   12.266010] [<c0008890>] (do_one_initcall+0x90/0x160) from
[<c008a57c>] (load_module+0x1944/0x1bf4)
[   12.275537] [<c008a57c>] (load_module+0x1944/0x1bf4) from
[<c008a8f8>] (sys_init_module+0xcc/0xec)
[   12.284957] [<c008a8f8>] (sys_init_module+0xcc/0xec) from
[<c000d940>] (ret_fast_syscall+0x0/0x30)
[   12.294728] Code: e3e00000 ebffed9d e1a00004 e8bd8038 (e5902000)
[   12.301154] ---[ end trace 8828fbcbbe3723c2 ]---
Segmentation fault


Any idea which could be the problem ?

Thanks in advance,
    Enric

>
>>
>> --
>> Denys

