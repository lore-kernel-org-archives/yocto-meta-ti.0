Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9AFFE00A0A; Fri, 28 Sep 2018 08:37:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA07FE009D9
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 08:37:17 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SFbHLt118509
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 10:37:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538149037;
	bh=oQDTOBLcSon+qk8wHBKLfjvfSsED1w+dayeSOnBV8to=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=vhjs/PcXYF0rIufd+WWJwVmQp+I5tgyJjK7U0dZ6sE8y2pS89IpCEea2jCaOtX0m0
	YpbPFTBotCvR6EMGU+yEl1O2wurW0rDKwmH1O3bdXOh1PT1GzQ/wQ9PQeLAh5JRhMo
	Ijb4RzEgaBqzF916nIJjvSGeX20qgdI+78F90DMk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SFbHdW012408
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 10:37:17 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 10:37:16 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1466.003; Fri, 28 Sep 2018 10:37:16 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko/master][PATCH v2 28/30] ti-ndk: Upgrading to
	3.40.01.01
Thread-Index: AQHUVqwksbiyxQRIbE2fMIo0Xi/kEqUF0PXg
Date: Fri, 28 Sep 2018 15:37:16 +0000
Message-ID: <e67882ee8f09487f8c265ddbcd788b06@ti.com>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538081009-52859-29-git-send-email-m-radhakrishnan2@ti.com>
	<20180927215044.GT8582@beryl>
In-Reply-To: <20180927215044.GT8582@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.117.116]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH v2 28/30] ti-ndk: Upgrading to 3.40.01.01
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
X-List-Received-Date: Fri, 28 Sep 2018 15:37:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, September 27, 2018 5:51 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [rocko/master][PATCH v2 28/30] ti-ndk: Upgrading to =
3.40.01.01

On Thu, Sep 27, 2018 at 04:43:27PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-ti/ndk/ti-ndk_2.26.00.08.bb | 13 -------------
>  recipes-ti/ndk/ti-ndk_3.40.01.01.bb | 13 +++++++++++++

Please make it a diff - pass -C/-M to git format-patch

Is there a specific value for <n> for the options -M<n> and -C<n> I should =
use below?
git send-email --smtp-server=3Dsmtp.mail.ti.com --from "Mahesh Radhakrishna=
n <m-radhakrishnan2@ti.com>" --to=3D"meta-ti@yoctoproject.org" --confirm=3D=
always --cover-letter --annotate  -M<n>  -C<n>  -30 --suppress-cc=3Dall --s=
ubject-prefix=3D"rocko/master][PATCH v3"

>  2 files changed, 13 insertions(+), 13 deletions(-)
>  delete mode 100644 recipes-ti/ndk/ti-ndk_2.26.00.08.bb
>  create mode 100644 recipes-ti/ndk/ti-ndk_3.40.01.01.bb
>=20
> diff --git a/recipes-ti/ndk/ti-ndk_2.26.00.08.bb b/recipes-ti/ndk/ti-ndk_=
2.26.00.08.bb
> deleted file mode 100644
> index e587bf9..0000000
> --- a/recipes-ti/ndk/ti-ndk_2.26.00.08.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require ti-ndk.inc
> -
> -PV =3D "2_26_00_08"
> -PR =3D "r0"
> -
> -LIC_FILES_CHKSUM =3D "file://ndk_${PV}_manifest.html;md5=3De2a7d40cf1e72=
07ac3dd6d993d71ee8c"
> -
> -SRC_URI[ndkzip.md5sum] =3D "09c7ffaff305f3083d15c0a0db73d781"
> -SRC_URI[ndkzip.sha256sum] =3D "5b22c6b8bfbf3a22c53f52bf880d5cf49daf38671=
6942a4202569521bb30f4a8"
> -
> -INHIBIT_PACKAGE_STRIP =3D "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> -INHIBIT_SYSROOT_STRIP =3D "1"
> diff --git a/recipes-ti/ndk/ti-ndk_3.40.01.01.bb b/recipes-ti/ndk/ti-ndk_=
3.40.01.01.bb
> new file mode 100644
> index 0000000..4a494b1
> --- /dev/null
> +++ b/recipes-ti/ndk/ti-ndk_3.40.01.01.bb
> @@ -0,0 +1,13 @@
> +require ti-ndk.inc
> +
> +PV =3D "3_40_01_01"
> +PR =3D "r0"
> +
> +LIC_FILES_CHKSUM =3D "file://manifest_ndk_${PV}.html;md5=3D9ddeee8ab01c1=
3f593e6d085cca46b6a"
> +
> +SRC_URI[ndkzip.md5sum] =3D "bbbef445f2d2f84f9bee5d297f77d397"
> +SRC_URI[ndkzip.sha256sum] =3D "e2e5c683c70dfad6f4372c5eeebaf0209b27abb0f=
77304f14f0359cbc7b3f4b8"
> +
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +INHIBIT_SYSROOT_STRIP =3D "1"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

