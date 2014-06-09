Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF7E6E00B7B; Mon,  9 Jun 2014 11:50:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
X-Greylist: delayed 220 seconds by postgrey-1.32 at yocto-www;
	Mon, 09 Jun 2014 11:50:52 PDT
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89578E00B66
	for <meta-ti@yoctoproject.org>; Mon,  9 Jun 2014 11:50:52 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s59IlBB1009585;
	Mon, 9 Jun 2014 13:47:11 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s59IlB3m002565;
	Mon, 9 Jun 2014 13:47:11 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Mon, 9 Jun 2014 13:47:11 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, Diego Sueiro <diego.sueiro@gmail.com>
Thread-Topic: [meta-ti] Building qt5 using Yocto+meta-ti possible for
	Beaglebone?
Thread-Index: AQHPgeDTQLh+fO0iPESzV5vfC4ZhSptlkwoAgAKvPQCAAKIhgIAAff6A//+/pWA=
Date: Mon, 9 Jun 2014 18:47:10 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6C85AD@DFLE08.ent.ti.com>
References: <5392397D.4000504@emagii.com>
	<7fe72dbd-40a2-4730-a737-ac67ef21c9a1@email.android.com>
	<5392BE20.2000509@emagii.com> <5394FEA0.1020602@emagii.com>
	<CAMCfZKHYWGdStwbGVjnfqC3O3zj5j4qPmsq9jH=U9s_a92EtRA@mail.gmail.com>
	<20140609173513.GM27324@denix.org>
In-Reply-To: <20140609173513.GM27324@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Building qt5 using Yocto+meta-ti possible for	Beaglebone?
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
X-List-Received-Date: Mon, 09 Jun 2014 18:50:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Monday, June 09, 2014 12:35 PM
> To: Diego Sueiro
> Cc: meta-ti mailing list
> Subject: Re: [meta-ti] Building qt5 using Yocto+meta-ti possible for
> Beaglebone?
>=20
> On Mon, Jun 09, 2014 at 07:04:17AM -0300, Diego Sueiro wrote:
> > Ulf,
> >
> > On Sun, Jun 8, 2014 at 9:24 PM, Ulf Samuelsson <meta-ti@emagii.com>
> wrote:
> >
> > > Romber Nelson and some other people mention that the 3.12 kernel
> > > used is not compatible with the advanced capes like LCDs.
> > > Do I need to revert to the 3.8 kernel?
> > >
> >
> > Kernel 3.12 does not have cape manager capabilities, as far as I know.
> > Did you tested it in a HDMI monitor/TV?
>=20
> Correct, cape support is not available in 3.12.
[Franklin] I don't believe any >3.2 kernel within meta-ti includes support =
for capes. I believe linux-ti33x-psp_3.2.bb included cape support since I t=
hink it was used in Angstrom but I never used it before so I could be wrong=
.
>=20
> --
> Denys
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

