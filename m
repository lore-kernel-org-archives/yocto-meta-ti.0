Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51016E00707; Tue,  1 Jul 2014 08:35:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19208E00547
	for <meta-ti@yoctoproject.org>; Tue,  1 Jul 2014 08:35:37 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s61FZahB030505
	for <meta-ti@yoctoproject.org>; Tue, 1 Jul 2014 10:35:36 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s61FZa9X013485
	for <meta-ti@yoctoproject.org>; Tue, 1 Jul 2014 10:35:36 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Tue, 1 Jul 2014 10:35:36 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 3/4] dra7xx-evm: Use dra7xx include
Thread-Index: AQHPlTGRxQ4sI/VsDkCVzNITl7SBhpuLWcUA
Date: Tue, 1 Jul 2014 15:35:35 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D8021@DFLE08.ent.ti.com>
References: <1404221769-7903-1-git-send-email-Chase.Maupin@ti.com>
	<1404221769-7903-3-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1404221769-7903-3-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] dra7xx-evm: Use dra7xx include
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
X-List-Received-Date: Tue, 01 Jul 2014 15:35:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Maupin, Chase
> Sent: Tuesday, July 01, 2014 8:36 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 3/4] dra7xx-evm: Use dra7xx include
>=20
> * Update the include file used to the dra7xx.inc file which
>   brings access to the dra7xx SOC_FAMILY
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  conf/machine/dra7xx-evm.conf |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
> index 14253cf..7069b44 100644
> --- a/conf/machine/dra7xx-evm.conf
> +++ b/conf/machine/dra7xx-evm.conf
> @@ -2,7 +2,7 @@
>  #@NAME: DRA7xx EVM
>  #@DESCRIPTION: Machine configuration for the TI DRA7xx EVM
>=20
> -require conf/machine/include/omap-a15.inc
> +require conf/machine/include/dra7xx.inc
>=20
>  IMAGE_FSTYPES +=3D "ubi tar.gz"
>=20
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

