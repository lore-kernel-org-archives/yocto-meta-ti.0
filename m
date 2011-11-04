Return-Path: <joelagnel@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59991E00309
	for <meta-ti@yoctoproject.org>; Fri,  4 Nov 2011 12:26:41 -0700 (PDT)
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id pA4JPo6E018117
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 4 Nov 2011 14:25:50 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA4JPo8Q023707;
	Fri, 4 Nov 2011 14:25:50 -0500 (CDT)
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA4JPoVw009922;
	Fri, 4 Nov 2011 14:25:50 -0500 (CDT)
Received: from DLEE09.ent.ti.com ([fe80::a026:b4ad:3e78:5ae5]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Fri, 4 Nov 2011 14:25:50 -0500
From: "Fernandes, Joel A" <joelagnel@ti.com>
To: Tom Rini <tom.rini@gmail.com>, Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [meta-ti] [PATCH] u-boot 2011.10rc: Fix pmic shut down over
	USB power
Thread-Index: AQHMmqVoyuB9IlrQK0ai1f0D6kZ7L5WcqdEAgACpgwD//8ZBoA==
Date: Fri, 4 Nov 2011 19:25:49 +0000
Message-ID: <083BC63EECB6FD41B8E81CF7FD87CC0F043C48@DLEE09.ent.ti.com>
References: <1320377869-29758-1-git-send-email-joelagnel@ti.com>
	<CC88246E-01E5-4BA1-A555-68F557393200@dominion.thruhere.net>
	<CA+M6bXkub505qK5YKWd28mCc0uB974gPmVLw35m6dhNsefnPwg@mail.gmail.com>
In-Reply-To: <CA+M6bXkub505qK5YKWd28mCc0uB974gPmVLw35m6dhNsefnPwg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] u-boot 2011.10rc: Fix pmic shut down over USB power
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
X-List-Received-Date: Fri, 04 Nov 2011 19:26:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Tom Rini [mailto:tom.rini@gmail.com]
> Sent: Friday, November 04, 2011 12:52 PM
> To: Koen Kooi
> Cc: Fernandes, Joel A; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] u-boot 2011.10rc: Fix pmic shut down
> over USB power
>=20
> On Fri, Nov 4, 2011 at 12:44 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> >
> > Op 4 nov. 2011, om 04:37 heeft Joel A Fernandes het volgende
> geschreven:
> >
> >> These are some fixes suggested by Jason Kridner to fix the PMIC
> >> instabilities we've been seeing over USB power.
> >>
> >> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> >> Cc: Jason Kridner <jdk@ti.com>
> >
> > Applied, thanks!
>=20
> This is of course the bad for A1 patch :)

New patch is coming! And if your A1 does not have a programmed EEPROM, then=
 it doesn't have a bad effect anyway but that's another topic ;)

Thanks,
Joel

