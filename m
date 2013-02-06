Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13E09E00527
	for <meta-ti@yoctoproject.org>; Wed,  6 Feb 2013 07:43:18 -0800 (PST)
Received: by mail-ve0-f172.google.com with SMTP id cz11so1293919veb.31
	for <meta-ti@yoctoproject.org>; Wed, 06 Feb 2013 07:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=GLhEeq3ePgwXiZZ8UgBLicz3TygtIx6fm7iWsPv23HY=;
	b=gp47OopSckAirYExntt04zsEf3O/MY3tx8QGf5bsXriFoXEEaSDkZ4ElaDPp2CGBe/
	eet3/yKpSRklPe+7eynRIiWknwpq+EVBGQkMMPlM/DlrQgfzQPzZ9pNV1rECTlmtwymm
	CXDddmp06zbeJDC5WJZNh+hvRbou7wPkT9SW42cK427mE/XUV6ceiDcJQXy6KGSXIR1S
	0fz7CwhOZMFNkgcNkN24RwWN6IWp8y54T3AyjY0yv9V03j8IlrzS88yhNaweo6MMfTTY
	/3MsW3bU9Sd4E0C2YY7/IIDzHkhTRplGRbCksu2R/dijTHv9wK0KMFG73YkQ5FWA1pyP
	FQ7Q==
MIME-Version: 1.0
X-Received: by 10.220.226.70 with SMTP id iv6mr33433930vcb.9.1360165398244;
	Wed, 06 Feb 2013 07:43:18 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Wed, 6 Feb 2013 07:43:18 -0800 (PST)
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE72E72EEEE@DLEE09.ent.ti.com>
References: <1360133872-10658-1-git-send-email-fcooper@ti.com>
	<1360133872-10658-2-git-send-email-fcooper@ti.com>
	<CALbNGRR-qnMUwuVNfehbvJRU9MqP5+EZhhhYji48x7UQTkfhJg@mail.gmail.com>
	<B0581B5571079145BA1CD78C126DBDE72E72EEEE@DLEE09.ent.ti.com>
Date: Wed, 6 Feb 2013 16:43:18 +0100
Message-ID: <CALbNGRTz2rWBf3TCNziVM5dWOB1hMgTV=9O6w+vUZXDm+jd=4Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 06 Feb 2013 15:43:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 6, 2013 at 9:38 AM, Dmytriyenko, Denys <denys@ti.com> wrote:
> 3.2
>
>
> Denys
>
>
>
> -----Original Message-----
> From: Andreas M=C3=BCller [schnitzeltony@googlemail.com]
> Received: Wednesday, 06 Feb 2013, 2:34
> To: fcooperjr27@gmail.com [fcooperjr27@gmail.com]
> CC: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
> Subject: Re: [meta-ti] [PATCH 2/2] omap3-sgx-modules: Add v4.08.00.01 of =
the
> SGX modules
>
> On Wed, Feb 6, 2013 at 7:57 AM,  <fcooperjr27@gmail.com> wrote:
>> From: Franklin S. Cooper Jr <fcooper@ti.com>
>>
>> * Add version 4.08.00.01 of the SGX modules.
>>
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>> Version 2:
>> Update SRC_URI link to use official SDK download link
>>
>>  .../omap3-sgx-modules_4.08.00.01.bb                |   56
>> ++++++++++++++++++++
>>  1 files changed, 56 insertions(+), 0 deletions(-)
>>  create mode 100644
>> recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb
>>
> Just a question: With which kernel version did you test that - because
> 4.05 currently used need patching for kernels > 3.3 for me.
>
> Andreas

With linux-omap 3.5 which I use in meta-gumstix-community for a while I get

ERROR: Function failed: do_compile (see
/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/omap3-sg=
x-modules/4.08.00.01-r122a/temp/log.do_compile.1757
for further information)
ERROR: Logfile of failure stored in:
/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/omap3-sg=
x-modules/4.08.00.01-r122a/temp/log.do_compile.1757
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 12 -e MAKEFLAGS=3D
KERNEL_PATH=3D/home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/src/kerne=
l
KERNEL_SRC=3D/home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel
KERNEL_VERSION=3D3.5.0 CC=3Darm-angstrom-linux-gnueabi-gcc  -march=3Darmv7-=
a
    -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon
--sysroot=3D/home/andreas/tmp/oe-core-eglibc/sysroots/overo
-mno-thumb-interwork -marm LD=3Darm-angstrom-linux-gnueabi-ld
--sysroot=3D/home/andreas/tmp/oe-core-eglibc/sysroots/overo
AR=3Darm-angstrom-linux-gnueabi-ar  BUILD=3Drelease TI_PLATFORM=3Domap3630
SUPPORT_XORG=3D1
| make -C /home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel M=
=3D`pwd`
| make[1]: Entering directory
`/home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel'
|   LD      /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnue=
abi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Linux_KM=
/services4/3rdparty/bufferclass_ti/built-in.o
|   CC [M]  /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnue=
abi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Linux_KM=
/services4/3rdparty/bufferclass_ti/bc_cat.o
|   LD [M]  /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnue=
abi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Linux_KM=
/services4/3rdparty/bufferclass_ti/bufferclass_ti.o
|   LD      /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnue=
abi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Linux_KM=
/services4/3rdparty/linux_drm/built-in.o
|   CC [M]  /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnue=
abi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Linux_KM=
/services4/3rdparty/linux_drm/pvr_drm_stubs.o

| make[3]: *** No rule to make target
`/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/omap3-s=
gx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/=
3rdparty/linux_drm/drm_auth.o',
needed by `/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnuea=
bi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/=
services4/3rdparty/linux_drm/drm.o'.
 Stop.
| make[2]: *** [/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-=
gnueabi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Linu=
x_KM/services4/3rdparty/linux_drm]
Error 2
| make[1]: *** [_module_/home/andreas/tmp/oe-core-eglibc/work/overo-angstro=
m-linux-gnueabi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/=
GFX_Linux_KM]
Error 2
| make[1]: Leaving directory
`/home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see
/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/omap3-sg=
x-modules/4.08.00.01-r122a/temp/log.do_compile.1757
for further information)

I added CONFIG_DRM_OMAP=3Dm (CONFIG_DRM=3Dy was there already at first
run) but the same error.

drm_auth.o is not found in my sysroot/kernel-image-folder but was
built and can be found in the build folder of the kernel.

Any thoughts?

Andreas

