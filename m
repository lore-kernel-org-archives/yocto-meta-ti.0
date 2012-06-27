Return-Path: <r-monk@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24C83E01304
	for <meta-ti@yoctoproject.org>; Wed, 27 Jun 2012 08:06:17 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q5RF6Epu020653;
	Wed, 27 Jun 2012 10:06:14 -0500
Received: from DNCE71.ent.ti.com (dnce71.ent.ti.com [137.167.131.20])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q5RF6Dh4020912;
	Wed, 27 Jun 2012 10:06:14 -0500
Received: from DNCE05.ent.ti.com ([fe80::2868:e891:b6c7:394]) by
	DNCE71.ent.ti.com ([fe80::3dd1:4b04:86e6:bfd0%29]) with mapi id
	14.01.0323.003; Wed, 27 Jun 2012 17:06:13 +0200
From: "Monk, Roger" <r-monk@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "fromm@dresearch-fe.de"
	<fromm@dresearch-fe.de>, Enrico <ebutera@users.berlios.de>
Thread-Topic: [meta-ti] gstreamer / ti-dmai component does not build	for
	ti8148-evm
Thread-Index: AQHNVHNtMy0aFka/jEKzq4E77EjZGZcOQc+g
Date: Wed, 27 Jun 2012 15:06:12 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF52240B8056E2@DNCE05.ent.ti.com>
References: <CADZ6=asseEZTzS6dz0we4-Czbr_n2Y6Pps5UsfGagh7NV04BqQ@mail.gmail.com>
	<CA+2YH7vu646k8kMUS9pYfJQ6+6s5PdvTdyxJSQewztRAaFEomg@mail.gmail.com>,
	<CADZ6=au5b5fKuhUm=4Nrsq2es66+u=X1aorgUgDLK8AZDA3mEg@mail.gmail.com>
	<7B98F5B8-3C44-4919-B826-36C3A3B75319@ti.com>
In-Reply-To: <7B98F5B8-3C44-4919-B826-36C3A3B75319@ti.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: gstreamer / ti-dmai component does not build	for	ti8148-evm
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
X-List-Received-Date: Wed, 27 Jun 2012 15:06:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 27, 2012 at 15:44:48, Dmytriyenko, Denys wrote:
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] gstreamer / ti-dmai component does not build
> for ti8148-evm
>
> Sorry for top post.
>
> gst-ducati is not part of meta-ti and it wasn't integrated yet.
> Although someone (was it Enrico?) had previously sent unfinished
> patches for it - you can check the archives. It didn't work for me on
> the first try and I had no time debugging it further, so the patches
> got postponed for now - I still have them in my Todo list though...
>

But either way... DM814x doesn't use gst-ducati.   It uses gstreamer-ti, (o=
n TI81xx branch) which is basically a gst-openmax interface.

> Denys
>
>
>
>
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

----- Reply message -----
> From: "Thilo Fromm" <fromm@dresearch-fe.de>
> To: "Enrico" <ebutera@users.berlios.de>
> Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
> Subject: [meta-ti] gstreamer / ti-dmai component does not build for
> ti8148- evm
> Date: Wed, Jun 27, 2012 10:38
>
>
>
>
> Hi Enrico,
>
> >> Hi,
> >>
> >> building gstreamer for ti8148 fails becasue DMAI does not build:
> >
> > Are you sure you can use gstreamer-ti with ti8148?
>
> Apparently I cannot.
>
> > AFAIK for
> > multimedia it's more like the pandaboard so you should use gst-ducati.
>
> ... which is not part of meta-ti?
>
> Regards,
> Thilo
>
> --
> Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect DResearch
> Fahrzeugelektronik GmbH Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
> Tel: +49 (30) 515 932 228   mailto:fromm@dresearch-fe.de
> Fax: +49 (30) 515 932 77    http://www.dresearch.de
> Amtsgericht: Berlin Charlottenburg, HRB 130120 B Ust.-IDNr.
> DE273952058
> Gesch=E4ftsf=FChrer: Dr. M. Weber, W. M=F6gle
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti





