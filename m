Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCABAC63705
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 19:52:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.26573.1670442745449640342
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 11:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2EEF540C2E;
	Wed,  7 Dec 2022 19:52:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtbj4TCGWcBa; Wed,  7 Dec 2022 19:52:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E298340A03;
	Wed,  7 Dec 2022 19:52:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D12541636A8; Wed,  7 Dec 2022 14:52:09 -0500 (EST)
Date: Wed, 7 Dec 2022 14:52:09 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Paresh Bhagat <p-bhagat@ti.com>
Cc: meta-ti@lists.yoctoproject.org, praneeth@ti.com, reatmon@ti.com,
	g-gupta@ti.com, s-adivi@ti.com
Subject: Re: [meta-ti][dunfell][PATCH] machine: Add am62axx evm
 configuration
Message-ID: <20221207195209.GA22689@denix.org>
References: <20221206094651.11172-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20221206094651.11172-1-p-bhagat@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Dec 2022 19:52:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15421

On Tue, Dec 06, 2022 at 03:16:51PM +0530, Paresh Bhagat wrote:
> From: "Bhagat, Paresh" <p-bhagat@ti.com>
>=20
> Lets add the basic AM62Axx-evm configuration.
> - Add configurations.
> - Add firmware overrides.
> - Add u-boot overrides.
> - Add tifs-lpm-stub.
> - Add cnm-wave-fw.
>=20
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  conf/machine/am62axx-evm-k3r5.conf            | 11 ++++++++
>  conf/machine/am62axx-evm.conf                 | 11 ++++++++
>  conf/machine/include/am62axx.inc              | 16 +++++++++++
>  recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb    |  5 +++-
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  1 +
>  .../tifs-lpm-stub/tifs-lpm-stub_git.bb        |  2 +-
>  recipes-bsp/u-boot/u-boot-ti.inc              |  1 +
>  recipes-kernel/linux/kernel-rdepends.inc      |  2 ++
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 27 +++++++++++++++++++
>  9 files changed, 74 insertions(+), 2 deletions(-)
>  create mode 100644 conf/machine/am62axx-evm-k3r5.conf
>  create mode 100644 conf/machine/am62axx-evm.conf
>  create mode 100644 conf/machine/include/am62axx.inc

...

> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti=
-rtos-bin/ti-rtos-firmware.bb
> index 31212aae..24a904f0 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -24,6 +24,7 @@ PLAT_SFX_j784s4-hs-evm =3D "j784s4"
>  PLAT_SFX_am65xx =3D "am65xx"
>  PLAT_SFX_am64xx =3D "am64xx"
>  PLAT_SFX_am62xx =3D "am62xx"
> +PLAT_SFX_am62axx =3D "am62axx"
> =20
>  FILESEXTRAPATHS_prepend :=3D "${METATIBASE}/recipes-bsp/ti-sci-fw/file=
s/:"
>  require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -354,6 +355,13 @@ do_install_am62xx() {
>      install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_st=
rip.xer5f ${LEGACY_DM_FW_DIR}
>  }
> =20
> +do_install_am62axx() {
> +    install -d ${LEGACY_IPC_FW_DIR}
> +    # DM+IPC Firmware
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/am62a-mcu-r5f0_0-fw ${LEGACY_IP=
C_FW_DIR}
> +    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_st=
rip.xer5f ${LEGACY_DM_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_str=
ip.xe71 ${LEGACY_IPC_FW_DIR}
> +}
> =20
>  do_deploy() {
>      install -d ${DEPLOYDIR}
> @@ -364,6 +372,11 @@ do_deploy_am62xx() {
>      install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_st=
rip.xer5f ${DEPLOYDIR}
>  }
> =20
> +do_deploy_am62axx() {
> +    install -d ${DEPLOYDIR}
> +    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_st=
rip.xer5f ${DEPLOYDIR}
> +}
> +
>  # Set up names for the firmwares
>  ALTERNATIVE_${PN}_am65xx =3D "\
>                      am65x-mcu-r5f0_0-fw \
> @@ -382,6 +395,11 @@ ALTERNATIVE_${PN}_am62xx =3D "\
>                      am62-main-r5f0_0-fw \
>                      "
> =20
> +ALTERNATIVE_${PN}_am62axx =3D "\
> +    =A6   =A6   =A6   =A6   am62a-mcu-r5f0_0-fw \
> +    =A6   =A6   =A6   =A6   am62a-c71_0-fw \
> +    =A6   =A6   =A6   =A6   "

^^^ What are these "=A6 =A6 =A6 =A6" characters doing here?


> +
>  ALTERNATIVE_${PN}_j7-hs-evm =3D "\
>                      j7-mcu-r5f0_0-fw \
>                      j7-mcu-r5f0_1-fw \
> @@ -514,6 +532,9 @@ TARGET_MCU_M4FSS0_0_am64xx =3D "am64-mcu-m4f0_0-fw"
>  TARGET_MAIN_R5FSS0_0_am62xx =3D "am62-main-r5f0_0-fw"
>  TARGET_MCU_M4FSS0_0_am62xx =3D "am62-mcu-m4f0_0-fw"
> =20
> +TARGET_C7X_0_am62axx-evm =3D "am62a-c71_0-fw"
> +TARGET_MCU_R5F0_0_am62axx-evm =3D "am62a-mcu-r5f0_0-fw"
> +
>  TARGET_MCU_R5FSS0_0_j7 =3D "j7-mcu-r5f0_0-fw"
>  TARGET_MCU_R5FSS0_1_j7 =3D "j7-mcu-r5f0_1-fw"
>  TARGET_MAIN_R5FSS0_0_j7 =3D "j7-main-r5f0_0-fw"
> @@ -619,6 +640,9 @@ ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] =3D "${ba=
se_libdir}/firmware/${TARGET_MC
>  ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw] =3D "${base_libdir}/firmwar=
e/${TARGET_MAIN_R5FSS0_0}"
>  ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] =3D "${base_libdir}/firmware=
/${TARGET_MCU_M4FSS0_0}"
> =20
> +ALTERNATIVE_LINK_NAME[am62a-c71_0-fw] =3D "${base_libdir}/firmware/${T=
ARGET_C7X_0}"
> +ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw] =3D "${base_libdir}/firmwar=
e/${TARGET_MCU_R5F0_0}"
> +
>  ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/$=
{TARGET_MCU_R5FSS0_0}"
>  ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/$=
{TARGET_MCU_R5FSS0_1}"
>  ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] =3D "${base_libdir}/firmware/=
${TARGET_MAIN_R5FSS0_0}"
> @@ -699,6 +723,9 @@ ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] =3D "${base_=
libdir}/firmware/pdk-ipc/ipc_ec
>  ALTERNATIVE_TARGET[am62-main-r5f0_0-fw] =3D "${base_libdir}/firmware/p=
dk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] =3D "${base_libdir}/firmware/pd=
k-ipc/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f"
> =20
> +ALTERNATIVE_TARGET[am62a-c71_0-fw] =3D "${base_libdir}/firmware/pdk-ip=
c/ipc_echo_test_c7x_1_release_strip.xe71"
> +ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/p=
dk-ipc/am62a-mcu-r5f0_0-fw"
> +
>  ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/pdk-=
ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/pdk-=
ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
>  ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] =3D "${base_libdir}/firmware/eth=
fw/app_remoteswitchcfg_server_strip.xer5f"
> --=20
> 2.17.1
>=20

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

