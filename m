Return-Path: <sudhangathan@gmail.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6EAA1E01562
	for <meta-ti@yoctoproject.org>; Tue, 25 Jun 2013 20:59:00 -0700 (PDT)
Received: by mail-qa0-f44.google.com with SMTP id o13so834126qaj.3
	for <meta-ti@yoctoproject.org>; Tue, 25 Jun 2013 20:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=FhIJ/a8hETIytXtop5vMDp433H4CGbkzFuxPSYnqic4=;
	b=T7VdnBPy0RI44eD6XXCuUGibVMtL1LqSCwx2mpRjTsAduPRyTzm+HVZ2UN+mbowP7m
	kqIjEC5ivX1NsXxKRiceWXGX700QZQI4seqhNWzNkwZm1YZslE7YtHTU0g1Rg5sFT7Ck
	fV80htNdXlgY1ljgtyoYKeYxswtWDShc19BBR4FEaw1iKfkr5s2Ns5bHRp0wNR5fHp+x
	tW8hVReARaKJqahM8UwIyw3H2Izv6MnNLxoJe67DfZC7Qpv7JR07lys1RrnGeLEgjJcZ
	qM/tqUyduNp2B1XHJ7tLAst4M9g0M5U/S1RlHs0QfIOG/v7ThY6WvH5A+gleguxDYUL9
	9L3g==
X-Received: by 10.49.101.74 with SMTP id fe10mr2405155qeb.11.1372219139155;
	Tue, 25 Jun 2013 20:58:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.95.9 with HTTP; Tue, 25 Jun 2013 20:58:38 -0700 (PDT)
From: Sudhangathan B S <sudhangathan@gmail.com>
Date: Wed, 26 Jun 2013 09:28:38 +0530
Message-ID: <CAGX3a99-Luc3AVn3L-HdtNCNeaS1GiZ_FUX8D5PJWx3rAxaePw@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: oe_runmake failed issue for 2.6.32 kernel
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
X-List-Received-Date: Wed, 26 Jun 2013 03:59:01 -0000
Content-Type: multipart/alternative; boundary=001a11c2c6ce58090204e006aab2

--001a11c2c6ce58090204e006aab2
Content-Type: text/plain; charset=ISO-8859-1

On my way to install 2.6.32 kernel for the Beagle board image. I need this
kernel to work with the leopard imaging/aptina camera module/sensors. I'm
encountering this "oe_runmake failed" issue. I have strong feeling it is
Yocto or the meta-ti layers, which is not set properly. On the web i got
related issues, but they are too old, and were related to OE.

I'm using danny branch. I had downloaded meta-ti, openembedded-core, and
meta-oe as .zip files meant for danny branch. Thanks to Denys D@ti for
help. I integrated meta-ti with yocto, and also built the image with the
default 3.2 kernel, and further with 2.6.37 kernel too, successfully.

I have also included partial terminal output below.!

These are a few lines from
/home/asahota/danny-try/danny-8.0/meta-ti/conf/machine/beagleboard.conf
*******START
#@TYPE: Machine
#@NAME: Beagleboard machine
#@DESCRIPTION: Machine configuration for the http://beagleboard.org/ board

require conf/machine/include/omap3.inc

# Only has DVI connector for external screen
GUI_MACHINE_CLASS = "bigscreen"

#PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"                <----
change
PREFERRED_VERSION_linux-omap-psp = "2.6.32"
PREFERRED_PROVIDER_virtual/bootloader = "u-boot-beagleboard"
PREFERRED_PROVIDER_u-boot = "u-boot-beagleboard"

IMAGE_FSTYPES += "tar.gz ubi"
EXTRA_IMAGECMD_jffs2 = "-lnp"

SERIAL_CONSOLE = "115200 ttyO2"

UBOOT_MACHINE = "omap3_beagle_config"
*******END


These are the FIRST few lines of my terminal output, for the command
bitbake core-image-sato
*******START
WARNING: Host distribution "Ubuntu 12.04.2 LTS" has not been validated with
this version of the build system; you may possibly experience unexpected
failures. It is recommended that you use a tested distribution.
Loading cache: 100%
|###################################################################################################################################|
ETA:  00:00:00
Loaded 1210 entries from dependency cache.

Build Configuration:
BB_VERSION        = "1.16.0"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beagleboard"
DISTRO            = "poky"
DISTRO_VERSION    = "1.3"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto
meta-ti
meta-yocto-bsp    = "<unknown>:<unknown>"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
*******END


These are the LAST few lines of my terminal output, for the command bitbake
-vvv core-image-sato
*******START
| include/linux/pagemap.h: In function 'fault_in_pages_readable':
| include/linux/pagemap.h:413:16: warning: variable 'c' set but not used
[-Wunused-but-set-variable]
 |   LD      fs/ubifs/ubifs.o
|   LD      fs/ubifs/built-in.o
|   LD      fs/built-in.o
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compileconfigs (see
/home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-gnueabi/linux-omap-psp-2.6.32-r0/temp/log.do_compileconfigs.28440
for further information)
ERROR: Task 805
(/home/asahota/danny-try/danny-8.0/meta-ti/recipes-kernel/linux/
linux-omap-psp_2.6.32.bb, do_compileconfigs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 5104 tasks of which 5097 didn't need to be
rerun and 1 failed.
No currently running tasks (5104 of 5135)

Summary: 1 task failed:
  /home/asahota/danny-try/danny-8.0/meta-ti/recipes-kernel/linux/
linux-omap-psp_2.6.32.bb, do_compileconfigs
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
*****END

I spent a lot of time tracing the error in the YP folders and files. It was
somewhere near kernel_do_configure. But I couldn't get where "oe_runmake"
is. Couldn't continue debugging.

---------------------------------
Sudhangathan BS
Ph:(+91) 9731-905-205
---------------------------------

--001a11c2c6ce58090204e006aab2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On my way to install 2.6.32 kernel for the Beagle boa=
rd image. I need this kernel to work with the leopard imaging/aptina camera=
 module/sensors. I&#39;m encountering this &quot;oe_runmake failed&quot; is=
sue. I have strong feeling it is Yocto or the meta-ti layers, which is not =
set properly. On the web i got related issues, but they are too old, and we=
re related to OE.<br>

<br></div><div>I&#39;m using danny branch. I had downloaded meta-ti, openem=
bedded-core, and meta-oe as .zip files meant for danny branch. Thanks to De=
nys D@ti for help. I integrated meta-ti with yocto, and also built the imag=
e with the default 3.2 kernel, and further with 2.6.37 kernel too, successf=
ully.<br>

<br></div><div>I have also included partial terminal output below.!<br></di=
v><div><br>These are a few lines from /home/asahota/danny-try/danny-8.0/met=
a-ti/conf/machine/beagleboard.conf<br></div><div>*******START<br>#@TYPE: Ma=
chine<br>

#@NAME: Beagleboard machine<br>#@DESCRIPTION: Machine configuration for the=
 <a href=3D"http://beagleboard.org/">http://beagleboard.org/</a> board <br>=
<br>require conf/machine/include/omap3.inc<br><br># Only has DVI connector =
for external screen<br>

GUI_MACHINE_CLASS =3D &quot;bigscreen&quot;<br><br>#PREFERRED_PROVIDER_virt=
ual/kernel =3D &quot;linux-mainline&quot;<br>PREFERRED_PROVIDER_virtual/ker=
nel =3D &quot;linux-omap-psp&quot;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 &lt;---- change<br>PREFERRED_VERSION_linux-omap-psp =3D &quot;2.6.32=
&quot;<br>

PREFERRED_PROVIDER_virtual/bootloader =3D &quot;u-boot-beagleboard&quot;<br=
>PREFERRED_PROVIDER_u-boot =3D &quot;u-boot-beagleboard&quot;<br><br>IMAGE_=
FSTYPES +=3D &quot;tar.gz ubi&quot;<br>EXTRA_IMAGECMD_jffs2 =3D &quot;-lnp&=
quot;<br>

<br>SERIAL_CONSOLE =3D &quot;115200 ttyO2&quot;<br><br>UBOOT_MACHINE =3D &q=
uot;omap3_beagle_config&quot;<br></div><div>*******END<br><br><br></div><di=
v>These are the FIRST few lines of my terminal output, for the command bitb=
ake core-image-sato<br>

*******START<br>WARNING: Host distribution &quot;Ubuntu 12.04.2 LTS&quot; h=
as not been validated with this version of the build system; you may possib=
ly experience unexpected failures. It is recommended that you use a tested =
distribution.<br>

Loading cache: 100% |######################################################=
###########################################################################=
##| ETA:=A0 00:00:00<br>Loaded 1210 entries from dependency cache.<br><br>

Build Configuration:<br>BB_VERSION=A0=A0=A0=A0=A0=A0=A0 =3D &quot;1.16.0&qu=
ot;<br>TARGET_ARCH=A0=A0=A0=A0=A0=A0 =3D &quot;arm&quot;<br>TARGET_OS=A0=A0=
=A0=A0=A0=A0=A0=A0 =3D &quot;linux-gnueabi&quot;<br>MACHINE=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 =3D &quot;beagleboard&quot;<br>DISTRO=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 =3D &quot;poky&quot;<br>

DISTRO_VERSION=A0=A0=A0 =3D &quot;1.3&quot;<br>TUNE_FEATURES=A0=A0=A0=A0 =
=3D &quot;armv7a vfp neon cortexa8&quot;<br>TARGET_FPU=A0=A0=A0=A0=A0=A0=A0=
 =3D &quot;vfp-neon&quot;<br>meta=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 <b=
r>meta-yocto=A0=A0=A0=A0=A0=A0=A0 <br>meta-ti=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 <br>meta-yocto-bsp=A0=A0=A0 =3D &quot;&lt;unknown&gt;:&lt;unknown&gt;&quot=
;<br>

<br>NOTE: Resolving any missing task queue dependencies<br>NOTE: Preparing =
runqueue<br>NOTE: Executing SetScene Tasks<br>*******END<br><br><br>These a=
re the LAST few lines of my terminal output, for the command bitbake -vvv c=
ore-image-sato<br>

</div><div>*******START<br>| include/linux/pagemap.h: In function &#39;faul=
t_in_pages_readable&#39;:</div><div>| include/linux/pagemap.h:413:16: warni=
ng: variable &#39;c&#39; set but not used [-Wunused-but-set-variable]</div>

<div>

| =A0 LD =A0 =A0 =A0fs/ubifs/ubifs.o</div><div>| =A0 LD =A0 =A0 =A0fs/ubifs=
/built-in.o</div><div>| =A0 LD =A0 =A0 =A0fs/built-in.o</div><div>| ERROR: =
oe_runmake failed</div><div>| ERROR: Function failed: do_compileconfigs (se=
e /home/asahota/danny-try/danny-8.0/build/tmp/work/beagleboard-poky-linux-g=
nueabi/linux-omap-psp-2.6.32-r0/temp/log.do_compileconfigs.28440 for furthe=
r information)</div>



<div>ERROR: Task 805 (/home/asahota/danny-try/danny-8.0/meta-ti/recipes-ker=
nel/linux/<a href=3D"http://linux-omap-psp_2.6.32.bb" target=3D"_blank">lin=
ux-omap-psp_2.6.32.bb</a>, do_compileconfigs) failed with exit code &#39;1&=
#39;</div>


<div>NOTE: Tasks Summary: Attempted 5104 tasks of which 5097 didn&#39;t nee=
d to be rerun and 1 failed.</div>
<div>No currently running tasks (5104 of 5135)</div><div><br></div><div>Sum=
mary: 1 task failed:</div><div>=A0 /home/asahota/danny-try/danny-8.0/meta-t=
i/recipes-kernel/linux/<a href=3D"http://linux-omap-psp_2.6.32.bb" target=
=3D"_blank">linux-omap-psp_2.6.32.bb</a>, do_compileconfigs</div>



<div>Summary: There was 1 WARNING message shown.</div><div>Summary: There w=
as 1 ERROR message shown, returning a non-zero exit code.</div><div>*****EN=
D<br><br></div><div>I spent a lot of time tracing the error in the YP folde=
rs and files. It was somewhere near kernel_do_configure. But I couldn&#39;t=
 get where &quot;oe_runmake&quot; is. Couldn&#39;t continue debugging.<br>

</div><div><br></div><div>---------------------------------<br>Sudhangathan=
 BS<br>Ph:<a href=3D"tel:%28%2B91%29%209731-905-205" value=3D"+919731905205=
" target=3D"_blank">(+91) 9731-905-205</a><br>

---------------------------------</div>
</div>

--001a11c2c6ce58090204e006aab2--
