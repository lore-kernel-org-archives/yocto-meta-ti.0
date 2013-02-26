Return-Path: <ceh@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 585C2E0027C
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 12:13:11 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1QKDAVm024734
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 14:13:10 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1QKDAjV020564
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 14:13:10 -0600
Received: from DLEE09.ent.ti.com ([fe80::a026:b4ad:3e78:5ae5]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 26 Feb 2013 14:13:10 -0600
From: "Hernandez, Carlos" <ceh@ti.com>
To: "Rini, Tom" <trini@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] recipe: u-boot: update recipe for more images
Thread-Index: AQHOFFZZe4kOXTI7pkOrcRetcAyqGJiM67iA//+lhCA=
Date: Tue, 26 Feb 2013 20:13:10 +0000
Message-ID: <32B5D12402BE454796026F6AC58AA86E2E71F333@DLEE09.ent.ti.com>
References: <1361903920-16650-1-git-send-email-m-karicheri2@ti.com>
	<512D0217.7090100@ti.com> <20130226192023.GL6725@denix.org>
	<512D0D9F.8050705@ti.com>
In-Reply-To: <512D0D9F.8050705@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 26 Feb 2013 12:14:46 -0800
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Hernandez,
	Carlos" <ceh@ti.com>
Subject: Re: [PATCH] recipe: u-boot: update recipe for more images
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
X-List-Received-Date: Tue, 26 Feb 2013 20:13:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> I haven't seen the keystone patches yet, so I don't know if the GPH
> image is "special" in terms of headers, but the build target
> u-boot-with-spl.bin is the canonical build target for "put
> u-boot-spl.bin and u-boot.bin together".
>=20

The current test script transfers (via UART) u-boot-spl.bin and then u-boot=
.img.=20
Have anybody tried booting one omap or sitara device using 'u-boot-with-spl=
.bin' image.

> --
> Tom

