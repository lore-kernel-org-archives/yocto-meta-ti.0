Return-Path: <sjha@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FB77E00D4F; Tue, 15 Oct 2019 05:12:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B45A8E00D00
	for <meta-ti@yoctoproject.org>; Tue, 15 Oct 2019 05:12:48 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9FCCmE1129915
	for <meta-ti@yoctoproject.org>; Tue, 15 Oct 2019 07:12:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571141568;
	bh=1qdyru9L24u75dNEI+8Qm7YkLgUg/B3L4ZJcbccJBnE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=I8KGA2E1b7c33dG0hbbVjE5ycVeBJDHt8fSPNQjd0QCmDxXEKqopfeT+LMJ/pFsU0
	cjgUSanW6JbitlQ2nLD7nJnS0QYQGLBzwBzY/q5GGrsaXTaRhdiRrJLEMfeOmdLeYc
	0ighOmHoX3qy0J8qKzp2skBnEDnYj9cJPmDsOJnA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9FCClYr089383
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 15 Oct 2019 07:12:47 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 15 Oct 2019 07:12:41 -0500
Received: from DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334]) by
	DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334%17]) with mapi id
	15.01.1713.004; Tue, 15 Oct 2019 07:12:41 -0500
From: "Jha, Santosh" <sjha@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [thud/master][PATCH 1] ipc-lld: inherit
	update-alternatives for softlink
Thread-Index: AQHVgwblav3rMHJbjkO8BvA2mLbCeKdbnFhA
Date: Tue, 15 Oct 2019 12:12:41 +0000
Message-ID: <f26c7a7a0eda411e994f65a9f1d02dea@ti.com>
References: <20191011180215.4082-1-sjha@ti.com> <20191015031617.GJ14271@beryl>
In-Reply-To: <20191015031617.GJ14271@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.219.51.67]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [thud/master][PATCH 1] ipc-lld: inherit update-alternatives for softlink
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
X-List-Received-Date: Tue, 15 Oct 2019 12:12:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Please see me response below.

Thanks & Best Regards,
Santosh

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, October 14, 2019 10:16 PM
To: Jha, Santosh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [thud/master][PATCH 1] ipc-lld: inherit update-alter=
natives for softlink

On Fri, Oct 11, 2019 at 01:02:15PM -0500, Santosh Jha wrote:
> - Fixed softlink  - inherit update-alternatives
> - Added alli-bios binaries in install

What is alli-bios?
[SJ] Typo, it should be all-bios. I will fix it this morning.


> ---

What version is this? It says [PATCH 1], which should be v2, v3, etc.
[SJ] v3, let me fix the typo first.


BTW, what's "allrtos" package down there?
[SJ] this package contains binaries - A72 running Bios, and corresponding r=
emote binaries for all cores. Default example (ipc-echo-test) - A72 running=
 Linux, and corresponding remote cores.

> Changes:
>  - Removed 'inherit deploy'
>  - Updated Commit message
>  - Removed deploy appends
> ---
>=20
> Signed-off-by: Santosh Jha <sjha@ti.com>
>=20
> Signed-off-by: Santosh Jha <sjha@ti.com>
> ---
>  .../ipc-lld/ipc-lld-examples-rtos_git.bb      | 45 +++++++------------
>  recipes-bsp/ipc-lld/ipc-lld.inc               |  2 +-
>  2 files changed, 17 insertions(+), 30 deletions(-)
>=20
> diff --git a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb b/recipes-b=
sp/ipc-lld/ipc-lld-examples-rtos_git.bb
> index 75db2162..e4e8f09f 100644
> --- a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
> +++ b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
> @@ -2,11 +2,16 @@ SUMMARY =3D "echo_test for IPC-LLD"
> =20
>  require ipc-lld.inc
> =20
> +inherit update-alternatives
> +
>  DEPENDS +=3D " ipc-lld-rtos common-csl-ip-rtos sciclient-rtos board-rtos=
"
> =20
> -REMOTE_FW_DIR =3D "${S}/examples/echo_test/yocto_bin"
> +REMOTE_FW_DIR =3D "${S}/examples/yocto_bin"
>  REMOTE_FW_BIN_DIR =3D "${REMOTE_FW_DIR}/ipc_echo_test/bin"
>  REMOTE_FWB_BIN_DIR =3D "${REMOTE_FW_DIR}/ipc_echo_testb/bin"
> +RTOS_ALL_CORES_BIN_DIR =3D "${REMOTE_FW_DIR}/ex02_bios_multicore_echo_te=
st/bin"
> +RTOS_2_CORES_BIN_DIR =3D "${REMOTE_FW_DIR}/ex01_bios_2core_echo_test/bin=
"
> +LINUX_2_CORES_BIN_DIR =3D "${REMOTE_FW_DIR}/ex03_linux_bios_2core_echo_t=
est/bin"
> =20
>  DST_BIN_PATH =3D "${base_libdir}/firmware/pdk-ipc"
> =20
> @@ -116,37 +121,19 @@ ALTERNATIVE_TARGET[j7-c71_0-fw] =3D "${base_libdir}=
/firmware/pdk-ipc/ipc_echo_test
> =20
>  ALTERNATIVE_PRIORITY =3D "10"
> =20
> -# copy the executables into the deploy directory
> -
> -do_deploy() {
> -    :
> -}
> -
> -do_deploy_am65xx() {
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DE=
PLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DE=
PLOYDIR}/
> -}
> +#add source and all rtos binaries package
> +PACKAGES =3D+ "${PN}-src"
> +PACKAGES =3D+ "${PN}-allrtos"
> =20
> -do_deploy_j7-evm() {
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DE=
PLOYDIR}/
> -    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${=
DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DE=
PLOYDIR}/
> -    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu1_1_release.xer5f ${=
DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${DE=
PLOYDIR}/
> -    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu2_0_release.xer5f ${=
DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${DE=
PLOYDIR}/
> -    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu2_1_release.xer5f ${=
DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${DE=
PLOYDIR}/
> -    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu3_0_release.xer5f ${=
DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${DE=
PLOYDIR}/
> -    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu3_1_release.xer5f ${=
DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 ${=
DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 ${=
DEPLOYDIR}/
> -    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_c7x_1_release.xe71 ${DEPL=
OYDIR}/
> -}
>  # make sure that lib/firmware, and all its contents are part of the pack=
age
>  FILES_${PN} +=3D "${base_libdir}/firmware"
> -FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
> +FILES_${PN}-src +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
> +FILES_${PN}-allrtos_append_am65xx +=3D "${RTOS_ALL_CORES_BIN_DIR}/am65xx=
_evm"
> +FILES_${PN}-allrtos_append_j7-evm +=3D "${RTOS_ALL_CORES_BIN_DIR}/j721e_=
evm"
> +FILES_${PN}-allrtos_append_am65xx +=3D "${RTOS_2_CORES_BIN_DIR}/am65xx_e=
vm"
> +FILES_${PN}-allrtos_append_j7-evm +=3D "${RTOS_2_CORES_BIN_DIR}/j721e_ev=
m"
> +FILES_${PN}-allrtos_append_am65xx +=3D "${LINUX_2_CORES_BIN_DIR}/am65xx_=
evm"
> +FILES_${PN}-allrtos_append_j7-evm +=3D "${LINUX_2_CORES_BIN_DIR}/j721e_e=
vm"
> =20
>  INSANE_SKIP_${PN} =3D "arch ldflags file-rdeps"
> =20
> diff --git a/recipes-bsp/ipc-lld/ipc-lld.inc b/recipes-bsp/ipc-lld/ipc-ll=
d.inc
> index 06683a06..243678f4 100644
> --- a/recipes-bsp/ipc-lld/ipc-lld.inc
> +++ b/recipes-bsp/ipc-lld/ipc-lld.inc
> @@ -18,7 +18,7 @@ SRC_URI =3D "${IPCLLD_GIT_URI};protocol=3D${IPCLLD_GIT_=
PROTOCOL};branch=3D${BRANCH}"
> =20
>  SRCREV =3D "${IPCLLD_SRCREV}"
>  PV =3D "01.00.00.00"
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE =3D "0"
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

