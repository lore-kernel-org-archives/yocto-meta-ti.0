Return-Path: <r-monk@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D5E7E0073F
	for <meta-ti@yoctoproject.org>; Wed, 27 Jun 2012 08:41:48 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q5RFfiSk018734;
	Wed, 27 Jun 2012 10:41:44 -0500
Received: from DNCE70.ent.ti.com (dnce70.ent.ti.com [137.167.131.19])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q5RFfi8A018678;
	Wed, 27 Jun 2012 10:41:44 -0500
Received: from DNCE05.ent.ti.com ([fe80::2868:e891:b6c7:394]) by
	DNCE70.ent.ti.com ([fe80::70c9:b447:24a2:dddc%30]) with mapi id
	14.01.0323.003; Wed, 27 Jun 2012 17:41:43 +0200
From: "Monk, Roger" <r-monk@ti.com>
To: Enrico <ebutera@users.berlios.de>
Thread-Topic: [meta-ti] gstreamer / ti-dmai component does not build for
	ti8148-evm
Thread-Index: AQHNVHpjVeS9oaIKk0C6m5AotaXpJZcOS/kw
Date: Wed, 27 Jun 2012 15:41:42 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF52240B805BDA@DNCE05.ent.ti.com>
References: <CADZ6=asseEZTzS6dz0we4-Czbr_n2Y6Pps5UsfGagh7NV04BqQ@mail.gmail.com>
	<CA+2YH7vu646k8kMUS9pYfJQ6+6s5PdvTdyxJSQewztRAaFEomg@mail.gmail.com>
	<CADZ6=au5b5fKuhUm=4Nrsq2es66+u=X1aorgUgDLK8AZDA3mEg@mail.gmail.com>
	<7B98F5B8-3C44-4919-B826-36C3A3B75319@ti.com>
	<4C82F39BABFE6A429733A300DEBF52240B8056E2@DNCE05.ent.ti.com>
	<CA+2YH7vyMKhpbefJRWN7CBWqj_xgkxN=LPVLjq5m1ZO0n_2s5Q@mail.gmail.com>
In-Reply-To: <CA+2YH7vyMKhpbefJRWN7CBWqj_xgkxN=LPVLjq5m1ZO0n_2s5Q@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: gstreamer / ti-dmai component does not build for ti8148-evm
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
X-List-Received-Date: Wed, 27 Jun 2012 15:41:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



>
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

-----Original Message-----
> From: ebutera@gmail.com [mailto:ebutera@gmail.com] On Behalf Of
> Enrico
> Sent: 27 June 2012 16:35
> To: Monk, Roger
> Cc: Dmytriyenko, Denys; Thilo Fromm; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] gstreamer / ti-dmai component does not build for
> ti8148-evm
>
> On Wed, Jun 27, 2012 at 5:06 PM, Monk, Roger <r-monk@ti.com> wrote:
> > On Wed, Jun 27, 2012 at 15:44:48, Dmytriyenko, Denys wrote:
> >> Cc: meta-ti@yoctoproject.org
> >> Subject: Re: [meta-ti] gstreamer / ti-dmai component does not build
> >> for ti8148-evm
> >>
> >> Sorry for top post.
> >>
> >> gst-ducati is not part of meta-ti and it wasn't integrated yet.
> >> Although someone (was it Enrico?) had previously sent unfinished
> >> patches for it - you can check the archives. It didn't work for me on
> >> the first try and I had no time debugging it further, so the patches
> >> got postponed for now - I still have them in my Todo list though...
>
> When i did it there was the problem that HDVICP2 sources (required to bui=
ld
> the stack) disappeared from TI (public) site, will they ever come back?
>
> > But either way... DM814x doesn't use gst-ducati.   It uses gstreamer-ti=
, (on
> TI81xx branch) which is basically a gst-openmax interface.
>
> Out of curiosity, can the same version be used for the pandaboard?

No, unfortunately not I'm afraid.  At the moment, there are some difference=
s in underlying components (like codec framework (dce vs omx), syslink and =
mem management) requiring these different approaches.

>
> Enrico


