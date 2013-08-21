Return-Path: <mrinmayee@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BFC6BE00406
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 22:22:03 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7L5M1Yn025340
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 00:22:02 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7L5Lw1R021072
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 00:22:00 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Wed, 21 Aug 2013 13:21:58 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] Timeout issue
Thread-Index: Ac6diEvL1Ah5xnxST560O3gdUpr9Cv//8XOA//6qC1A=
Date: Wed, 21 Aug 2013 05:21:57 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D5444B02@DBDE04.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D544493F@DBDE04.ent.ti.com>
	<20130820164111.GC8481@edge>
In-Reply-To: <20130820164111.GC8481@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Timeout issue
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
X-List-Received-Date: Wed, 21 Aug 2013 05:22:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, August 20, 2013 10:11 PM
> To: Hingolikar, Mrinmayee
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] Timeout issue
>=20
> On Tue, Aug 20, 2013 at 09:33:15AM +0000, Hingolikar, Mrinmayee wrote:
> > Hi all,
> >
> > During yocto build many times the fetch times out resulting in a
> > fetcher failure. The same command for fetch when run with a larger
> > timeout for wget succeeds.
> > Where can we modify the arguments to wget so that the build doesn't
> > halt due to a fetcher failure?
>=20
> Mrinmayee,
>=20
> Please also raise this issue with the IT department from your side -
> we've seen the proxies timing out lately for other teams and the more
> people complain, the faster it should get resolved... Thanks.
>=20
Yes we have raised this issue with the IT department for the omapzoom serve=
r as of now.
Thanks.
> --
> Denys

