Return-Path: <joshua.marinacci@nokia.com>
Received: from mgw-da02.nokia.com (smtp.nokia.com [147.243.128.26])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A043EE0027D
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 12:10:36 -0700 (PDT)
Received: from vaebh102.NOE.Nokia.com (in-mx.nokia.com [10.160.244.23])
	by mgw-da02.nokia.com (Sentrion-MTA-4.2.2/Sentrion-MTA-4.2.2) with
	ESMTP id q6UJAPqb004267; Mon, 30 Jul 2012 22:10:26 +0300
Received: from smtp.mgd.nokia.com ([65.54.30.61]) by vaebh102.NOE.Nokia.com
	over TLS secured channel with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 30 Jul 2012 22:11:11 +0300
Received: from 008-AM1MPN1-072.mgdnok.nokia.com ([169.254.2.76]) by
	008-AM1MMR1-006.mgdnok.nokia.com ([65.54.30.61]) with mapi id
	14.02.0283.004; Mon, 30 Jul 2012 21:10:24 +0200
From: <joshua.marinacci@nokia.com>
To: <ebutera@users.sourceforge.net>
Thread-Topic: [meta-ti] Gumstix Wifi
Thread-Index: AQHNbPdyKck16OkwMUiNLuyywd/NZpdBWVuAgAC5HQA=
Date: Mon, 30 Jul 2012 19:10:23 +0000
Message-ID: <40A10ADC-FEF3-4292-8C02-F50825A59D4A@nokia.com>
References: <9D64B6CF-0B94-413C-89A4-D9A55DB38AF1@nokia.com>
	<CA+2YH7sLFSnRJ4RAUGj=V=BbGpE-3pB79sxm33O_RXCSqWC8Tw@mail.gmail.com>
In-Reply-To: <CA+2YH7sLFSnRJ4RAUGj=V=BbGpE-3pB79sxm33O_RXCSqWC8Tw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [97.125.57.15]
MIME-Version: 1.0
X-OriginalArrivalTime: 30 Jul 2012 19:11:11.0086 (UTC)
	FILETIME=[14B810E0:01CD6E87]
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
X-List-Received-Date: Mon, 30 Jul 2012 19:10:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <59C2A9FF70320E42B04D3C2D0EE7CEC1@mgd.nokia.com>
Content-Transfer-Encoding: quoted-printable

Hmm. I don't see to have depmod installed.  Perhaps that is part of my prob=
lem. What package would I need to add to the minimal-core-image to get that=
?

thanks,
	Josh
On Jul 30, 2012, at 1:07 AM, ext Enrico wrote:

> On Sat, Jul 28, 2012 at 9:30 PM,  <joshua.marinacci@nokia.com> wrote:
>> This does work. When I boot the wpa stuff is included but I still don't =
have a network driver loaded.  If I include the built modules-3.2.19-r0-ove=
ro.tgz in my rootfs I can cd into the directory with all of the modules.  H=
owever insmod libertas.ko fails with
>>=20
>>        insmod: can't insert 'libertas_tf_usb.ko': unknown symbol in modu=
le, or unknown parameter
>>=20
>> and modprobe fails with
>>=20
>>        modprobe: module libertas not found in modules.dep
>>=20
>>=20
>> So, what should I do to make sure the libertas module is compiled correc=
tly, included in my kernel, and then actually used at runtime?
>=20
> try with "depmod -a" (this must be done only once after you untar the
> modules) before modprobe libertas.
>=20
> I am not sure but i think it was "modprobe libertas_sdio", try that
> too. And of course you will need the libertas firmware
> (sd8686....bin).
>=20
> Enrico


