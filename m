Return-Path: <madhu1313b@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 29B88E00C59; Thu, 14 Feb 2019 01:14:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (madhu1313b[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.193 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5916E00CE7
	for <meta-ti@yoctoproject.org>; Thu, 14 Feb 2019 01:14:10 -0800 (PST)
Received: by mail-qt1-f193.google.com with SMTP id y4so6006134qtc.10
	for <meta-ti@yoctoproject.org>; Thu, 14 Feb 2019 01:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GYsRJEw70OI6uD/syldrrepht/Mlmc4D2u6M/AMlD3E=;
	b=qyoFFSZjKlFAB4ROEY6asBl8mQSN+t+QACICpa3yJ8NXjfvq8ID2E5Z3zoUqtQbLLt
	3aBI/nTl37UHHTedJLxH73qPCHOzQlADrpY3MP7GyIdoiWO3lHnPArteFfbjHXLlqmsO
	f3dwTD4QcIayo1BgtkaINRNamnCH71MF9uBP9SOa3StzH06tHluPYd2CuYNp3LXQxEFA
	6wT582n6nECzdJyJQvR0T1E+Wow2yRpbr0vJeqZE35NIFwnET9zsbVYMuRs9jn9pRvA5
	vd1Kr9hr2kCMuGZxtj2X2MBScsbozF1RHGGNYeWLOPxe09K+8sjTvKZyx5vrY33N2YzU
	mr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GYsRJEw70OI6uD/syldrrepht/Mlmc4D2u6M/AMlD3E=;
	b=Pj/7UO5T9WvhAlXv9yzRR7AXtKVuppJrw/EJTbMH3i/a/j6uYCLY+IJbOqa8vpW/l3
	I4EIqopfHfHlW6LWvUpwTtUIlrHStogbNKRo0+netihKUY5DnF4ToYSfAPsDtwVtJNfW
	cK72adizW0MWMZ4jl8Vd9zAJ6SnihbSoVCfu+BF7wAzb/A47yoAbMPzFENMxjUujwry6
	0pO8FWupoLVZ6pYxbm7OWVWPnjasDlmQkyMibmK8ZjA74js++ChG3wiizfbtpUDV3RQz
	bBTY8khFVJYzYA1fUpTjndjhhn3hrAfKJQZ/50s2CQHaOY9+EuJHZHtWFrPSI8YCVSL9
	dy1g==
X-Gm-Message-State: AHQUAubEINMEFVBpSW+bjtwIecCtvXgO5lghemUoN4yfxq0wPfS8VeAB
	kRzhDmK+Bmh63D+dEEgVQ97Z1MhuQVa3TdicAZvSvg==
X-Google-Smtp-Source: AHgI3IYxEKjXgUeW4UenZyKmkEZUS/mBwqJARhUWJR+tNZ6h+FSvIUynO2kz/EpgZDxkUdfH/uHmdnWMvUwvg5fQb34=
X-Received: by 2002:a0c:a326:: with SMTP id u35mr2104406qvu.190.1550135649881; 
	Thu, 14 Feb 2019 01:14:09 -0800 (PST)
MIME-Version: 1.0
References: <CAH5YvUt77u-_wztLrs8rwcHd7CUXZn8nQimEhkQwTHN4TYEooA@mail.gmail.com>
	<20190213215621.GB19384@beryl>
In-Reply-To: <20190213215621.GB19384@beryl>
From: Madhu B <madhu1313b@gmail.com>
Date: Thu, 14 Feb 2019 14:43:53 +0530
Message-ID: <CAH5YvUu7zW17+MqQnF-VDRc9p6P+W0ox31X8UU5aM+F1NPj-fg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: =?UTF-8?B?UmU6IGNwOiBjYW5ub3Qgc3RhdCDigJguL3RhcmdldGZzLy9ldGMvKuKAmTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ==?=
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
X-List-Received-Date: Thu, 14 Feb 2019 09:14:13 -0000
Content-Type: multipart/alternative; boundary="000000000000c3d31e0581d714f6"

--000000000000c3d31e0581d714f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denys,
               I understand that the recipes are not compatible with the
pandaboard. Suppose if I want to make meta-ti layer compatible with
pandaboard, what are major things that I need to do with meta-ti layer?

Regards,
-Madhu.


On Thu, Feb 14, 2019 at 3:26 AM Denys Dmytriyenko <denys@ti.com> wrote:

> On Wed, Feb 13, 2019 at 11:13:49AM +0530, Madhu B wrote:
> > Hello everyone,
> >                       I am getting an similar issue like
> >
> https://lists.yoctoproject.org/pipermail/meta-ti/2017-January/009481.html=
.
> > But even after applying the patch specified in the above link I am
> > observing the issue and in my case MACHINE =3D pandaboard.
>
> Not sure which of the 20 layers that you use changes this, but the recipe
> is
> not compatible with pandaboard and the proper output should be:
>
> ERROR: Nothing PROVIDES 'ti-sgx-ddk-um'
> ti-sgx-ddk-um was skipped: incompatible with machine pandaboard (not in
> COMPATIBLE_MACHINE)
>
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-graphics/l=
ibgles/ti-sgx-ddk-um_1.14.3699939.bb#n6
>
> --
> Denys
>
>
> > Here is the log data:
> >
> *************************************************************************=
*****************************
> > mbaikana@HYMBAIKANA:~/workspace_agl/build$ bitbake agl-demo-platform
> > WARNING: Host distribution "ubuntu-14.04" has not been validated with
> this
> > version of the build system; you may possibly experience unexpected
> > failures. It is recommended that you use a tested distribution.
> > Parsing recipes: 100%
> >
> |########################################################################=
##################################|
> > Time: 0:01:23
> > Parsing of 2571 .bb files complete (0 cached, 2571 parsed). 3474 target=
s,
> > 430 skipped, 0 masked, 0 errors.
> > WARNING: No bb files matched BBFILE_PATTERN_agl-distro
> > '^/home/mbaikana/workspace_agl/meta-agl/meta-agl-distro/'
> > NOTE: Resolving any missing task queue dependencies
> >
> > Build Configuration:
> > BB_VERSION           =3D "1.36.0"
> > BUILD_SYS            =3D "x86_64-linux"
> > NATIVELSBSTRING      =3D "universal"
> > TARGET_SYS           =3D "arm-agl-linux-gnueabi"
> > MACHINE              =3D "pandaboard"
> > DISTRO               =3D "poky-agl"
> > DISTRO_VERSION       =3D "6.0.3"
> > TUNE_FEATURES        =3D "arm armv7a vfp thumb neon callconvention-hard=
"
> > TARGET_FPU           =3D "hard"
> > meta-ti              =3D "HEAD:ed83a43c6a76875ee5f0388b3b60a28f2a373a10=
"
> > meta-qt5             =3D "HEAD:682ad61c071a9710e9f9d8a32ab1b5f3c14953d1=
"
> > meta-agl-profile-graphical-qt5
> > meta-agl-profile-graphical
> > meta-netboot         =3D "HEAD:0f1bcdcbe367a560dd57270f06cae593101e764b=
"
> > meta-hmi-framework
> > meta-audio-4a-framework =3D "HEAD:85d1e8250e3e36fb02f3143cce76738878534=
8f4"
> > meta-agl-demo        =3D "HEAD:98d6acf7b2805e570008eb513ac4aa73a0fa00c3=
"
> > meta-oe
> > meta-multimedia
> > meta-networking
> > meta-python
> > meta-filesystems     =3D "HEAD:eae996301d9c097bcbeb8046f08041dc82bb62f8=
"
> > meta-agl-profile-core
> > meta-agl-distro
> > meta-agl-bsp         =3D "HEAD:0f1bcdcbe367a560dd57270f06cae593101e764b=
"
> > meta-security        =3D "HEAD:8f6969a775fa6afbf553e72ba83e71197780b2d8=
"
> > meta-perl            =3D "HEAD:eae996301d9c097bcbeb8046f08041dc82bb62f8=
"
> > meta-security
> > meta-app-framework   =3D "HEAD:0f1bcdcbe367a560dd57270f06cae593101e764b=
"
> > meta
> > meta-poky            =3D "HEAD:e74a1931af9c5b883345345a03a6a9ebf6821cb0=
"
> >
> > Initialising tasks: 100%
> >
> |########################################################################=
###############################|
> > Time: 0:00:13
> > NOTE: Executing SetScene Tasks
> > NOTE: Executing RunQueue Tasks
> > ERROR: ti-sgx-ddk-um-1.14.3699939-r28 do_install: oe_runmake failed
> > ERROR: ti-sgx-ddk-um-1.14.3699939-r28 do_install: Function failed:
> > do_install (log file is located at
> >
> /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/=
ti-sgx-ddk-um/1.14.3699939-r28/temp/log.do_install.8103)
> > ERROR: Logfile of failure stored in:
> >
> /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/=
ti-sgx-ddk-um/1.14.3699939-r28/temp/log.do_install.8103
> > Log data follows:
> > | DEBUG: Executing python function extend_recipe_sysroot
> > | NOTE: Direct dependencies are
> >
> ['/home/mbaikana/workspace_agl/poky/meta/recipes-devtools/quilt/quilt-nat=
ive_0.65.bb:
> do_populate_sysroot',
> >
> '/home/mbaikana/workspace_agl/poky/meta/recipes-graphics/drm/libdrm_2.4.8=
3.bb:
> do_populate_sysroot',
> >
> '/home/mbaikana/workspace_agl/poky/meta/recipes-devtools/gcc/gcc-cross_7.=
3.bb:
> do_populate_sysroot',
> >
> '/home/mbaikana/workspace_agl/poky/meta/recipes-core/systemd/systemd_234.=
bb:
> do_populate_sysroot',
> >
> '/home/mbaikana/workspace_agl/poky/meta/recipes-core/systemd/systemd-syst=
emctl-native.bb:
> do_populate_sysroot',
> >
> '/home/mbaikana/workspace_agl/poky/meta/recipes-support/libffi/libffi_3.2=
.1.bb:
> do_populate_sysroot',
> > '/home/mbaikana/workspace_agl/poky/meta/recipes-core/glibc/glibc_2.26.b=
b:
> do_populate_sysroot',
> >
> '/home/mbaikana/workspace_agl/poky/meta/recipes-devtools/gcc/gcc-runtime_=
7.3.bb:
> do_populate_sysroot',
> >
> 'virtual:native:/home/mbaikana/workspace_agl/poky/meta/recipes-devtools/p=
seudo/pseudo_1.8.2.bb:
> do_populate_sysroot',
> >
> '/home/mbaikana/workspace_agl/poky/meta/recipes-graphics/wayland/wayland_=
1.13.0.bb:
> do_populate_sysroot',
> > '/home/mbaikana/workspace_agl/meta-ti/recipes-graphics/gbm/
> libgbm_10.0.0.bb:
> > do_populate_sysroot']
> > | NOTE: Installed into sysroot: []
> > | NOTE: Skipping as already exists in sysroot: ['quilt-native', 'libdrm=
',
> > 'gcc-cross-arm', 'systemd', 'systemd-systemctl-native', 'libffi',
> 'glibc',
> > 'gcc-runtime', 'pseudo-native', 'wayland', 'libgbm', 'libpthread-stubs'=
,
> > 'libpciaccess', 'libtool-native', 'mpfr-native', 'gnu-config-native',
> > 'libmpc-native', 'linux-libc-headers', 'xz-native', 'autoconf-native',
> > 'texinfo-dummy-native', 'gmp-native', 'binutils-cross-arm',
> 'zlib-native',
> > 'automake-native', 'shadow', 'kmod', 'xz', 'bash-completion',
> > 'base-passwd', 'libcgroup', 'readline', 'libcap', 'shadow-native',
> > 'util-linux', 'base-files', 'opkg-utils', 'libpam', 'shadow-sysroot',
> > 'acl', 'libgcc', 'expat', 'libxml2', 'util-macros',
> > 'gettext-minimal-native', 'm4-native', 'bison-native', 'flex-native',
> > 'attr', 'zlib', 'ncurses', 'cracklib', 'flex', 'python3', 'openssl',
> > 'bzip2', 'gdbm', 'db', 'sqlite3', 'cryptodev-linux']
> > | DEBUG: Python function extend_recipe_sysroot finished
> > | DEBUG: Executing shell function do_install
> > | NOTE: make -j 4 install
> >
> DESTDIR=3D/home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linu=
x-gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/image
> > TARGET_PRODUCT=3D
> > | mkdir -p
> >
> /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/=
ti-sgx-ddk-um/1.14.3699939-r28/image/etc
> > | mkdir -p
> >
> /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/=
ti-sgx-ddk-um/1.14.3699939-r28/image/usr/bin
> > | mkdir -p
> >
> /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/=
ti-sgx-ddk-um/1.14.3699939-r28/image/usr/include
> > | mkdir -p
> >
> /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/=
ti-sgx-ddk-um/1.14.3699939-r28/image/usr/lib
> > | cp -ar ./targetfs//etc/*
> >
> /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/=
ti-sgx-ddk-um/1.14.3699939-r28/image/etc
> > | cp: cannot stat =E2=80=98./targetfs//etc/*=E2=80=99: No such file or =
directory
> > | make: *** [install] Error 1
> > | ERROR: oe_runmake failed
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_install (log file is located at
> >
> /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/=
ti-sgx-ddk-um/1.14.3699939-r28/temp/log.do_install.8103)
> > ERROR: Task
> >
> (/home/mbaikana/workspace_agl/meta-ti/recipes-graphics/libgles/ti-sgx-ddk=
-um_1.14.3699939.bb:
> do_install)
> > failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 1280 tasks of which 1275 didn't need to =
be
> > rerun and 1 failed.
> >
> > Summary: 1 task failed:
> >
> > /home/mbaikana/workspace_agl/meta-ti/recipes-graphics/libgles/
> ti-sgx-ddk-um_1.14.3699939.bb:
> > do_install
> > Summary: There were 2 WARNING messages shown.
> > Summary: There were 2 ERROR messages shown, returning a non-zero exit
> code.
> >
> >
> *************************************************************************=
*****************************
> >
> > Regards,
> > -Madhu.
>
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>
>

--000000000000c3d31e0581d714f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Denys,</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I understand that the r=
ecipes are not compatible with the pandaboard. Suppose if I want to make me=
ta-ti layer compatible with pandaboard, what are major things that I need t=
o do with meta-ti layer? <br></div><div><br></div><div>Regards,</div><div>-=
Madhu.<br></div><div><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Feb 14, 2019 at 3:26 AM Denys Dmytri=
yenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Feb 13, 2019 =
at 11:13:49AM +0530, Madhu B wrote:<br>
&gt; Hello everyone,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0I am getting an similar issue like<br>
&gt; <a href=3D"https://lists.yoctoproject.org/pipermail/meta-ti/2017-Janua=
ry/009481.html" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctopro=
ject.org/pipermail/meta-ti/2017-January/009481.html</a>.<br>
&gt; But even after applying the patch specified in the above link I am<br>
&gt; observing the issue and in my case MACHINE =3D pandaboard.<br>
<br>
Not sure which of the 20 layers that you use changes this, but the recipe i=
s <br>
not compatible with pandaboard and the proper output should be:<br>
<br>
ERROR: Nothing PROVIDES &#39;ti-sgx-ddk-um&#39;<br>
ti-sgx-ddk-um was skipped: incompatible with machine pandaboard (not in COM=
PATIBLE_MACHINE)<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-g=
raphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb#n6" rel=3D"noreferrer" target=
=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-=
graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb#n6</a><br>
<br>
-- <br>
Denys<br>
<br>
<br>
&gt; Here is the log data:<br>
&gt; **********************************************************************=
********************************<br>
&gt; mbaikana@HYMBAIKANA:~/workspace_agl/build$ bitbake agl-demo-platform<b=
r>
&gt; WARNING: Host distribution &quot;ubuntu-14.04&quot; has not been valid=
ated with this<br>
&gt; version of the build system; you may possibly experience unexpected<br=
>
&gt; failures. It is recommended that you use a tested distribution.<br>
&gt; Parsing recipes: 100%<br>
&gt; |#####################################################################=
#####################################|<br>
&gt; Time: 0:01:23<br>
&gt; Parsing of 2571 .bb files complete (0 cached, 2571 parsed). 3474 targe=
ts,<br>
&gt; 430 skipped, 0 masked, 0 errors.<br>
&gt; WARNING: No bb files matched BBFILE_PATTERN_agl-distro<br>
&gt; &#39;^/home/mbaikana/workspace_agl/meta-agl/meta-agl-distro/&#39;<br>
&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt; <br>
&gt; Build Configuration:<br>
&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.36.0&qu=
ot;<br>
&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-li=
nux&quot;<br>
&gt; NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-agl-l=
inux-gnueabi&quot;<br>
&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;pand=
aboard&quot;<br>
&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;poky-agl&quot;<br>
&gt; DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;6.0.3&quot;<br>
&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm armv7a vfp thum=
b neon callconvention-hard&quot;<br>
&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;hard&quot=
;<br>
&gt; meta-ti=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;HEAD=
:ed83a43c6a76875ee5f0388b3b60a28f2a373a10&quot;<br>
&gt; meta-qt5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD=
:682ad61c071a9710e9f9d8a32ab1b5f3c14953d1&quot;<br>
&gt; meta-agl-profile-graphical-qt5<br>
&gt; meta-agl-profile-graphical<br>
&gt; meta-netboot=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD:0f1bcdcbe=
367a560dd57270f06cae593101e764b&quot;<br>
&gt; meta-hmi-framework<br>
&gt; meta-audio-4a-framework =3D &quot;HEAD:85d1e8250e3e36fb02f3143cce76738=
8785348f4&quot;<br>
&gt; meta-agl-demo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;HEAD:98d6acf7b2805e=
570008eb513ac4aa73a0fa00c3&quot;<br>
&gt; meta-oe<br>
&gt; meta-multimedia<br>
&gt; meta-networking<br>
&gt; meta-python<br>
&gt; meta-filesystems=C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD:eae996301d9c097bcbe=
b8046f08041dc82bb62f8&quot;<br>
&gt; meta-agl-profile-core<br>
&gt; meta-agl-distro<br>
&gt; meta-agl-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD:0f1bcdcbe=
367a560dd57270f06cae593101e764b&quot;<br>
&gt; meta-security=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;HEAD:8f6969a775fa6a=
fbf553e72ba83e71197780b2d8&quot;<br>
&gt; meta-perl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;HEAD:eae9=
96301d9c097bcbeb8046f08041dc82bb62f8&quot;<br>
&gt; meta-security<br>
&gt; meta-app-framework=C2=A0 =C2=A0=3D &quot;HEAD:0f1bcdcbe367a560dd57270f=
06cae593101e764b&quot;<br>
&gt; meta<br>
&gt; meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;HEAD:e74a=
1931af9c5b883345345a03a6a9ebf6821cb0&quot;<br>
&gt; <br>
&gt; Initialising tasks: 100%<br>
&gt; |#####################################################################=
##################################|<br>
&gt; Time: 0:00:13<br>
&gt; NOTE: Executing SetScene Tasks<br>
&gt; NOTE: Executing RunQueue Tasks<br>
&gt; ERROR: ti-sgx-ddk-um-1.14.3699939-r28 do_install: oe_runmake failed<br=
>
&gt; ERROR: ti-sgx-ddk-um-1.14.3699939-r28 do_install: Function failed:<br>
&gt; do_install (log file is located at<br>
&gt; /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnuea=
bi/ti-sgx-ddk-um/1.14.3699939-r28/temp/log.do_install.8103)<br>
&gt; ERROR: Logfile of failure stored in:<br>
&gt; /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnuea=
bi/ti-sgx-ddk-um/1.14.3699939-r28/temp/log.do_install.8103<br>
&gt; Log data follows:<br>
&gt; | DEBUG: Executing python function extend_recipe_sysroot<br>
&gt; | NOTE: Direct dependencies are<br>
&gt; [&#39;/home/mbaikana/workspace_agl/poky/meta/recipes-devtools/quilt/qu=
ilt-native_0.65.bb:do_populate_sysroot&#39;,<br>
&gt; &#39;/home/mbaikana/workspace_agl/poky/meta/recipes-graphics/drm/libdr=
m_2.4.83.bb:do_populate_sysroot&#39;,<br>
&gt; &#39;/home/mbaikana/workspace_agl/poky/meta/recipes-devtools/gcc/gcc-c=
ross_7.3.bb:do_populate_sysroot&#39;,<br>
&gt; &#39;/home/mbaikana/workspace_agl/poky/meta/recipes-core/systemd/syste=
md_234.bb:do_populate_sysroot&#39;,<br>
&gt; &#39;/home/mbaikana/workspace_agl/poky/meta/recipes-core/systemd/syste=
md-systemctl-native.bb:do_populate_sysroot&#39;,<br>
&gt; &#39;/home/mbaikana/workspace_agl/poky/meta/recipes-support/libffi/lib=
ffi_3.2.1.bb:do_populate_sysroot&#39;,<br>
&gt; &#39;/home/mbaikana/workspace_agl/poky/meta/recipes-core/glibc/glibc_2=
.26.bb:do_populate_sysroot&#39;,<br>
&gt; &#39;/home/mbaikana/workspace_agl/poky/meta/recipes-devtools/gcc/gcc-r=
untime_7.3.bb:do_populate_sysroot&#39;,<br>
&gt; &#39;virtual:native:/home/mbaikana/workspace_agl/poky/meta/recipes-dev=
tools/pseudo/pseudo_1.8.2.bb:do_populate_sysroot&#39;,<br>
&gt; &#39;/home/mbaikana/workspace_agl/poky/meta/recipes-graphics/wayland/w=
ayland_1.13.0.bb:do_populate_sysroot&#39;,<br>
&gt; &#39;/home/mbaikana/workspace_agl/meta-ti/recipes-graphics/gbm/<a href=
=3D"http://libgbm_10.0.0.bb" rel=3D"noreferrer" target=3D"_blank">libgbm_10=
.0.0.bb</a>:<br>
&gt; do_populate_sysroot&#39;]<br>
&gt; | NOTE: Installed into sysroot: []<br>
&gt; | NOTE: Skipping as already exists in sysroot: [&#39;quilt-native&#39;=
, &#39;libdrm&#39;,<br>
&gt; &#39;gcc-cross-arm&#39;, &#39;systemd&#39;, &#39;systemd-systemctl-nat=
ive&#39;, &#39;libffi&#39;, &#39;glibc&#39;,<br>
&gt; &#39;gcc-runtime&#39;, &#39;pseudo-native&#39;, &#39;wayland&#39;, &#3=
9;libgbm&#39;, &#39;libpthread-stubs&#39;,<br>
&gt; &#39;libpciaccess&#39;, &#39;libtool-native&#39;, &#39;mpfr-native&#39=
;, &#39;gnu-config-native&#39;,<br>
&gt; &#39;libmpc-native&#39;, &#39;linux-libc-headers&#39;, &#39;xz-native&=
#39;, &#39;autoconf-native&#39;,<br>
&gt; &#39;texinfo-dummy-native&#39;, &#39;gmp-native&#39;, &#39;binutils-cr=
oss-arm&#39;, &#39;zlib-native&#39;,<br>
&gt; &#39;automake-native&#39;, &#39;shadow&#39;, &#39;kmod&#39;, &#39;xz&#=
39;, &#39;bash-completion&#39;,<br>
&gt; &#39;base-passwd&#39;, &#39;libcgroup&#39;, &#39;readline&#39;, &#39;l=
ibcap&#39;, &#39;shadow-native&#39;,<br>
&gt; &#39;util-linux&#39;, &#39;base-files&#39;, &#39;opkg-utils&#39;, &#39=
;libpam&#39;, &#39;shadow-sysroot&#39;,<br>
&gt; &#39;acl&#39;, &#39;libgcc&#39;, &#39;expat&#39;, &#39;libxml2&#39;, &=
#39;util-macros&#39;,<br>
&gt; &#39;gettext-minimal-native&#39;, &#39;m4-native&#39;, &#39;bison-nati=
ve&#39;, &#39;flex-native&#39;,<br>
&gt; &#39;attr&#39;, &#39;zlib&#39;, &#39;ncurses&#39;, &#39;cracklib&#39;,=
 &#39;flex&#39;, &#39;python3&#39;, &#39;openssl&#39;,<br>
&gt; &#39;bzip2&#39;, &#39;gdbm&#39;, &#39;db&#39;, &#39;sqlite3&#39;, &#39=
;cryptodev-linux&#39;]<br>
&gt; | DEBUG: Python function extend_recipe_sysroot finished<br>
&gt; | DEBUG: Executing shell function do_install<br>
&gt; | NOTE: make -j 4 install<br>
&gt; DESTDIR=3D/home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-l=
inux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/image<br>
&gt; TARGET_PRODUCT=3D<br>
&gt; | mkdir -p<br>
&gt; /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnuea=
bi/ti-sgx-ddk-um/1.14.3699939-r28/image/etc<br>
&gt; | mkdir -p<br>
&gt; /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnuea=
bi/ti-sgx-ddk-um/1.14.3699939-r28/image/usr/bin<br>
&gt; | mkdir -p<br>
&gt; /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnuea=
bi/ti-sgx-ddk-um/1.14.3699939-r28/image/usr/include<br>
&gt; | mkdir -p<br>
&gt; /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnuea=
bi/ti-sgx-ddk-um/1.14.3699939-r28/image/usr/lib<br>
&gt; | cp -ar ./targetfs//etc/*<br>
&gt; /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnuea=
bi/ti-sgx-ddk-um/1.14.3699939-r28/image/etc<br>
&gt; | cp: cannot stat =E2=80=98./targetfs//etc/*=E2=80=99: No such file or=
 directory<br>
&gt; | make: *** [install] Error 1<br>
&gt; | ERROR: oe_runmake failed<br>
&gt; | WARNING: exit code 1 from a shell command.<br>
&gt; | ERROR: Function failed: do_install (log file is located at<br>
&gt; /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnuea=
bi/ti-sgx-ddk-um/1.14.3699939-r28/temp/log.do_install.8103)<br>
&gt; ERROR: Task<br>
&gt; (/home/mbaikana/workspace_agl/meta-ti/recipes-graphics/libgles/ti-sgx-=
ddk-um_1.14.3699939.bb:do_install)<br>
&gt; failed with exit code &#39;1&#39;<br>
&gt; NOTE: Tasks Summary: Attempted 1280 tasks of which 1275 didn&#39;t nee=
d to be<br>
&gt; rerun and 1 failed.<br>
&gt; <br>
&gt; Summary: 1 task failed:<br>
&gt; <br>
&gt; /home/mbaikana/workspace_agl/meta-ti/recipes-graphics/libgles/<a href=
=3D"http://ti-sgx-ddk-um_1.14.3699939.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ti-sgx-ddk-um_1.14.3699939.bb</a>:<br>
&gt; do_install<br>
&gt; Summary: There were 2 WARNING messages shown.<br>
&gt; Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.<br>
&gt; <br>
&gt; **********************************************************************=
********************************<br>
&gt; <br>
&gt; Regards,<br>
&gt; -Madhu.<br>
<br>
&gt; -- <br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti@=
yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti<=
/a><br>
<br>
</blockquote></div>

--000000000000c3d31e0581d714f6--
