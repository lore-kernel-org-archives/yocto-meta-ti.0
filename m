Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 963E5E00293
	for <meta-ti@yoctoproject.org>; Sat,  6 Oct 2012 01:35:52 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q968ZnGh028973;
	Sat, 6 Oct 2012 03:35:49 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q968ZnrM005247;
	Sat, 6 Oct 2012 03:35:49 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Sat, 6 Oct 2012 03:35:49 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-ti] [PATCH v2] libgles-omap3: Pull in changes	from	arago
	to meta-ti
Thread-Index: AQHNlSz1nPrhdKhEn0errGx7KtmfiZesENEk
Date: Sat, 6 Oct 2012 08:35:48 +0000
Message-ID: <83AEDAE8-EB16-4B14-B2EB-C1332C5D7454@ti.com>
References: <1346665189-10535-1-git-send-email-fcooper27jr@gmail.com>
	<F45EF99D-D3F7-4CB3-91A7-DDA8C014A727@dominion.thruhere.net>
	<8F29D6B095ED194EA1980491A5E029710C2B3ED7@DFLE09.ent.ti.com>,
	<8F29D6B095ED194EA1980491A5E029710C2D6298@DFLE09.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C2D6298@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2] libgles-omap3: Pull in changes	from	arago	to meta-ti
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
X-List-Received-Date: Sat, 06 Oct 2012 08:35:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Koen,
>> +    cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir} || true
>> +    cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/ || true
>=20
> IIRC this is going to generate some file conflicts and in OE-classic we p=
ointed qt to the proper place for the includes. Has something changed since=
 then?

Does the below answer your question?
http://arago-project.org/git/?p=3Darago.git;a=3Dcommit;h=3D02e8c5404184d258=
bcb8dadbdafb760bc1acb912

This is a result of change to the newer version of the graphics SDK.

>> +    cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/ || true

one of the files being installed here is wsegl.h. Qt can provide that file =
but shouldn't. This is what the below patch talks about

http://cgit.openembedded.org/openembedded/commit/recipes/qt4?id=3Df63289cfa=
7e1d96cc7f5ab845e5764f0b853a022

That patch does need to be submitted to oe-core. But since the qt embedded =
gles recipe should depend on the graphics SDK the wsegl.h should already ex=
ist which means Qt shouldn't be copying its own version.

>> +    cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir} || true

Qt can also provide pvr2d.h but once again the one from the graphics SDK sh=
ould be used instead.

From the graphics SDK point of view is there any other issues with those he=
aders being installed?


On Sep 17, 2012, at 6:34 PM, "Cooper Jr., Franklin" <fcooper@ti.com> wrote:

> You can ignore this patch for now while I investigate some more.
>=20
> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproje=
ct.org] On Behalf Of Cooper Jr., Franklin
> Sent: Monday, September 03, 2012 5:30 AM
> To: Koen Kooi; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH v2] libgles-omap3: Pull in changes from ara=
go to meta-ti
>=20
> Are you referring to this commit http://cgit.openembedded.org/openembedde=
d/commit/recipes/qt4?id=3Df63289cfa7e1d96cc7f5ab845e5764f0b853a022 ?
>=20
> The point of that commit was to insure that the headers from the Graphics=
 SDK is being used and not a Qt version. This patch is just making sure tha=
t the SXG version of the include files are available.
>=20
> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproje=
ct.org] On Behalf Of Koen Kooi
> Sent: Monday, September 03, 2012 4:54 AM
> To: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH v2] libgles-omap3: Pull in changes from ara=
go to meta-ti
>=20
>=20
> Op 3 sep. 2012, om 11:39 heeft Franklin S. Cooper Jr <fcooperjr27@gmail.c=
om> het volgende geschreven:
>>=20
>> -   =20
>> +    cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir} || true
>> +    cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/ || true
>=20
> IIRC this is going to generate some file conflicts and in OE-classic we p=
ointed qt to the proper place for the includes. Has something changed since=
 then?
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

