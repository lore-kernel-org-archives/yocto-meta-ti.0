Return-Path: <Joshua.Vanderpool@raymondcorp.com>
Received: from smtp.raymondcorp.com (smtp.raymondcorp.com [24.97.209.121])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61A1EE0079B
	for <meta-ti@yoctoproject.org>; Tue, 14 Jan 2014 03:22:58 -0800 (PST)
Received: from usnygrcas1.raymondcorp.local (nothing.attdns.com
	[130.1.155.194] (may be forged))
	by smtp.raymondcorp.com (8.14.3/8.14.3) with ESMTP id s0EBMvDk022868
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 14 Jan 2014 05:22:58 -0600
Received: from USNYGRMBX4.raymondcorp.local ([169.254.4.152]) by usnygrcas1
	([130.1.155.198]) with mapi id 14.03.0158.001; Tue, 14 Jan 2014 06:22:57
	-0500
From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: meta-ti Digest, Vol 28, Issue 14
Thread-Index: AQHPEJoPUOkw1Xoq1UqikinCJOBQwQ==
Date: Tue, 14 Jan 2014 11:22:57 +0000
Message-ID: <7D1F292BE8E4CC4F93079C1A7A58D5622BA339FB@USNYGRMBX4.raymondcorp.local>
References: <mailman.5.1389643201.11936.meta-ti@yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.150.131]
MIME-Version: 1.0
X-MessageScreenMessageID: 1389698578.165151.1642.2706604042
X-MessageScreenContentScore: Score of 0 assigned to Content
X-MessageScreenUCEScore: Score of 0 assigned to UCE
X-MessageScreen: Analyzed by IntelliReach MessageScreen(tm)
Subject: Re: meta-ti Digest, Vol 28, Issue 14
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
X-List-Received-Date: Tue, 14 Jan 2014 11:23:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 01/13/2014 03:00 PM, meta-ti-request@yoctoproject.org wrote:=0A=
> Send meta-ti mailing list submissions to=0A=
> 	meta-ti@yoctoproject.org=0A=
>=0A=
> To subscribe or unsubscribe via the World Wide Web, visit=0A=
> 	https://lists.yoctoproject.org/listinfo/meta-ti=0A=
> or, via email, send a message with subject or body 'help' to=0A=
> 	meta-ti-request@yoctoproject.org=0A=
>=0A=
> You can reach the person managing the list at=0A=
> 	meta-ti-owner@yoctoproject.org=0A=
>=0A=
> When replying, please edit your Subject line so it is more specific=0A=
> than "Re: Contents of meta-ti digest..."=0A=
>=0A=
>=0A=
> Today's Topics:=0A=
>=0A=
>    1. USB keyboard not recognized with poky build AM335x-SK=0A=
>       (Vanderpool Josh)=0A=
>    2. Re: USB keyboard not recognized with poky build AM335x-SK=0A=
>       (Denys Dmytriyenko)=0A=
>=0A=
>=0A=
> ----------------------------------------------------------------------=0A=
>=0A=
> Message: 1=0A=
> Date: Mon, 13 Jan 2014 19:26:19 +0000=0A=
> From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>=0A=
> To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>=0A=
> Subject: [meta-ti] USB keyboard not recognized with poky build=0A=
> 	AM335x-SK=0A=
> Message-ID:=0A=
> 	<7D1F292BE8E4CC4F93079C1A7A58D5622BA337F7@USNYGRMBX4.raymondcorp.local=
>=0A=
> 	=0A=
> Content-Type: text/plain; charset=3D"us-ascii"=0A=
>=0A=
> bitbake -e core-image-basic | grep 'DISTRO_FEATURES=3D'=0A=
> DISTRO_FEATURES=3D"alsa argp bluetooth ext2 irda largefile pcmcia=0A=
> usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 ipv4 ipv6=0A=
> libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets=0A=
> libc-charsets libc-crypt         libc-crypt-ufc libc-db-aliases=0A=
> libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse            =0A=
>         libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales=0A=
> libc-locale-code                     libc-memusage libc-nis=0A=
> libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams=0A=
> libc-sunrpc                     libc-utmp libc-utmpx libc-wordexp=0A=
> libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc    =0A=
> libc-posix-wchar-io largefile opengl ptest multiarch wayland pulseaudio=
=0A=
> sysvinit"=0A=
> POKY_DEFAULT_DISTRO_FEATURES=3D"largefile opengl ptest multiarch waylan=
d"=0A=
>=0A=
> Build Configuration:=0A=
> BB_VERSION        =3D "1.21.1"=0A=
> BUILD_SYS         =3D "x86_64-linux"=0A=
> NATIVELSBSTRING   =3D "Ubuntu-12.04"=0A=
> TARGET_SYS        =3D "arm-poky-linux-gnueabi"=0A=
> MACHINE           =3D "am335x-evm"=0A=
> DISTRO            =3D "poky"=0A=
> DISTRO_VERSION    =3D "1.5+snapshot-20140113"=0A=
> TUNE_FEATURES     =3D "armv7a vfp neon callconvention-hard cortexa8"=0A=
> TARGET_FPU        =3D "vfp-neon"=0A=
> meta             =0A=
> meta-yocto        =3D "master:005af45191ded6185c618c708181b31281e43092"=
=0A=
> meta-ti           =3D "master:85c35541100affcdc47bb72619a59ce1c0d0ef85"=
=0A=
> meta-qt5          =3D "master:72ca958ebfb61640c614ec865196d68fba2576c2"=
=0A=
> meta-ruby         =3D "master:4e7073b2ebee64f669b688fde3c1200589d8cb04"=
=0A=
>=0A=
>=0A=
> Confidentiality Notice:=0A=
>=0A=
> The preceding e-mail message (including any attachments) contains infor=
mation that may be confidential, protected by applicable legal privileges=
, or constitute non-public information. It is intended to be conveyed onl=
y to the designated recipient(s). If you are not an intended recipient of=
 this message, please notify the sender by replying to this message and t=
hen delete it from your system. Use, dissemination, distribution or repro=
duction of this message by unintended recipients is =0A=
> not authorized and may be unlawful.=0A=
>=0A=
>=0A=
>=0A=
>=0A=
>=0A=
> ------------------------------=0A=
>=0A=
> Message: 2=0A=
> Date: Mon, 13 Jan 2014 14:31:23 -0500=0A=
> From: Denys Dmytriyenko <denys@ti.com>=0A=
> To: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>=0A=
> Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>=0A=
> Subject: Re: [meta-ti] USB keyboard not recognized with poky build=0A=
> 	AM335x-SK=0A=
> Message-ID: <20140113193123.GA5631@edge>=0A=
> Content-Type: text/plain; charset=3D"us-ascii"=0A=
>=0A=
> On Mon, Jan 13, 2014 at 07:26:19PM +0000, Vanderpool Josh wrote:=0A=
>> bitbake -e core-image-basic | grep 'DISTRO_FEATURES=3D'=0A=
>> DISTRO_FEATURES=3D"alsa argp bluetooth ext2 irda largefile pcmcia=0A=
>> usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 ipv4 ipv6=0A=
>> libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets=0A=
>> libc-charsets libc-crypt         libc-crypt-ufc libc-db-aliases=0A=
>> libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse            =0A=
>>         libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales=0A=
>> libc-locale-code                     libc-memusage libc-nis=0A=
>> libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams=0A=
>> libc-sunrpc                     libc-utmp libc-utmpx libc-wordexp=0A=
>> libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc    =0A=
>> libc-posix-wchar-io largefile opengl ptest multiarch wayland pulseaudi=
o=0A=
>> sysvinit"=0A=
>> POKY_DEFAULT_DISTRO_FEATURES=3D"largefile opengl ptest multiarch wayla=
nd"=0A=
>>=0A=
>> Build Configuration:=0A=
>> BB_VERSION        =3D "1.21.1"=0A=
>> BUILD_SYS         =3D "x86_64-linux"=0A=
>> NATIVELSBSTRING   =3D "Ubuntu-12.04"=0A=
>> TARGET_SYS        =3D "arm-poky-linux-gnueabi"=0A=
>> MACHINE           =3D "am335x-evm"=0A=
>> DISTRO            =3D "poky"=0A=
>> DISTRO_VERSION    =3D "1.5+snapshot-20140113"=0A=
>> TUNE_FEATURES     =3D "armv7a vfp neon callconvention-hard cortexa8"=0A=
>> TARGET_FPU        =3D "vfp-neon"=0A=
>> meta             =0A=
>> meta-yocto        =3D "master:005af45191ded6185c618c708181b31281e43092=
"=0A=
>> meta-ti           =3D "master:85c35541100affcdc47bb72619a59ce1c0d0ef85=
"=0A=
>> meta-qt5          =3D "master:72ca958ebfb61640c614ec865196d68fba2576c2=
"=0A=
>> meta-ruby         =3D "master:4e7073b2ebee64f669b688fde3c1200589d8cb04=
"=0A=
> Thanks.=0A=
> Can you please double-check that you are using 3.12.4 version of the ke=
rnel on =0A=
> your SK board?=0A=
>=0A=
Poky (Yocto Project Reference Distro) 1.5+snapshot-20140113 am335x-evm=0A=
/dev/ttyO0=0A=
=0A=
am335x-evm login: root=0A=
root@am335x-evm:~# uname -a=0A=
Linux am335x-evm 3.12.4 #1 SMP PREEMPT Fri Dec 27 12:46:50 EST 2013=0A=
armv7l GNU/Linux=0A=
root@am335x-evm:~#=0A=
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




