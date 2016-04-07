Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD7F5E00C1F; Thu,  7 Apr 2016 00:38:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9822E00AEA
	for <meta-ti@yoctoproject.org>; Thu,  7 Apr 2016 00:38:15 -0700 (PDT)
Received: by mail-pf0-f178.google.com with SMTP id 184so50821246pff.0
	for <meta-ti@yoctoproject.org>; Thu, 07 Apr 2016 00:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:subject:date:mime-version:importance
	:disposition-notification-to;
	bh=DAtbNTMx6srLHiziiCUKasAlhbHjH2sOX9g8T+nh4lQ=;
	b=Bklguxnnk41vQY1O8DgoIn89J84K46cob7hVmJuQdaKEkZsznWVVno8/4TYnxSH5gi
	W/C6RjTnkD9Y2O6r4/1s9sTVE3UlKULQ/48MqWv9OiWt8nCe0beZkCHWpuhk5bJkMVkh
	2MMpjG0nh7/sxU46gyxwwwpnXWDgwncstlLxAs67hBp3Bd6gDWZ5RYQX6NtOach6Fzvr
	w7/T0Bk14sEUtn3rIfN7IUtke/sTd/1aTnHWFjmDlANp/kFv8jgLAkImh6OHu2dt/k3K
	xzTLjnKbpwierGS0/HkloTZ53aWlgcBfQsdpcW2TVvM3V70jFdQLPN4NZvjUTwsssFEb
	1xCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
	:importance:disposition-notification-to;
	bh=DAtbNTMx6srLHiziiCUKasAlhbHjH2sOX9g8T+nh4lQ=;
	b=ZT6kbhWvWiLLoKw/i6ylZUn9z8oCBRl7berCL6ZQkgztOxMYKauoaYkjaE5Wu5MOCl
	FCepxlvNqAKWC1OjojZluaY4wNOqHu9Q9K+hQi2MQXu6LHaEh8EE+hr2q+Uzkc0eH+CW
	WPRscUHMTQ9Gq9GVglRt/a/Dy618XTco60EWZIrrn5rnFb8DEu1SvDijf8c0QEKkRxLH
	cbVqGeSf1mak/gO+r2upnN0E6U1+9FPRh9VpucVmzBIi25OF9rrJmmRgq+5nUCi20Hid
	d++ZRZVfakhWVJoXfbbF2imalx1ja/aeXU7mZIVL0IiToNG8sScsFYMq6LcSv+oip4Vb
	f9Ag==
X-Gm-Message-State: AD7BkJKkfvTcyQH8/wEJHBxSjydicIe6CSD1bkOemUOAo35gj3uDA8Lb4bMcGpzKI6uqKQ==
X-Received: by 10.98.71.70 with SMTP id u67mr2723696pfa.85.1460014694971;
	Thu, 07 Apr 2016 00:38:14 -0700 (PDT)
Received: from RD3 ([59.99.236.185])
	by smtp.gmail.com with ESMTPSA id o7sm9741327pfa.37.2016.04.07.00.38.11
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Apr 2016 00:38:13 -0700 (PDT)
Message-ID: <188BD465D20643E496811D07CF7FDF9C@RD3>
From: <winiston@futuraautomation.com>
To: "OpenEmbedded core" <openembedded-core@lists.openembedded.org>,
	"yocto texas" <meta-ti@yoctoproject.org>
Date: Thu, 7 Apr 2016 13:11:02 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Cc: Yocto layer <linux-yocto@yoctoproject.org>
Subject: Problem in Third party Software (Navit) integration
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
X-List-Received-Date: Thu, 07 Apr 2016 07:38:17 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0069_01D190CE.EF5060A0"

------=_NextPart_000_0069_01D190CE.EF5060A0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear,

I cannot add =E2=80=9CNavit=E2=80=9D to my  kernel =
(=E2=80=9Ccore-image-base=E2=80=9D or =E2=80=9Cqt4e-demo-image=E2=80=9D =
).  Kernel is successfully generated. But =E2=80=9CNavit=E2=80=9D is not =
running in my kernel. How do I integrate =E2=80=9Cnavit=E2=80=9D to my =
kernel .  Please provide the way to add =E2=80=9Cnavit=E2=80=9D.
Note: =E2=80=9CNavit=E2=80=9D is navigation software.
I am using yocto build system (Poky) for building =
=E2=80=9Ccore-image-base=E2=80=9D kernel for =
=E2=80=9Cam437x-evm=E2=80=9D.  Since I want to integrate =
=E2=80=9CNavit=E2=80=9D to my kernel, I have added =
=E2=80=9Cmeta-oe=E2=80=9D layer .  =E2=80=9Cmeta-oe=E2=80=9D(jethro =
branch) has been downloaded from open embedded project and integrated to =
poky. meta-oe has =E2=80=9Crecipes-navigation=E2=80=9D.=20

After that  I made the following changes in =
=E2=80=9C/build/conf/local.conf =E2=80=9C to integrate =
=E2=80=9CNavit=E2=80=9D to my kernel.

1.   IMAGE_INSTALL_append =3D " navit"       (For append Navit to my =
kernel ).
2.  DISTRO_FEATURES_BACKFILL_CONSIDERED =3D " bluez5"               =
(navit is using bluez4. For avoid conflict to blue54 and bluez5, this =
line is added ).
3. BBFILES+=3D "${HOME}/winiston/poky/meta-oe/recipes-navigation/*/*.bb" =
      =20
4.  MACHINE ??=3D "am437x-evm"     (=E2=80=9Cam437x-evm=E2=80=9D machine =
is selected).

bblayers.conf (/build/conf/bblayers.conf ) files as given below.

# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION =3D "6"

BBPATH =3D "${TOPDIR}"
BBFILES ?=3D ""

BBLAYERS ?=3D " \
  /home/winiston/poky/meta \
  /home/winiston/poky/meta-yocto \
  /home/winiston/poky/meta-yocto-bsp \
  /home/winiston/poky/meta-ti \
  /home/winiston/poky/meta-oe \
  "
BBLAYERS_NON_REMOVABLE ?=3D " \
  /home/winiston/poky/meta \
  /home/winiston/poky/meta-yocto \
  "
#wini
BBFILES +=3D "${HOME}/winiston/poky/meta/recipes-qt/*/*.bb"
#added by hob
BBFILES +=3D "${TOPDIR}/recipes/images/custom/*.bb"
#added by hob
BBFILES +=3D "${TOPDIR}/recipes/images/*.bb"

Please see my below  command and terminal window output.

winiston@winiston-VirtualBox:~/poky$ source oe-init-build-env
### Shell environment set up for builds. ###

You can now run 'bitbake <target>'

Common targets are:
    core-image-minimal
    core-image-sato
    meta-toolchain
    adt-installer
    meta-ide-support

You can also run generated qemu images with a command like 'runqemu =
qemux86'
winiston@winiston-VirtualBox:~/poky/build$ bitbake core-image-base
Loading cache: 100% |##########################| ETA:  00:00:00
Loaded 2223 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for jpeg (jpeg, libjpeg-turbo)
NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg
NOTE: multiple providers are available for jpeg-native (jpeg-native, =
libjpeg-turbo-native)
NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg-native

Build Configuration:
BB_VERSION        =3D "1.28.0"
BUILD_SYS         =3D "i686-linux"
NATIVELSBSTRING   =3D "Ubuntu-14.04"
TARGET_SYS        =3D "arm-poky-linux-gnueabi"
MACHINE           =3D "am437x-evm"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "2.0.1"
TUNE_FEATURES     =3D "arm armv7a vfp thumb neon callconvention-hard =
cortexa9"
TARGET_FPU        =3D "vfp-neon"
meta             =20
meta-yocto       =20
meta-yocto-bsp    =3D "jethro:12fae239641cc7a72c509a1a0841ab8bb06ce7f0"
meta-ti           =3D "master:963c35fc490a733a533c0c30471f9974eed451d6"
meta-oe           =3D "jethro:12fae239641cc7a72c509a1a0841ab8bb06ce7f0"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 3805 tasks of which 3799 didn't need to =
be rerun and all succeeded.

Kernel is successfully generated. But =E2=80=9CNavit=E2=80=9D is not =
running in my kernel. How do I integrate/add =E2=80=9CNavit=E2=80=9D to =
my kernel ? should I make any other configuration and package?

Thanks in advance...

Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291

------=_NextPart_000_0069_01D190CE.EF5060A0
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV>Dear,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I cannot add =E2=80=9CNavit=E2=80=9D to my&nbsp; kernel =
(=E2=80=9Ccore-image-base=E2=80=9D or=20
=E2=80=9Cqt4e-demo-image=E2=80=9D ). <FONT =
color=3D#000000>&nbsp;</FONT><FONT=20
style=3D"COLOR: #0000ff" color=3D#000000><FONT color=3D#000000>Kernel is =
successfully=20
generated. But =E2=80=9CNavit=E2=80=9D is not running in my =
kernel</FONT>. </FONT>How do I=20
integrate =E2=80=9Cnavit=E2=80=9D to my kernel .&nbsp; Please provide =
the way to add=20
=E2=80=9Cnavit=E2=80=9D.</DIV>
<DIV><FONT color=3D#0000ff>Note: =E2=80=9CNavit=E2=80=9D is navigation =
software.</FONT></DIV>
<DIV>I am using yocto build system (Poky) for building =
=E2=80=9Ccore-image-base=E2=80=9D kernel=20
for =E2=80=9Cam437x-evm=E2=80=9D.&nbsp; Since I want to integrate =
=E2=80=9CNavit=E2=80=9D to my kernel, I have=20
added =E2=80=9Cmeta-oe=E2=80=9D layer .&nbsp; =
=E2=80=9Cmeta-oe=E2=80=9D(jethro branch) has been downloaded from=20
open embedded project and integrated to poky. meta-oe has =
=E2=80=9Crecipes-navigation=E2=80=9D.=20
</DIV>
<DIV>&nbsp;</DIV>
<DIV>After that&nbsp; I made the following changes in =
=E2=80=9C/build/conf/local.conf =E2=80=9C=20
to integrate =E2=80=9CNavit=E2=80=9D to my kernel.</DIV>
<DIV>&nbsp;</DIV>
<DIV>1.&nbsp;&nbsp; IMAGE_INSTALL_append =3D "=20
navit"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (For append Navit to my =
kernel=20
).</DIV>
<DIV>2.&nbsp; DISTRO_FEATURES_BACKFILL_CONSIDERED =3D "=20
bluez5"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;=20
(navit is using bluez4. For avoid conflict to blue54 and bluez5, this =
line is=20
added ).</DIV>
<DIV>3. BBFILES+=3D=20
"${HOME}/winiston/poky/meta-oe/recipes-navigation/*/*.bb"&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;=20
</DIV>
<DIV>4.&nbsp; MACHINE ??=3D "am437x-evm"&nbsp;&nbsp;&nbsp;&nbsp; =
(=E2=80=9Cam437x-evm=E2=80=9D=20
machine is selected).</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#9b00d3>bblayers.conf (/build/conf/bblayers.conf ) =
files as=20
given below.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV># LAYER_CONF_VERSION is increased each time =
build/conf/bblayers.conf</DIV>
<DIV># changes incompatibly</DIV>
<DIV>LCONF_VERSION =3D "6"</DIV>
<DIV>&nbsp;</DIV>
<DIV>BBPATH =3D "${TOPDIR}"</DIV>
<DIV>BBFILES ?=3D ""</DIV>
<DIV>&nbsp;</DIV>
<DIV>BBLAYERS ?=3D " \</DIV>
<DIV>&nbsp; /home/winiston/poky/meta \</DIV>
<DIV>&nbsp; /home/winiston/poky/meta-yocto \</DIV>
<DIV>&nbsp; /home/winiston/poky/meta-yocto-bsp \</DIV>
<DIV>&nbsp; /home/winiston/poky/meta-ti \</DIV>
<DIV>&nbsp; /home/winiston/poky/meta-oe \</DIV>
<DIV>&nbsp; "</DIV>
<DIV>BBLAYERS_NON_REMOVABLE ?=3D " \</DIV>
<DIV>&nbsp; /home/winiston/poky/meta \</DIV>
<DIV>&nbsp; /home/winiston/poky/meta-yocto \</DIV>
<DIV>&nbsp; "</DIV>
<DIV>#wini</DIV>
<DIV>BBFILES +=3D "${HOME}/winiston/poky/meta/recipes-qt/*/*.bb"</DIV>
<DIV>#added by hob</DIV>
<DIV>BBFILES +=3D "${TOPDIR}/recipes/images/custom/*.bb"</DIV>
<DIV>#added by hob</DIV>
<DIV>BBFILES +=3D "${TOPDIR}/recipes/images/*.bb"</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>Please see my below&nbsp; command and =
terminal window=20
output.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>winiston@winiston-VirtualBox:~/poky$ source oe-init-build-env</DIV>
<DIV>### Shell environment set up for builds. ###</DIV>
<DIV>&nbsp;</DIV>
<DIV>You can now run 'bitbake &lt;target&gt;'</DIV>
<DIV>&nbsp;</DIV>
<DIV>Common targets are:</DIV>
<DIV>&nbsp;&nbsp;&nbsp; core-image-minimal</DIV>
<DIV>&nbsp;&nbsp;&nbsp; core-image-sato</DIV>
<DIV>&nbsp;&nbsp;&nbsp; meta-toolchain</DIV>
<DIV>&nbsp;&nbsp;&nbsp; adt-installer</DIV>
<DIV>&nbsp;&nbsp;&nbsp; meta-ide-support</DIV>
<DIV>&nbsp;</DIV>
<DIV>You can also run generated qemu images with a command like 'runqemu =

qemux86'</DIV>
<DIV><FONT color=3D#0000ff>winiston@winiston-VirtualBox:~/poky/build$ =
bitbake=20
core-image-base</FONT></DIV>
<DIV>Loading cache: 100% |##########################| ETA:&nbsp; =
00:00:00</DIV>
<DIV>Loaded 2223 entries from dependency cache.</DIV>
<DIV>NOTE: Resolving any missing task queue dependencies</DIV>
<DIV>NOTE: multiple providers are available for jpeg (jpeg, =
libjpeg-turbo)</DIV>
<DIV>NOTE: consider defining a PREFERRED_PROVIDER entry to match =
jpeg</DIV>
<DIV>NOTE: multiple providers are available for jpeg-native =
(jpeg-native,=20
libjpeg-turbo-native)</DIV>
<DIV>NOTE: consider defining a PREFERRED_PROVIDER entry to match=20
jpeg-native</DIV>
<DIV>&nbsp;</DIV>
<DIV>Build Configuration:</DIV>
<DIV>BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
"1.28.0"</DIV>
<DIV>BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=20
"i686-linux"</DIV>
<DIV>NATIVELSBSTRING&nbsp;&nbsp; =3D "Ubuntu-14.04"</DIV>
<DIV>TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=20
"arm-poky-linux-gnueabi"</DIV>
<DIV>MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D=20
"am437x-evm"</DIV>
<DIV>DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; =3D=20
"poky"</DIV>
<DIV>DISTRO_VERSION&nbsp;&nbsp;&nbsp; =3D "2.0.1"</DIV>
<DIV>TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp; =3D "arm armv7a vfp thumb =
neon=20
callconvention-hard cortexa9"</DIV>
<DIV>TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
"vfp-neon"</DIV>
<DIV>meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
</DIV>
<DIV>meta-yocto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </DIV>
<DIV>meta-yocto-bsp&nbsp;&nbsp;&nbsp; =3D=20
"jethro:12fae239641cc7a72c509a1a0841ab8bb06ce7f0"</DIV>
<DIV>meta-ti&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D=20
"master:963c35fc490a733a533c0c30471f9974eed451d6"</DIV>
<DIV>meta-oe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D=20
"jethro:12fae239641cc7a72c509a1a0841ab8bb06ce7f0"</DIV>
<DIV>&nbsp;</DIV>
<DIV>NOTE: Preparing RunQueue</DIV>
<DIV>NOTE: Executing SetScene Tasks</DIV>
<DIV>NOTE: Executing RunQueue Tasks</DIV>
<DIV>NOTE: Tasks Summary: Attempted 3805 tasks of which 3799 didn't need =
to be=20
rerun and all succeeded.</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>Kernel is successfully generated. But =
=E2=80=9CNavit=E2=80=9D is not=20
running in my kernel. How do I integrate/add =E2=80=9CNavit=E2=80=9D to =
my kernel ? should I=20
make any other configuration and package?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks in advance...</DIV>
<DIV>&nbsp;</DIV>
<DIV=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: =
#000000">Regards,<BR>Winiston.P<BR>Futura=20
Automation Pvt Ltd.<BR><BR>Ph :91-80-28375290 / 28375295<BR>Fax=20
:91-80-28375291<BR></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_0069_01D190CE.EF5060A0--
