Return-Path: <madhu1313b@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93E6EE0097C; Tue, 12 Feb 2019 21:44:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (madhu1313b[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.194 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 822BBE0090E
	for <meta-ti@yoctoproject.org>; Tue, 12 Feb 2019 21:44:02 -0800 (PST)
Received: by mail-qt1-f194.google.com with SMTP id j36so1292907qta.7
	for <meta-ti@yoctoproject.org>; Tue, 12 Feb 2019 21:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=8VxgPKJabH+2OLkxVf0EBo5uY2E3JMVLy0LsZNOHoEA=;
	b=uMMhMSHSUFHsCDphTqvVltqWM4dpKNf4sDCsmWkqo4B86UxpCbieflZBGq8ztVO4LB
	dPkfjPOFjhsMYWnrZs4Xh73rYTAxfyfiTBaKU+CuMzHeBtbYXw8NNyi3vIH4ARYXRjQM
	OxorZM7k6qvSYfRubPMrK5DlUKiswVwNYETdZ/ra2biQfaTFuZiiSbZ8xz2lC6M7xxa0
	qD+2C3WfoI3cbAetpx212b7z6WDFrtEnHEBGHdj7b8JLdBcSkgawOkZLZe36cj8Hkvus
	8S9NlS4CnkKVTb94WKoMEGlHBzIRuNJzV9p34A6QV/0I1zRhKWCkZ9hCpkMCVKU743YK
	dAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=8VxgPKJabH+2OLkxVf0EBo5uY2E3JMVLy0LsZNOHoEA=;
	b=Ns1T5GDCpm+Lze2kbFGYbJQptVqvT23C6m1fz8LlhMi6R3BUpdfB47Vz93oui3l5Om
	/Cf04ufMGn3h1p1yxgh49JFnPsQ4zC0uwEHqCm17LHpfPuOTuKi6xi7YIIRjb7vCJbmC
	i6vRQio2beGmmcfIXv5f9y8y67g2dNDybXEhxau55CFUhfxOuBZvkRaKKCH/09nsHlE9
	T+ehdmbgNk3zcjOiZIhzp/zKgxuM/s9y8gCKSJfK51VTC841hs9RHPCR71Mk1H9+exXn
	NdZug8wJzQGrE5vjBIcDOU7bNXqT9vEjvkBeezD14jsjGsRl+jnAG5xDnDjhNsacaq4U
	9OnQ==
X-Gm-Message-State: AHQUAuZtAyBfHzoOrXyHGm4OdAm1pVlxaabDWI0ZcihZDt+LzwZYSra8
	fJyIU931yZz/57Of+G9NQnGBcZyUKRKSD1hog08dWxMl
X-Google-Smtp-Source: AHgI3IY1QiS0NJMuNinR6HmvKIYuzyfA+3NWY1AGdLJ+cYB0cC4LREpt0K6Y6JpAUx9/i1Sj8CBisOmTGE340Ect78U=
X-Received: by 2002:ac8:50b:: with SMTP id u11mr5647858qtg.107.1550036641564; 
	Tue, 12 Feb 2019 21:44:01 -0800 (PST)
MIME-Version: 1.0
From: Madhu B <madhu1313b@gmail.com>
Date: Wed, 13 Feb 2019 11:13:49 +0530
Message-ID: <CAH5YvUt77u-_wztLrs8rwcHd7CUXZn8nQimEhkQwTHN4TYEooA@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: =?UTF-8?B?Y3A6IGNhbm5vdCBzdGF0IOKAmC4vdGFyZ2V0ZnMvL2V0Yy8q4oCZOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5?=
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
X-List-Received-Date: Wed, 13 Feb 2019 05:44:03 -0000
Content-Type: multipart/alternative; boundary="00000000000068ce3e0581c00771"

--00000000000068ce3e0581c00771
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,
                      I am getting an similar issue like
https://lists.yoctoproject.org/pipermail/meta-ti/2017-January/009481.html.
But even after applying the patch specified in the above link I am
observing the issue and in my case MACHINE =3D pandaboard.

Here is the log data:
***************************************************************************=
***************************
mbaikana@HYMBAIKANA:~/workspace_agl/build$ bitbake agl-demo-platform
WARNING: Host distribution "ubuntu-14.04" has not been validated with this
version of the build system; you may possibly experience unexpected
failures. It is recommended that you use a tested distribution.
Parsing recipes: 100%
|##########################################################################=
################################|
Time: 0:01:23
Parsing of 2571 .bb files complete (0 cached, 2571 parsed). 3474 targets,
430 skipped, 0 masked, 0 errors.
WARNING: No bb files matched BBFILE_PATTERN_agl-distro
'^/home/mbaikana/workspace_agl/meta-agl/meta-agl-distro/'
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           =3D "1.36.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "arm-agl-linux-gnueabi"
MACHINE              =3D "pandaboard"
DISTRO               =3D "poky-agl"
DISTRO_VERSION       =3D "6.0.3"
TUNE_FEATURES        =3D "arm armv7a vfp thumb neon callconvention-hard"
TARGET_FPU           =3D "hard"
meta-ti              =3D "HEAD:ed83a43c6a76875ee5f0388b3b60a28f2a373a10"
meta-qt5             =3D "HEAD:682ad61c071a9710e9f9d8a32ab1b5f3c14953d1"
meta-agl-profile-graphical-qt5
meta-agl-profile-graphical
meta-netboot         =3D "HEAD:0f1bcdcbe367a560dd57270f06cae593101e764b"
meta-hmi-framework
meta-audio-4a-framework =3D "HEAD:85d1e8250e3e36fb02f3143cce767388785348f4"
meta-agl-demo        =3D "HEAD:98d6acf7b2805e570008eb513ac4aa73a0fa00c3"
meta-oe
meta-multimedia
meta-networking
meta-python
meta-filesystems     =3D "HEAD:eae996301d9c097bcbeb8046f08041dc82bb62f8"
meta-agl-profile-core
meta-agl-distro
meta-agl-bsp         =3D "HEAD:0f1bcdcbe367a560dd57270f06cae593101e764b"
meta-security        =3D "HEAD:8f6969a775fa6afbf553e72ba83e71197780b2d8"
meta-perl            =3D "HEAD:eae996301d9c097bcbeb8046f08041dc82bb62f8"
meta-security
meta-app-framework   =3D "HEAD:0f1bcdcbe367a560dd57270f06cae593101e764b"
meta
meta-poky            =3D "HEAD:e74a1931af9c5b883345345a03a6a9ebf6821cb0"

Initialising tasks: 100%
|##########################################################################=
#############################|
Time: 0:00:13
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: ti-sgx-ddk-um-1.14.3699939-r28 do_install: oe_runmake failed
ERROR: ti-sgx-ddk-um-1.14.3699939-r28 do_install: Function failed:
do_install (log file is located at
/home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti=
-sgx-ddk-um/1.14.3699939-r28/temp/log.do_install.8103)
ERROR: Logfile of failure stored in:
/home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti=
-sgx-ddk-um/1.14.3699939-r28/temp/log.do_install.8103
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are
['/home/mbaikana/workspace_agl/poky/meta/recipes-devtools/quilt/quilt-nativ=
e_0.65.bb:do_populate_sysroot',
'/home/mbaikana/workspace_agl/poky/meta/recipes-graphics/drm/libdrm_2.4.83.=
bb:do_populate_sysroot',
'/home/mbaikana/workspace_agl/poky/meta/recipes-devtools/gcc/gcc-cross_7.3.=
bb:do_populate_sysroot',
'/home/mbaikana/workspace_agl/poky/meta/recipes-core/systemd/systemd_234.bb=
:do_populate_sysroot',
'/home/mbaikana/workspace_agl/poky/meta/recipes-core/systemd/systemd-system=
ctl-native.bb:do_populate_sysroot',
'/home/mbaikana/workspace_agl/poky/meta/recipes-support/libffi/libffi_3.2.1=
.bb:do_populate_sysroot',
'/home/mbaikana/workspace_agl/poky/meta/recipes-core/glibc/glibc_2.26.bb:do=
_populate_sysroot',
'/home/mbaikana/workspace_agl/poky/meta/recipes-devtools/gcc/gcc-runtime_7.=
3.bb:do_populate_sysroot',
'virtual:native:/home/mbaikana/workspace_agl/poky/meta/recipes-devtools/pse=
udo/pseudo_1.8.2.bb:do_populate_sysroot',
'/home/mbaikana/workspace_agl/poky/meta/recipes-graphics/wayland/wayland_1.=
13.0.bb:do_populate_sysroot',
'/home/mbaikana/workspace_agl/meta-ti/recipes-graphics/gbm/libgbm_10.0.0.bb=
:
do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['quilt-native', 'libdrm',
'gcc-cross-arm', 'systemd', 'systemd-systemctl-native', 'libffi', 'glibc',
'gcc-runtime', 'pseudo-native', 'wayland', 'libgbm', 'libpthread-stubs',
'libpciaccess', 'libtool-native', 'mpfr-native', 'gnu-config-native',
'libmpc-native', 'linux-libc-headers', 'xz-native', 'autoconf-native',
'texinfo-dummy-native', 'gmp-native', 'binutils-cross-arm', 'zlib-native',
'automake-native', 'shadow', 'kmod', 'xz', 'bash-completion',
'base-passwd', 'libcgroup', 'readline', 'libcap', 'shadow-native',
'util-linux', 'base-files', 'opkg-utils', 'libpam', 'shadow-sysroot',
'acl', 'libgcc', 'expat', 'libxml2', 'util-macros',
'gettext-minimal-native', 'm4-native', 'bison-native', 'flex-native',
'attr', 'zlib', 'ncurses', 'cracklib', 'flex', 'python3', 'openssl',
'bzip2', 'gdbm', 'db', 'sqlite3', 'cryptodev-linux']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 4 install
DESTDIR=3D/home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-=
gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/image
TARGET_PRODUCT=3D
| mkdir -p
/home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti=
-sgx-ddk-um/1.14.3699939-r28/image/etc
| mkdir -p
/home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti=
-sgx-ddk-um/1.14.3699939-r28/image/usr/bin
| mkdir -p
/home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti=
-sgx-ddk-um/1.14.3699939-r28/image/usr/include
| mkdir -p
/home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti=
-sgx-ddk-um/1.14.3699939-r28/image/usr/lib
| cp -ar ./targetfs//etc/*
/home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti=
-sgx-ddk-um/1.14.3699939-r28/image/etc
| cp: cannot stat =E2=80=98./targetfs//etc/*=E2=80=99: No such file or dire=
ctory
| make: *** [install] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_install (log file is located at
/home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti=
-sgx-ddk-um/1.14.3699939-r28/temp/log.do_install.8103)
ERROR: Task
(/home/mbaikana/workspace_agl/meta-ti/recipes-graphics/libgles/ti-sgx-ddk-u=
m_1.14.3699939.bb:do_install)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 1280 tasks of which 1275 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:

/home/mbaikana/workspace_agl/meta-ti/recipes-graphics/libgles/ti-sgx-ddk-um=
_1.14.3699939.bb:
do_install
Summary: There were 2 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

***************************************************************************=
***************************

Regards,
-Madhu.

--00000000000068ce3e0581c00771
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>He=
llo everyone,</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 I am getting an similar issue like <a href=3D"https://lists.yoctoproject.o=
rg/pipermail/meta-ti/2017-January/009481.html">https://lists.yoctoproject.o=
rg/pipermail/meta-ti/2017-January/009481.html</a>. But even after applying =
the patch specified in the above link I am observing the issue and in my ca=
se MACHINE =3D pandaboard.</div><div><br></div><div>Here is the log data:</=
div><div>******************************************************************=
************************************</div><div>mbaikana@HYMBAIKANA:~/worksp=
ace_agl/build$ bitbake agl-demo-platform<br>WARNING: Host distribution &quo=
t;ubuntu-14.04&quot; has not been validated with this version of the build =
system; you may possibly experience unexpected failures. It is recommended =
that you use a tested distribution.<br>Parsing recipes: 100% |#############=
###########################################################################=
##################| Time: 0:01:23<br>Parsing of 2571 .bb files complete (0 =
cached, 2571 parsed). 3474 targets, 430 skipped, 0 masked, 0 errors.<br>WAR=
NING: No bb files matched BBFILE_PATTERN_agl-distro &#39;^/home/mbaikana/wo=
rkspace_agl/meta-agl/meta-agl-distro/&#39;<br>NOTE: Resolving any missing t=
ask queue dependencies<br><br>Build Configuration:<br>BB_VERSION=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.36.0&quot;<=
br>BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D &quot;x86_64-linux&quot;<br>NATIVELSBSTRING=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D &quot;universal&quot;<br>TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;arm-agl-linux-gnueabi&quot;<br>=
MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D &quot;pandaboard&quot;<br>DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;poky=
-agl&quot;<br>DISTRO_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;=
6.0.3&quot;<br>TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D =
&quot;arm armv7a vfp thumb neon callconvention-hard&quot;<br>TARGET_FPU=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;hard&qu=
ot;<br>meta-ti=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D &quot;HEAD:ed83a43c6a76875ee5f0388b3b60a28f2a373a10&=
quot;<br>meta-qt5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;HEAD:682ad61c071a9710e9f9d8a32ab1b5f3c14953d1&quo=
t;<br>meta-agl-profile-graphical-qt5 <br>meta-agl-profile-graphical <br>met=
a-netboot=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;HEAD:0f=
1bcdcbe367a560dd57270f06cae593101e764b&quot;<br>meta-hmi-framework=C2=A0=C2=
=A0 <br>meta-audio-4a-framework =3D &quot;HEAD:85d1e8250e3e36fb02f3143cce76=
7388785348f4&quot;<br>meta-agl-demo=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D &quot;HEAD:98d6acf7b2805e570008eb513ac4aa73a0fa00c3&quot;<br>meta-o=
e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <br>meta-multimedia=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-networkin=
g=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-python=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-filesystems=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D &quot;HEAD:eae996301d9c097bcbeb8046f08041dc82bb62f8&quot;<br>meta-agl-p=
rofile-core <br>meta-agl-distro=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-agl-=
bsp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;HEAD:0f1bcdcb=
e367a560dd57270f06cae593101e764b&quot;<br>meta-security=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;HEAD:8f6969a775fa6afbf553e72ba83e7119778=
0b2d8&quot;<br>meta-perl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;HEAD:eae996301d9c097bcbeb8046f08041dc82bb62f8&quo=
t;<br>meta-security=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-app-=
framework=C2=A0=C2=A0 =3D &quot;HEAD:0f1bcdcbe367a560dd57270f06cae593101e76=
4b&quot;<br>meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-poky=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;HEAD:e74a1931af9c5b=
883345345a03a6a9ebf6821cb0&quot;<br><br>Initialising tasks: 100% |#########=
###########################################################################=
###################| Time: 0:00:13<br>NOTE: Executing SetScene Tasks<br>NOT=
E: Executing RunQueue Tasks<br>ERROR: ti-sgx-ddk-um-1.14.3699939-r28 do_ins=
tall: oe_runmake failed<br>ERROR: ti-sgx-ddk-um-1.14.3699939-r28 do_install=
: Function failed: do_install (log file is located at /home/mbaikana/worksp=
ace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti-sgx-ddk-um/1.14.3699=
939-r28/temp/log.do_install.8103)<br>ERROR: Logfile of failure stored in: /=
home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti-=
sgx-ddk-um/1.14.3699939-r28/temp/log.do_install.8103<br>Log data follows:<b=
r>| DEBUG: Executing python function extend_recipe_sysroot<br>| NOTE: Direc=
t dependencies are [&#39;/home/mbaikana/workspace_agl/poky/meta/recipes-dev=
tools/quilt/quilt-native_0.65.bb:do_populate_sysroot&#39;, &#39;/home/mbaik=
ana/workspace_agl/poky/meta/recipes-graphics/drm/libdrm_2.4.83.bb:do_popula=
te_sysroot&#39;, &#39;/home/mbaikana/workspace_agl/poky/meta/recipes-devtoo=
ls/gcc/gcc-cross_7.3.bb:do_populate_sysroot&#39;, &#39;/home/mbaikana/works=
pace_agl/poky/meta/recipes-core/systemd/systemd_234.bb:do_populate_sysroot&=
#39;, &#39;/home/mbaikana/workspace_agl/poky/meta/recipes-core/systemd/syst=
emd-systemctl-native.bb:do_populate_sysroot&#39;, &#39;/home/mbaikana/works=
pace_agl/poky/meta/recipes-support/libffi/libffi_3.2.1.bb:do_populate_sysro=
ot&#39;, &#39;/home/mbaikana/workspace_agl/poky/meta/recipes-core/glibc/gli=
bc_2.26.bb:do_populate_sysroot&#39;, &#39;/home/mbaikana/workspace_agl/poky=
/meta/recipes-devtools/gcc/gcc-runtime_7.3.bb:do_populate_sysroot&#39;, &#3=
9;virtual:native:/home/mbaikana/workspace_agl/poky/meta/recipes-devtools/ps=
eudo/pseudo_1.8.2.bb:do_populate_sysroot&#39;, &#39;/home/mbaikana/workspac=
e_agl/poky/meta/recipes-graphics/wayland/wayland_1.13.0.bb:do_populate_sysr=
oot&#39;, &#39;/home/mbaikana/workspace_agl/meta-ti/recipes-graphics/gbm/li=
bgbm_10.0.0.bb:do_populate_sysroot&#39;]<br>| NOTE: Installed into sysroot:=
 []<br>| NOTE: Skipping as already exists in sysroot: [&#39;quilt-native&#3=
9;, &#39;libdrm&#39;, &#39;gcc-cross-arm&#39;, &#39;systemd&#39;, &#39;syst=
emd-systemctl-native&#39;, &#39;libffi&#39;, &#39;glibc&#39;, &#39;gcc-runt=
ime&#39;, &#39;pseudo-native&#39;, &#39;wayland&#39;, &#39;libgbm&#39;, &#3=
9;libpthread-stubs&#39;, &#39;libpciaccess&#39;, &#39;libtool-native&#39;, =
&#39;mpfr-native&#39;, &#39;gnu-config-native&#39;, &#39;libmpc-native&#39;=
, &#39;linux-libc-headers&#39;, &#39;xz-native&#39;, &#39;autoconf-native&#=
39;, &#39;texinfo-dummy-native&#39;, &#39;gmp-native&#39;, &#39;binutils-cr=
oss-arm&#39;, &#39;zlib-native&#39;, &#39;automake-native&#39;, &#39;shadow=
&#39;, &#39;kmod&#39;, &#39;xz&#39;, &#39;bash-completion&#39;, &#39;base-p=
asswd&#39;, &#39;libcgroup&#39;, &#39;readline&#39;, &#39;libcap&#39;, &#39=
;shadow-native&#39;, &#39;util-linux&#39;, &#39;base-files&#39;, &#39;opkg-=
utils&#39;, &#39;libpam&#39;, &#39;shadow-sysroot&#39;, &#39;acl&#39;, &#39=
;libgcc&#39;, &#39;expat&#39;, &#39;libxml2&#39;, &#39;util-macros&#39;, &#=
39;gettext-minimal-native&#39;, &#39;m4-native&#39;, &#39;bison-native&#39;=
, &#39;flex-native&#39;, &#39;attr&#39;, &#39;zlib&#39;, &#39;ncurses&#39;,=
 &#39;cracklib&#39;, &#39;flex&#39;, &#39;python3&#39;, &#39;openssl&#39;, =
&#39;bzip2&#39;, &#39;gdbm&#39;, &#39;db&#39;, &#39;sqlite3&#39;, &#39;cryp=
todev-linux&#39;]<br>| DEBUG: Python function extend_recipe_sysroot finishe=
d<br>| DEBUG: Executing shell function do_install<br>| NOTE: make -j 4 inst=
all DESTDIR=3D/home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-li=
nux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/image TARGET_PRODUCT=3D<br>| mkd=
ir -p /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnue=
abi/ti-sgx-ddk-um/1.14.3699939-r28/image/etc<br>| mkdir -p /home/mbaikana/w=
orkspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti-sgx-ddk-um/1.14=
.3699939-r28/image/usr/bin<br>| mkdir -p /home/mbaikana/workspace_agl/build=
/tmp/work/pandaboard-agl-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/image=
/usr/include<br>| mkdir -p /home/mbaikana/workspace_agl/build/tmp/work/pand=
aboard-agl-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/image/usr/lib<br>| =
cp -ar ./targetfs//etc/* /home/mbaikana/workspace_agl/build/tmp/work/pandab=
oard-agl-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/image/etc<br>| cp: ca=
nnot stat =E2=80=98./targetfs//etc/*=E2=80=99: No such file or directory<br=
>| make: *** [install] Error 1<br>| ERROR: oe_runmake failed<br>| WARNING: =
exit code 1 from a shell command.<br>| ERROR: Function failed: do_install (=
log file is located at /home/mbaikana/workspace_agl/build/tmp/work/pandaboa=
rd-agl-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/temp/log.do_install.810=
3)<br>ERROR: Task (/home/mbaikana/workspace_agl/meta-ti/recipes-graphics/li=
bgles/ti-sgx-ddk-um_1.14.3699939.bb:do_install) failed with exit code &#39;=
1&#39;<br>NOTE: Tasks Summary: Attempted 1280 tasks of which 1275 didn&#39;=
t need to be rerun and 1 failed.<br><br>Summary: 1 task failed:<br>=C2=A0 /=
home/mbaikana/workspace_agl/meta-ti/recipes-graphics/libgles/ti-sgx-ddk-um_=
1.14.3699939.bb:do_install<br>Summary: There were 2 WARNING messages shown.=
<br>Summary: There were 2 ERROR messages shown, returning a non-zero exit c=
ode.<br><br></div><div>****************************************************=
**************************************************</div><div><br></div><div=
>Regards,</div><div>-Madhu.<br></div></div></div></div></div>

--00000000000068ce3e0581c00771--
