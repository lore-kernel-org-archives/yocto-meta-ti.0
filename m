Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8F25E00406
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 18:42:44 -0700 (PDT)
Received: by mail-oa0-f42.google.com with SMTP id i18so2443692oag.29
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 18:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4V/h7NgK2NpHATXh0zTJFJ/qcjJSel6Uzc6qDN6L8WY=;
	b=jHaP9JvPydlOwx/lSVHwmHdXZv7V2MEt1eLnVhH5k10jLnJ+I8VJX3U6sn3MvdJQN4
	DALOEJuBUSkMaGJuQsqZ9qpzs6Ne+MaZhT385GFCCTEsTO56usLk7irGHwEMVbEC61ok
	v/kF7ru9sXMKnp22M8GNS/m5NDOs7P+f23CadPM5HOx1vsqiV78MPFU8yvo6IqEBCZdB
	S+yzQxmF0p/0ByNCEsopJdzmkzYq3zoxbDZXeKZtowcCLcL3yybdQx6YIJNgMQuxz/xy
	0X9Cnzt1xxb87yuI/O7vaUct2xjpAKYSnj9+wKANtX62C+kSbblmzPmSmPCCZAllGF4u
	6aAw==
MIME-Version: 1.0
X-Received: by 10.60.54.68 with SMTP id h4mr4988734oep.74.1377049363670; Tue,
	20 Aug 2013 18:42:43 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Tue, 20 Aug 2013 18:42:43 -0700 (PDT)
In-Reply-To: <CAMKF1sqb8smKgKM8wCyb5cbcdcbqphBBi0dhsZHo9j_-MMeUqg@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
	<CAFZh4h8ncW+-UskiqTAOSXFyDvN5Rc+bnj=ykGfXRZYPRbbgrA@mail.gmail.com>
	<CAMKF1sqb8smKgKM8wCyb5cbcdcbqphBBi0dhsZHo9j_-MMeUqg@mail.gmail.com>
Date: Tue, 20 Aug 2013 21:42:43 -0400
Message-ID: <CAFZh4h-OBDoeWFWpMLng8Uw6HEidMoWJtQvwdP9SjPwaci9O0Q@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Wed, 21 Aug 2013 01:42:45 -0000
Content-Type: multipart/alternative; boundary=089e013d061628ee5304e46b4aa4

--089e013d061628ee5304e46b4aa4
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 16, 2013 at 5:59 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> use linux-libc-headers from 2.6.37 as well and not the 3.8 or whatever is
> default on OE-Core branch that you are using.
>

OK, I'm in a little new territory here.  I've been attempting to add
machine support to my oe_core + meta-ti master checkout.  I've setup the
machine conf for c6a816x-evm and all the associated files using denzil as a
base.  I modified the 2.6.37 recipe to use my custom boards kernel instead
of the one from git (set SRC_URI to my .tar.bz2).  I stubbed out u-boot for
now as it was giving me problems.

First question.  I looked at my poky/meta/recipes-kernel/linux-libc-headers
dir of a denzil checkout that last had c6a816x-evm support to use as kind
of an example/guide.  I see recipes for linux-libc-headers_3.2.bb and
linux-libc-headers_3.0.8.bb.  Do I need to create a recipe for 2.6.37 and
set the SRC_URI for a 2.6.37 commit so that my rootfs packages will be
built against headers that match the version of the kernel I'm using?  It
looked like linux-libc-headers.inc has some kind of check to decide on
which headers to use (3 or 2.6) but I don't quite follow how it works yet.

Second question.  When I try to bitbake core-image-minimal after adding in
my kernel (a tar.bz2), it builds but the do_package phase gets errors:

Build Configuration:
BB_VERSION        = "1.19.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Debian-7.1"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "c6a816x-evm"
DISTRO_VERSION    = "oe-core.0"
TUNE_FEATURES     = "armv7a vfp neon"
TARGET_FPU        = "vfp-neon"
meta              = "master:b8952942aed77473d3b44a17112cbf6a9e83eff3"
meta-ti           = "master:ed417f659a24499301eb8e40de06e281462f213a"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: objcopy failed with exit code 256 (cmd was
'arm-oe-linux-gnueabi-objcopy' --only-keep-debug
'/home/hutch/oe_core_beagleboard/oe-core/build/tmp-eglibc/work/c6a816x_evm-oe-linux-gnueabi/linux-ti81xx-psp/2.6.37-r0/package/usr/src/kernel/image/usr/src/kernel/scripts/mod/mk_elfconfig'
'/home/hutch/oe_core_beagleboard/oe-core/build/tmp-eglibc/work/c6a816x_evm-oe-linux-gnueabi/linux-ti81xx-psp/2.6.37-r0/package/usr/src/kernel/image/usr/src/kernel/scripts/mod/.debug/mk_elfconfig'):
arm-oe-linux-gnueabi-objcopy:/home/hutch/oe_core_beagleboard/oe-core/build/tmp-eglibc/work/c6a816x_evm-oe-linux-gnueabi/linux-ti81xx-psp/2.6.37-r0/package/usr/src/kernel/image/usr/src/kernel/scripts/mod/mk_elfconfig:
File format not recognized
ERROR: Function failed: split_and_strip_files
ERROR: Logfile of failure stored in:
/home/hutch/oe_core_beagleboard/oe-core/build/tmp-eglibc/work/c6a816x_evm-oe-linux-gnueabi/linux-ti81xx-psp/2.6.37-r0/temp/log.do_package.25280
ERROR: Task 631
(/home/hutch/oe_core_beagleboard/oe-core/meta-ti/recipes-kernel/linux/
linux-ti81xx-psp_2.6.37.bb, do_package) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1541 tasks of which 1528 didn't need to be
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /home/hutch/oe_core_beagleboard/oe-core/meta-ti/recipes-kernel/linux/
linux-ti81xx-psp_2.6.37.bb, do_package
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

I did some searches of this kind of error and mostly found noise but also
found some references to  INHIBIT_PACKAGE_STRIP but I'm not sure if that
will fix this problem or not.

So far my deploy dir has a uImage but not the rootfs tar or images. I hope
fixing the above will get me there.

Regards,

Brian

--089e013d061628ee5304e46b4aa4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2013 at 5:59 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</sp=
an> wrote:<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:courier =
new,monospace;font-size:small"><br></div><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><div><div class=3D"h5"><div><span style=3D"font-family:=
&#39;courier new&#39;,monospace">use linux-libc-headers from 2.6.37 as well=
 and not the 3.8 or whatever is default on OE-Core branch that you are usin=
g.</span></div>
</div></div></div></div></div></blockquote><div><br></div><div>OK, I&#39;m =
in a little new territory here. =A0I&#39;ve been attempting to add machine =
support to my oe_core + meta-ti master checkout. =A0I&#39;ve setup the mach=
ine conf for c6a816x-evm and all the associated files using denzil as a bas=
e. =A0I modified the 2.6.37 recipe to use my custom boards kernel instead o=
f the one from git (set SRC_URI to my .tar.bz2). =A0I stubbed out u-boot fo=
r now as it was giving me problems.</div>
<div><br></div><div>First question. =A0I looked at my=A0poky/meta/recipes-k=
ernel/linux-libc-headers dir of a denzil checkout that last had c6a816x-evm=
 support to use as kind of an example/guide. =A0I see recipes for=A0<a href=
=3D"http://linux-libc-headers_3.2.bb">linux-libc-headers_3.2.bb</a> and=A0<=
a href=3D"http://linux-libc-headers_3.0.8.bb">linux-libc-headers_3.0.8.bb</=
a>. =A0Do I need to create a recipe for 2.6.37 and set the SRC_URI for a 2.=
6.37 commit so that my rootfs packages will be built against headers that m=
atch the version of the kernel I&#39;m using? =A0It looked like linux-libc-=
headers.inc has some kind of check to decide on which headers to use (3 or =
2.6) but I don&#39;t quite follow how it works yet.</div>
<div><br></div><div>Second question. =A0When I try to bitbake core-image-mi=
nimal after adding in my kernel (a tar.bz2), it builds but the do_package p=
hase gets errors:</div><div><br></div><div>Build Configuration:</div><div>
BB_VERSION =A0 =A0 =A0 =A0=3D &quot;1.19.1&quot;</div><div>BUILD_SYS =A0 =
=A0 =A0 =A0 =3D &quot;x86_64-linux&quot;</div><div>NATIVELSBSTRING =A0 =3D =
&quot;Debian-7.1&quot;</div><div>TARGET_SYS =A0 =A0 =A0 =A0=3D &quot;arm-oe=
-linux-gnueabi&quot;</div><div>MACHINE =A0 =A0 =A0 =A0 =A0 =3D &quot;c6a816=
x-evm&quot;</div>
<div>DISTRO_VERSION =A0 =A0=3D &quot;oe-core.0&quot;</div><div>TUNE_FEATURE=
S =A0 =A0 =3D &quot;armv7a vfp neon&quot;</div><div>TARGET_FPU =A0 =A0 =A0 =
=A0=3D &quot;vfp-neon&quot;</div><div>meta =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D &=
quot;master:b8952942aed77473d3b44a17112cbf6a9e83eff3&quot;</div>
<div>meta-ti =A0 =A0 =A0 =A0 =A0 =3D &quot;master:ed417f659a24499301eb8e40d=
e06e281462f213a&quot;</div><div><br></div><div>NOTE: Resolving any missing =
task queue dependencies</div><div>NOTE: Preparing runqueue</div><div>NOTE: =
Executing SetScene Tasks</div>
<div>NOTE: Executing RunQueue Tasks</div><div>ERROR: objcopy failed with ex=
it code 256 (cmd was &#39;arm-oe-linux-gnueabi-objcopy&#39; --only-keep-deb=
ug &#39;/home/hutch/oe_core_beagleboard/oe-core/build/tmp-eglibc/work/c6a81=
6x_evm-oe-linux-gnueabi/linux-ti81xx-psp/2.6.37-r0/package/usr/src/kernel/i=
mage/usr/src/kernel/scripts/mod/mk_elfconfig&#39; &#39;/home/hutch/oe_core_=
beagleboard/oe-core/build/tmp-eglibc/work/c6a816x_evm-oe-linux-gnueabi/linu=
x-ti81xx-psp/2.6.37-r0/package/usr/src/kernel/image/usr/src/kernel/scripts/=
mod/.debug/mk_elfconfig&#39;):</div>
<div>arm-oe-linux-gnueabi-objcopy:/home/hutch/oe_core_beagleboard/oe-core/b=
uild/tmp-eglibc/work/c6a816x_evm-oe-linux-gnueabi/linux-ti81xx-psp/2.6.37-r=
0/package/usr/src/kernel/image/usr/src/kernel/scripts/mod/mk_elfconfig: Fil=
e format not recognized</div>
<div>ERROR: Function failed: split_and_strip_files</div><div>ERROR: Logfile=
 of failure stored in: /home/hutch/oe_core_beagleboard/oe-core/build/tmp-eg=
libc/work/c6a816x_evm-oe-linux-gnueabi/linux-ti81xx-psp/2.6.37-r0/temp/log.=
do_package.25280</div>
<div>ERROR: Task 631 (/home/hutch/oe_core_beagleboard/oe-core/meta-ti/recip=
es-kernel/linux/<a href=3D"http://linux-ti81xx-psp_2.6.37.bb">linux-ti81xx-=
psp_2.6.37.bb</a>, do_package) failed with exit code &#39;1&#39;</div><div>
NOTE: Tasks Summary: Attempted 1541 tasks of which 1528 didn&#39;t need to =
be rerun and 1 failed.</div><div>Waiting for 0 running tasks to finish:</di=
v><div><br></div><div>Summary: 1 task failed:</div><div>=A0 /home/hutch/oe_=
core_beagleboard/oe-core/meta-ti/recipes-kernel/linux/<a href=3D"http://lin=
ux-ti81xx-psp_2.6.37.bb">linux-ti81xx-psp_2.6.37.bb</a>, do_package</div>
<div>Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.=A0</div><div><br></div><div>I did some searches of this kind of error=
 and mostly found noise but also found some references to =A0<span style=3D=
"white-space:pre-wrap">INHIBIT_PACKAGE_STRIP but I&#39;m not sure if that w=
ill fix this problem or not.</span></div>
<div><span style=3D"white-space:pre-wrap"><br></span></div><div><span style=
=3D"white-space:pre-wrap">So far my deploy dir has a uImage but not the roo=
tfs tar or images.  I hope fixing the above will get me there.</span></div>
<div><span style=3D"white-space:pre-wrap"><br></span></div><div><span style=
=3D"white-space:pre-wrap">Regards,</span></div><div><span style=3D"white-sp=
ace:pre-wrap"><br></span></div><div><span style=3D"white-space:pre-wrap">Br=
ian</span></div>
</div>

--089e013d061628ee5304e46b4aa4--
