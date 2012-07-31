Return-Path: <joshua.marinacci@nokia.com>
Received: from mgw-sa01.nokia.com (smtp.nokia.com [147.243.1.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71065E002A8
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 21:01:01 -0700 (PDT)
Received: from vaebh102.NOE.Nokia.com (vaebh102.europe.nokia.com
	[10.160.244.23])
	by mgw-sa01.nokia.com (Sentrion-MTA-4.2.2/Sentrion-MTA-4.2.2) with
	ESMTP id q6V40vvV010850
	for <meta-ti@yoctoproject.org>; Tue, 31 Jul 2012 07:00:59 +0300
Received: from smtp.mgd.nokia.com ([65.54.30.59]) by vaebh102.NOE.Nokia.com
	over TLS secured channel with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 31 Jul 2012 07:01:45 +0300
Received: from 008-AM1MPN1-072.mgdnok.nokia.com ([169.254.2.76]) by
	008-AM1MMR1-004.mgdnok.nokia.com ([65.54.30.59]) with mapi id
	14.02.0283.004; Tue, 31 Jul 2012 06:00:57 +0200
From: <joshua.marinacci@nokia.com>
To: <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Gumstix Wifi
Thread-Index: AQHNbPdyKck16OkwMUiNLuyywd/NZpdBWVuAgAC5HQCAAAjfgIAAUMMAgAA6nAA=
Date: Tue, 31 Jul 2012 04:00:56 +0000
Message-ID: <E2A4CA6E-D2BD-4CE7-8FE3-9699CFCBBD73@nokia.com>
References: <9D64B6CF-0B94-413C-89A4-D9A55DB38AF1@nokia.com>
	<CA+2YH7sLFSnRJ4RAUGj=V=BbGpE-3pB79sxm33O_RXCSqWC8Tw@mail.gmail.com>
	<40A10ADC-FEF3-4292-8C02-F50825A59D4A@nokia.com>
	<20120730194207.GA23003@edge>
	<1DDA99E7-9D0B-42DF-977F-EC15832B6795@nokia.com>
In-Reply-To: <1DDA99E7-9D0B-42DF-977F-EC15832B6795@nokia.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [97.125.57.15]
MIME-Version: 1.0
X-OriginalArrivalTime: 31 Jul 2012 04:01:45.0075 (UTC)
	FILETIME=[33414C30:01CD6ED1]
X-Nokia-AV: Clean
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
X-List-Received-Date: Tue, 31 Jul 2012 04:01:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3AF9DE4B84D89447967B3927644274B0@mgd.nokia.com>
Content-Transfer-Encoding: quoted-printable

Thank you everyone for your help. I finally got it working. After adding th=
ose extra recipes, doing the usual wifi config with /etc/network/interfaces=
 and wpa-supplicant, and running depmod -a I was able get everything in pla=
ce. Adding the magic firmware files extracted from Gumstix's pre-built dist=
ro was the last piece of the puzzle. When I next rebooted I was already on =
the network. =20

So, my question now is "what's up with those sd8686* firmware files? If the=
y are required then why aren't they a part of meta-gumstix?  Is it somethin=
g special that can only be legally downloaded from Gumstix.com?=20

thank you everyone.
	Josh


On Jul 30, 2012, at 5:31 PM, ext joshua.marinacci@nokia.com wrote:

> ah, that explains it then.
>=20
> Okay, so I've made a bit more progress. I added some more packages to my =
build my appending this to my build/conf/local.conf
>=20
> CORE_IMAGE_EXTRA_INSTALL +=3D "wpa-supplicant"
> CORE_IMAGE_EXTRA_INSTALL +=3D "wireless-tools"
> #CORE_IMAGE_EXTRA_INSTALL +=3D "resolveconf"
> CORE_IMAGE_EXTRA_INSTALL +=3D "openssl"
> CORE_IMAGE_EXTRA_INSTALL +=3D "zeroconf"
> CORE_IMAGE_EXTRA_INSTALL +=3D "modutils-initscripts"
> CORE_IMAGE_EXTRA_INSTALL +=3D "update-modules"
>=20
>=20
> This gives me depmod and the rest.  Now I can manually load drivers and d=
epmod -a succeeds.  However, I still can't activate the wlan0.   ifup wlan0=
 gives me
>=20
> root@overo:~# ifup wlan0
> Could not read interface wlan0 flags: No such device
> WEXT: Could not set interface 'wlan0' UP
> wlan0: Failed to initialize driver interface
>=20
> On a hunch I looked at /var/log/messages and it says near the end:
>=20
>=20
> Jul 30 23:17:03 overo user.info kernel: libertas_sdio: Libertas SDIO driv=
er
> Jul 30 23:17:03 overo user.info kernel: libertas_sdio: Copyright Pierre O=
ssman
> Jul 30 23:17:03 overo user.err kernel: libertas_sdio: failed to find firm=
ware (-2)
>=20
>=20
> You mentioned the firmware. Where do I get that?
>=20
>=20
> Incidentally, I don't get all of the kernel boot messages when my gumstix=
 boots.  It says=20
>=20
> Starting kernel ...
>=20
> Uncompressing Linux... done, booting the kernel.
>=20
> Yocto (Built by Poky 7.0) 1.2+snapshot-20120730 overo ttyO2
>=20
> overo login:
>=20
>=20
> And then I'm at the login prompt.  I'm assuming there is some boot settin=
g which controls this? All of the messages are showing up in /var/log/messa=
ges, however.
>=20
> Thanks,
>=20
> Josh
>=20
>=20
> On Jul 30, 2012, at 12:42 PM, ext Denys Dmytriyenko wrote:
>=20
>> On Mon, Jul 30, 2012 at 07:10:23PM +0000, joshua.marinacci@nokia.com wro=
te:
>>> Hmm. I don't see to have depmod installed.  Perhaps that is part of my=
=20
>>> problem. What package would I need to add to the minimal-core-image to =
get=20
>>> that?
>>=20
>> Josh,
>>=20
>> core-image-minimal uses busybox for tools like insmod and modprobe. The=
=20
>> default configuration for busybox does not have depmod enabled. As of=20
>> module-init-tools, they are being built, but not installed on the filesy=
stem.=20
>> So, you can either modify busybox config to enable depmod, or add=20
>> module-init-tools-depmod package to your filesystem. The new way is to u=
se=20
>> kmod, which is available in oe-core master, or meta-oe in denzil. But oe=
-core=20
>> master setup is broken for me at the moment, so I can't verify that kmod=
 is=20
>> included. At least it's not listed in the image/task...
>>=20
>> Denys
>>=20
>>=20
>>> On Jul 30, 2012, at 1:07 AM, ext Enrico wrote:
>>>=20
>>>> On Sat, Jul 28, 2012 at 9:30 PM,  <joshua.marinacci@nokia.com> wrote:
>>>>> This does work. When I boot the wpa stuff is included but I still don=
't have a network driver loaded.  If I include the built modules-3.2.19-r0-=
overo.tgz in my rootfs I can cd into the directory with all of the modules.=
  However insmod libertas.ko fails with
>>>>>=20
>>>>>      insmod: can't insert 'libertas_tf_usb.ko': unknown symbol in mod=
ule, or unknown parameter
>>>>>=20
>>>>> and modprobe fails with
>>>>>=20
>>>>>      modprobe: module libertas not found in modules.dep
>>>>>=20
>>>>>=20
>>>>> So, what should I do to make sure the libertas module is compiled cor=
rectly, included in my kernel, and then actually used at runtime?
>>>>=20
>>>> try with "depmod -a" (this must be done only once after you untar the
>>>> modules) before modprobe libertas.
>>>>=20
>>>> I am not sure but i think it was "modprobe libertas_sdio", try that
>>>> too. And of course you will need the libertas firmware
>>>> (sd8686....bin).
>>>>=20
>>>> Enrico
>>>=20
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


