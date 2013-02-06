Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3485BE0071D
	for <meta-ti@yoctoproject.org>; Wed,  6 Feb 2013 07:57:48 -0800 (PST)
Received: by mail-vc0-f179.google.com with SMTP id gb23so924467vcb.24
	for <meta-ti@yoctoproject.org>; Wed, 06 Feb 2013 07:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=CPSdCLvF6uk5ET1w5rAjb4gXXv2I2mrGfp2diqOBxro=;
	b=jsny8eILkUlBXQeslBR8hdgrUgA8QeHGP3H13BNneEnpqlMwH408PTVzkvN+Ui7x07
	uMM6ofPRSOXxFX2jOhCq4R/jef5RfeW9pFGfZbqv9SvkpXrXriXe8qRK7NnJeMnehElb
	MzAmOz5RlpJywy3bONGrEnXm8fHQRC/pmSFVLwqlynEfnkOcEiWgTuvi1HniwNN+FZ75
	ooMBsmVGArn1kTf5y5w5UVQJxQFitmkgqh98jhqR0wJcTK93IgnHAwuvNjgPsa5dK2CX
	GK6m4TiZc2QAqIXHMl6fo7RfYXq9VgymrIvZMiOe3P/zclEAiYWnEUOqXyxNTr6kgyqL
	C/0A==
MIME-Version: 1.0
X-Received: by 10.52.32.230 with SMTP id m6mr14917380vdi.83.1360166267672;
	Wed, 06 Feb 2013 07:57:47 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Wed, 6 Feb 2013 07:57:47 -0800 (PST)
In-Reply-To: <CALbNGRTz2rWBf3TCNziVM5dWOB1hMgTV=9O6w+vUZXDm+jd=4Q@mail.gmail.com>
References: <1360133872-10658-1-git-send-email-fcooper@ti.com>
	<1360133872-10658-2-git-send-email-fcooper@ti.com>
	<CALbNGRR-qnMUwuVNfehbvJRU9MqP5+EZhhhYji48x7UQTkfhJg@mail.gmail.com>
	<B0581B5571079145BA1CD78C126DBDE72E72EEEE@DLEE09.ent.ti.com>
	<CALbNGRTz2rWBf3TCNziVM5dWOB1hMgTV=9O6w+vUZXDm+jd=4Q@mail.gmail.com>
Date: Wed, 6 Feb 2013 16:57:47 +0100
Message-ID: <CALbNGRQ1+WTt4uekk4rPcnQzhZzwTzpCd_NkZTXfDjQb4Z9N+A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] omap3-sgx-modules: Add v4.08.00.01 of the SGX modules
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
X-List-Received-Date: Wed, 06 Feb 2013 15:57:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 6, 2013 at 4:43 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Feb 6, 2013 at 9:38 AM, Dmytriyenko, Denys <denys@ti.com> wrote:
>> 3.2
>>
>>
>> Denys
>>
>>
>>
>> -----Original Message-----
>> From: Andreas M=C3=BCller [schnitzeltony@googlemail.com]
>> Received: Wednesday, 06 Feb 2013, 2:34
>> To: fcooperjr27@gmail.com [fcooperjr27@gmail.com]
>> CC: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
>> Subject: Re: [meta-ti] [PATCH 2/2] omap3-sgx-modules: Add v4.08.00.01 of=
 the
>> SGX modules
>>
>> On Wed, Feb 6, 2013 at 7:57 AM,  <fcooperjr27@gmail.com> wrote:
>>> From: Franklin S. Cooper Jr <fcooper@ti.com>
>>>
>>> * Add version 4.08.00.01 of the SGX modules.
>>>
>>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>>> ---
>>> Version 2:
>>> Update SRC_URI link to use official SDK download link
>>>
>>>  .../omap3-sgx-modules_4.08.00.01.bb                |   56
>>> ++++++++++++++++++++
>>>  1 files changed, 56 insertions(+), 0 deletions(-)
>>>  create mode 100644
>>> recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb
>>>
>> Just a question: With which kernel version did you test that - because
>> 4.05 currently used need patching for kernels > 3.3 for me.
>>
>> Andreas
>
> With linux-omap 3.5 which I use in meta-gumstix-community for a while I g=
et
>
> ERROR: Function failed: do_compile (see
> /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/omap3-=
sgx-modules/4.08.00.01-r122a/temp/log.do_compile.1757
> for further information)
> ERROR: Logfile of failure stored in:
> /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/omap3-=
sgx-modules/4.08.00.01-r122a/temp/log.do_compile.1757
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 12 -e MAKEFLAGS=3D
> KERNEL_PATH=3D/home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/src/ker=
nel
> KERNEL_SRC=3D/home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/src/kern=
el
> KERNEL_VERSION=3D3.5.0 CC=3Darm-angstrom-linux-gnueabi-gcc  -march=3Darmv=
7-a
>     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon
> --sysroot=3D/home/andreas/tmp/oe-core-eglibc/sysroots/overo
> -mno-thumb-interwork -marm LD=3Darm-angstrom-linux-gnueabi-ld
> --sysroot=3D/home/andreas/tmp/oe-core-eglibc/sysroots/overo
> AR=3Darm-angstrom-linux-gnueabi-ar  BUILD=3Drelease TI_PLATFORM=3Domap363=
0
> SUPPORT_XORG=3D1
> | make -C /home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel =
M=3D`pwd`
> | make[1]: Entering directory
> `/home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel'
> |   LD      /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gn=
ueabi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Linux_=
KM/services4/3rdparty/bufferclass_ti/built-in.o
> |   CC [M]  /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gn=
ueabi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Linux_=
KM/services4/3rdparty/bufferclass_ti/bc_cat.o
> |   LD [M]  /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gn=
ueabi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Linux_=
KM/services4/3rdparty/bufferclass_ti/bufferclass_ti.o
> |   LD      /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gn=
ueabi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Linux_=
KM/services4/3rdparty/linux_drm/built-in.o
> |   CC [M]  /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gn=
ueabi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Linux_=
KM/services4/3rdparty/linux_drm/pvr_drm_stubs.o
>
> | make[3]: *** No rule to make target
> `/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/omap3=
-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services=
4/3rdparty/linux_drm/drm_auth.o',
> needed by `/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnu=
eabi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Linux_K=
M/services4/3rdparty/linux_drm/drm.o'.
>  Stop.
> | make[2]: *** [/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linu=
x-gnueabi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Li=
nux_KM/services4/3rdparty/linux_drm]
> Error 2
> | make[1]: *** [_module_/home/andreas/tmp/oe-core-eglibc/work/overo-angst=
rom-linux-gnueabi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_0=
1/GFX_Linux_KM]
> Error 2
> | make[1]: Leaving directory
> `/home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see
> /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/omap3-=
sgx-modules/4.08.00.01-r122a/temp/log.do_compile.1757
> for further information)
>
> I added CONFIG_DRM_OMAP=3Dm (CONFIG_DRM=3Dy was there already at first
> run) but the same error.
>
> drm_auth.o is not found in my sysroot/kernel-image-folder but was
> built and can be found in the build folder of the kernel.
>
> Any thoughts?
>
> Andreas

One - maybe stupid - question: Have you tested with latest oe-core -or
do you have

commit c753f9d59f4d0a5af4ea5deb6e2b9609e05314e2
Author: Mark Asselstine <mark.asselstine@windriver.com>
Date:   Thu Jan 31 13:31:03 2013 -0500

    kernel: avoid copying unnecessary files during do_install

    kernel_do_install() populates $kerneldir with files needed to build
    external modules. To accomplish this there are several copy commands
    to get source from the kernel source tree and build trees after which
    a 'clean' is performed. Since we are copying from the build tree we
    get about 1G of .o and .cmd files copied over only to have them
    removed when we clean. This adds additional IO overhead as well as
    overhead caused by pseudo. By avoiding copying these files in the
    first place we get multiple gains:
      * avoid initial copy
      * avoid file deletes during clean
      * reduce pseudo overhead

    Additionally we are making use of cpio vs cp which tends to be
    significantly faster at performing copies.

    With these changes I observe a 15-30% decrease in the time to complete
    the do_install() operation on the kernel.

    [YOCTO #3517]

    Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

in your repo?

Andreas

