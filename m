Return-Path: <gaurav@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77779E00CFF; Mon, 18 Dec 2017 14:37:21 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CAD3E00A9C
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 14:37:19 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBIMbJ0k017620
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 16:37:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513636639;
	bh=esoVN3nXYoYewfHdQwJftcLwMiXsjMUrXgWwN8Vjmdo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=YV9wASudZvJNBsb8fTB5d1dV8iCTtvhkbIal1oHmFdGhIrrPdEVA2vRk0JUOMOFcg
	HPmQtbF57qs//fCQ8AxPZGfx8vvU1abOM6P8Tr8iaWjJ/8gF0wMsk8VLTIw6l3FhtW
	rL4DnGt7MW8qoFAnHvPTgyQLk7kofR5saRNaZO+w=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBIMbJfZ027650
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 16:37:19 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 18 Dec 2017 16:37:19 -0600
Received: from DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12]) by
	DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12%17]) with mapi id
	15.01.1261.035; Mon, 18 Dec 2017 16:37:18 -0600
From: "Mitra, Gaurav" <gaurav@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] Enable OpenMP RTOS eclipse plugin signature
Thread-Index: AQHTeE16oq/VbTvIn0qMbHjkNEfU1aNKEEoA//+ggwA=
Date: Mon, 18 Dec 2017 22:37:18 +0000
Message-ID: <18c68ca5ad4449c7b79c2b54229a91b6@ti.com>
References: <20171218221333.56296-1-gaurav@ti.com> <20171218221839.GD4033@edge>
In-Reply-To: <20171218221839.GD4033@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.219.18.117]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] Enable OpenMP RTOS eclipse plugin signature
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
X-List-Received-Date: Mon, 18 Dec 2017 22:37:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The eclipse-plugin.bbclass and ti-paths-append.inc are in:

meta-processor-sdk-internal/classes/eclipse-plugin.bbclass
meta-processor-sdk-internal/recipes-ti/includes/ti-paths-append.inc

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, December 18, 2017 4:19 PM
To: Mitra, Gaurav
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] Enable OpenMP RTOS eclipse plugin signature

On Mon, Dec 18, 2017 at 04:13:33PM -0600, Gaurav Mitra wrote:
> - Integrate hotfix to remove legacy eclipse plugin generation from=20
> OpenMP RTOS
>=20
> Signed-off-by: Gaurav Mitra <gaurav@ti.com>
> ---
>  recipes-ti/openmp-rtos/openmp-rtos_git.bb | 31=20
> ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb=20
> b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> index f5bf4765..b562e2f2 100644
> --- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> +++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> @@ -2,20 +2,41 @@ DESCRIPTION =3D "TI OpenMP RTOS"
>  HOMEPAGE =3D "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
>  LICENSE =3D "BSD"
> =20
> -require recipes-ti/includes/ti-paths.inc
> +inherit eclipse-plugin
> +require recipes-ti/includes/ti-paths-append.inc

????????????????????????????????????
There's no eclipse-plugin.bbclass, there's no ti-paths-append.inc


> -PV =3D "2_06_02_00"
> +PV =3D "2_06_02_01"
> +ECLIPSE_PLUGIN_VERSION =3D "2.06.02.01"
>  PR =3D "r0"
> =20
> +ECLIPSE_PLUGIN_DIR     =3D "${OMP_INSTALL_DIR_RECIPE}/eclipse"
> +ECLIPSE_PLUGIN_MACHINE =3D "${@'${MACHINE}'.replace('-evm','')}"
> +ECLIPSE_PLUGIN_NAME    =3D "${ECLIPSE_PLUGIN_MACHINE} OpenMP"
> +ECLIPSE_PLUGIN_RTSC    =3D "com.ti.rtsc.openmp"
> +ECLIPSE_PLUGIN_DESC    =3D "TI OpenMP RTOS"
> +
> +ECLIPSE_PLUGIN_PROVIDER  =3D "Texas Instruments Inc."
> +ECLIPSE_PLUGIN_DESC_URL  =3D "http://www.ti.com"
> +ECLIPSE_PLUGIN_COPYRIGHT =3D "Copyright Texas Instruments 2017"
> +
> +ECLIPSE_PLUGIN_ROOT_MACRO =3D "OMP_INSTALL_DIR"
> +ECLIPSE_PLUGIN_ROOT       =3D "../../.."
> +ECLIPSE_PLUGIN_REPO       =3D "${ECLIPSE_PLUGIN_ROOT}/packages"
> +ECLIPSE_PLUGIN_DOCS       =3D "${ECLIPSE_PLUGIN_ROOT}/docs"
> +ECLIPSE_FOLDER_PREFIX     =3D "openmp"
> +ECLIPSE_ROOT_MACRO        =3D "OMP_INSTALL_DIR"
> +
> +# Don't create toc_top.xml or toc_cdoc.xml ECLIPSE_PLUGIN_CDOC =3D ""
> +
>  OPENMP_RTOS_GIT_URI =3D "git://git.ti.com/openmp/ti-openmp-dsp-runtime.g=
it"
>  OPENMP_RTOS_GIT_PROTOCOL =3D "git"
>  OPENMP_RTOS_GIT_BRANCH =3D "master"
> =20
>  BRANCH =3D "${OPENMP_RTOS_GIT_BRANCH}"
> -SRC_URI =3D=20
> "${OPENMP_RTOS_GIT_URI};protocol=3D${OPENMP_RTOS_GIT_PROTOCOL};branch=3D$=
{BRANCH} \ -"
> +SRC_URI =3D "${OPENMP_RTOS_GIT_URI};protocol=3D${OPENMP_RTOS_GIT_PROTOCO=
L};branch=3D${BRANCH}"
> =20
> -SRCREV =3D "a2a518dcc9154a372b38bd5be8a483359123823c"
> +SRCREV =3D "69af0caf19c2713e21b25e77acf103074be129f2"
> =20
>  LIC_FILES_CHKSUM =3D "file://docs/license/omp_manifest_template.html;md5=
=3D61a6972303c0447b7c056195d7ebafee"
> =20
> --
> 2.14.1
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

