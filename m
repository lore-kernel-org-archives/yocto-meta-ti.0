Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D5DECAAA1
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 08:50:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.5343.1662972636107675042
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 01:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mo2qEU7V;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28C8oVBL103490;
	Mon, 12 Sep 2022 03:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662972631;
	bh=n8BoWar149x9YlCVi9B4OvWSaw1L7Mtk37RFKzX6CpI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=mo2qEU7VSH48kk2bnauTrEe22GUZu4C2DarBVlgAaLWvOSQSDUFCleQwXcI5c7oL7
	 jk7yRAqIJfqisSamOqOqxvXGJw+9Gkvo8Tt9//jMuAkH5OuFdTIoPb4ZCVykZvs8Wy
	 vpBMAXU7Nh/z88smy9aPhm3sg+pVICpvYQfIsrVA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28C8oVXZ094491
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Sep 2022 03:50:31 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 12
 Sep 2022 03:50:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 12 Sep 2022 03:50:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28C8oUlH109033;
	Mon, 12 Sep 2022 03:50:30 -0500
Date: Mon, 12 Sep 2022 14:20:29 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Andrew Davis <afd@ti.com>,
        Nishanth
 Menon <nm@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH 1/3] ti-rtos-firmware: j721e-hs-evm:
 add secure firmware images
Message-ID: <20220912085029.hx5yxbyz2omi5e7e@ula0497581>
References: <20220909055055.38394-1-m-chawdhry@ti.com>
 <20220909055055.38394-2-m-chawdhry@ti.com>
 <20220910232229.GP18429@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220910232229.GP18429@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 08:50:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15019

On 19:22-20220910, Denys Dmytriyenko wrote:
> On Fri, Sep 09, 2022 at 11:20:53AM +0530, Manorit Chawdhry via lists.yoctoproject.org wrote:
> > Adds support for secure firmware images in J721E HS EVM.
> > 
> > Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> > ---
> >  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 80 +++++++++++++++++++++-
> >  1 file changed, 79 insertions(+), 1 deletion(-)
> > 
> > diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> > index 19ea93f1..78faeae3 100644
> > --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> > +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> > @@ -14,6 +14,7 @@ inherit update-alternatives
> >  
> >  PLAT_SFX = ""
> >  PLAT_SFX_j7 = "j721e"
> > +PLAT_SFX_j7-hs-evm = "j721e"
> 
> In dunfell j7 above already covers j7-hs-evm
> 
> 

Okay, will remove this.

> >  PLAT_SFX_j7200-evm = "j7200"
> >  PLAT_SFX_j7200-hs-evm = "j7200"
> >  PLAT_SFX_j721s2-evm = "j721s2"
> > @@ -31,7 +32,7 @@ PV = "${CORESDK_RTOS_VERSION}"
> >  CLEANBROKEN = "1"
> >  PR = "${INC_PR}.0"
> >  
> > -# Secure Build 
> > +# Secure Build
> >  DEPENDS += "openssl-native"
> >  
> >  FILES_${PN} += "${base_libdir}"
> > @@ -57,6 +58,28 @@ do_install_prepend_j7-hs-evm() {
> >                  mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
> >                  ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> >          )
> > +        (
> > +          cd ${RTOS_IPC_FW_DIR}; \
> 
> Same comment about keeping the formatting intact.

Sure, sending v2 with the fixes.

Regards,
Manorit

> 
> 
> > +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_0_release_strip.xer5f \
> > +                        ipc_echo_test_mcu2_0_release_strip.xer5f.signed; \
> > +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_1_release_strip.xer5f \
> > +                        ipc_echo_test_mcu2_1_release_strip.xer5f.signed; \
> > +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_0_release_strip.xer5f \
> > +                        ipc_echo_test_mcu3_0_release_strip.xer5f.signed; \
> > +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_1_release_strip.xer5f \
> > +                        ipc_echo_test_mcu3_1_release_strip.xer5f.signed; \
> > +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c66xdsp_1_release_strip.xe66 \
> > +                        ipc_echo_test_c66xdsp_1_release_strip.xe66.signed; \
> > +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c66xdsp_2_release_strip.xe66 \
> > +                        ipc_echo_test_c66xdsp_2_release_strip.xe66.signed; \
> > +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_1_release_strip.xe71 \
> > +                        ipc_echo_test_c7x_1_release_strip.xe71.signed; \
> > +        )
> > +        (
> > +          cd ${RTOS_ETH_FW_DIR}; \
> > +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh app_remoteswitchcfg_server_strip.xer5f \
> > +                        app_remoteswitchcfg_server_strip.xer5f.signed;
> > +        )
> >  }
> >  
> >  # J7 HS support
> > @@ -117,6 +140,18 @@ do_install_j7() {
> >      install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
> >  }
> >  
> > +do_install_append_j7-hs-evm() {
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_1_release_strip.xe66.signed ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_2_release_strip.xe66.signed ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
> > +    # ETH firmware
> > +    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f.signed ${LEGACY_ETH_FW_DIR}
> > +}
> > +
> >  do_install_j7200-evm() {
> >      install -d ${LEGACY_IPC_FW_DIR}
> >      install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> > @@ -223,6 +258,25 @@ ALTERNATIVE_${PN}_am62xx = "\
> >                      am62-main-r5f0_0-fw \
> >                      "
> >  
> > +ALTERNATIVE_${PN}_j7-hs-evm = "\
> > +                    j7-mcu-r5f0_0-fw \
> > +                    j7-mcu-r5f0_1-fw \
> > +                    j7-main-r5f0_0-fw \
> > +                    j7-main-r5f0_1-fw \
> > +                    j7-main-r5f1_0-fw \
> > +                    j7-main-r5f1_1-fw \
> > +                    j7-c66_0-fw \
> > +                    j7-c66_1-fw \
> > +                    j7-c71_0-fw\
> > +                    j7-main-r5f0_0-fw-sec \
> > +                    j7-main-r5f0_1-fw-sec \
> > +                    j7-main-r5f1_0-fw-sec \
> > +                    j7-main-r5f1_1-fw-sec \
> > +                    j7-c66_0-fw-sec \
> > +                    j7-c66_1-fw-sec \
> > +                    j7-c71_0-fw-sec \
> > +                    "
> > +
> >  ALTERNATIVE_${PN}_j7 = "\
> >                      j7-mcu-r5f0_0-fw \
> >                      j7-mcu-r5f0_1-fw \
> > @@ -295,6 +349,14 @@ TARGET_C66_0_j7 = "j7-c66_0-fw"
> >  TARGET_C66_1_j7 = "j7-c66_1-fw"
> >  TARGET_C7X_0_j7 = "j7-c71_0-fw"
> >  
> > +TARGET_MAIN_R5FSS0_0_SIGNED_j7-hs-evm = "j7-main-r5f0_0-fw-sec"
> > +TARGET_MAIN_R5FSS0_1_SIGNED_j7-hs-evm = "j7-main-r5f0_1-fw-sec"
> > +TARGET_MAIN_R5FSS1_0_SIGNED_j7-hs-evm = "j7-main-r5f1_0-fw-sec"
> > +TARGET_MAIN_R5FSS1_1_SIGNED_j7-hs-evm = "j7-main-r5f1_1-fw-sec"
> > +TARGET_C66_0_SIGNED_j7-hs-evm = "j7-c66_0-fw-sec"
> > +TARGET_C66_1_SIGNED_j7-hs-evm = "j7-c66_1-fw-sec"
> > +TARGET_C7X_0_SIGNED_j7-hs-evm = "j7-c71_0-fw-sec"
> > +
> >  TARGET_MCU_R5FSS0_0_j7200-evm = "j7200-mcu-r5f0_0-fw"
> >  TARGET_MCU_R5FSS0_1_j7200-evm = "j7200-mcu-r5f0_1-fw"
> >  TARGET_MAIN_R5FSS0_0_j7200-evm = "j7200-main-r5f0_0-fw"
> > @@ -345,6 +407,14 @@ ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${base_libdir}/firmware/${TARGET_C66_0}"
> >  ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${base_libdir}/firmware/${TARGET_C66_1}"
> >  ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X_0}"
> >  
> > +ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
> > +ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
> > +ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0_SIGNED}"
> > +ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1_SIGNED}"
> > +ALTERNATIVE_LINK_NAME[j7-c66_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C66_0_SIGNED}"
> > +ALTERNATIVE_LINK_NAME[j7-c66_1-fw-sec] = "${base_libdir}/firmware/${TARGET_C66_1_SIGNED}"
> > +ALTERNATIVE_LINK_NAME[j7-c71_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_0_SIGNED}"
> > +
> >  ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
> >  ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> >  ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> > @@ -383,6 +453,14 @@ ALTERNATIVE_TARGET[j7-c66_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test
> >  ALTERNATIVE_TARGET[j7-c66_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release_strip.xe66"
> >  ALTERNATIVE_TARGET[j7-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
> >  
> > +ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f.signed"
> > +ALTERNATIVE_TARGET[j7-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f.signed"
> > +ALTERNATIVE_TARGET[j7-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f.signed"
> > +ALTERNATIVE_TARGET[j7-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f.signed"
> > +ALTERNATIVE_TARGET[j7-c66_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_1_release_strip.xe66.signed"
> > +ALTERNATIVE_TARGET[j7-c66_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release_strip.xe66.signed"
> > +ALTERNATIVE_TARGET[j7-c71_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71.signed"
> > +
> >  ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
> >  ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
> >  ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
> > -- 
> > 2.34.1

