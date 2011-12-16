Return-Path: <jdk@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA0ADE013EB
	for <meta-ti@yoctoproject.org>; Fri, 16 Dec 2011 05:44:10 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id pBGDi86J020476;
	Fri, 16 Dec 2011 07:44:08 -0600
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pBGDi8Ci004847;
	Fri, 16 Dec 2011 07:44:08 -0600 (CST)
Received: from DFLE34.ent.ti.com ([fe80::c12:d795:2e56:2d02]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Fri, 16 Dec 2011 07:44:08 -0600
From: "Kridner, Jason" <jdk@ti.com>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@gmx.de>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Is it intended to build TI bootloaders with
	march=armv5?
Thread-Index: AQHMu9Qvkg2g2Kf6lkiM5oMxeTvRTpXedu50
Date: Fri, 16 Dec 2011 13:44:07 +0000
Message-ID: <F61A9010E56D7F4C93A19FD36DAAC3592FF98E@DFLE34.ent.ti.com>
References: <201112161021.49738.schnitzeltony@gmx.de>
In-Reply-To: <201112161021.49738.schnitzeltony@gmx.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: Is it intended to build TI bootloaders with march=armv5?
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
X-List-Received-Date: Fri, 16 Dec 2011 13:44:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Do you have the disassembly around the access?=0A=
________________________________________=0A=
From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org] o=
n behalf of Andreas M=FCller [schnitzeltony@gmx.de]=0A=
Sent: Friday, December 16, 2011 4:21 AM=0A=
To: meta-ti@yoctoproject.org=0A=
Subject: [meta-ti] Is it intended to build TI bootloaders with march=3Darmv=
5?=0A=
=0A=
Hi=0A=
=0A=
as some of you might know, I am desperately working on u-boot SPL support f=
or=0A=
gumstix overo and having very strange effects: as soon as a stacic integer=
=0A=
variable is accessed, the bootloader hangs [1].=0A=
=0A=
In the compile logs I found ( checked also for beagleboard ) that=0A=
=0A=
march=3Darmv5=0A=
=0A=
is used ( x-load is build with march=3Darmv7-a ). Is this intended? Could t=
his=0A=
explain my trouble?=0A=
=0A=
Andreas=0A=
=0A=
[1] http://lists.denx.de/pipermail/u-boot/2011-December/113491.html=0A=
=0A=
=0A=
_______________________________________________=0A=
meta-ti mailing list=0A=
meta-ti@yoctoproject.org=0A=
https://lists.yoctoproject.org/listinfo/meta-ti=0A=

