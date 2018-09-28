Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 39C73E00A0C; Fri, 28 Sep 2018 12:14:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B453E009E7
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 12:14:13 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SJEDPa095538
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 14:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538162053;
	bh=CNEudKfgnxETxaVW0bdwOM8LV149L7zK7pxcGTRV7uQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=cSD5HxBQxUA6dpUtaFTWyGJ1npWKOVhOuvru6Q8DNed+0ntb3LT5HqAobZ5KqNeno
	Iggs9QQuodB3Kz0eG2kd13B3p1OuO8g4afZ3KClX/fsVU8i8LRfSDzEzddrprXhfgn
	okmV5jOh66Se4bK4I/6vhK4Sl75j+reAbN6TaHVM=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SJED5P019289
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 14:14:13 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 14:14:12 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1466.003; Fri, 28 Sep 2018 14:14:12 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko/master][PATCH v3 08/29] icss-emac-lld: Update
	to version 01.00.00.13
Thread-Index: AQHUV1Ar1KsCHcW3/Uuwd8FRuZ6tmaUGDetA
Date: Fri, 28 Sep 2018 19:14:12 +0000
Message-ID: <ec29e73c3f2b4ac88ab5aeb093acbc56@ti.com>
References: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538151990-44823-9-git-send-email-m-radhakrishnan2@ti.com>
	<20180928172453.GD13888@beryl>
In-Reply-To: <20180928172453.GD13888@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.117.116]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH v3 08/29] icss-emac-lld: Update to version 01.00.00.13
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
X-List-Received-Date: Fri, 28 Sep 2018 19:14:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, September 28, 2018 1:25 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [rocko/master][PATCH v3 08/29] icss-emac-lld: Update=
 to version 01.00.00.13

On Fri, Sep 28, 2018 at 12:26:09PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/icss-emac-lld/icss-emac-lld.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/ic=
ss-emac-lld/icss-emac-lld.inc
> index d7ca641..0d1afb8 100644
> --- a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> @@ -10,7 +10,7 @@ ICSS_EMAC_LLD_GIT_BRANCH =3D "master"
>  ICSS_EMAC_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/icss_emac"
> =20
>  # Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.13"
> -ICSS_EMAC_LLD_SRCREV =3D "a4071ded3edb0cfebaa62b1f1f35686ea24585b1"
> +ICSS_EMAC_LLD_SRCREV =3D "999692b6d60fd54a0390b1cf4724f1620e757fdf"

Do you also have to bump PV here? The log says update to 01.00.00.13...
This commit is the official PDK release of ICSS EMAC with the tag DEV.ICSS_=
EMAC_LLD.01.00.00.13
The earlier patch (https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commi=
t/recipes-bsp/icss-emac-lld/icss-emac-lld.inc?h=3Drocko&id=3Dd3d575e8dfc71e=
fece38e8a6c8ef802f1f2c3361) was a pre-release version to get the linux buil=
ds going with the intermediate release.=20

>  BRANCH =3D "${ICSS_EMAC_LLD_GIT_BRANCH}"
>  SRC_URI =3D "${ICSS_EMAC_LLD_GIT_URI};destsuffix=3D${ICSS_EMAC_LLD_GIT_D=
ESTSUFFIX};protocol=3D${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

