Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C3A4E006D9
	for <meta-ti@yoctoproject.org>; Mon, 11 Jun 2012 20:08:52 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q5C38ouZ005205;
	Mon, 11 Jun 2012 22:08:50 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q5C38oR0020050;
	Mon, 11 Jun 2012 22:08:50 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 11 Jun 2012 22:08:50 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-ti] RFC: creating "extras" layer
Thread-Index: AQHNSDkvaqxXeq/eIkOPJFR3sdD5UZb2AO4P
Date: Tue, 12 Jun 2012 03:08:49 +0000
Message-ID: <02A43FA9-CB23-403B-A5FB-6602C56C6BC5@ti.com>
References: <20120612011706.GD30300@denix.org>
In-Reply-To: <20120612011706.GD30300@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: RFC: creating "extras" layer
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
X-List-Received-Date: Tue, 12 Jun 2012 03:08:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sounds like a good plan

Sincerely,
Chase Maupin
On Jun 11, 2012, at 3:17 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:

> Koen, et al,
>=20
> This is a RFC for creating an additional "extras" layer inside meta-ti t=
o=20
> contain pieces and components that are either slightly outdated (i.e. ol=
d=20
> Davinci boards, hawk/crane etc.) or have best-effort status (TI81x, anyt=
hing=20
> DSP-related, etc.) or require non-standard dependencies besides OE-Core=
=20
> (systemd?) with the possibility of moving them back to "main" meta-ti in=
 the=20
> future, once they become "first-class citizens", i.e. gain current and=
=20
> continuing support.
>=20
> The initial split (which is still "work in progress"), following the abo=
ve=20
> description (except the systemd for now) can be checked at:
>=20
> http://arago-project.org/git/?p=3Dmeta-ti.git;a=3Dshortlog;h=3Drefs/head=
s/split
>=20
> I do understand this is, like any other restructuring, an invasive chang=
e, but=20
> is required to properly position "meta-ti" and the support behind it. I'=
m open=20
> to a discussion and any constructive criticism - feel free to comment. T=
hanks.
>=20
> --=20
> Denys
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

