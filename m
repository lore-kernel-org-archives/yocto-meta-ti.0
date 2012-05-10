Return-Path: <r-monk@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CFAFE013FE
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 07:23:38 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4AENbKt017499;
	Thu, 10 May 2012 09:23:37 -0500
Received: from DNCE71.ent.ti.com (dnce71.ent.ti.com [137.167.131.20])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4AENanm011113;
	Thu, 10 May 2012 09:23:37 -0500
Received: from DNCE05.ent.ti.com ([fe80::2868:e891:b6c7:394]) by
	DNCE71.ent.ti.com ([fe80::3dd1:4b04:86e6:bfd0%29]) with mapi id
	14.01.0323.003; Thu, 10 May 2012 16:23:36 +0200
From: "Monk, Roger" <r-monk@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [meta-ti] [PATCH] omapfbplay: import from OE classic
Thread-Index: AQHNLqUZfbMuoq6l6USfKciGIL58ZpbDBCMA///qGwCAACHx8P//4RyAgAAiO1A=
Date: Thu, 10 May 2012 14:23:35 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF52240B75598B@DNCE05.ent.ti.com>
References: <1336651467-17102-1-git-send-email-koen@dominion.thruhere.net>
	<4C82F39BABFE6A429733A300DEBF52240B755661@DNCE05.ent.ti.com>
	<F6B9E80B-34AA-44B6-99BA-C875C3589CC1@dominion.thruhere.net>
	<4C82F39BABFE6A429733A300DEBF52240B75582C@DNCE05.ent.ti.com>
	<8452F6A8-6078-4C3A-80A9-96528007111B@dominion.thruhere.net>
In-Reply-To: <8452F6A8-6078-4C3A-80A9-96528007111B@dominion.thruhere.net>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Dmytriyenko,
	Denys" <denys@ti.com>
Subject: Re: [PATCH] omapfbplay: import from OE classic
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
X-List-Received-Date: Thu, 10 May 2012 14:23:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2012 at 15:20:31, Koen Kooi wrote:
> Subject: Re: [meta-ti] [PATCH] omapfbplay: import from OE classic
>
>
> Op 10 mei 2012, om 16:13 heeft Monk, Roger het volgende geschreven:
>
> > On Thu, May 10, 2012 at 15:09:36, Koen Kooi wrote:
> >> Subject: Re: [meta-ti] [PATCH] omapfbplay: import from OE classic
> >>
> >>
> >> Op 10 mei 2012, om 15:42 heeft Monk, Roger het volgende geschreven:
> >>
> >>> Hi Koen,
> >>>
> >>> Think we've still got some API incompatibility here.  I needed to
> >> roll
> >>> back to an earlier omapfbplay commit
> >>> (34293052c5a2ae328eac6903512e6b4ce19b5639) and patch CODEC_TYPE :-
> >>>
> >>> -        if (afc->streams[i]->codec->codec_type =3D=3D CODEC_TYPE_VID=
EO
> >> && !st)
> >>> +        if (afc->streams[i]->codec->codec_type =3D=3D
> >>> + AVMEDIA_TYPE_VIDEO && !st)
> >>>
> >>> to get this working on beagleboard-xm, so I suspect there may have
> >> been an API change after Aug11, or
> >> d03f042ecac0a231bedeadc7a6c67f0102d5505a was rebased against 0.8
> >> branch?  I guess we should ask Mans...
> >>
> >> We still use libav 0.7.4 in meta-oe, I suspect Mans updated to
> >> 0.8.x or even newer. I only build tested it, so I'm open for fixes
> >> that make it run :) Upgrading libav might be an option as well, but
> >> I'm not sure of that will get accepted for the meta-oe release branch.
> >>
> >
> > See attached for now - probably ok as reasonable known working
> baseline before we upgrade other bits?
>
> The patch looks good to me. Once the beaglebone a6 release it out I'll
> have time to look at libav. I'll need it for a customer project in
> that timeframe as well. Thanks for updating the patch!
>

Np! - you gave me great head-start! - I'll re-send via git send-email.

> regards,
>
> Koen



Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102



