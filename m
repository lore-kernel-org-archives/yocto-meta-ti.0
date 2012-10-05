Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09106E0049B
	for <meta-ti@yoctoproject.org>; Thu,  4 Oct 2012 22:01:50 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9551mKN024577;
	Fri, 5 Oct 2012 00:01:48 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9551mr2024380;
	Fri, 5 Oct 2012 00:01:48 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 4 Oct 2012 23:59:40 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-ti] [PATCH] bt-firmware: Port bt-firmware recipe
Thread-Index: AQHNmHzohagUSr25BE+//DbDMzUP/ZeWa7dggBPMUCA=
Date: Fri, 5 Oct 2012 04:59:39 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2F7C6E@DFLE09.ent.ti.com>
References: <1348273383-26479-1-git-send-email-fcooper@ti.com>
	<0FBB2B4A-2C24-44D5-8453-190826E1EBD3@dominion.thruhere.net>
	<8F29D6B095ED194EA1980491A5E029710C2DB7BF@DFLE09.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C2DB7BF@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] bt-firmware: Port bt-firmware recipe
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
X-List-Received-Date: Fri, 05 Oct 2012 05:01:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Quick correction The statement in the previous was in reference to a recipe=
 I will be submitting soon called wl12xx-firmware. That recipe is the one t=
hat was called linux-firmware in Arago which I am now renaming to wl12xx-fi=
rmware.=20


Bt-firmware does provide the latest files needed for the Bluetooth portion =
of wl12xx. What is located in linux-firmware-wl12xx is outdated compared to=
 the contents of bt-firmware. For example linux-firmware-wl12xx does not co=
ntain the bluetooth init script for am335x, while bt-firmware does.


-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Cooper Jr., Franklin
Sent: Saturday, September 22, 2012 9:50 AM
To: Koen Kooi; Franklin S. Cooper Jr
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] bt-firmware: Port bt-firmware recipe

In arago this recipe was named linux-firmware. However, the custom git tree=
 that is used only contains the firmware files for the wl12xx which is why =
I renamed it to reflect that. The firmware provided in this git tree will b=
e the latest and greatest and include bug fixes that we discover during our=
 testing. Now that I think of it will this cause an issue for people who wa=
nt to use this recipe and linux-firmware-wl12xx at the same time? It seems =
like this can cause a race condition in determining which set of files will=
 be used. I never used RCONFLICTS before but I am guessing setting RCONFLIC=
TS =3D "linux-firmware-wl12xx" will fix that problem. I will try that out. =
If you have any other suggestions let me know.

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Koen Kooi
Sent: Friday, September 21, 2012 11:43 PM
To: Franklin S. Cooper Jr
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] bt-firmware: Port bt-firmware recipe


Op 22 sep. 2012, om 02:23 heeft Franklin S. Cooper Jr <fcooperjr27@gmail.co=
m> het volgende geschreven:

> * Port bt-firmware recipe from arago.
> * Bt-firmware provides the bluetooth firmware for the TI wl12xx  Wi+Fi=20
> + Bluetooth module.

What is the difference between this and the linux-firmware recipe?
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

