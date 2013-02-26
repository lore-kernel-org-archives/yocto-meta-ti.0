Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id D08D5E00312
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 20:05:18 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1Q45GrT022843;
	Mon, 25 Feb 2013 22:05:16 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1Q45GtE016363;
	Mon, 25 Feb 2013 22:05:16 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Mon, 25 Feb 2013 22:05:15 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 1/2] linux-omap3: Add supported kernel recipe
	for am37x-evm and am3517-evm
Thread-Index: AQHODVo/vuwMChqXs0Kdjmqo8b/TwpiLz3AA//+kgPuAAGUmAP//t0fg
Date: Tue, 26 Feb 2013 04:05:15 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3AF5F0@DFLE09.ent.ti.com>
References: <1361138432-18908-1-git-send-email-fcooper@ti.com>
	<20130226014414.GE6725@denix.org>
	<1062C227-A018-4C33-8071-417E7C256AA9@ti.com>
	<20130226021845.GD17751@edge>
In-Reply-To: <20130226021845.GD17751@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] linux-omap3: Add supported kernel recipe for am37x-evm and am3517-evm
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
X-List-Received-Date: Tue, 26 Feb 2013 04:05:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Your right. The recipes are almost identical. Only tweaks I would make is s=
witching the commit id and replacing the require linux.inc with a simple in=
herit kernel.
You can revert my patch if you like and I can make tweaks to the current re=
cipe or you can delete your version. Whichever approach you prefer is fine =
with me.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, February 25, 2013 8:19 PM
> To: Cooper Jr., Franklin
> Cc: fcooperjr27@gmail.com; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 1/2] linux-omap3: Add supported kernel reci=
pe
> for am37x-evm and am3517-evm
>=20
> On Mon, Feb 25, 2013 at 09:16:43PM -0500, Cooper Jr., Franklin wrote:
> > Glancing at your recipe it looks the same.
> >
> > I must of missed your version. The kernel hasn't changed so they
> > should be identical. Let me double check with a quick diff
>=20
> Please do. I only see minor diffs (commit ID vs. tag, some order diff etc=
).
>=20
> --
> Denys

