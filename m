Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D8F6E00599
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:44:31 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0RKiUGv015223;
	Fri, 27 Jan 2012 14:44:30 -0600
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0RKiUTu021321;
	Fri, 27 Jan 2012 14:44:30 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 27 Jan 2012 14:44:30 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Mills, William" <wmills@ti.com>
Thread-Topic: [meta-ti] [PATCH 1/3] matrix-gui-browser: port from arago overlay
Thread-Index: AQHM3TO/GjDr/rvaXE2FdDXpUeIY/JYhEqwA//+bssA=
Date: Fri, 27 Jan 2012 20:44:29 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1010BF9DA6E@DLEE12.ent.ti.com>
References: <4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
	<4F2304E7.7070809@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>
	<20120127202150.GE8707@denix.org> <4F230803.1070503@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D92A@DLEE12.ent.ti.com>
	<20120127203433.GG8707@denix.org>
	<7D46E86EC0A8354091174257B2FED1010BF9D9FE@DLEE12.ent.ti.com>
	<4F230C50.8070400@ti.com>
In-Reply-To: <4F230C50.8070400@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from arago overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 20:44:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

That is what I was planning to do with the bbappends for qt.

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: Mills, William
> Sent: Friday, January 27, 2012 2:43 PM
> To: Maupin, Chase
> Cc: Denys Dmytriyenko; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 1/3] matrix-gui-browser: port from
> arago overlay
>=20
>=20
> On 01/27/2012 03:39 PM, Maupin, Chase wrote:
> >>
> >> -----Original Message-----
> >> From: Denys Dmytriyenko [mailto:denis@denix.org]
> >> As of today's state of Arago - if you don't count recipes/ti,
> which
> >> was
> >> "untouchable" for some special reasons, everything else is quite
> >> clean with
> >> using amends everywhere possible! And our of all the people you
> >> should know
> >> this better.
> > There are plenty of recipes in arago outside of the ti directory
> that are not just amends.  What I am saying is that I would like to
> split the bbappends into their own directory so that we can more
> easily track what we are appending and ideally find ways to drive
> those changes into lower common layers (not that we always can)
> >
>=20
> So it can be even clearer and cleaner than it is today.  Great.
> Sounds
> like a good task for a meta-arago owner.
>=20


