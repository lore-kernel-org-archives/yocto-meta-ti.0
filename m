Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6527EE0049D
	for <meta-ti@yoctoproject.org>; Sun,  2 Sep 2012 12:47:18 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q82JlHbi012059;
	Sun, 2 Sep 2012 14:47:17 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q82JlHDq024056;
	Sun, 2 Sep 2012 14:47:17 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Sun, 2 Sep 2012 14:47:17 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-ti] Fix image recipes in meta-ti
Thread-Index: Ac2Ig7pGwFxbqvJjRsORVyoWs1t29wALPzCAAAOMOgAAJFZ/AAAH6Uxw//+ntWU=
Date: Sun, 2 Sep 2012 19:47:16 +0000
Message-ID: <26A1186D-E714-4AD6-BB0E-1743FB6DFA2A@ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C2B2B46@DFLE09.ent.ti.com>
	<kkitbg3uuuda8t5puice0pub.1346534080222@email.android.com>
	<20120901225617.GF22219@edge>
	<B2475CE6-3C80-4BE1-BCE9-A368D5F7B7C5@dominion.thruhere.net>,
	<8F29D6B095ED194EA1980491A5E029710C2B34AD@DFLE09.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C2B34AD@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
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
X-List-Received-Date: Sun, 02 Sep 2012 19:47:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I agree with Denys and Franklin here.  Meta-ti should be a straight BSP lay=
er so we should remove distro dependencies.  This is the same as moving net=
base changes to meta-arago.  There may be things in meta-ti that don't belo=
ng there and they should be moved to the appropriate location

I understand that you have been using meta-ti and leading the way here, bu=
t that does not mean that we can't work together in this layer going forwar=
d.  You may have noticed that most of the TI SDK stuff has been going into =
meta-arago since that is where it belongs.  We are trying hard not to put t=
hings in meta-ti that will force others to use the arago distribution, I wo=
uldask that we make sure the same applies for Angstrom as well, or any othe=
r distribution for that matter.

I'm confused where the objection is to moving these recipes that rely on t=
he Angstrom layer into the actual Angstrom layer?  Let's discuss that topic=
 and how we can structure this layer to meet everyone's needs.  That would =
likely be more productive and save us all frustration.

Sincerely,
Chase Maupin
On Sep 2, 2012, at 1:07 PM, "Cooper Jr., Franklin" <fcooper@ti.com> wrote:

> I will reiterate my initial point. The argument if the mentioned recipes=
 should even be in meta-ti is a completely different discussion and beyond =
the scope of this discussion. The fact of the matter is meta-ti is broken u=
nless you depend on meta-angstrom which is wrong. As Denys' pointed out (ht=
tps://lists.yoctoproject.org/pipermail/meta-ti/2012-August/001452.html) thi=
s is a "minor" issue but an issue that other people are experiencing.
>=20
> Koen you have brought up valid points before in other discussions about =
not placing things in meta-ti that can break things for other people. The s=
ame logic applies here. All I want is a clean solution which will allow me =
to use meta-ti in a distroless environment which I do frequently. How this =
is accomplished I can care less.
>=20
> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproj=
ect.org] On Behalf Of Koen Kooi
> Sent: Sunday, September 02, 2012 11:17 AM
> To: Dmytriyenko, Denys
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] Fix image recipes in meta-ti
>=20
>=20
> Op 2 sep. 2012, om 00:56 heeft Denys Dmytriyenko <denys@ti.com> het volg=
ende geschreven:
>=20
>> On Sat, Sep 01, 2012 at 09:14:43PM +0000, Kridner, Jason wrote:
>>> Will meta-oe take the recipes?
>>=20
>> Well, those maybe better suited for meta-angstrom instead... If you=20
>> think about it - cloud9 is an important component of default=20
>> Beaglebone images based on Angstrom, so images with the cloud9 in the=
=20
>> name are naturally associated with Angstrom. Anybody else who'd like=20
>> to use meta-ti as BSP layer outside of Angstrom would most probably use=
 own images anyway...
>=20
> I'd be happy to remove all those pesky beagleboard, beaglebone, pandaboa=
rd, etc related recipes, machines, images from meta-ti if they are causing =
such big, unsolvable problems for the TI SDK team.=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

