Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B16DCE00945; Fri,  9 Sep 2016 11:13:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 354E4E00924
	for <meta-ti@yoctoproject.org>; Fri,  9 Sep 2016 11:13:18 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u89IDFIj030597;
	Fri, 9 Sep 2016 13:13:15 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u89IDF7l010542;
	Fri, 9 Sep 2016 13:13:15 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Fri, 9 Sep 2016 13:13:14 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] linux-ti-staging: add QMSS PDSP FW
	dependency for	Keystone
Thread-Index: AQHSCsHzptrmzp6FOkGh/QhBhQZ6NKBxdfDA
Date: Fri, 9 Sep 2016 18:13:14 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958142FC7C6@DFLE09.ent.ti.com>
References: <1473443067-18961-1-git-send-email-denis@denix.org>
In-Reply-To: <1473443067-18961-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [PATCH] linux-ti-staging: add QMSS PDSP FW dependency for	Keystone
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
X-List-Received-Date: Fri, 09 Sep 2016 18:13:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK

Looks good to me. I can't think of anything that may be missing.

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, September 09, 2016 1:44 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] linux-ti-staging: add QMSS PDSP FW dependency
> for Keystone
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_4.4.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-
> kernel/linux/linux-ti-staging_4.4.bb
> index 4c4a8e5..157bc6b 100644
> --- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
> @@ -34,6 +34,9 @@ RDEPENDS_kernel-base_append_k2g-evm =3D " ti-sci-fw"
>  # Add run-time dependency for SerDes firmware to the rootfs
>  RDEPENDS_kernel-base_append_keystone =3D " serdes-fw"
>=20
> +# Add run-time dependency for QMSS PDSP firmware to the rootfs
> +RDEPENDS_kernel-base_append_keystone =3D " qmss-pdsp-fw"
> +
>  # Add run-time dependency for NETCP PA firmware to the rootfs
>  RDEPENDS_kernel-base_append_k2hk-evm =3D " netcp-pa-fw"
>  RDEPENDS_kernel-base_append_k2e-evm =3D " netcp-pa-fw"
> @@ -77,7 +80,7 @@ SRCREV =3D
> "20272d4fd5fd81c551d8a31a3daddc18923b71bb"
>  PV =3D "4.4.19+git${SRCPV}"
>=20
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> rebuild
> -MACHINE_KERNEL_PR_append =3D "b"
> +MACHINE_KERNEL_PR_append =3D "c"
>  PR =3D "${MACHINE_KERNEL_PR}"
>=20
>  KERNEL_GIT_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git=
"
> --
> 2.7.4
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

