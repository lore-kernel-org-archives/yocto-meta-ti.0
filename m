Return-Path: <munoz0raul@gmail.com>
Received: from mail-ia0-f177.google.com (mail-ia0-f177.google.com
	[209.85.210.177]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id D8960E002AB;
	Thu,  7 Feb 2013 12:26:47 -0800 (PST)
Received: by mail-ia0-f177.google.com with SMTP id h8so3373782iaa.22
	for <multiple recipients>; Thu, 07 Feb 2013 12:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=hdgBnGQ25okWCxm2rV+bHkV/ku6g6cKDrfYvDqYRQ9Q=;
	b=c0U2kkywgnVYncFvRgSwspa0YGly3GGOXCFzefy8vzYh9E7kCmIm4+LkkgwMJnUaYu
	vexFVcwuwPfdwT9YLLbtJQuC4dzwGWDxlKePYnpK11wfQW1k5CIc3NQ1VKVA+6Vy8oSH
	itJJS6lOpN4URPoomMun/PmJJ5i7aol+hwFMpx01ztMtIaL74KT5An1HfIe8mLWuPLx2
	DzCzUOZFCS2G4ZGLIiPiMwFiUy6JTVP3Ig0+NVJnAcq2gG8XCGtvHYPeGFLunNe9sXGT
	uKZzWJ1Va9QkT5/WEjlPz9M+8LZMmosPaRrXNJmTSjr6n20k+UN6j0FA5Gxiavvi9fxS
	uAow==
MIME-Version: 1.0
X-Received: by 10.50.237.5 with SMTP id uy5mr5936203igc.12.1360268806819; Thu,
	07 Feb 2013 12:26:46 -0800 (PST)
Received: by 10.64.147.40 with HTTP; Thu, 7 Feb 2013 12:26:46 -0800 (PST)
Date: Thu, 7 Feb 2013 18:26:46 -0200
Message-ID: <CANmViriV1_tAO+j_nTkpZjcSRD8dh2ALXwHVs1QC-9_dDmrfFA@mail.gmail.com>
From: Raul Rosetto Munoz <munoz0raul@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Wifi Module + udev configs
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
X-List-Received-Date: Thu, 07 Feb 2013 20:26:48 -0000
Content-Type: multipart/alternative; boundary=f46d044787fb078e9c04d528434e

--f46d044787fb078e9c04d528434e
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello All,
I need to configure my yocto project to work with wifi dongle realteck
rtl8192cu.

I'm using this building configuration:

Build Configuration:
BB_VERSION        =3D "1.16.0"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "beaglebone"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "1.3"
TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
TARGET_FPU        =3D "vfp-neon"
meta
meta-yocto        =3D "danny:47b0864fbd65746558d8186450c182d98bac78ca"
meta-ti           =3D "danny:1e898d9b619545dadf2ececad81cd58cdf37c8cd"
meta-oe


First, I built all the modules needed for the wifi dongle and installed in
Angstron standard distro.

This worked well and I had the following lsmod:

Module                  Size  Used by
arc4                    1183  2
rtl8192cu              73042  0
rtl8192c_common        52118  1 rtl8192cu
rtlwifi                57197  1 rtl8192cu
mac80211              149274  3 rtl8192cu,rtl8192c_common,rtlwifi
cfg80211              122225  2 rtlwifi,mac80211
rfkill                 14659  1 cfg80211
g_mass_storage         24014  0
ipv6                  209407  14

Then I tried to do the same for my project and installed the following
packages:
packages:

IMAGE_INSTALL_append =3D " \
        libxml2 \
        gnupg \
        curl \
        gdb \
        curl-dev \
        minicom \
        lrzsz \
        libcap \
        ppp \
        ppp-dialin \
        usbutils \
        mtd-utils \
        openssh \
        dhcp-server \
        dhcp-client \
        kernel-modules \
        udev-extraconf \
        wpa-supplicant \
        i2c-tools \
        update-modules \
        modutils-initscripts \
        zeroconf \
        wireless-tools \
        openssl \
        net-tools \
        busybox \
        linux-firmware \
        systemd \
        connman"

My first problem is that the module does not go up automatically rtl8192cu
different than Angstron distro that when I plug the dongle all modules rise=
.

Another important difference is that on Angstron distro I have on /lib/udev
the "firmware" binary file.  I really was not able to install this
functionality in udev.

Please some one can Help me to configure this device?

And How to make this firmware binary go to /lib/udev?

I have not found the way to configure the udev features.

Thanks all for help.

--=20
*Raul Rosetto Mu=F1oz*

--f46d044787fb078e9c04d528434e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello All,</div><div>I need to configure my yocto pro=
ject to work with wifi dongle realteck rtl8192cu.</div><div><br></div><div>=
I&#39;m using this building configuration:</div><div><br></div><div>Build C=
onfiguration:</div>
<div>BB_VERSION =A0 =A0 =A0 =A0=3D &quot;1.16.0&quot;</div><div>TARGET_ARCH=
 =A0 =A0 =A0 =3D &quot;arm&quot;</div><div>TARGET_OS =A0 =A0 =A0 =A0 =3D &q=
uot;linux-gnueabi&quot;</div><div>MACHINE =A0 =A0 =A0 =A0 =A0 =3D &quot;bea=
glebone&quot;</div><div>DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;poky&quot;<=
/div>
<div>DISTRO_VERSION =A0 =A0=3D &quot;1.3&quot;</div><div>TUNE_FEATURES =A0 =
=A0 =3D &quot;armv7a vfp neon cortexa8&quot;</div><div>TARGET_FPU =A0 =A0 =
=A0 =A0=3D &quot;vfp-neon&quot;</div><div>meta =A0 =A0 =A0 =A0 =A0 =A0 =A0<=
/div><div>meta-yocto =A0 =A0 =A0 =A0=3D &quot;danny:47b0864fbd65746558d8186=
450c182d98bac78ca&quot;</div>
<div>meta-ti =A0 =A0 =A0 =A0 =A0 =3D &quot;danny:1e898d9b619545dadf2ececad8=
1cd58cdf37c8cd&quot;</div><div>meta-oe =A0 =A0 =A0 =A0 =A0=A0</div><div><br=
></div><div><br></div><div>First, I built all the modules needed for the wi=
fi dongle and installed in Angstron standard distro.</div>
<div><br></div><div>This worked well and I had the following lsmod:</div><d=
iv><br></div><div>Module =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Size =A0Used by=
</div><div>arc4 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01183 =A02=A0</div><d=
iv>rtl8192cu =A0 =A0 =A0 =A0 =A0 =A0 =A073042 =A00=A0</div>
<div>rtl8192c_common =A0 =A0 =A0 =A052118 =A01 rtl8192cu</div><div>rtlwifi =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A057197 =A01 rtl8192cu</div><div>mac80211 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0149274 =A03 rtl8192cu,rtl8192c_common,rtlwifi</div><=
div>cfg80211 =A0 =A0 =A0 =A0 =A0 =A0 =A0122225 =A02 rtlwifi,mac80211</div>
<div>rfkill =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 14659 =A01 cfg80211</div><div>g=
_mass_storage =A0 =A0 =A0 =A0 24014 =A00=A0</div><div>ipv6 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0209407 =A014=A0</div><div><br></div><div>Then I tried to=
 do the same for my project and installed the following packages:</div>
<div>packages:</div><div><br></div><div>IMAGE_INSTALL_append =3D &quot; \</=
div><div>=A0 =A0 =A0 =A0 libxml2 \</div><div>=A0 =A0 =A0 =A0 gnupg \</div><=
div>=A0 =A0 =A0 =A0 curl \</div><div>=A0 =A0 =A0 =A0 gdb \</div><div>=A0 =
=A0 =A0 =A0 curl-dev \</div><div>=A0 =A0 =A0 =A0 minicom \</div>
<div>=A0 =A0 =A0 =A0 lrzsz \</div><div>=A0 =A0 =A0 =A0 libcap \</div><div>=
=A0 =A0 =A0 =A0 ppp \</div><div>=A0 =A0 =A0 =A0 ppp-dialin \</div><div>=A0 =
=A0 =A0 =A0 usbutils \</div><div>=A0 =A0 =A0 =A0 mtd-utils \</div><div>=A0 =
=A0 =A0 =A0 openssh \</div><div>=A0 =A0 =A0 =A0 dhcp-server \</div>
<div>=A0 =A0 =A0 =A0 dhcp-client \</div><div>=A0 =A0 =A0 =A0 kernel-modules=
 \</div><div>=A0 =A0 =A0 =A0 udev-extraconf \</div><div>=A0 =A0 =A0 =A0 wpa=
-supplicant \</div><div>=A0 =A0 =A0 =A0 i2c-tools \</div><div>=A0 =A0 =A0 =
=A0 update-modules \</div><div>=A0 =A0 =A0 =A0 modutils-initscripts \</div>
<div>=A0 =A0 =A0 =A0 zeroconf \</div><div>=A0 =A0 =A0 =A0 wireless-tools \<=
/div><div>=A0 =A0 =A0 =A0 openssl \</div><div>=A0 =A0 =A0 =A0 net-tools \</=
div><div>=A0 =A0 =A0 =A0 busybox \</div><div>=A0 =A0 =A0 =A0 linux-firmware=
 \</div><div>=A0 =A0 =A0 =A0 systemd \</div><div>=A0 =A0 =A0 =A0 connman&qu=
ot;</div>
<div><br></div><div>My first problem is that the module does not go up auto=
matically rtl8192cu different than Angstron distro that when I plug the don=
gle all modules rise.</div><div><br></div><div>Another important difference=
 is that on Angstron distro I have on /lib/udev the &quot;firmware&quot; bi=
nary file. =A0I really was not able to install this functionality in udev.<=
/div>
<div><br></div><div>Please some one can Help me to configure this device?</=
div><div><br></div><div>And How to make this firmware binary go to /lib/ude=
v?</div><div><br></div><div>I have not found the way to configure the udev =
features.</div>
<div><br></div><div>Thanks all for help.</div><div><br></div>-- <br><b>Raul=
 Rosetto Mu=F1oz</b>
</div>

--f46d044787fb078e9c04d528434e--
