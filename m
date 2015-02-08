Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0EC2E0083D; Sat,  7 Feb 2015 17:45:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6404E007AB
	for <meta-ti@yoctoproject.org>; Sat,  7 Feb 2015 17:45:23 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t181jKoR028465;
	Sat, 7 Feb 2015 19:45:20 -0600
Received: from DFLE51.ent.ti.com (dfle51.ent.ti.com [10.64.6.12])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t181jJHb012928;
	Sat, 7 Feb 2015 19:45:19 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE51.ent.ti.com ([fe80::f88a:66e:ad57:ae4a%17]) with mapi id
	14.03.0224.002; Sat, 7 Feb 2015 19:45:19 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] keystone: stop backfilling rtc
Thread-Index: AQHQQW8ntWyIQQr72kix49LSdQsC3Jzl/uJQ
Date: Sun, 8 Feb 2015 01:45:19 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058110C29@DLEE11.ent.ti.com>
References: <1423159825-17883-1-git-send-email-denis@denix.org>
In-Reply-To: <1423159825-17883-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] keystone: stop backfilling rtc
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
X-List-Received-Date: Sun, 08 Feb 2015 01:45:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ack.
This works.

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Thursday, February 05, 2015 1:10 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] keystone: stop backfilling rtc
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  conf/machine/include/keystone.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/conf/machine/include/keystone.inc
> b/conf/machine/include/keystone.inc
> index 9a5c11f..820fe12 100644
> --- a/conf/machine/include/keystone.inc
> +++ b/conf/machine/include/keystone.inc
> @@ -20,3 +20,4 @@ EXTRA_IMAGEDEPENDS +=3D "u-boot"
>  EXTRA_IMAGEDEPENDS +=3D "boot-monitor"
>=20
>  MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat pci"
> +MACHINE_FEATURES_BACKFILL_CONSIDERED =3D "rtc"
> --
> 2.2.0
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

