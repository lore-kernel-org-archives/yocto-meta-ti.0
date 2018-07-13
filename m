Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1EF56E01217; Fri, 13 Jul 2018 11:13:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 871FFE00CC2
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 11:13:18 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DIDHFo003184
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 13:13:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531505598;
	bh=19bLOZ7+iT9kQVPfkoWaDm9b8kul717Pdv4ZrEP/vCg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=WiZG9I/zcpLsh+519VBHJcHuqC2W7Vfj85T2D+v6fV0yYUuJygydQF6ZDUIpofNvF
	dSXjRKn/XZBwFG+RA+GWTAwRfUZ/gc0kTz8nzI2C3Ej0nZSH03YB80F2Csq1hdf94i
	H/J80f92penfyXaw5bHV5/AfElMFidhsrHQQP49M=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DIDHqK031174
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 13:13:17 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 13:13:17 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1466.003; Fri, 13 Jul 2018 13:13:17 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v2 3/3] ti-sgx-ddk-km: add k3 (AM654x) support
Thread-Index: AQHUGs9xL4hJD7jOpkWvlMax/X7g9qSNdHGA
Date: Fri, 13 Jul 2018 18:13:17 +0000
Message-ID: <d6da453c8f8d4ca9adae9066fbae7546@ti.com>
References: <1531323931-31875-1-git-send-email-e-ruei1@ti.com>
	<1531323931-31875-4-git-send-email-e-ruei1@ti.com>
	<20180713173137.GG25410@beryl>
In-Reply-To: <20180713173137.GG25410@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.148]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2 3/3] ti-sgx-ddk-km: add k3 (AM654x) support
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
X-List-Received-Date: Fri, 13 Jul 2018 18:13:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, July 13, 2018 1:32 PM
To: Ruei, Eric
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2 3/3] ti-sgx-ddk-km: add k3 (AM654x) suppor=
t

On Wed, Jul 11, 2018 at 11:45:31AM -0400, Eric Ruei wrote:
> - add K3 (AM654x) support based on SGX DDK 1.17
>=20
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb  | 41 ++++++++++++++++=
++++++

This is still sent as a new recipe, while being very similar to existing on=
e.=20
Making it a diff would really help. If git doesn't see the similarity on it=
s=20
own, you can try passing --find-copies-harder flag...

Do you mean the fit will search the data base, not just in the local commit=
s?


>  1 file changed, 41 insertions(+)
>  create mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.494895=
7.bb
>=20
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/=
recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> new file mode 100644
> index 0000000..3ce9105
> --- /dev/null
> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -0,0 +1,41 @@
> +DESCRIPTION =3D  "Kernel drivers for the PowerVR SGX chipset found in th=
e TI SoCs"
> +HOMEPAGE =3D "https://git.ti.com/graphics/omap5-sgx-ddk-linux"
> +LICENSE =3D "MIT | GPLv2"
> +LIC_FILES_CHKSUM =3D "file://eurasia_km/README;beginline=3D13;endline=3D=
22;md5=3D74506d9b8e5edbce66c2747c50fcef12"
> +
> +inherit module
> +
> +COMPATIBLE_MACHINE =3D "k3"
> +
> +MACHINE_KERNEL_PR_append =3D "o"
> +PR =3D "${MACHINE_KERNEL_PR}"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +DEPENDS =3D "virtual/kernel"
> +
> +PROVIDES =3D "omapdrm-pvr"
> +
> +RPROVIDES_${PN} =3D "omapdrm-pvr"
> +RREPLACES_${PN} =3D "omapdrm-pvr"
> +RCONFLICTS_${PN} =3D "omapdrm-pvr"
> +
> +BRANCH =3D "ti-img-sgx/${PV}/k4.14"
> +
> +SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=
=3Dgit;branch=3D${BRANCH}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +SRCREV =3D "b630d462f5fbb86e5f98965ba1af35da1207822f"
> +
> +TARGET_PRODUCT_k3 =3D "ti654x"
> +
> +EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" TARGET_PRODUCT=3D=
${TARGET_PRODUCT}'
> +
> +do_compile_prepend() {
> +    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_linux
> +}
> +
> +do_install() {
> +    make -C ${STAGING_KERNEL_DIR} SUBDIRS=3D${B}/eurasia_km/eurasiacon/b=
inary_omap_linux_xorg_release/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D}=
 PREFIX=3D${STAGING_DIR_HOST} modules_install
> +}
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

