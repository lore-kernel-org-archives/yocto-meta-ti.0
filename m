Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7373E0095D; Sun, 21 Jun 2015 19:29:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ankur.tyagi85[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.42 listed in list.dnswl.org]
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D05AE00793
	for <meta-ti@yoctoproject.org>; Sun, 21 Jun 2015 19:29:05 -0700 (PDT)
Received: by oigb199 with SMTP id b199so70960659oig.3
	for <meta-ti@yoctoproject.org>; Sun, 21 Jun 2015 19:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=b5aETWNY/9/2BQu/zmM/TiNow83TcWoAv5ndxHchihk=;
	b=PqNJPZv1ZxsC+90z2eYWbPp3k8BkzpBPHHdNrDaBp0qNaxs0Saetd8lk7Pj6bXNiWv
	zjAqihdeSeRM4bYVYF061YFa4RNXX00YqU8soWGI0dVbl5Tw8dQV+kgB17FZt2VT99cF
	T1SSvsNIUWBJv+g2zWUj6aqDwkLOJIJKVItlKdpdhNAUoBeA0CQrw9iWDTB5dAQm8EKQ
	r1XcCT+QHl4dwFX1VNljKPpZTvKfWbuOvxo2hfkkVXcZLGdGaTbyMFCpdH/31fiiF/Pr
	b7soVj6xdwQsrb5t5wSpvRCuilMyThhaXwNp9WxNvD/pix3tBKF14SP1cBB6aeWpeQ+s
	oU0w==
X-Received: by 10.202.71.20 with SMTP id u20mr21638566oia.81.1434940144969;
	Sun, 21 Jun 2015 19:29:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.106.213 with HTTP; Sun, 21 Jun 2015 19:28:45 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 22 Jun 2015 14:28:45 +1200
Message-ID: <CADySD0HphnNi2CXZKZP82Vumbv-ajwDsUBNjh2SQ+w+W5dnq6A@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Problem building chromium for AM335x EVM
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
X-List-Received-Date: Mon, 22 Jun 2015 02:29:09 -0000
Content-Type: multipart/alternative; boundary=001a113e53649d6d8f05191209b4

--001a113e53649d6d8f05191209b4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E2=80=8B=E2=80=8B
Hi,

I am trying to build chromium for AM335x EVM but having trouble. I am using
arago-daisy-config
When chromium is doing the configure step it is halted with a message that
the package
gdk-2.0 is missing. Can someone give a hint about whats wrong in my
configuration and how to
proceed?

In my local.conf I have added:

DISTRO_FEATURES_remove =3D " x11 wayland"
PACKAGECONFIG_remove =3D " x11 wayland"

This is the output from 'bitbake chromium':


Loading cache: 100%
|##########################################################################=
###########################################################################=
###################|
ETA:  00:00:00
Loaded 2346 entries from dependency cache.
Parsing recipes: 100%
|##########################################################################=
###########################################################################=
#################|
Time: 00:00:03
Parsing of 1911 .bb files complete (1904 cached, 7 parsed). 2352 targets,
224 skipped, 0 masked, 0 errors.
WARNING: No recipes available for:

/home/ankur/ti-arago/new/oe-layersetup/sources/meta-openembedded/meta-brows=
er/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bbappen=
d
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        =3D "1.26.0"
BUILD_SYS         =3D "i686-linux"
NATIVELSBSTRING   =3D "Ubuntu-14.04"
TARGET_SYS        =3D "arm-linux-gnueabi"
MACHINE           =3D "am335x-evm"
DISTRO            =3D "arago"
DISTRO_VERSION    =3D "2015.05"
TUNE_FEATURES     =3D "armv7a vfp thumb neon callconvention-hard cortexa8"
TARGET_FPU        =3D "vfp-neon"
meta-arago-distro
meta-arago-extras =3D "daisy:dd99e55e89ca680b18ebfa80dacbef4895e17511"
meta-qt5          =3D "master:5ebbfedbc72452d2de18ce1557a36f3ba8b1175f"
toolchain-layer
meta-networking
meta-ruby         =3D "daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa"
meta-browser      =3D "master:fff8d3bdc97ddb97d4129256ee5c7708a85c4aca"
meta-oe           =3D "daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa"
meta-ti           =3D "daisy:7e50591a6902ced8c32f40109567d969e45c815e"
meta-linaro-toolchain =3D "daisy:06008235ca752fea678953e85adaa29a491d246b"
meta              =3D "daisy:5a577ec878a15f3caaf4893b819825ffb8c81266"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_configure (log file is located at
/home/ankur/ti-arago/new/oe-layersetup/build/arago-tmp-external-linaro-tool=
chain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/tem=
p/log.do_configure.30182)
ERROR: Logfile of failure stored in:
/home/ankur/ti-arago/new/oe-layersetup/build/arago-tmp-external-linaro-tool=
chain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/tem=
p/log.do_configure.30182
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function do_configure
| Updating projects from gyp files...
| Package gdk-2.0 was not found in the pkg-config search path.
| Perhaps you should add the directory containing `gdk-2.0.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'gdk-2.0' found
| gyp: Call to 'pkg-config --cflags gdk-2.0' returned exit status 1.
| WARNING:
/home/ankur/ti-arago/new/oe-layersetup/build/arago-tmp-external-linaro-tool=
chain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/tem=
p/run.do_configure.30182:1
exit 1 from
|   build/gyp_chromium --depth=3D. -Dangle_use_commit_id=3D0 -Dclang=3D0
-Dhost_clang=3D0 -Ddisable_fatal_linker_warnings=3D1 -Dlinux_use_gold_binar=
y=3D0
-Dlinux_use_gold_flags=3D0 -I
/home/ankur/ti-arago/new/oe-layersetup/build/arago-tmp-external-linaro-tool=
chain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/oe-=
defaults.gypi
-I
/home/ankur/ti-arago/new/oe-layersetup/build/arago-tmp-external-linaro-tool=
chain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/inc=
lude.gypi
-f ninja
| ERROR: Function failed: do_configure (log file is located at
/home/ankur/ti-arago/new/oe-layersetup/build/arago-tmp-external-linaro-tool=
chain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/tem=
p/log.do_configure.30182)
ERROR: Task 4
(/home/ankur/ti-arago/new/oe-layersetup/sources/meta-openembedded/meta-brow=
ser/recipes-browser/chromium/
chromium_40.0.2214.91.bb, do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1075 tasks of which 1074 didn't need to be
rerun and 1 failed.
No currently running tasks (1075 of 1076)

Summary: 1 task failed:

/home/ankur/ti-arago/new/oe-layersetup/sources/meta-openembedded/meta-brows=
er/recipes-browser/chromium/
chromium_40.0.2214.91.bb, do_configure
Summary: There was 1 WARNING message shown.
NOTE: Writing buildhistory
ankur@GGL-PC1210:~/ti-arago/new/oe-layersetup/build$

=E2=80=8Bregards
Ankur=E2=80=8B

--001a113e53649d6d8f05191209b4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:rgb(51,51,153);display:inline">=E2=80=8B=E2=80=
=8B</div>Hi,<br><br>I am trying to build chromium for AM335x EVM but having=
 trouble. I am using arago-daisy-config<br>When chromium is doing the confi=
gure step it is halted with a message that the package<br>gdk-2.0 is missin=
g. Can someone give a hint about whats wrong in my configuration and how to=
 <br>proceed?<br><br>In my local.conf I have added:<br><br>DISTRO_FEATURES_=
remove =3D &quot; x11 wayland&quot;<br>PACKAGECONFIG_remove =3D &quot; x11 =
wayland&quot;<br><br>This is the output from &#39;bitbake chromium&#39;:<br=
><br><br>Loading cache: 100% |#############################################=
###########################################################################=
################################################| ETA: =C2=A000:00:00<br>Lo=
aded 2346 entries from dependency cache.<br>Parsing recipes: 100% |########=
###########################################################################=
###########################################################################=
########| Time: 00:00:03<br>Parsing of 1911 .bb files complete (1904 cached=
, 7 parsed). 2352 targets, 224 skipped, 0 masked, 0 errors.<br>WARNING: No =
recipes available for:<br>=C2=A0 /home/ankur/ti-arago/new/oe-layersetup/sou=
rces/meta-openembedded/meta-browser/recipes-gnome/gnome-settings-daemon/gno=
me-settings-daemon_2.32.1.bbappend<br>NOTE: Resolving any missing task queu=
e dependencies<br><br>Build Configuration:<br>BB_VERSION =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;1.26.0&quot;<br>BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;i686-linux&quot;<br>NATIVELSBSTRING =C2=A0 =3D &quot;Ubuntu-14.04=
&quot;<br>TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-linux-gnueabi=
&quot;<br>MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;am335x-evm&q=
uot;<br>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arago&quo=
t;<br>DISTRO_VERSION =C2=A0 =C2=A0=3D &quot;2015.05&quot;<br>TUNE_FEATURES =
=C2=A0 =C2=A0 =3D &quot;armv7a vfp thumb neon callconvention-hard cortexa8&=
quot;<br>TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;vfp-neon&quot;<br>=
meta-arago-distro<br>meta-arago-extras =3D &quot;daisy:dd99e55e89ca680b18eb=
fa80dacbef4895e17511&quot;<br>meta-qt5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;master:5ebbfedbc72452d2de18ce1557a36f3ba8b1175f&quot;<br>toolchai=
n-layer =C2=A0 <br>meta-networking =C2=A0 <br>meta-ruby =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D &quot;daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa&quot;<b=
r>meta-browser =C2=A0 =C2=A0 =C2=A0=3D &quot;master:fff8d3bdc97ddb97d412925=
6ee5c7708a85c4aca&quot;<br>meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &=
quot;daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa&quot;<br>meta-ti =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;daisy:7e50591a6902ced8c32f40109567d9=
69e45c815e&quot;<br>meta-linaro-toolchain =3D &quot;daisy:06008235ca752fea6=
78953e85adaa29a491d246b&quot;<br>meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;daisy:5a577ec878a15f3caaf4893b819825ffb8c81266&quot;=
<br><br>NOTE: Preparing RunQueue<br>NOTE: Executing SetScene Tasks<br>NOTE:=
 Executing RunQueue Tasks<br>ERROR: Function failed: do_configure (log file=
 is located at /home/ankur/ti-arago/new/oe-layersetup/build/arago-tmp-exter=
nal-linaro-toolchain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0=
.2214.91-r0/temp/log.do_configure.30182)<br>ERROR: Logfile of failure store=
d in: /home/ankur/ti-arago/new/oe-layersetup/build/arago-tmp-external-linar=
o-toolchain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-=
r0/temp/log.do_configure.30182<br>Log data follows:<br>| DEBUG: Executing p=
ython function sysroot_cleansstate<br>| DEBUG: Python function sysroot_clea=
nsstate finished<br>| DEBUG: Executing shell function do_configure<br>| Upd=
ating projects from gyp files...<br>| Package gdk-2.0 was not found in the =
pkg-config search path.<br>| Perhaps you should add the directory containin=
g `gdk-2.0.pc&#39;<br>| to the PKG_CONFIG_PATH environment variable<br>| No=
 package &#39;gdk-2.0&#39; found<br>| gyp: Call to &#39;pkg-config --cflags=
 gdk-2.0&#39; returned exit status 1.<br>| WARNING: /home/ankur/ti-arago/ne=
w/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf=
-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/temp/run.do_configure.3018=
2:1 exit 1 from<br>| =C2=A0 build/gyp_chromium --depth=3D. -Dangle_use_comm=
it_id=3D0 -Dclang=3D0 -Dhost_clang=3D0 -Ddisable_fatal_linker_warnings=3D1 =
-Dlinux_use_gold_binary=3D0 -Dlinux_use_gold_flags=3D0 -I /home/ankur/ti-ar=
ago/new/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortex=
a8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/oe-defaults.gypi -I =
/home/ankur/ti-arago/new/oe-layersetup/build/arago-tmp-external-linaro-tool=
chain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/inc=
lude.gypi -f ninja<br>| ERROR: Function failed: do_configure (log file is l=
ocated at /home/ankur/ti-arago/new/oe-layersetup/build/arago-tmp-external-l=
inaro-toolchain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214=
.91-r0/temp/log.do_configure.30182)<br>ERROR: Task 4 (/home/ankur/ti-arago/=
new/oe-layersetup/sources/meta-openembedded/meta-browser/recipes-browser/ch=
romium/<a href=3D"http://chromium_40.0.2214.91.bb">chromium_40.0.2214.91.bb=
</a>, do_configure) failed with exit code &#39;1&#39;<br>NOTE: Tasks Summar=
y: Attempted 1075 tasks of which 1074 didn&#39;t need to be rerun and 1 fai=
led.<br>No currently running tasks (1075 of 1076)<br><br>Summary: 1 task fa=
iled:<br>=C2=A0 /home/ankur/ti-arago/new/oe-layersetup/sources/meta-openemb=
edded/meta-browser/recipes-browser/chromium/<a href=3D"http://chromium_40.0=
.2214.91.bb">chromium_40.0.2214.91.bb</a>, do_configure<br>Summary: There w=
as 1 WARNING message shown.<br>NOTE: Writing buildhistory<br>ankur@GGL-PC12=
10:~/ti-arago/new/oe-layersetup/build$<br><br><div class=3D"gmail_default" =
style=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,153)">=
=E2=80=8Bregards<br></div><div class=3D"gmail_default" style=3D"font-family=
:georgia,serif;font-size:small;color:rgb(51,51,153)">Ankur=E2=80=8B</div><b=
r></div>

--001a113e53649d6d8f05191209b4--
