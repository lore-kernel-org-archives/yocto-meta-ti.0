Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8927E00A9C; Thu, 12 Oct 2017 11:17:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19CAEE007EF
	for <meta-ti@yoctoproject.org>; Thu, 12 Oct 2017 11:17:10 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9CIHAn5007944
	for <meta-ti@yoctoproject.org>; Thu, 12 Oct 2017 13:17:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507832230;
	bh=cUL+Y1MvXzRIhLyBLaIaLJ2+lfhrcBP8769S7E3OYbY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=APQBSNHRZM90OUqT29N5ht1NLAWIOnD08rKGC92jE5tqV0iSbC8oo0UgXWSgLC30N
	Lic05KO/ubVjbMlSX3eSWxmANn4+Km8+6FoLftst6MIMVyFTxLlmuXgDFdrcDpkVoe
	chtfPUfggw84Atw7615PYvwzj4oT/n9jI9kVtL0U=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9CIHAek016549
	for <meta-ti@yoctoproject.org>; Thu, 12 Oct 2017 13:17:10 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Thu, 12 Oct 2017 13:17:09 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [PATCH] linux: ti-uio: remove KERNEL_DEVICETREE appends
Thread-Index: AQHTQ3bkubNppX5E6ECDvloEZeBE/KLghZ7g
Date: Thu, 12 Oct 2017 18:17:08 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926D8E085@DLEE08.ent.ti.com>
References: <1507825145-1602-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1507825145-1602-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [PATCH] linux: ti-uio: remove KERNEL_DEVICETREE appends
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
X-List-Received-Date: Thu, 12 Oct 2017 18:17:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK

> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Thursday, October 12, 2017 12:19 PM
> To: meta-ti@yoctoproject.org
> Cc: Gou, Hongmei; Nelson, Sam; Stiffler, Jacob
> Subject: [PATCH] linux: ti-uio: remove KERNEL_DEVICETREE appends
>=20
> * KERNEL_DEVICETREE is now specified in the machine configuration and
>   these appends have already been added there.
>   - This removes the duplcitaion of these device trees in this list and
>     thus resolves the "duplicate node name" failure during the fitImage
>     creation.
> * Extend am57xx-evm dts injection to dra7xx family
>   - Now that KERNEL_DEVICETREE is specified in the machine
>     configuration, am57xx-hs-evm inherits this list from am57xx-evm.
>   - Extending these injectionsto the entire family allows these device
>     trees to be availble for am57xx-hs-evm as well.
>   - For dra7xx-evm and dra7xx-hs-evm, these device trees will not be
>     built as they are not included in their KERNEL_DEVICETREE list.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-kernel/linux/ti-uio.inc | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-ui=
o.inc
> index 13cf53e..3104f4e 100644
> --- a/recipes-kernel/linux/ti-uio.inc
> +++ b/recipes-kernel/linux/ti-uio.inc
> @@ -3,8 +3,8 @@ SRC_URI_append_k2hk =3D " file://k2hk-uio.dtsi"
>  SRC_URI_append_k2l-evm =3D " file://k2l-uio.dtsi"
>  SRC_URI_append_k2e =3D " file://k2e-uio.dtsi"
>  SRC_URI_append_k2g =3D " file://keystone-k2g-pru-uio.dtsi"
> -SRC_URI_append_am57xx-evm =3D " file://am572x-pru-uio.dtsi \
> -                              file://am571x-pru-uio.dtsi \
> +SRC_URI_append_dra7xx =3D " file://am572x-pru-uio.dtsi \
> +                          file://am571x-pru-uio.dtsi \
>  "
>  SRC_URI_append_ti33x =3D " file://am335x-pru-uio.dtsi"
>  SRC_URI_append_ti43x =3D " file://am437x-pru-uio.dtsi"
> @@ -15,11 +15,6 @@ DTSI_LIST_append_k2hk =3D " k2hk-uio.dtsi"
>  DTSI_LIST_append_k2l-evm =3D " k2l-uio.dtsi"
>  DTSI_LIST_append_k2e =3D " k2e-uio.dtsi"
>=20
> -KERNEL_DEVICETREE_append_am57xx-evm =3D
> "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am572x-idk-pru-
> excl-uio.dtb am571x-idk-pru-excl-uio.dtb", "", d)}"
> -KERNEL_DEVICETREE_append_ti33x =3D
> "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am335x-icev2-pru-
> excl-uio.dtb", "", d)}"
> -KERNEL_DEVICETREE_append_ti43x =3D
> "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am437x-idk-pru-
> excl-uio.dtb", "", d)}"
> -KERNEL_DEVICETREE_append_k2g =3D
> "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " keystone-k2g-ice-
> pru-excl-uio.dtb", "", d)}"
> -
>  do_setup_uio() {
>      if [ "${ENABLE_TI_UIO_DEVICES}" =3D=3D "1" ]
>      then
> @@ -35,7 +30,7 @@ do_setup_uio() {
>      fi
>  }
>=20
> -do_setup_uio_append_am57xx-evm() {
> +do_setup_uio_append_dra7xx() {
>=20
>      if [ "${ENABLE_TI_UIO_DEVICES}" =3D=3D "1" ]
>      then
> --
> 2.7.4


