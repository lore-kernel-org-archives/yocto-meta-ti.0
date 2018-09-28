Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA4D3E009E7; Fri, 28 Sep 2018 07:22:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3B32E009CF
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 07:22:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SEMWI9099672
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 09:22:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538144552;
	bh=vEa9oOXSexricoFz6zG2uriSGqSbHk7P8bZHuNlbp68=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=t+Lk8nDvaeWeE9I4I/owL7AMbadFpb21eQGqTx2Y3+7JLJD0XmCgFNnHh51EP/Ri2
	mIjjteVgYE0+Djt+G/pzTnh93c3aqgimxygGmjznr5Y9tqZa3n3Qc0SBWCXr2xn21l
	Zu7IbMESKhTfowhOolUt9N4tpeLd5oWAbOHxJPsY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SEMW3T009462
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 09:22:32 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 09:22:32 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1466.003; Fri, 28 Sep 2018 09:22:31 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko/master][PATCH v2 01/30] ti-pdk-bbclass:
	Checking for doxygen support in the correct manner
Thread-Index: AQHUVqosoX52AL0Q2024sfZlvlltTKUFv3sA
Date: Fri, 28 Sep 2018 14:22:31 +0000
Message-ID: <d7921beb7fd0422ba15437061a2830ed@ti.com>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538081009-52859-2-git-send-email-m-radhakrishnan2@ti.com>
	<20180927213638.GM8582@beryl>
In-Reply-To: <20180927213638.GM8582@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.117.116]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH v2 01/30] ti-pdk-bbclass: Checking for doxygen support in the correct manner
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
X-List-Received-Date: Fri, 28 Sep 2018 14:22:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, September 27, 2018 5:37 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [rocko/master][PATCH v2 01/30] ti-pdk-bbclass: Check=
ing for doxygen support in the correct manner

On Thu, Sep 27, 2018 at 04:43:00PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  classes/ti-pdk.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> index 0716074..f59969f 100644
> --- a/classes/ti-pdk.bbclass
> +++ b/classes/ti-pdk.bbclass
> @@ -9,8 +9,8 @@ DEPENDS_append_omap-a15 =3D " ti-cgt-arm-native"
>  DEPENDS_remove_ti33x =3D "ti-cgt6x-native"
>  DEPENDS_remove_ti43x =3D "ti-cgt6x-native"
>  DEPENDS_append_omapl1 =3D " ti-cgt-arm-native"
> -DEPENDS_remove_am65xx-evm =3D "gcc-arm-none-eabi-native ti-cgt6x-native"
> -DEPENDS_append_am65xx-evm =3D " ti-cgt-arm-native gcc-linaro-baremetal-a=
arch64-native"
> +DEPENDS_remove_k3 =3D "gcc-arm-none-eabi-native ti-cgt6x-native"
> +DEPENDS_append_k3 =3D " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-n=
ative"
> =20
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build"
> @@ -72,7 +72,7 @@ PARALLEL_XDC =3D "--jobs=3D${BB_NUMBER_THREADS}"
>  PARALLEL_MAKE =3D ""
> =20
>  def get_doxygen_support(d):
> -    if d.getVar('TI_PDK_DOXYGEN_SUPPORT') =3D=3D '1':
> +    if d.getVar('TI_PDK_DOXYGEN_SUPPORT', True) =3D=3D '1':

"Checking for doxygen support in the correct manner"

Why the change?

I was thinking it was a bug fix when the doxygen support was added, but I'm=
 wrong .
I see the commit now which explains why this was removed=20
https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/classes/ti-pdk.bb=
class?h=3Drocko&id=3D195d3f7b93b605eccab685b408f354d35a60884e=20
Apparently meta-processor-sdk-internal's ti-pdk.bbclass  didn't catch up wi=
th this change.
So, pls ignore this patch.

>          return ''
>      return 'DOXYGEN_SUPPORT=3Dno'
> =20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

