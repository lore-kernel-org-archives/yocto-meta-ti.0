Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CD72E00715
	for <meta-ti@yoctoproject.org>; Tue,  3 Sep 2013 10:29:02 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r83HT18F013296;
	Tue, 3 Sep 2013 12:29:01 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r83HT0Cu019378;
	Tue, 3 Sep 2013 12:29:00 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 3 Sep 2013 12:29:00 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Tasslehoff Kjappfot <tasskjapp@gmail.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 5/5] libgles-omap3, omap3-sgx-modules: remove
	old 4.03.00.02 version
Thread-Index: AQHOpsFK5j5twB2ZCkG4LvwuoiWfDJmwiVMAgAImvACAAZdysA==
Date: Tue, 3 Sep 2013 17:29:00 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C544A11@DFLE08.ent.ti.com>
References: <1378005180-30928-1-git-send-email-denis@denix.org>
	<1378005180-30928-5-git-send-email-denis@denix.org>
	<20130901031528.GA18322@edge> <52247F4E.6030404@gmail.com>
In-Reply-To: <52247F4E.6030404@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] libgles-omap3, omap3-sgx-modules: remove old 4.03.00.02 version
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
X-List-Received-Date: Tue, 03 Sep 2013 17:29:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Tasslehoff Kjappfot
> Sent: Monday, September 02, 2013 7:07 AM
> To: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 5/5] libgles-omap3, omap3-sgx-modules: remo=
ve
> old 4.03.00.02 version
>=20
> On 09/01/2013 05:15 AM, Denys Dmytriyenko wrote:
> > BTW, consider this an RFC for removing the next 4.05.00.03 version as
> > well - I know some people are still using it, so please speak up.
> >
>=20
> We're using 4.05.00.03 for our OMAP3530 board, because that is the latest=
 one
> we've tried that actually works :)
>=20
> Last time I tried newer versions there were "instant lockup" problems.
> Are any of the newer versions compatible with OMAP3530 now?
[Franklin] The Graphics SDK was validated on am3517  using a 2.6.37 kernel.=
 I've successfully used 04.08.00.02 without any problems. What kernel versi=
on are you using?
>=20
> - Tasslehoff
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

