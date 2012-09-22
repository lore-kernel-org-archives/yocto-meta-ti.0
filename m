Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60DE9E011C5
	for <meta-ti@yoctoproject.org>; Sat, 22 Sep 2012 07:50:12 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8MEo3dH029168;
	Sat, 22 Sep 2012 09:50:04 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8MEo3Si004610;
	Sat, 22 Sep 2012 09:50:03 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Sat, 22 Sep 2012 09:50:03 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-ti] [PATCH] bt-firmware: Port bt-firmware recipe
Thread-Index: AQHNmHzohagUSr25BE+//DbDMzUP/ZeWa7dg
Date: Sat, 22 Sep 2012 14:50:03 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2DB7BF@DFLE09.ent.ti.com>
References: <1348273383-26479-1-git-send-email-fcooper@ti.com>
	<0FBB2B4A-2C24-44D5-8453-190826E1EBD3@dominion.thruhere.net>
In-Reply-To: <0FBB2B4A-2C24-44D5-8453-190826E1EBD3@dominion.thruhere.net>
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
X-List-Received-Date: Sat, 22 Sep 2012 14:50:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

