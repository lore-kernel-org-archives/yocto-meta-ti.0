Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DD25E0027F
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 16:55:53 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8HNtq2q022500
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 18:55:52 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8HNtqcG030665
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 18:55:52 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 17 Sep 2012 18:55:52 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] libgles-omap3: Add new 4.06.00.02 version.
Thread-Index: AQHNibYfzJBNf4dGrEu8S+UEYAw/SJd4tP0A//+sdECAAc1ugIAVHZow
Date: Mon, 17 Sep 2012 23:55:52 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2D6306@DFLE09.ent.ti.com>
References: <1346665309-10837-1-git-send-email-fcooper27jr@gmail.com>
	<C65364BD-A83A-4A63-AEC3-3DAC96A979B3@dominion.thruhere.net>
	<8F29D6B095ED194EA1980491A5E029710C2B3E93@DFLE09.ent.ti.com>
	<81DF8557-307C-43CF-9E46-4CA3F7C41A30@dominion.thruhere.net>
In-Reply-To: <81DF8557-307C-43CF-9E46-4CA3F7C41A30@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] libgles-omap3: Add new 4.06.00.02 version.
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
X-List-Received-Date: Mon, 17 Sep 2012 23:55:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

-----Original Message-----
From: Koen Kooi [mailto:koen@dominion.thruhere.net]=20
Sent: Tuesday, September 04, 2012 3:28 AM
To: Cooper Jr., Franklin
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] libgles-omap3: Add new 4.06.00.02 version.


Op 3 sep. 2012, om 12:13 heeft "Cooper Jr., Franklin" <fcooper@ti.com> het =
volgende geschreven:

>=20
>=20
> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org=20
> [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Koen Kooi
> Sent: Monday, September 03, 2012 4:56 AM
> To: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] libgles-omap3: Add new 4.06.00.02 version.
>=20
>=20
> Op 3 sep. 2012, om 11:41 heeft Franklin S. Cooper Jr <fcooperjr27@gmail.c=
om> het volgende geschreven:
>=20
>> * Add a new version of the Graphics SDK. There are a few changes in=20
>> the  Graphics SDK that need to be investigated to determine if it=20
>> impacts  someone who is trying to use X11. This recipe should work=20
>> fine  for non X11 users. Therefore, the DEFAULT_PREFERENCE will be -1=20
>> until  it is clear that X11 users arent negatively impacted and any=20
>> needed  changes in libgles-omap3.inc are made.
>=20
> What's the timeframe for such tests?
>=20
> I plan on leaving the DEFAULT_PREFERENCE at -1 until we can ensure that X=
11 issues are sorted out. I am not even sure if there really is an issue.. =
All I know is libpvrPVR2D_X11WSEGL OpenGLES2 was being used in the 4.05 ver=
sion but no longer exists in this newer version. The only version of libpvr=
PVR2D_X11WSEGL that exist is for OpenVG. I was told by the graphics team th=
at libpvrPVR2D_X11WSEGL is deprecated and libpvrPVR2D_DRIWSEGL should be us=
ed instead. Is this a non issue?

Here's my limited understanding of the wsegl stuff:

X11wsegl is a 'dumb' way to make it work with x11. It will tell X11 the rec=
t coordinates to draw a window border and nothing more. The rendering still=
 happens to the framebuffer. No context locking, nothing.
Driwsegl uses DRI for rendering and need a proper Xorg module to work, it f=
eatures locking and stuff so you can have multiple clients.=20

Roger Monk had it working a few months ago on omap4, but I don't know what =
he had to do to make it work. I hope it is as simple as rebuilding the sgxk=
ernel modules with SUPPORT_XORG=3D1 (actually dri) and installing the binar=
y Xorg module.

regards,

Koen

