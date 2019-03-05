Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D67FEE00DC9; Tue,  5 Mar 2019 11:33:33 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D124FE0048C
	for <meta-ti@yoctoproject.org>; Tue,  5 Mar 2019 11:33:32 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x25JXW42095532
	for <meta-ti@yoctoproject.org>; Tue, 5 Mar 2019 13:33:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551814412;
	bh=wpv0fnGm+L5Plp/Ody+WtBWdsNjy6QPYiwxeBv9KT1U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=T6tHgYE9aGZbavFP2faKLqtJO+GAa8iJzoA8ojn+C62Q6pG0bc6aYxzRh0hHOvAWE
	PNGYk1kiclUi0T8veANKxfVoeMU6kxcFMtKXrBPcSJP+E0yx5CvXkDum2Qsz+Cio+E
	NvXLOh0NxLqXeQwFpyIMW27VQF563RjFhPzoVh4I=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x25JXWtR039587
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 5 Mar 2019 13:33:32 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 5 Mar 2019 13:33:32 -0600
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1591.008; Tue, 5 Mar 2019 13:33:32 -0600
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko/master][PATCH] ti-cgt6x: Update to version 8.3.2
Thread-Index: AQHU0vWBzrv/kB2ZCEyhTk4ECfVziKX9baDQ
Date: Tue, 5 Mar 2019 19:33:31 +0000
Message-ID: <e7ca488d27814b0aa6207c4adf82bc43@ti.com>
References: <1551749965-9481-1-git-send-email-m-radhakrishnan2@ti.com>
	<1551749965-9481-2-git-send-email-m-radhakrishnan2@ti.com>
	<20190305014817.GV26081@beryl>
In-Reply-To: <20190305014817.GV26081@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.118.69]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH] ti-cgt6x: Update to version 8.3.2
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
X-List-Received-Date: Tue, 05 Mar 2019 19:33:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, March 4, 2019 8:48 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [rocko/master][PATCH] ti-cgt6x: Update to version 8.=
3.2

On Mon, Mar 04, 2019 at 08:39:25PM -0500, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  .../{ti-cgt6x_8.2.2.bb =3D> ti-cgt6x_8.3.2.bb}       | 28 +++++++-------=
--------
>  1 file changed, 8 insertions(+), 20 deletions(-)
>  rename recipes-ti/devtools/{ti-cgt6x_8.2.2.bb =3D> ti-cgt6x_8.3.2.bb} (7=
2%)
>=20
> diff --git a/recipes-ti/devtools/ti-cgt6x_8.2.2.bb b/recipes-ti/devtools/=
ti-cgt6x_8.3.2.bb
> similarity index 72%
> rename from recipes-ti/devtools/ti-cgt6x_8.2.2.bb
> rename to recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> index 53f5252..90106e5 100644
> --- a/recipes-ti/devtools/ti-cgt6x_8.2.2.bb
> +++ b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> @@ -2,8 +2,8 @@ DESCRIPTION =3D "TI DSP Code Generation Tools"
>  HOMEPAGE =3D "https://www-a.ti.com/downloads/sds_support/TICodegeneratio=
nTools/download.htm"
>  LICENSE =3D "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause=
 & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
> =20
> -LIC_FILES_CHKSUM =3D "file://ti-cgt-c6000_${PV}/C6000_8.2.x_CodeGenerati=
onTools_Manifest.htm;md5=3D66147c95fc5d3f900b73414f8258c91e"
> -LIC_FILES_CHKSUM_class-target =3D "file://usr/share/doc/ti/cgt-c6x/C6000=
_8.2.x_CodeGenerationTools_Manifest.htm;md5=3D66147c95fc5d3f900b73414f8258c=
91e"
> +LIC_FILES_CHKSUM =3D "file://ti-cgt-c6000_${PV}/C6000CodeGenerationTools=
_8.3.x_manifest.html;md5=3Dd06c6f9acebf78df4108a8535396e9f1"
> +LIC_FILES_CHKSUM_class-target =3D "file://usr/share/doc/ti/cgt-c6x/C6000=
CodeGenerationTools_8.3.x_manifest.html;md5=3Dd06c6f9acebf78df4108a8535396e=
9f1"

Please briefly mention reason for license checksum change in the commit log=
, I saw that "Patrick Powell (Public Domain)" which was present in both the=
se versions were not mentioned in the LIICENSE string.
When I tried to include "Patrick Powell" in the license string, it gives th=
e below warnings.  Is the Patrick Powell already included as "& PD"  ? Yoct=
o was not able to find Patrick Powell license.

While comparing the checksum files, it was found that there were manifest d=
ifferences.=20
WARNING: ti-cgt6x: LICENSE value "(TI-TSPA & Thai-Open-Source-Software-Cent=
er) & BSD-3-Clause & BSL-1.0 & Patrick Powell & AFL-3.0 & MIT & BSD-2-Claus=
e & PD" has an invalid format - license names must be separated by the foll=
owing characters to indicate the license selection: &|()
WARNING: ti-cgt6x-native: LICENSE value "(TI-TSPA & Thai-Open-Source-Softwa=
re-Center) & BSD-3-Clause & BSL-1.0 & Patrick Powell & AFL-3.0 & MIT & BSD-=
2-Clause & PD" has an invalid format - license names must be separated by t=
he following characters to indicate the license selection: &|()
WARNING: ti-cgt6x: LICENSE value "(TI-TSPA & Thai-Open-Source-Software-Cent=
er) & BSD-3-Clause & BSL-1.0 & Patrick Powell & AFL-3.0 & MIT & BSD-2-Claus=
e & PD" has an invalid format - license names must be separated by the foll=
owing characters to indicate the license selection: &|()
WARNING: ti-cgt6x-native: LICENSE value "(TI-TSPA & Thai-Open-Source-Softwa=
re-Center) & BSD-3-Clause & BSL-1.0 & Patrick Powell & AFL-3.0 & MIT & BSD-=
2-Clause & PD" has an invalid format - license names must be separated by t=
he following characters to indicate the license selection: &|()

>  PE =3D "1"
> =20
> @@ -37,11 +37,11 @@ BINFILE_NAME_class-target =3D "cgt6x_arm_installer"
> =20
>  SRC_URI =3D "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/$=
{PV}/${BINFILE};name=3D${BINFILE_NAME}"
> =20
> -SRC_URI[cgt6x_x86_installer.md5sum] =3D "548c841b231c2fbd954218d4e370c99=
5"
> -SRC_URI[cgt6x_x86_installer.sha256sum] =3D "f269e51eb29de2efd32b3ea93bee=
bd7b00a1a156c923be1a33ba7d785c4c6a24"
> +SRC_URI[cgt6x_x86_installer.md5sum] =3D "f1f534e6a4bdee6df39e8d0cb458d16=
1"
> +SRC_URI[cgt6x_x86_installer.sha256sum] =3D "1fba2a8f5532b33a23677771d686=
a866171ce7a0e567fed50d900d0ecd2e17e6"
> =20
> -SRC_URI[cgt6x_arm_installer.md5sum] =3D "56f5e5464ab87af517a6cdd5fed06f3=
f"
> -SRC_URI[cgt6x_arm_installer.sha256sum] =3D "4b2e605a4afc3d4d0ac74013ee32=
496541abf093aedd70bc7ef040597933b1ea"
> +SRC_URI[cgt6x_arm_installer.md5sum] =3D "425d82308e71202ad004a36b7ec3cec=
9"
> +SRC_URI[cgt6x_arm_installer.sha256sum] =3D "70c387ddde379194fed712087be6=
cb0ca5f4f0e65d7f29bd7462c38ee011928f"
> =20
>  do_install() {
>      install -d ${D}${bindir}
> @@ -54,10 +54,7 @@ do_install() {
>          install -m 755 ${binfile} ${D}${datadir}/ti/cgt-c6x/bin
>      done
> =20
> -    install -d ${D}${datadir}/ti/cgt-c6x/include
> -    for includefile in ${S}/ti-cgt-c6000_${PV}/include/*; do
> -        install -m 644 ${includefile} ${D}${datadir}/ti/cgt-c6x/include
> -    done
> +    cp -r  ${S}/ti-cgt-c6000_${PV}/include ${D}${datadir}/ti/cgt-c6x/inc=
lude=20

If not using install, please pass correct options to cp to avoid host=20
contamination warnings.


>      install -d ${D}${datadir}/ti/cgt-c6x/lib
>      for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.a; do
> @@ -72,11 +69,6 @@ do_install() {
>          install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
>      done
> =20
> -    install -d ${D}${datadir}/ti/cgt-c6x/lib/src
> -    for srcfile in ${S}/ti-cgt-c6000_${PV}/lib/src/*; do
> -        install -m 644 ${srcfile} ${D}${datadir}/ti/cgt-c6x/lib/src
> -    done
> -
>      install -d ${D}${datadir}/man/man1
>      for manfile in ${S}/ti-cgt-c6000_${PV}/man/man1/*; do
>          if [ -e ${manfile} ]; then
> @@ -89,7 +81,7 @@ do_install() {
>          install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
>      done
> =20
> -    for docfile in ${S}/ti-cgt-c6000_${PV}/*.htm; do
> +    for docfile in ${S}/ti-cgt-c6000_${PV}/*.html; do
>          install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
>      done
> =20
> @@ -97,10 +89,6 @@ do_install() {
>          install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
>      done
> =20
> -    for docfile in ${S}/ti-cgt-c6000_${PV}/doc/*; do
> -        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> -    done
> -
>  }
> =20
>  do_install_class-target() {
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

