Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2B94DE00547; Tue,  1 Jul 2014 08:40:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 289 seconds by postgrey-1.32 at yocto-www;
	Tue, 01 Jul 2014 08:40:01 PDT
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D49C1E00342
	for <meta-ti@yoctoproject.org>; Tue,  1 Jul 2014 08:40:01 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s61FZBuY030313
	for <meta-ti@yoctoproject.org>; Tue, 1 Jul 2014 10:35:11 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s61FZBpq002889
	for <meta-ti@yoctoproject.org>; Tue, 1 Jul 2014 10:35:11 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 1 Jul 2014 10:35:11 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/4] dra7xx: create DRA7xx include file for
	new	SOC Family
Thread-Index: AQHPlTGpYjSYzS9uC0erHc0MVMPQg5uLWaoQ
Date: Tue, 1 Jul 2014 15:35:11 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D8011@DFLE08.ent.ti.com>
References: <1404221769-7903-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1404221769-7903-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] dra7xx: create DRA7xx include file for new	SOC Family
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
X-List-Received-Date: Tue, 01 Jul 2014 15:40:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Maupin, Chase
> Sent: Tuesday, July 01, 2014 8:36 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 1/4] dra7xx: create DRA7xx include file for new=
 SOC
> Family
>=20
> * Create the dra7xx.inc file which inherits the omap-a15.inc file
>   and then adds the dra7xx as another valid SOC_FAMILY setting.
> * The addition of the dra7xx SOC_FAMILY is done while still keeping
>   access to the omap-a15 family.  What this means is that omap-a15
>   can apply to omap5-evm, dra7xx-evm, and am57xx-evm.  Then the
>   dra7xx family can be used to differentiate between omap5 and
>   dra7xx based devices.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  conf/machine/include/dra7xx.inc |    2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 conf/machine/include/dra7xx.inc
>=20
> diff --git a/conf/machine/include/dra7xx.inc
> b/conf/machine/include/dra7xx.inc new file mode 100644 index
> 0000000..fd0ecfe
> --- /dev/null
> +++ b/conf/machine/include/dra7xx.inc
> @@ -0,0 +1,2 @@
> +require conf/machine/include/omap-a15.inc SOC_FAMILY_append =3D
> ":dra7xx"
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

