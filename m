Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6891E0027F
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 16:34:13 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8HNYBeB020176;
	Mon, 17 Sep 2012 18:34:11 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8HNYBWw012229;
	Mon, 17 Sep 2012 18:34:11 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 17 Sep 2012 18:34:11 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH v2] libgles-omap3: Pull in changes from	arago
	to meta-ti
Thread-Index: AQHNib877mwunonD6067AuY7NH7+SZePQiGg
Date: Mon, 17 Sep 2012 23:34:10 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2D6298@DFLE09.ent.ti.com>
References: <1346665189-10535-1-git-send-email-fcooper27jr@gmail.com>
	<F45EF99D-D3F7-4CB3-91A7-DDA8C014A727@dominion.thruhere.net>
	<8F29D6B095ED194EA1980491A5E029710C2B3ED7@DFLE09.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C2B3ED7@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH v2] libgles-omap3: Pull in changes from	arago	to meta-ti
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
X-List-Received-Date: Mon, 17 Sep 2012 23:34:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

You can ignore this patch for now while I investigate some more.

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Cooper Jr., Franklin
Sent: Monday, September 03, 2012 5:30 AM
To: Koen Kooi; meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2] libgles-omap3: Pull in changes from arago=
 to meta-ti

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
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

