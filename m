Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id BD93EE002AB
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 18:16:48 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1Q2Gj8P001104;
	Mon, 25 Feb 2013 20:16:45 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1Q2GjhY006487;
	Mon, 25 Feb 2013 20:16:45 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 25 Feb 2013 20:16:45 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 1/2] linux-omap3: Add supported kernel recipe
	for am37x-evm and am3517-evm
Thread-Index: AQHODVo/vuwMChqXs0Kdjmqo8b/TwpiLz3AA//+kgPs=
Date: Tue, 26 Feb 2013 02:16:43 +0000
Message-ID: <1062C227-A018-4C33-8071-417E7C256AA9@ti.com>
References: <1361138432-18908-1-git-send-email-fcooper@ti.com>,
	<20130226014414.GE6725@denix.org>
In-Reply-To: <20130226014414.GE6725@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
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
X-List-Received-Date: Tue, 26 Feb 2013 02:16:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Glancing at your recipe it looks the same.

I must of missed your version. The kernel hasn't changed so they should be =
identical. Let me double check with a quick diff

On Feb 25, 2013, at 7:45 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> On Sun, Feb 17, 2013 at 04:00:31PM -0600, fcooperjr27@gmail.com wrote:
>> From: Franklin S. Cooper Jr <fcooper@ti.com>
>=20
> So, how is it different from this:
>=20
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=3D53dcf7977a=
86714cbd27f919a473dac8f6f16434
>=20
> --=20
> Denys
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

