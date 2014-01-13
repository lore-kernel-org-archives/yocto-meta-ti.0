Return-Path: <Joshua.Vanderpool@raymondcorp.com>
Received: from smtp.raymondcorp.com (smtp.raymondcorp.com [24.97.209.121])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9F7EE0075B
	for <meta-ti@yoctoproject.org>; Mon, 13 Jan 2014 11:26:21 -0800 (PST)
Received: from usnygrcas2.raymondcorp.local (nothing.attdns.com
	[130.1.155.195] (may be forged))
	by smtp.raymondcorp.com (8.14.3/8.14.3) with ESMTP id s0DJQKEm007916
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 13 Jan 2014 13:26:21 -0600
Received: from USNYGRMBX4.raymondcorp.local ([169.254.4.152]) by usnygrcas2
	([130.1.155.199]) with mapi id 14.03.0158.001; Mon, 13 Jan 2014 14:26:20
	-0500
From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: USB keyboard not recognized with poky build AM335x-SK
Thread-Index: Ac8QlVW1Ir7lNHSIQGCta4+Q5xQbJA==
Date: Mon, 13 Jan 2014 19:26:19 +0000
Message-ID: <7D1F292BE8E4CC4F93079C1A7A58D5622BA337F7@USNYGRMBX4.raymondcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.150.131]
MIME-Version: 1.0
X-MessageScreenMessageID: 1389641181.87311.1642.2514665479
X-MessageScreenContentScore: Score of 0 assigned to Content
X-MessageScreenUCEScore: Score of 0 assigned to UCE
X-MessageScreen: Analyzed by IntelliReach MessageScreen(tm)
Subject: USB keyboard not recognized with poky build AM335x-SK
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
X-List-Received-Date: Mon, 13 Jan 2014 19:26:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

bitbake -e core-image-basic | grep 'DISTRO_FEATURES=3D'=0A=
DISTRO_FEATURES=3D"alsa argp bluetooth ext2 irda largefile pcmcia=0A=
usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 ipv4 ipv6=0A=
libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets=0A=
libc-charsets libc-crypt         libc-crypt-ufc libc-db-aliases=0A=
libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse            =0A=
        libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales=0A=
libc-locale-code                     libc-memusage libc-nis=0A=
libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams=0A=
libc-sunrpc                     libc-utmp libc-utmpx libc-wordexp=0A=
libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc    =0A=
libc-posix-wchar-io largefile opengl ptest multiarch wayland pulseaudio=0A=
sysvinit"=0A=
POKY_DEFAULT_DISTRO_FEATURES=3D"largefile opengl ptest multiarch wayland"=
=0A=
=0A=
Build Configuration:=0A=
BB_VERSION        =3D "1.21.1"=0A=
BUILD_SYS         =3D "x86_64-linux"=0A=
NATIVELSBSTRING   =3D "Ubuntu-12.04"=0A=
TARGET_SYS        =3D "arm-poky-linux-gnueabi"=0A=
MACHINE           =3D "am335x-evm"=0A=
DISTRO            =3D "poky"=0A=
DISTRO_VERSION    =3D "1.5+snapshot-20140113"=0A=
TUNE_FEATURES     =3D "armv7a vfp neon callconvention-hard cortexa8"=0A=
TARGET_FPU        =3D "vfp-neon"=0A=
meta             =0A=
meta-yocto        =3D "master:005af45191ded6185c618c708181b31281e43092"=0A=
meta-ti           =3D "master:85c35541100affcdc47bb72619a59ce1c0d0ef85"=0A=
meta-qt5          =3D "master:72ca958ebfb61640c614ec865196d68fba2576c2"=0A=
meta-ruby         =3D "master:4e7073b2ebee64f669b688fde3c1200589d8cb04"=0A=
=0A=

Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is=20
not authorized and may be unlawful.




