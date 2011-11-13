Return-Path: <joelagnel@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C824E00502
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 09:28:51 -0800 (PST)
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id pADHSnOk025674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 13 Nov 2011 11:28:49 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id pADHSnjT002843;
	Sun, 13 Nov 2011 11:28:49 -0600 (CST)
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pADHSncH028010;
	Sun, 13 Nov 2011 11:28:49 -0600 (CST)
Received: from DLEE09.ent.ti.com ([fe80::a026:b4ad:3e78:5ae5]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Sun, 13 Nov 2011 11:28:49 -0600
From: "Fernandes, Joel A" <joelagnel@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [meta-ti] [PATCH v2] linux-ti33x-psp: Check if scheduling is
	required after DMA
Thread-Index: AQHMohZNCsbN4KR5H0+xV1SoufwX9ZWrbmkA//+fBoA=
Date: Sun, 13 Nov 2011 17:28:48 +0000
Message-ID: <083BC63EECB6FD41B8E81CF7FD87CC0F044B49@DLEE09.ent.ti.com>
References: <1321197079-16422-1-git-send-email-joelagnel@ti.com>
	<96D8B429-D458-46D7-8558-3F33C9EB29BC@dominion.thruhere.net>
In-Reply-To: <96D8B429-D458-46D7-8558-3F33C9EB29BC@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Maupin,
	Chase" <chase.maupin@ti.com>
Subject: Re: [PATCH v2] linux-ti33x-psp: Check if scheduling is required after DMA
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
X-List-Received-Date: Sun, 13 Nov 2011 17:28:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> Sent: Sunday, November 13, 2011 11:09 AM
> To: Fernandes, Joel A
> Cc: meta-ti@yoctoproject.org; Maupin, Chase
> Subject: Re: [meta-ti] [PATCH v2] linux-ti33x-psp: Check if scheduling is
> required after DMA
>=20
>=20
> Op 13 nov. 2011, om 16:11 heeft Joel A Fernandes het volgende geschreven:
>=20
> > After processing one DMA completion, checking if rescheduling is
> > required instead of scheduling another completion request if the FIFO
> > is non empty.
> >
> > This fixes high CPU load issue seen with g_mass_storage on a
> > beaglebone and could potentially fix similar issues seen with other
> > gadget drivers
> >
> > Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
>=20
>=20
> I stil get the 100% cpu load after ejecting the drive even after applying
> this patch.

There might be more than one issue here, the other issue was with "rcu_kthr=
ead" taking up 100% CPU which was consistently reproducible with g_ether on=
 a MAC host, does this process still give a high CPU load and have similar =
symptoms?

With node not running, do you see the high CPU load with any other applicat=
ion using g_ether?

Regards,
Joel

