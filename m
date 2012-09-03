Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6771FE013A6
	for <meta-ti@yoctoproject.org>; Mon,  3 Sep 2012 03:30:05 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q83AU41c004263;
	Mon, 3 Sep 2012 05:30:04 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q83AU41K000442;
	Mon, 3 Sep 2012 05:30:04 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 3 Sep 2012 05:30:04 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH v2] libgles-omap3: Pull in changes from arago
	to meta-ti
Thread-Index: AQHNiboU59C7e9hszUCio4F48K3fy5d4aTKw
Date: Mon, 3 Sep 2012 10:30:03 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2B3ED7@DFLE09.ent.ti.com>
References: <1346665189-10535-1-git-send-email-fcooper27jr@gmail.com>
	<F45EF99D-D3F7-4CB3-91A7-DDA8C014A727@dominion.thruhere.net>
In-Reply-To: <F45EF99D-D3F7-4CB3-91A7-DDA8C014A727@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH v2] libgles-omap3: Pull in changes from arago	to meta-ti
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
X-List-Received-Date: Mon, 03 Sep 2012 10:30:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Are you referring to this commit http://cgit.openembedded.org/openembedded/=
commit/recipes/qt4?id=3Df63289cfa7e1d96cc7f5ab845e5764f0b853a022 ?

The point of that commit was to insure that the headers from the Graphics S=
DK is being used and not a Qt version. This patch is just making sure that =
the SXG version of the include files are available.

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Koen Kooi
Sent: Monday, September 03, 2012 4:54 AM
To: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2] libgles-omap3: Pull in changes from arago=
 to meta-ti


Op 3 sep. 2012, om 11:39 heeft Franklin S. Cooper Jr <fcooperjr27@gmail.com=
> het volgende geschreven:
>=20
> -=09
> +    cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir} || true
> +    cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/ || true

IIRC this is going to generate some file conflicts and in OE-classic we poi=
nted qt to the proper place for the includes. Has something changed since t=
hen?
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

