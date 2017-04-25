Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D9BBE00AF8; Tue, 25 Apr 2017 16:39:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04BD1E00867
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 16:39:36 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3PNdaxo030747
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 18:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493163576;
	bh=sBXsvsZzkohzyjp8a+y07BJ9ew2k2BlbBGbrnlKQlKM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=BWWmCx6Oll0x4hmpJRSaaXlOefiB68sMAxiHdEZwixluzvxi1WHDHnYUaz6Mm1I+j
	p8VgMnNrYTyrcw7Z1HevwATuEKIk1SMcdF+qlWd380gH/fCnjf54jTCwdHcxKTOtmU
	vUN6Rsp8xFntcre6eqDqaNqm+2HRNFI8YDCTd6Ho=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3PNdaDW017940
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 18:39:36 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Tue, 25 Apr 2017 18:39:35 -0500
From: "Pang, Ivan" <i-pang@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>
Thread-Topic: [meta-ti] [morty v3 1/3] ti-cgt-arm: add recipe for 16.9.2
Thread-Index: AQHSvbbVd8yTrY0dgESAv5LbhH8uzaHXDRoA//+w5nA=
Date: Tue, 25 Apr 2017 23:39:35 +0000
Message-ID: <C45960711C772449A33A51ED1374F08A4060D136@DFLE08.ent.ti.com>
References: <1493119564-36769-1-git-send-email-a0393906@ti.com>
	<20170425231916.GT31608@edge>
In-Reply-To: <20170425231916.GT31608@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [morty v3 1/3] ti-cgt-arm: add recipe for 16.9.2
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
X-List-Received-Date: Tue, 25 Apr 2017 23:39:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Karthik, Denys,

>> +PV =3D "16.9.2"
 > Would it be better to have this in the recipe filename? I'm not sure if =
there is a preference.

Sorry, I haven't kept up with the patch mails. There was a specific reason =
I moved the PV out of the filename and into the .inc file - I had multiple =
recipes in RTOS that would need to align with this PV (see ti-cgt-arm-linux=
.bb and ti-cgt-arm-windows.bb). This would let us update only the .inc file=
 whenever we want to bump up the version.

Ivan

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Dmytriyenko, Denys
Sent: Tuesday, April 25, 2017 6:19 PM
To: R, Karthik
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [morty v3 1/3] ti-cgt-arm: add recipe for 16.9.2

Karthik,

This looks much better!

I would have said there's no reason to split it into a recipe and .inc anym=
ore, but we'll probably also need a -nativesdk recipe, so keeping .inc for =
now.

There are couple cosmetic nitpicks - there's no space between SUMMARY and =
=3D sign; and BINFILE variable is defined twice. I'll fix those on merge th=
ough.

--
Denys


On Tue, Apr 25, 2017 at 04:56:02PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb |  8 ++++++
>  recipes-ti/devtools/ti-cgt-arm.inc              | 35 +++++++++++++++++++=
++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
>  create mode 100644 recipes-ti/devtools/ti-cgt-arm.inc
>=20
> diff --git a/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb b/recipes-ti=
/devtools/ti-cgt-arm-native_16.9.2.bb
> new file mode 100644
> index 0000000..c4fc7f0
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
> @@ -0,0 +1,8 @@
> +include ti-cgt-arm.inc
> +
> +LIC_FILES_CHKSUM =3D "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=3Dc32ea=
dd03472353c042a8a7c4568438b"
> +
> +BINFILE_MD5 =3D "7b73e51e9548a4a0bf3923a336b1a974"
> +BINFILE_SHA256 =3D "d1a5c255319088be7d75b3fce1b16a2e3d60c75023db7dad16ca=
b6d4d3425d06"
> +
> +PR_append =3D "r2"
> diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-=
cgt-arm.inc
> new file mode 100644
> index 0000000..8cc1ca4
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt-arm.inc
> @@ -0,0 +1,35 @@
> +SUMMARY=3D "TI ARM Code Generation Tools"
> +HOMEPAGE =3D "https://www-a.ti.com/downloads/sds_support/TICodegeneratio=
nTools/download.htm"
> +LICENSE =3D "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause=
 & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-Cl=
ause"
> +
> +inherit native
> +require recipes-ti/includes/ti-unpack.inc
> +require recipes-ti/includes/ti-staging.inc
> +require recipes-ti/includes/ti-paths.inc
> +
> +S =3D "${WORKDIR}/ti-cgt-arm-${PV}"
> +
> +SRC_URI =3D "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/=
${PV}.LTS/${BINFILE};name=3D${BINFILE_NAME}"
> +
> +BINFILE =3D "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
> +TI_BIN_UNPK_ARGS =3D "--prefix ${S}"
> +TI_BIN_UNPK_CMDS =3D ""
> +
> +do_install() {
> +    install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
> +    cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
> +}
> +
> +SRC_URI[cgt_arm_installer.md5sum] =3D "${BINFILE_MD5}"
> +SRC_URI[cgt_arm_installer.sha256sum] =3D "${BINFILE_SHA256}"
> +
> +BINFILE_NAME =3D "cgt_arm_installer"
> +BINFILE =3D "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
> +
> +FILES_${PN} +=3D "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
> +
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +INHIBIT_SYSROOT_STRIP =3D "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +
> +INSANE_SKIP_${PN} +=3D "arch staticdev"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
--=20
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

