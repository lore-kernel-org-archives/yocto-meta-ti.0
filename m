Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B37A6E00348
	for <meta-ti@yoctoproject.org>; Tue, 11 Sep 2012 05:55:34 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8BCtTBi029586;
	Tue, 11 Sep 2012 07:55:29 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8BCtTlF032212;
	Tue, 11 Sep 2012 07:55:29 -0500
Received: from DLEE09.ent.ti.com ([fe80::a026:b4ad:3e78:5ae5]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 11 Sep 2012 07:55:28 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [meta-ti] [PATCH] am33x-cm3: Don't compile binary
Thread-Index: AQHNj+WbAA+FDAjxYE66Tk8QTjbSqJeFGaPn
Date: Tue, 11 Sep 2012 12:55:27 +0000
Message-ID: <7F24675E-04BD-4965-B3B0-8DE4D384F250@ti.com>
References: <1347330377-10755-1-git-send-email-fcooper@ti.com>,
	<D88D285C-1A83-49A1-A61E-4FA672CBF97A@dominion.thruhere.net>
In-Reply-To: <D88D285C-1A83-49A1-A61E-4FA672CBF97A@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] am33x-cm3: Don't compile binary
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
X-List-Received-Date: Tue, 11 Sep 2012 12:55:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

What should be used is what has been validated to work which is the prebuil=
t binary provided by the PSP team.=20

If it hasn't been validated it shouldn't be used.

On Sep 11, 2012, at 1:20 AM, "Koen Kooi" <koen@dominion.thruhere.net> wrote=
:

>=20
> Op 11 sep. 2012, om 04:26 heeft Franklin S. Cooper Jr <fcooperjr27@gmail.=
com> het volgende geschreven:
>=20
>> * Building from source needs to be tested. For now use prebuilt binary
>> which has been validated.
>=20
>=20
> NAK, if there are problems they need to get reported and fixed. Handwavin=
g about that there *might* be bugs is unproductive and wrong.
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

