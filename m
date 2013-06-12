Return-Path: <manishv.b@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4432E015BA
	for <meta-ti@yoctoproject.org>; Tue, 11 Jun 2013 21:08:34 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5C48WMS024065
	for <meta-ti@yoctoproject.org>; Tue, 11 Jun 2013 23:08:33 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5C48TTV015378
	for <meta-ti@yoctoproject.org>; Tue, 11 Jun 2013 23:08:31 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Wed, 12 Jun 2013 12:08:29 +0800
From: "Vishwanathrao Badarkhe, Manish" <manishv.b@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Cooper Jr., Franklin"
	<fcooper@ti.com>
Thread-Topic: [meta-ti] Meta-TI patches for OMAPL138
Thread-Index: AQHOYIp1nx0HR9bFfE2beK4Oi29YXpkj0IMAgA2y3ZA=
Date: Wed, 12 Jun 2013 04:08:28 +0000
Message-ID: <A4887BF146CD57468F700B415D2F47015A12CD@DBDE04.ent.ti.com>
References: <A4887BF146CD57468F700B415D2F470159EF7A@DBDE04.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C492418@DFLE08.ent.ti.com>
	<20130603185502.GD10512@edge>
In-Reply-To: <20130603185502.GD10512@edge>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Meta-TI patches for OMAPL138
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
X-List-Received-Date: Wed, 12 Jun 2013 04:08:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys

On Tue, Jun 04, 2013 at 00:25:02, Dmytriyenko, Denys wrote:
> On Mon, Jun 03, 2013 at 06:44:59PM +0000, Cooper Jr., Franklin wrote:
> > If you plan on adding support for an omapl138 soc/board then please do=
=20
> > not make changes to am18x recipes and machine.
>=20
> Well, am18x board does use omapl138 SOC...
>=20
>=20
> > A new machine should be created for this new machine.
>=20
> ??? I know you meant config, but this is just funny :)
>=20
>=20
> > I would take the conf/machine/am180x-evm.conf and duplicate it for=20
> > your
> > ompal138 board and make the necessary changes there.
>=20
> And I, before giving any specific recommendations, would like to understa=
nd how and where these patches fit - what exact machine/platform is this fo=
r and what is the product SDK this goes into? What will be the support mode=
l for that?
>=20
> It does seem to conflict with Sitara AMSDK (am180x-evm based on OMAPL138 =
SOC) that still uses 2.6.37 kernel. Once I know a little bit more about thi=
s new PSP release 03.22.00.04 for of 3.3 kernel, I'd be able to give better=
 recommendations on how to properly integrate your work into meta-ti layer.

Please let me know, how to integrate my work into meta-ti layer.


Regards,=20
Manish

