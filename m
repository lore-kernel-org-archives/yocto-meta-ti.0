Return-Path: <joshua.marinacci@nokia.com>
Received: from mgw-da02.nokia.com (smtp.nokia.com [147.243.128.26])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DCB3E002A8
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 20:55:22 -0700 (PDT)
Received: from vaebh101.NOE.Nokia.com (vaebh101.europe.nokia.com
	[10.160.244.22])
	by mgw-da02.nokia.com (Sentrion-MTA-4.2.2/Sentrion-MTA-4.2.2) with
	ESMTP id q6V3soSw013624; Tue, 31 Jul 2012 06:55:19 +0300
Received: from smtp.mgd.nokia.com ([65.54.30.21]) by vaebh101.NOE.Nokia.com
	over TLS secured channel with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 31 Jul 2012 06:55:55 +0300
Received: from 008-AM1MPN1-072.mgdnok.nokia.com ([169.254.2.76]) by
	008-AM1MMR1-012.mgdnok.nokia.com ([65.54.30.21]) with mapi id
	14.02.0283.004; Tue, 31 Jul 2012 05:55:08 +0200
From: <joshua.marinacci@nokia.com>
To: <denis@denix.org>
Thread-Topic: [meta-ti] Gumstix Wifi
Thread-Index: AQHNbPdyKck16OkwMUiNLuyywd/NZpdBWVuAgAC5HQCAAAjfgIAAUMMAgAA4GACAAADlAA==
Date: Tue, 31 Jul 2012 03:55:08 +0000
Message-ID: <DE5F9C7B-8703-4B58-9A90-050CF8A590E4@nokia.com>
References: <9D64B6CF-0B94-413C-89A4-D9A55DB38AF1@nokia.com>
	<CA+2YH7sLFSnRJ4RAUGj=V=BbGpE-3pB79sxm33O_RXCSqWC8Tw@mail.gmail.com>
	<40A10ADC-FEF3-4292-8C02-F50825A59D4A@nokia.com>
	<20120730194207.GA23003@edge>
	<1DDA99E7-9D0B-42DF-977F-EC15832B6795@nokia.com>
	<20120731035156.GB7856@denix.org>
In-Reply-To: <20120731035156.GB7856@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [97.125.57.15]
MIME-Version: 1.0
X-OriginalArrivalTime: 31 Jul 2012 03:55:55.0936 (UTC)
	FILETIME=[6326EA00:01CD6ED0]
X-Nokia-AV: Clean
Cc: meta-ti@yoctoproject.org
Subject: Re: Gumstix Wifi
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
X-List-Received-Date: Tue, 31 Jul 2012 03:55:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BA930B9FA4D0314AB5A762713F5DEE5F@mgd.nokia.com>
Content-Transfer-Encoding: quoted-printable

Well, If I hit a key to stop the boot then execute printenv: it shows me th=
is:

et:   No ethernet found.
Hit any key to stop autoboot:  0
Overo # printenv
bootcmd=3Dif mmc init; then if run loadbootscript; then run bootscript; els=
e if run loaduimage; then run mmcboot; else run nandboot; fi; fi; else run =
nandboot;
 fi
bootdelay=3D5
baudrate=3D115200
loadaddr=3D0x82000000
console=3DttyS2,115200n8
mpurate=3D500
vram=3D12M
dvimode=3D1024x768MR-16@60
defaultdisplay=3Ddvi
mmcroot=3D/dev/mmcblk0p2 rw
mmcrootfstype=3Dext3 rootwait
nandroot=3D/dev/mtdblock4 rw
nandrootfstype=3Djffs2
mmcargs=3Dsetenv bootargs console=3D${console} mpurate=3D${mpurate} vram=3D=
${vram} omapfb.mode=3Ddvi:${dvimode} omapfb.debug=3Dy omapdss.def_disp=3D${=
defaultdisplay} root=3D
${mmcroot} rootfstype=3D${mmcrootfstype}
nandargs=3Dsetenv bootargs console=3D${console} mpurate=3D${mpurate} vram=
=3D${vram} omapfb.mode=3Ddvi:${dvimode} omapfb.debug=3Dy omapdss.def_disp=
=3D${defaultdisplay} root
=3D${nandroot} rootfstype=3D${nandrootfstype}
loadbootscript=3Dfatload mmc 0 ${loadaddr} boot.scr
bootscript=3Decho Running bootscript from mmc ...; source ${loadaddr}
loaduimage=3Dfatload mmc 0 ${loadaddr} uImage
mmcboot=3Decho Booting from mmc ...; run mmcargs; bootm ${loadaddr}
nandboot=3Decho Booting from nand ...; run nandargs; nand read ${loadaddr} =
280000 400000; bootm ${loadaddr}
stdin=3Dserial
stdout=3Dserial
stderr=3Dserial
dieid#=3D1eba00029ff80000016842c91601702f

Environment size: 1209/131068 bytes

- Josh


On Jul 30, 2012, at 8:51 PM, ext Denys Dmytriyenko wrote:

> On Tue, Jul 31, 2012 at 12:31:10AM +0000, joshua.marinacci@nokia.com wrot=
e:
>> Incidentally, I don't get all of the kernel boot messages when my gumsti=
x=20
>> boots.  It says=20
>>=20
>> Starting kernel ...
>>=20
>> Uncompressing Linux... done, booting the kernel.
>>=20
>> Yocto (Built by Poky 7.0) 1.2+snapshot-20120730 overo ttyO2
>>=20
>> overo login:
>>=20
>>=20
>> And then I'm at the login prompt.  I'm assuming there is some boot setti=
ng=20
>> which controls this? All of the messages are showing up in=20
>> /var/log/messages, however.
>=20
> What's your "bootargs" variable in u-boot? Does it contain "quiet"? Does =
it=20
> have the proper console settings?
>=20
> --=20
> Denys
>=20
>=20
>> On Jul 30, 2012, at 12:42 PM, ext Denys Dmytriyenko wrote:
>>=20
>>> On Mon, Jul 30, 2012 at 07:10:23PM +0000, joshua.marinacci@nokia.com wr=
ote:
>>>> Hmm. I don't see to have depmod installed.  Perhaps that is part of my=
=20
>>>> problem. What package would I need to add to the minimal-core-image to=
 get=20
>>>> that?
>>>=20
>>> Josh,
>>>=20
>>> core-image-minimal uses busybox for tools like insmod and modprobe. The=
=20
>>> default configuration for busybox does not have depmod enabled. As of=20
>>> module-init-tools, they are being built, but not installed on the files=
ystem.=20
>>> So, you can either modify busybox config to enable depmod, or add=20
>>> module-init-tools-depmod package to your filesystem. The new way is to =
use=20
>>> kmod, which is available in oe-core master, or meta-oe in denzil. But o=
e-core=20
>>> master setup is broken for me at the moment, so I can't verify that kmo=
d is=20
>>> included. At least it's not listed in the image/task...
>>>=20
>>> Denys
>>>=20
>>>=20
>>>> On Jul 30, 2012, at 1:07 AM, ext Enrico wrote:
>>>>=20
>>>>> On Sat, Jul 28, 2012 at 9:30 PM,  <joshua.marinacci@nokia.com> wrote:
>>>>>> This does work. When I boot the wpa stuff is included but I still do=
n't have a network driver loaded.  If I include the built modules-3.2.19-r0=
-overo.tgz in my rootfs I can cd into the directory with all of the modules=
.  However insmod libertas.ko fails with
>>>>>>=20
>>>>>>      insmod: can't insert 'libertas_tf_usb.ko': unknown symbol in mo=
dule, or unknown parameter
>>>>>>=20
>>>>>> and modprobe fails with
>>>>>>=20
>>>>>>      modprobe: module libertas not found in modules.dep
>>>>>>=20
>>>>>>=20
>>>>>> So, what should I do to make sure the libertas module is compiled co=
rrectly, included in my kernel, and then actually used at runtime?
>>>>>=20
>>>>> try with "depmod -a" (this must be done only once after you untar the
>>>>> modules) before modprobe libertas.
>>>>>=20
>>>>> I am not sure but i think it was "modprobe libertas_sdio", try that
>>>>> too. And of course you will need the libertas firmware
>>>>> (sd8686....bin).
>>>>>=20
>>>>> Enrico
>>>>=20
>>>> _______________________________________________
>>>> meta-ti mailing list
>>>> meta-ti@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-ti
>>=20
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>>=20


