Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 821A6E00712; Mon, 23 Feb 2015 07:42:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F88EE006E9
	for <meta-ti@yoctoproject.org>; Mon, 23 Feb 2015 07:42:55 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1NFgs7q018163
	for <meta-ti@yoctoproject.org>; Mon, 23 Feb 2015 09:42:54 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1NFgrrq025151
	for <meta-ti@yoctoproject.org>; Mon, 23 Feb 2015 09:42:53 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Mon, 23 Feb 2015 09:42:52 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v2 2/2] ti-cgt6x: Add verion 8.0.0
Thread-Index: AQHQQVhpM2tek0+7YUuikvYUpXZn4Jz6Rk0AgAQzUAA=
Date: Mon, 23 Feb 2015 15:42:52 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958140ECE28@DFLE09.ent.ti.com>
References: <1423150109-9436-1-git-send-email-j-stiffler@ti.com>
	<1423150109-9436-2-git-send-email-j-stiffler@ti.com>
	<20150220172522.GJ31287@edge>
In-Reply-To: <20150220172522.GJ31287@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2 2/2] ti-cgt6x: Add verion 8.0.0
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
X-List-Received-Date: Mon, 23 Feb 2015 15:42:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is the license string given by the OSRB. I will submit a v3 replacing =
'and' with '&'.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, February 20, 2015 12:25 PM
To: Stiffler, Jacob
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2 2/2] ti-cgt6x: Add verion 8.0.0

On Thu, Feb 05, 2015 at 10:28:29AM -0500, Jacob Stiffler wrote:
> * Supports native and nativesdk classes as well as target.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-ti/devtools/ti-cgt6x_8.0.0.bb |   88 +++++++++++++++++++++++++++=
++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 recipes-ti/devtools/ti-cgt6x_8.0.0.bb
>=20
> diff --git a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb=20
> b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
> new file mode 100644
> index 0000000..c56a629
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
> @@ -0,0 +1,88 @@
> +DESCRIPTION =3D "TI DSP Code Generation Tools"
> +HOMEPAGE =3D "https://www-a.ti.com/downloads/sds_support/TICodegeneratio=
nTools/download.htm"
> +LICENSE =3D "TI TSPA with portions under Thai Open Source Software Cente=
r & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 and MIT and BSD-2-Cl=
ause and Public Domain and other similar"

^^^ This is a very strange license. Have you consulted with OSRB? Should "a=
nd"=20
be replaced with "&" at the end?


> +
> +LIC_FILES_CHKSUM =3D "file://ti-cgt-c6000_${PV}/LICENSE.txt;md5=3Db63119=
62635a4f15630e36ec2d875eca"
> +LIC_FILES_CHKSUM_class-target =3D "file://usr/share/doc/ti/cgt-c6x/LICEN=
SE.txt;md5=3Db6311962635a4f15630e36ec2d875eca"
> +
> +PE =3D "1"
> +
> +require ../includes/ti-unpack.inc
> +
> +BINFILE =3D "ti_cgt_c6000_${PV}_linux_installer_x86.bin"
> +BINFILE_NAME =3D "cgt6x_x86_installer"
> +TI_BIN_UNPK_ARGS =3D "--prefix ${S}"
> +TI_BIN_UNPK_CMDS =3D ""
> +
> +BINFILE_class-target =3D "ti_cgt_c6000_${PV}_armlinuxa8hf_busybox_instal=
ler.sh"
> +BINFILE_NAME_class-target =3D "cgt6x_arm_installer"

Now, since target portion is very ARM specific, would be nice to add this:

COMPATIBLE_HOST_class-target =3D "arm.*-linux"

Also, you may want to copy the anonymous function that checks for hardfp fr=
om libgles recipes. You might want to modify it to only check the target ca=
se though, to not block native and nativesdk cases... Let me know if you ha=
ve any issues here.


> +SRC_URI =3D "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/P=
roduction/${PV}/${BINFILE};name=3D${BINFILE_NAME}"
> +
> +SRC_URI[cgt6x_x86_installer.md5sum] =3D "ff83845672090bf0a669bba7b0cadf5=
6"
> +SRC_URI[cgt6x_x86_installer.sha256sum] =3D "297f77a00b211b3c4afa23afe731=
9e98b2400b5d2eb0f8c8cfe3ef7d7aa4d709"
> +
> +SRC_URI[cgt6x_arm_installer.md5sum] =3D "13961e5a1da4c310ea8c8707ab981ff=
f"
> +SRC_URI[cgt6x_arm_installer.sha256sum] =3D "cb24ae05baffbd44d6dedba68743=
be09fd883e04403e069c437c486533d8fffb"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    for binfile in ${S}/ti-cgt-c6000_${PV}/bin/*; do
> +        install -m 755 ${binfile} ${D}${bindir}
> +    done
> +
> +    install -d ${D}${datadir}/ti/cgt-c6x/include
> +    for includefile in ${S}/ti-cgt-c6000_${PV}/include/*; do
> +        install -m 644 ${includefile} ${D}${datadir}/ti/cgt-c6x/include
> +    done
> +
> +    install -d ${D}${datadir}/ti/cgt-c6x/lib
> +    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.a; do
> +        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
> +    done
> +
> +    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.cmd; do
> +        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
> +    done
> +
> +    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.lib; do
> +        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
> +    done
> +
> +    install -d ${D}${datadir}/ti/cgt-c6x/lib/src
> +    for srcfile in ${S}/ti-cgt-c6000_${PV}/lib/src/*; do
> +        install -m 644 ${srcfile} ${D}${datadir}/ti/cgt-c6x/lib/src
> +    done
> +
> +    install -d ${D}${datadir}/man/man1
> +    for manfile in ${S}/ti-cgt-c6000_${PV}/man/man1/*; do
> +        install -m 644 ${manfile} ${D}${datadir}/man/man1
> +    done
> +
> +    install -d ${D}${datadir}/doc/ti/cgt-c6x
> +    for docfile in ${S}/ti-cgt-c6000_${PV}/*.txt; do
> +        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> +    done
> +
> +    for docfile in ${S}/ti-cgt-c6000_${PV}/*.htm; do
> +        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> +    done
> +
> +    for docfile in ${S}/ti-cgt-c6000_${PV}/*.spdx; do
> +        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> +    done
> +
> +    for docfile in ${S}/ti-cgt-c6000_${PV}/doc/*; do
> +        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> +    done
> +
> +}
> +
> +do_install_class-target() {
> +    ${WORKDIR}/${BINFILE} --prefix ${D} }
> +
> +FILES_${PN} +=3D "${datadir}/ti/*"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

