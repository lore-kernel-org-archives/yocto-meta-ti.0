Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 7236CE006CC
	for <meta-ti@yoctoproject.org>; Wed, 20 Feb 2013 05:49:37 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1KDnZKV028055;
	Wed, 20 Feb 2013 07:49:35 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1KDnZPc011942;
	Wed, 20 Feb 2013 07:49:35 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 20 Feb 2013 07:49:35 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] arago servers sane?
Thread-Index: AQHOD2xp+SgbbQS+jk2a8wE/5ISrk5iCwt6g
Date: Wed, 20 Feb 2013 13:49:34 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3975AE@DFLE09.ent.ti.com>
References: <CALbNGRRkxbzvQa0Lieiknz=QS+LehASn+6-QD2qY5G-CkND7zQ@mail.gmail.com>
In-Reply-To: <CALbNGRRkxbzvQa0Lieiknz=QS+LehASn+6-QD2qY5G-CkND7zQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: arago servers sane?
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
X-List-Received-Date: Wed, 20 Feb 2013 13:49:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Try cloning the git repository outside of OE. If that fails then the Arago-=
project server could be acting up.

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Andreas M=FCller
> Sent: Wednesday, February 20, 2013 7:16 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] arago servers sane?
>=20
> Hi
>=20
> after deleting all my temp file I get during parse (?!):
>=20
> ERROR: ExpansionError during parsing
> /home/andreas/data/oe-core/sources/meta-ti/recipes-bsp/u-boot/u-
> boot_2013.01.bb:
> Failure expanding variable SRCPV,expression was ${@bb.fetch2.get_srcrev(d=
)}
> which triggered exception FetchError:
> Fetcher failure: Fetch command failed with exit code 128, output:
> fatal: The remote end hung up unexpectedly
>=20
> ERROR: Command execution failed: Exited with 1
>=20
> I tried to browse http://arago-project.org/git/projects/ but get only an =
empty
> frame and the page loads forever.
>=20
> Any thoughts?
>=20
> Andreas
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

