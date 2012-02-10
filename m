Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32D26E003E3
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 07:05:15 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1AF5E9n024904;
	Fri, 10 Feb 2012 09:05:14 -0600
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1AF5Epw020453;
	Fri, 10 Feb 2012 09:05:14 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Fri, 10 Feb 2012 09:05:14 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Merging in linux-stable updates, git send-email
Thread-Index: AQHM5/1qFTS2IEiSbky2nJz4S1BXypY2OkTQ
Date: Fri, 10 Feb 2012 15:05:14 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1012766A9C8@DLEE12.ent.ti.com>
References: <9A3E20AC-1D66-4B5E-8B91-B930DE69039B@dominion.thruhere.net>
In-Reply-To: <9A3E20AC-1D66-4B5E-8B91-B930DE69039B@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: Merging in linux-stable updates, git send-email
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
X-List-Received-Date: Fri, 10 Feb 2012 15:05:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Koen,

Which recipe are you going to update here?  I assume this is not the linux-=
ti33x-psp_3.2.bb recipe but something else?

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
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Koen Kooi
> Sent: Friday, February 10, 2012 8:08 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] Merging in linux-stable updates, git send-email
>=20
> Hi,
>=20
> The update to 3.2.5 for the bone kernel is almost done, but it
> involves adding ~275 patches. Does it make sense to git-send-email
> that megapatch for review? The difficulty is rooted in the origin
> of the TI kernel: linux-omap instead of Linus' tree, so we can't
> (easily) rebase all the patches on top of 3.2.5, so it's actually
> 3.2.5 rebased onto TI v3.2-staging and then the extra beaglebone
> patches added.
>=20
> Git am -3 takes care of duplicate patches and automerging conflicts
> but I'd still like to find out what the best way to review this is.
>=20
> regards,
>=20
> Koen
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

