Return-Path: <jbergsagel@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EEDC8E00EF0; Fri,  2 Aug 2019 12:42:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01F89E00ED6
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 12:42:30 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72JgU9i118888
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 14:42:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564774950;
	bh=CZZ+ZcD8xXvQFi6oTFC02vR/uptOWTnieXoOcM12PYA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=MSKjzyR7G8hGBr64ltDQjlU1BtU26sayQVXsm/+ZTGzGdWbbxTUCwHngQHKYEHCUV
	NZLthluCKwNBI0liNRk95RONLrPmgeyW+hyix+NTOg32UXZaX0RpsqQ/tGqpOFQ7Mx
	d4f5nv5Fpn1KNwRuHqnx9mUTzq2+Be3RR4d0pIao=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72JgUqb084799
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 14:42:30 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 14:42:30 -0500
Received: from DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12]) by
	DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12%17]) with mapi id
	15.01.1713.004; Fri, 2 Aug 2019 14:42:30 -0500
From: "Bergsagel, Jonathan" <jbergsagel@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [PATCH] ipc-lld: add AM65xx IPC echo_test firmware binaries
Thread-Index: AQHVSVjfNKoTpe/irkeld3p/r15eg6boeQoA///I3LA=
Date: Fri, 2 Aug 2019 19:42:30 +0000
Message-ID: <3d7c8515c6ed409a8423a5e3572420d1@ti.com>
References: <20190802173446.23892-1-jbergsagel@ti.com>
	<20190802175858.GR20944@beryl>
In-Reply-To: <20190802175858.GR20944@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.77.105]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Anna,
	Suman" <s-anna@ti.com>
Subject: Re: [PATCH] ipc-lld: add AM65xx IPC echo_test firmware binaries
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
X-List-Received-Date: Fri, 02 Aug 2019 19:42:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Ok, sure.  I'll take a look and then post a new version of the patch that c=
ombines the handling of the two platforms into a single file.

Thanks,
Jonathan


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, August 02, 2019 12:59 PM
To: Bergsagel, Jonathan
Cc: meta-ti@yoctoproject.org; Anna, Suman
Subject: Re: [PATCH] ipc-lld: add AM65xx IPC echo_test firmware binaries

Jonathan,

Can you combine the recipes? Instead of adding new ipc-lld-fw-am65x, you ca=
n=20
re-use existing J7 ipc-lld-fw. Especially since they both pull binaries fro=
m=20
the same repo and the same SRCREV.

You can install and deploy only binaries needed for the platform - see PRU =
FW=20
recipe for example how to do that:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/pru/pru-=
icss_git.bb

--=20
Denys


On Fri, Aug 02, 2019 at 12:34:46PM -0500, Jonathan Bergsagel wrote:
> Use IPC/LLD based IPC echo test firmware for AM65xx
> Linux IPC testing.
> Updated location of J721E firmware binaries as well,
> with latest IPC/LLD commit.
>=20
> Signed-off-by: Jonathan Bergsagel <jbergsagel@ti.com>
> ---
>  recipes-bsp/ipc-lld/ipc-lld-fw-am65x_git.bb | 68 +++++++++++++++++++++
>  recipes-bsp/ipc-lld/ipc-lld-fw_git.bb       |  6 +-
>  2 files changed, 72 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-bsp/ipc-lld/ipc-lld-fw-am65x_git.bb
>=20
> diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw-am65x_git.bb b/recipes-bsp/ip=
c-lld/ipc-lld-fw-am65x_git.bb
> new file mode 100644
> index 000000000000..afe3ce240816
> --- /dev/null
> +++ b/recipes-bsp/ipc-lld/ipc-lld-fw-am65x_git.bb
> @@ -0,0 +1,68 @@
> +SUMMARY =3D "AM65x R5 IPC Echo Test Firmware Binaries"
> +
> +LICENSE =3D "TI-TFL"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7eae093f2b09fd39307f30028a068=
b91"
> +
> +inherit deploy
> +inherit update-alternatives
> +
> +COMPATIBLE_MACHINE =3D "am65xx"
> +
> +PV =3D "1.0-git${SRCPV}"
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +PROTOCOL =3D "git"
> +BRANCH =3D "master"
> +SRCREV =3D "81392da08fab2b5cfc23d63dbe71b7244a6af477"
> +
> +SRC_URI =3D "git://git.ti.com/keystone-rtos/ipc-lld.git;protocol=3D${PRO=
TOCOL};branch=3D${BRANCH}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +R5_FW_DIR =3D "${S}/examples/echo_test/binaries/am65xx"
> +
> +# make sure that lib/firmware, and all its contents are part of the pack=
age
> +FILES_${PN} +=3D "${base_libdir}/firmware"
> +
> +# install the R5 ipc echo test binaries in lib/firmware/pdk-ipc, with so=
ftlinks up a level
> +do_install() {
> +  install -d ${D}${base_libdir}/firmware/pdk-ipc
> +  install -m 0644 ${R5_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${D}${=
base_libdir}/firmware/pdk-ipc/
> +  install -m 0644 ${R5_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f =
${D}${base_libdir}/firmware/pdk-ipc/
> +  install -m 0644 ${R5_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${D}${=
base_libdir}/firmware/pdk-ipc/
> +  install -m 0644 ${R5_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f =
${D}${base_libdir}/firmware/pdk-ipc/
> +}
> +
> +TARGET_MCU_R5FSS0_0 =3D "am65x-mcu-r5f0_0-fw"
> +TARGET_MCU_R5FSS0_1 =3D "am65x-mcu-r5f0_1-fw"
> +ALTERNATIVE_${PN} =3D "\
> +                    am65x-mcu-r5f0_0-fw \
> +                    am65x-mcu-r5f0_1-fw \
> +                    "
> +ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/=
${TARGET_MCU_R5FSS0_0}"
> +ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/=
${TARGET_MCU_R5FSS0_1}"
> +ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_mcu1_0_release.strip.xer5f"
> +ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_mcu1_1_release.strip.xer5f"
> +
> +ALTERNATIVE_PRIORITY =3D "10"
> +
> +# copy the executables into the deploy directory
> +do_deploy () {
> +  install ${R5_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
> +  install ${R5_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${DEPLOY=
DIR}/
> +  install ${R5_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
> +  install ${R5_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${DEPLOY=
DIR}/
> +}
> +addtask deploy after do_install before do_build
> +
> +# This is used to prevent the build system to strip the executables
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +INHIBIT_SYSROOT_STRIP =3D "1"
> +# This is used to prevent the build system to split the debug info in a =
separate file
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +# As it likely to be a different arch from the Yocto build, disable chec=
king by adding "arch" to INSANE_SKIP
> +INSANE_SKIP_${PN} +=3D "arch"
> +
> +# we don't want to configure and build the source code
> +do_compile[noexec] =3D "1"
> +do_configure[noexec] =3D "1"
> diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb b/recipes-bsp/ipc-lld/=
ipc-lld-fw_git.bb
> index f8157d8c6e5b..82cc11186aac 100644
> --- a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
> +++ b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
> @@ -6,18 +6,20 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7eae093f2b09=
fd39307f30028a068b91"
>  inherit deploy
>  inherit update-alternatives
> =20
> +COMPATIBLE_MACHINE =3D "j7-evm"
> +
>  PV =3D "1.0-git${SRCPV}"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
>  PROTOCOL =3D "git"
>  BRANCH =3D "master"
> -SRCREV =3D "66764a5f063db606ea9db23380694bfd7d4aeafb"
> +SRCREV =3D "81392da08fab2b5cfc23d63dbe71b7244a6af477"
> =20
>  SRC_URI =3D "git://git.ti.com/keystone-rtos/ipc-lld.git;protocol=3D${PRO=
TOCOL};branch=3D${BRANCH}"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -R5_DSP_FW_DIR =3D "${S}/examples/echo_test/binaries"
> +R5_DSP_FW_DIR =3D "${S}/examples/echo_test/binaries/j721e"
> =20
>  # make sure that lib/firmware, and all its contents are part of the pack=
age
>  FILES_${PN} +=3D "${base_libdir}/firmware"
> --=20
> 2.17.1
>=20

