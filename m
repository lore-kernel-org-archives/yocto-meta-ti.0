Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E7D9E00BC2; Mon, 10 Jul 2017 07:30:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB608E00B8B
	for <meta-ti@yoctoproject.org>; Mon, 10 Jul 2017 07:30:02 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6AEU1vn018346
	for <meta-ti@yoctoproject.org>; Mon, 10 Jul 2017 09:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499697001;
	bh=2xxhvv41Nale78iIEwEFSAQrEsHgjygpdxoUnklUn8E=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=ounWHtwPuNym8rDAFZB0CKdqWVkDXtPS7mV+t32I62wdtGL+ki/q4/VwXeV/s071G
	4NlQTT78GLPN6jyx1i/S2Cm1D2Yh/4QiRUZulNrk8YKcE+3v6SMqNC4L9SxXBUnwGc
	PVwW8Cuylou3Pj7UqLu5vOKPjZv2M7NbrQtB1i6A=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6AEU1SH022385
	for <meta-ti@yoctoproject.org>; Mon, 10 Jul 2017 09:30:01 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Mon, 10 Jul 2017 09:30:00 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] icss-emac-lld-rtos: Added rtos recipe for
	icss-emac-lld
Thread-Index: AQHS9qktvUj3Cyerr0ioR1LK1OUNBqJNI3QQ
Date: Mon, 10 Jul 2017 14:29:59 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926D53EE3@DLEE08.ent.ti.com>
References: <1499380944-60574-1-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1499380944-60574-1-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [PATCH] icss-emac-lld-rtos: Added rtos recipe for	icss-emac-lld
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
X-List-Received-Date: Mon, 10 Jul 2017 14:30:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

As there are also recipes for Linux user space icss-emac-lld, can we create=
 icss-emac-lld.inc to include the common information such as SRC_URI, SRCRE=
V, and etc.?=20

Linux user space icss-emac-lld recipes in meta-processor-sdk:
http://arago-project.org/git/projects/?p=3Dmeta-processor-sdk.git;a=3Dtree;=
f=3Drecipes-bsp/icss-emac-lld;h=3D0e6b07f5b436f6c32cb98f6f80cce1640f749b6d;=
hb=3Db90a8b708c29abe7e888118c269a4c8878d98b0d

Thanks,
Hongmei

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Thursday, July 06, 2017 6:42 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] icss-emac-lld-rtos: Added rtos recipe for icss=
-
> emac-lld
>=20
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  .../icss-emac-lld/icss-emac-lld-rtos_git.bb        | 43
> ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
>=20
> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb b/recipe=
s-
> bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
> new file mode 100644
> index 0000000..53e6bf3
> --- /dev/null
> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
> @@ -0,0 +1,43 @@
> +inherit ti-pdk
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D
> "file://icss_emacDrv.h;beginline=3D1;endline=3D40;md5=3D88d270788c1d85165=
1130
> 4f11a28586d"
> +
> +COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g"
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +ICSS_EMAC_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/icss-emac.git"
> +ICSS_EMAC_LLD_GIT_PROTOCOL =3D "git"
> +ICSS_EMAC_LLD_GIT_BRANCH =3D "master"
> +ICSS_EMAC_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/icss_emac"
> +
> +# Below commit ID corresponds to "DEV.ICSS-EMAC_LLD.01.00.00.07C"
> +ICSS_EMAC_LLD_SRCREV =3D "08cb0540eeab7721fe82b603cb6285393f314117"
> +
> +BRANCH =3D "${ICSS_EMAC_LLD_GIT_BRANCH}"
> +SRC_URI =3D
> "${ICSS_EMAC_LLD_GIT_URI};destsuffix=3D${ICSS_EMAC_LLD_GIT_DESTSUFFI
> X};protocol=3D${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"
> +
> +SRCREV =3D "${ICSS_EMAC_LLD_SRCREV}"
> +PV =3D "01.00.00.07C"
> +PR =3D "r0"
> +
> +S =3D "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
> +
> +DEPENDS_append =3D " osal-rtos \
> +                   pruss-lld-rtos \
> +"
> +DEPENDS_append_ti33x =3D " starterware-rtos \ "
> +DEPENDS_append_ti43x =3D " starterware-rtos \ "
> +
> +# Build with make instead of XDC
> +TI_PDK_XDCMAKE =3D "0"
> +
> +export PDK_ICSS_EMAC_ROOT_PATH =3D"${WORKDIR}/build"
> +export DEST_ROOT=3D"${S}"
> +
> +# HTML doc link params
> +PDK_COMP_LINK_TEXT =3D "ICSS-EMAC LLD"
> +
> +INSANE_SKIP_${PN} =3D "arch"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

