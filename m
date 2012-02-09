Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10BB1E01370
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 05:01:52 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q19D1olJ018608;
	Thu, 9 Feb 2012 07:01:50 -0600
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q19D1oT9013806;
	Thu, 9 Feb 2012 07:01:50 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Thu, 9 Feb 2012 07:01:50 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: James Abernathy <jfabernathy@gmail.com>, Gary Thomas <gary@mlbassoc.com>
Thread-Topic: [meta-ti] building Yocto for Pandaboard
Thread-Index: AQHM5rQnABlTcsc9UEeGcv8Cg1R3AZY0iAHg
Date: Thu, 9 Feb 2012 13:01:49 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10127667EB8@DLEE12.ent.ti.com>
References: <4F32F016.4020008@gmail.com> <4F32F1B3.8090000@mlbassoc.com>
	<4F32F31B.2000303@gmail.com>
	<59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>
	<4F32F59B.7010804@mlbassoc.com>
	<8EA0B5D5-4DC5-4F48-83E6-B019862BD57F@dominion.thruhere.net>
	<4F32F87E.2070907@mlbassoc.com>
	<38997C75-E36D-4A49-96D0-FB5E8A52817D@gmail.com>
In-Reply-To: <38997C75-E36D-4A49-96D0-FB5E8A52817D@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: building Yocto for Pandaboard
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Feb 2012 13:01:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of James Abernathy
> Sent: Wednesday, February 08, 2012 4:52 PM
> To: Gary Thomas
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] building Yocto for Pandaboard
>=20
>=20
> On Feb 8, 2012, at 5:34 PM, Gary Thomas wrote:
>=20
> > On 2012-02-08 15:27, Koen Kooi wrote:
> >>
> >> Op 8 feb. 2012, om 23:22 heeft Gary Thomas het volgende
> geschreven:
> >>
> >>> On 2012-02-08 15:18, Koen Kooi wrote:
> >>>>
> >>>> Op 8 feb. 2012, om 23:11 heeft jfabernathy het volgende
> geschreven:
> >>>>
> >>>>> On 02/08/2012 05:05 PM, Gary Thomas wrote:
> >>>>>> On 2012-02-08 14:58, jfabernathy wrote:
> >>>>>>> I'm trying to build the pandaboard BSP for Yocto. I cloned
> the meta-ti repository in the poky directory and tried to build
> core-image-sato for both machine pandaboard and
> >>>>>>> omap4430-panda. However, I immediately get an error because
> bitbake is looking for recipes-images/angstrom/systemd-image.bb,
> which is required in the ti-hw-bringup-image.bb image
> >>>>>>> recipe.
> >>>>>>>
> >>>>>>> All I really included was the machine name change in
> local.conf and added the meta-ti layer in bblayers.conf.
> >>>>>>>
> >>>>>>> Did I miss a step?
> >>>>>>
> >>>>>> This was discussed last week.  Add this line to your
> local.conf
> >>>>>>  BBMASK =3D ".*/meta-ti/recipes-misc/"
> >>>>>> This will skip some BeagleBoard/BeagleBone recipes that are
> not
> >>>>>> currently working in a Yocto tree.
> >>>>>>
> >>>>> Thanks a bunch. That got it going.  The README said nothing
> >>>>
> >>>> Stop spreading such lies!
> >>>
> >>> It's not a lie, just a perspective.
> >>
> >> It *is* a lie, since the README is non-empty. Regardless of what
> you want to do, the README does contain content.
> >
> > Sorry, I thought you were referring to my work-around to get this
> > going in Yocto.  Obviously, he was looking for more info in the
> > README than just how to use this layer with Angstrom and I agree
> > that this "trick" probably does not belong in the README.
> >
> > --
>=20
> Wow!  Sorry I jumped into a mailing list I obviously don't
> understand or belong in.  I apologize if I offended.  I did read
> the README, but it didn't make a bit of sense to me because it
> talked about angstrom, which I don't know anything about and
> wondered what that had to do with yocto.  My current Yocto
> knowledge is based on the meta-intel layer, which doesn't mention
> angstrom.  It sounds like the hint/trick that Gary mentioned will
> make bitbake build with just yocto, which is what I want.  My goal
> is more of a proof of concept.  I'd like to prove if you could take
> the same image recipe and move it from Pandaboard to Atom and vice
> versa.  That way a developer could pick the hardware platform based
> on the performance, features, and cost.  The software effort should
> be minimal to move if the Yocto concept works as advertised.

Jim, you are welcome here.  As was mentioned before there have been a lot o=
f discussions about this layer.  One of the goals for the meta-ti layer wil=
l be to work with just oe-core and yocto and not require meta-angstrom.  We=
 are moving that direction and the use case you are trying and your experie=
nces with it are important.  Thanks for taking the time to give this a shot=
.

>=20
> Jim A
>=20
> > ------------------------------------------------------------
> > Gary Thomas                 |  Consulting for the
> > MLB Associates              |    Embedded world
> > ------------------------------------------------------------
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

