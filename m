Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EA86DE009CA; Mon, 20 Jun 2016 13:35:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99CC4E0091D
	for <meta-ti@yoctoproject.org>; Mon, 20 Jun 2016 13:34:59 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5KKYGkG020614
	for <meta-ti@yoctoproject.org>; Mon, 20 Jun 2016 15:34:16 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5KKYuMZ007789
	for <meta-ti@yoctoproject.org>; Mon, 20 Jun 2016 15:34:56 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Mon, 20 Jun 2016 15:34:57 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH v2 1/2] uio-module-drv: Update to new version 2.1.0.0
Thread-Index: AQHRyy7r8xmTzLepH0mbYoEYghogVZ/yz+JA
Date: Mon, 20 Jun 2016 20:34:56 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058406379@DLEE11.ent.ti.com>
References: <1466453053-11731-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1466453053-11731-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] uio-module-drv: Update to new version 2.1.0.0
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
X-List-Received-Date: Mon, 20 Jun 2016 20:35:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry missed adding change from previous version of patch
---
Version number corrected to 2.1.0.0
---

> -----Original Message-----
> From: Nelson, Sam
> Sent: Monday, June 20, 2016 4:04 PM
> To: meta-ti@yoctoproject.org
> Cc: Nelson, Sam
> Subject: [PATCH v2 1/2] uio-module-drv: Update to new version 2.1.0.0
>=20
> One API change in read/write
> Additional test code added
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb | 18
> +++++++++++++++---
>  recipes-bsp/uio-module-drv/uio-module-drv.inc         |  6 +++---
>  2 files changed, 18 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> index 3134a03..1923b36 100644
> --- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> +++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> @@ -2,16 +2,28 @@ DESCRIPTION =3D "Test code for user space IO (UIO)
> driver"
>=20
>  include uio-module-drv.inc
>=20
> -PR =3D "r1"
> +PR =3D "r0"
>=20
> -COMPATIBLE_MACHINE =3D "keystone"
> +COMPATIBLE_MACHINE =3D "keystone|am57xx-evm"
> +
> +DEVICE_NAME_am57xx-evm =3D "am57xx"
> +DEVICE_NAME_keystone-evm =3D "keystone"
>  RDEPENDS_${PN} =3D "uio-module-drv"
>=20
>  do_compile() {
> -	oe_runmake -C ${S} test
> +	oe_runmake -C ${S} test "DEVICE=3D${DEVICE_NAME}"
>  }
>=20
>  do_install() {
>  	install -d ${D}${bindir}/
> +	install -c -m 755 ${S}/test/uio_mem_test ${D}${bindir}/.
> +	install -c -m 755 ${S}/test/uio_int_test ${D}${bindir}/.
> +}
> +
> +do_install_append_keystone () {
>  	install -c -m 755 ${S}/test/uio_cic2_int_multithread_test
> ${D}${bindir}/.
>  }
> +
> +do_install_append_am57xx-evm () {
> +	install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test
> ${D}${bindir}/.
> +}
> diff --git a/recipes-bsp/uio-module-drv/uio-module-drv.inc b/recipes-
> bsp/uio-module-drv/uio-module-drv.inc
> index 161c45b..88eab76 100644
> --- a/recipes-bsp/uio-module-drv/uio-module-drv.inc
> +++ b/recipes-bsp/uio-module-drv/uio-module-drv.inc
> @@ -2,10 +2,10 @@ LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D2b7c96eb2aed7b0f6f922214dbde9016"
>=20
>  BRANCH =3D "master"
> -# This corresponds to version 02.00.00.00 -SRCREV =3D
> "6a7eda36e390658593a5b8d87b0f00beb3997240"
> +# This corresponds to version 02.01.00.00 SRCREV =3D
> +"19761495883bf8fb2670b0929d255135bd295dcb"
>=20
> -PV =3D "2.0.0.0+git${SRCPV}"
> +PV =3D "2.1.0.0+git${SRCPV}"
>=20
>  SRC_URI =3D "git://git.ti.com/keystone-linux/uio-module-
> drv.git;protocol=3Dgit;branch=3D${BRANCH}"
>=20
> --
> 1.9.1


