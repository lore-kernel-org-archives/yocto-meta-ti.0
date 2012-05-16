Return-Path: <raj.khem@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 228E7E01408
	for <meta-ti@yoctoproject.org>; Tue, 15 May 2012 18:32:20 -0700 (PDT)
Received: by eekb45 with SMTP id b45so46282eek.35
	for <meta-ti@yoctoproject.org>; Tue, 15 May 2012 18:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sjpHcPBag6WjMQMNDTJD00RopgU3D3cCsx5CcBEs/Eo=;
	b=bPVEdmsNYY3nqYUawhIKVDfj5UMrilG0ZMqNOpqCEp8uGQQ3yxyokChsySmJdRaWgA
	NL7sEtt8O3TGR2Au3LHa8/TBg7adi0abujUy70qM+aGMPmyYDQZNDox+TuQZYUyYfn9v
	YvOTAz9hPJyxw4BP0mcBwPCwpTY6A5I+oM477Hp3OZNQUBIVvsATouaBhYNNn704virr
	CPD76EbNqJqgSdFag2oUXuK2zAcdqEcshILyNNM5B9il/Y+30tEKkNmV6V/TdoZK5jIk
	Mw0QVUbafdBiwMQWzAeuDnoiXTjEmWG8S7v33MOEppjlxO6gnLgGCR/GTCDGWnb13n5T
	pIug==
MIME-Version: 1.0
Received: by 10.213.121.130 with SMTP id h2mr972883ebr.122.1337131939784; Tue,
	15 May 2012 18:32:19 -0700 (PDT)
Received: by 10.14.2.132 with HTTP; Tue, 15 May 2012 18:32:19 -0700 (PDT)
In-Reply-To: <20120516001134.GL14763@denix.org>
References: <1336704080-23643-1-git-send-email-denis@denix.org>
	<F63AF365-5587-4FDC-A8CC-F47BD2E01DB8@dominion.thruhere.net>
	<CAMKF1spefVF84MbRzjgjwKk71dwGP5FcUH5+RsbnCBFLHfO81A@mail.gmail.com>
	<20120516001134.GL14763@denix.org>
Date: Tue, 15 May 2012 18:32:19 -0700
Message-ID: <CAMKF1sqhPAMLS+dydumVmY7LrCYAYVT-nsMOtpceC9Bf1dNs_Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] linux-ti33x-psp 3.2: avoid gold linker for Thumb2 kernel
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 16 May 2012 01:32:21 -0000
Content-Type: multipart/alternative; boundary=20cf3066788349e7cf04c01d4aca

--20cf3066788349e7cf04c01d4aca
Content-Type: text/plain; charset=UTF-8

On Tuesday, May 15, 2012, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, May 11, 2012 at 06:21:12PM -0700, Khem Raj wrote:
>> On Thu, May 10, 2012 at 11:46 PM, Koen Kooi <koen@dominion.thruhere.net>
wrote:
>> >
>> > Op 11 mei 2012, om 04:41 heeft Denys Dmytriyenko het volgende
geschreven:
>> >
>> >> From: Denys Dmytriyenko <denys@ti.com>
>> >>
>> >> BeagleBone kernel is required to be built in Thumb2 mode for fast
boot.
>> >> Gold linker is not yet perfect for this, giving an internal error:
>> >>
>> >> | arm-linux-gnueabi-ld: internal error in thumb_branch_common, at
.../binutils-cross-2.22-r6/binutils-2.22/gold/arm.cc:4149
>> >>
>> >> While this fix can be put in generic linux.inc for all the kernels,
it's
>> >> better to test the Gold linker out as much as possible and only
disable it
>> >> for known issues, like this one (until it gets fixed, of course).
>> >>
>> >> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> >
>> > Looks good to me.
>>
>> OK here is blind shot. Try this binutils patch and let me know if it
helps.
>>
>>
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/gold&id=b72f3238ad32ab420306a0226d8c2e57c52ddf45
>
> No luck - it now just segfaults where it used to give an internal error:
>
>  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm
--sysroot=/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone
-Wp,-MD,kernel/.printk.o.d  -nostdinc -isystem
/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include
-I/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include
-Iarch/arm/include/generated -Iinclude  -include
/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h
-D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include
-Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes
-Wno-trigraphs -fno-strict-aliasing -fno-common
-Werror-implicit-function-declaration -Wno-format-security
-fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm
-mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -mthumb
-Wa,-mimplicit-it=always -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=7
-march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024
-fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer
-Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow
-fconserve-stack -DCC_HAVE_ASM_GOTO -D"KBUILD_STR(s)=#s"
-D"KBUILD_BASENAME=KBUILD_STR(printk)"
-D"KBUILD_MODNAME=KBUILD_STR(printk)" -c -o kernel/.tmp_printk.o
kernel/printk.c
>
> /bin/sh: line 1: 13513 Segmentation fault
 arm-angstrom-linux-gnueabi-ld
--sysroot=/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone
-r -o kernel/printk.o kernel/.tmp_printk.o -T kernel/.tmp_printk.ver
> make[1]: *** [kernel/printk.o] Error 139
>
>
> The contents of .tmp_printk.ver:
>
> __crc_oops_in_progress = 0xb1c3a01a ;
> __crc_console_drivers = 0x0fc34a55 ;
> __crc_console_set_on_cmdline = 0x2459bbcc ;
> __crc_printk = 0x27e1a049 ;
> __crc_vprintk = 0xbf8ba54a ;
> __crc_console_suspend_enabled = 0xfedd35fc ;
> __crc_console_lock = 0xfbaaf01e ;
> __crc_console_trylock = 0x40d04664 ;
> __crc_console_unlock = 0xc631580a ;
> __crc_console_conditional_schedule = 0xbef43296 ;
> __crc_console_stop = 0xfb0ca1d2 ;
> __crc_console_start = 0x7a3fb1e2 ;
> __crc_register_console = 0xb0d88192 ;
> __crc_unregister_console = 0x8db62ff8 ;
> __crc___printk_ratelimit = 0x6128b5fc ;
> __crc_printk_timed_ratelimit = 0x07cc4a5d ;
> __crc_kmsg_dump_register = 0x030d11a8 ;
> __crc_kmsg_dump_unregister = 0x3ca16d23 ;
>
> The full verbose log is attached. Any ideas?

I guess it needs to be debugged
>
> --
> Denys
>

--20cf3066788349e7cf04c01d4aca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, May 15, 2012, Denys Dmytriyenko &lt;<a href=3D"mailto:d=
enis@denix.org">denis@denix.org</a>&gt; wrote:<br>&gt; On Fri, May 11, 2012=
 at 06:21:12PM -0700, Khem Raj wrote:<br>&gt;&gt; On Thu, May 10, 2012 at 1=
1:46 PM, Koen Kooi &lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@d=
ominion.thruhere.net</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>&gt;&gt; &gt; Op 11 mei 2012, om 04:41 heeft Denys Dmytriy=
enko het volgende geschreven:<br>&gt;&gt; &gt;<br>&gt;&gt; &gt;&gt; From: D=
enys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.com</a>&gt;<b=
r>
&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; BeagleBone kernel is required to be =
built in Thumb2 mode for fast boot.<br>&gt;&gt; &gt;&gt; Gold linker is not=
 yet perfect for this, giving an internal error:<br>&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; | arm-linux-gnueabi-ld: internal error in thumb_branch_co=
mmon, at .../binutils-cross-2.22-r6/binutils-2.22/gold/arm.cc:4149<br>&gt;&=
gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; While this fix can be put in generic linu=
x.inc for all the kernels, it&#39;s<br>
&gt;&gt; &gt;&gt; better to test the Gold linker out as much as possible an=
d only disable it<br>&gt;&gt; &gt;&gt; for known issues, like this one (unt=
il it gets fixed, of course).<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; Sig=
ned-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.=
com</a>&gt;<br>
&gt;&gt; &gt;<br>&gt;&gt; &gt; Looks good to me.<br>&gt;&gt;<br>&gt;&gt; OK=
 here is blind shot. Try this binutils patch and let me know if it helps.<b=
r>&gt;&gt;<br>&gt;&gt; <a href=3D"http://git.openembedded.org/openembedded-=
core-contrib/commit/?h=3Dkraj/gold&amp;id=3Db72f3238ad32ab420306a0226d8c2e5=
7c52ddf45">http://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Dkraj/gold&amp;id=3Db72f3238ad32ab420306a0226d8c2e57c52ddf45</a><br>
&gt;<br>&gt; No luck - it now just segfaults where it used to give an inter=
nal error:<br>&gt;<br>&gt; =C2=A0arm-angstrom-linux-gnueabi-gcc =C2=A0-mno-=
thumb-interwork -marm --sysroot=3D/OE/angstrom/build/tmp-angstrom_v2012_x-e=
glibc/sysroots/beaglebone -Wp,-MD,kernel/.printk.o.d =C2=A0-nostdinc -isyst=
em /OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr=
/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/inc=
lude -I/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angst=
rom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698=
cb6816d72f01/git/arch/arm/include -Iarch/arm/include/generated -Iinclude =
=C2=A0-include /OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebo=
ne-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b14=
7b31c698cb6816d72f01/git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endi=
an -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap/include -Wall -Wundef=
 -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werro=
r-implicit-function-declaration -Wno-format-security -fno-delete-null-point=
er-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-inte=
rwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-depr=
ecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -fomi=
t-frame-pointer -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict=
-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO -D&quot;KBUILD_STR(s)=3D#s&qu=
ot; -D&quot;KBUILD_BASENAME=3DKBUILD_STR(printk)&quot; -D&quot;KBUILD_MODNA=
ME=3DKBUILD_STR(printk)&quot; -c -o kernel/.tmp_printk.o kernel/printk.c<br=
>
&gt;<br>&gt; /bin/sh: line 1: 13513 Segmentation fault =C2=A0 =C2=A0 =C2=A0=
arm-angstrom-linux-gnueabi-ld --sysroot=3D/OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/sysroots/beaglebone -r -o kernel/printk.o kernel/.tmp_printk.=
o -T kernel/.tmp_printk.ver<br>
&gt; make[1]: *** [kernel/printk.o] Error 139<br>&gt;<br>&gt;<br>&gt; The c=
ontents of .tmp_printk.ver:<br>&gt;<br>&gt; __crc_oops_in_progress =3D 0xb1=
c3a01a ;<br>&gt; __crc_console_drivers =3D 0x0fc34a55 ;<br>&gt; __crc_conso=
le_set_on_cmdline =3D 0x2459bbcc ;<br>
&gt; __crc_printk =3D 0x27e1a049 ;<br>&gt; __crc_vprintk =3D 0xbf8ba54a ;<b=
r>&gt; __crc_console_suspend_enabled =3D 0xfedd35fc ;<br>&gt; __crc_console=
_lock =3D 0xfbaaf01e ;<br>&gt; __crc_console_trylock =3D 0x40d04664 ;<br>&g=
t; __crc_console_unlock =3D 0xc631580a ;<br>
&gt; __crc_console_conditional_schedule =3D 0xbef43296 ;<br>&gt; __crc_cons=
ole_stop =3D 0xfb0ca1d2 ;<br>&gt; __crc_console_start =3D 0x7a3fb1e2 ;<br>&=
gt; __crc_register_console =3D 0xb0d88192 ;<br>&gt; __crc_unregister_consol=
e =3D 0x8db62ff8 ;<br>
&gt; __crc___printk_ratelimit =3D 0x6128b5fc ;<br>&gt; __crc_printk_timed_r=
atelimit =3D 0x07cc4a5d ;<br>&gt; __crc_kmsg_dump_register =3D 0x030d11a8 ;=
<br>&gt; __crc_kmsg_dump_unregister =3D 0x3ca16d23 ;<br>&gt;<br>&gt; The fu=
ll verbose log is attached. Any ideas?<br>
<br>I guess it needs to be debugged<br>&gt;<br>&gt; --<br>&gt; Denys<br>&gt=
;

--20cf3066788349e7cf04c01d4aca--
