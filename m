Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B817CE0049D
	for <meta-ti@yoctoproject.org>; Sun,  2 Sep 2012 11:07:34 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q82I7Xfh017081;
	Sun, 2 Sep 2012 13:07:33 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q82I7XrR025344;
	Sun, 2 Sep 2012 13:07:33 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Sun, 2 Sep 2012 13:07:33 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] Fix image recipes in meta-ti
Thread-Index: Ac2Ig7pGwFxbqvJjRsORVyoWs1t29wALPzCAAAOMOgAAJFZ/AAAH6Uxw
Date: Sun, 2 Sep 2012 18:07:32 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2B34AD@DFLE09.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C2B2B46@DFLE09.ent.ti.com>
	<kkitbg3uuuda8t5puice0pub.1346534080222@email.android.com>
	<20120901225617.GF22219@edge>
	<B2475CE6-3C80-4BE1-BCE9-A368D5F7B7C5@dominion.thruhere.net>
In-Reply-To: <B2475CE6-3C80-4BE1-BCE9-A368D5F7B7C5@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Fix image recipes in meta-ti
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
X-List-Received-Date: Sun, 02 Sep 2012 18:07:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I will reiterate my initial point. The argument if the mentioned recipes sh=
ould even be in meta-ti is a completely different discussion and beyond the=
 scope of this discussion. The fact of the matter is meta-ti is broken unle=
ss you depend on meta-angstrom which is wrong. As Denys' pointed out (https=
://lists.yoctoproject.org/pipermail/meta-ti/2012-August/001452.html) this i=
s a "minor" issue but an issue that other people are experiencing.

 Koen you have brought up valid points before in other discussions about no=
t placing things in meta-ti that can break things for other people. The sam=
e logic applies here. All I want is a clean solution which will allow me to=
 use meta-ti in a distroless environment which I do frequently. How this is=
 accomplished I can care less.

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Koen Kooi
Sent: Sunday, September 02, 2012 11:17 AM
To: Dmytriyenko, Denys
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] Fix image recipes in meta-ti


Op 2 sep. 2012, om 00:56 heeft Denys Dmytriyenko <denys@ti.com> het volgend=
e geschreven:

> On Sat, Sep 01, 2012 at 09:14:43PM +0000, Kridner, Jason wrote:
>> Will meta-oe take the recipes?
>=20
> Well, those maybe better suited for meta-angstrom instead... If you=20
> think about it - cloud9 is an important component of default=20
> Beaglebone images based on Angstrom, so images with the cloud9 in the=20
> name are naturally associated with Angstrom. Anybody else who'd like=20
> to use meta-ti as BSP layer outside of Angstrom would most probably use o=
wn images anyway...

I'd be happy to remove all those pesky beagleboard, beaglebone, pandaboard,=
 etc related recipes, machines, images from meta-ti if they are causing suc=
h big, unsolvable problems for the TI SDK team.=20
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

