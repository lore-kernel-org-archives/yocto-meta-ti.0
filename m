Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 687D5E00348
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 13:06:18 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8EK6HUJ000785
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 15:06:17 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8EK6HbN020543
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 15:06:17 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 14 Sep 2012 15:06:17 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] RFC: 2 possible workarounds for recipes-misc
	dependency	on Angstrom
Thread-Index: AQHNkkQ/4N0j0S1cR0KV1Bo1zwbuSZeKQuHA
Date: Fri, 14 Sep 2012 20:06:17 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101591F5F33@DLEE12.ent.ti.com>
References: <20120914064306.GC26968@edge>
In-Reply-To: <20120914064306.GC26968@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: RFC: 2 possible workarounds for recipes-misc dependency	on Angstrom
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
X-List-Received-Date: Fri, 14 Sep 2012 20:06:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Friday, September 14, 2012 1:43 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] RFC: 2 possible workarounds for recipes-misc
> dependency on Angstrom
>=20
> Koen et al,
>=20
> There will be 2 patches sent under this thread that try to
> resolve the
> dependency of recipes-misc/images on meta-angstrom layer w/o
> (re)moving those
> recipes. Those are just 2 possible alternatives of fixing it up
> for now. The
> third option would be to move the recipes-misc/images to another
> layer, once
> we agree on its name/location and other details. Nobody wants to
> just remove
> those recipes w/o giving them a proper home. Which also means,
> that one of the
> proposed 2 workarounds can still be used temporarily until such
> home is found.
> [Or, one of the two can be the final solution, if we decide not
> to move...]
>=20
> Please at least consider these patches and don't blindly dismiss
> them, as this
> matter is quite a hot button.

Denys, is it worth pulling these things in just to remove them when meta-be=
agle is created?  I think the better course is to do what you have done whi=
ch is spell out the policy for meta-ti clearly and let these recipes get mo=
ved.  I think what is missing is a reasonable time frame being set for when=
 these recipes will be removed from meta-ti.  Maybe I'm missing something h=
ere but it seems like if we are planning a cleanup of meta-ti that we shoul=
dn't start it with first adding more things to cleanup.

So really I think the question is do we have an agreement on "meta-beagle" =
or whatever it should be called, a timeline for it to be created and the re=
cipes moved?  Let's make meta-ti be the foundation BSP that we can all buil=
d on top of and nothing more or less.

>=20
> --
> Denys
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

