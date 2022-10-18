Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1162CC433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 11:06:30 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5458.1666091174083267946
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Oct 2022 04:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TKuJOcFH;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: m-chawdhry@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29IB6CMa070736
	for <meta-ti@lists.yoctoproject.org>; Tue, 18 Oct 2022 06:06:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666091172;
	bh=U/ofju5WSztZe8YKf3ByJSOr7P3mibwNzj5Ok5UpMz0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TKuJOcFHOKKrbbd+xZINgUhgrfLAgLPEeYPsU6goa2OztknxHnPNIG/MA56mT9yOI
	 Cw7esU2TObWBrbxL7ZnTZ6gmr8Zp54b8fq4xEBDQlnPfvnYDd2cffeCsy+xCyNv/Fy
	 2rsM+BmYvAMeBbMYIKJmbMZ4DscI9Aw7r7CdCAY8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29IB6CuB065892
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 18 Oct 2022 06:06:12 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 18
 Oct 2022 06:06:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 18 Oct 2022 06:06:12 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29IB6Big026809;
	Tue, 18 Oct 2022 06:06:12 -0500
Date: Tue, 18 Oct 2022 16:36:11 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: Andrew Davis <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][RFC dunfell][PATCH v2 2/6] ti-rtos-firmware: Add
 J784S4 High Security support
Message-ID: <20221018110611.yealkmyeoamsus4o@ula0497581>
References: <20221012100941.153924-1-m-chawdhry@ti.com>
 <20221012100941.153924-3-m-chawdhry@ti.com>
 <2fe8d36c-7540-6400-00dd-e80596f3306f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2fe8d36c-7540-6400-00dd-e80596f3306f@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Oct 2022 11:06:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15180

On 09:02-20221017, Andrew Davis wrote:
> On 10/12/22 5:09 AM, Manorit Chawdhry wrote:
> > Sign the firmwares for j784s4 similar to j721s2 hs.
> > Duplicate all j784s4 entries for j784s4-hs as we cannot use same
> > keyword for match between j784s4-evm and j784s4-hs-evm.
> > 
> > Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> > ---
> >   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 135 +++++++++++++++++++++
> >   1 file changed, 135 insertions(+)
> > 
> > diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> > index 68c93ae7..f3b7d416 100644
> > --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> > +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> > @@ -20,6 +20,7 @@ PLAT_SFX_j7200-hs-evm = "j7200"
> >   PLAT_SFX_j721s2-evm = "j721s2"
> >   PLAT_SFX_j721s2-hs-evm = "j721s2"
> >   PLAT_SFX_j784s4-evm = "j784s4"
> > +PLAT_SFX_j784s4-hs-evm = "j784s4"
> >   PLAT_SFX_am65xx = "am65xx"
> >   PLAT_SFX_am64xx = "am64xx"
> >   PLAT_SFX_am62xx = "am62xx"
> > @@ -128,6 +129,38 @@ do_install_prepend_j721s2-hs-evm() {
> >           )
> >   }
> > +# J784S4 support
> > +do_install_prepend_j784s4-hs-evm() {
> > +        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> > +        ( cd ${RTOS_DM_FW_DIR}; \
> > +                mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
> > +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> > +        )
> > +        (
> > +          cd ${RTOS_IPC_FW_DIR}; \
> > +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_0_release_strip.xer5f \
> > +                ipc_echo_test_mcu2_0_release_strip.xer5f.signed; \
> > +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_1_release_strip.xer5f \
> > +                ipc_echo_test_mcu2_1_release_strip.xer5f.signed; \
> > +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_0_release_strip.xer5f \
> > +                ipc_echo_test_mcu3_0_release_strip.xer5f.signed; \
> > +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_1_release_strip.xer5f \
> > +                ipc_echo_test_mcu3_1_release_strip.xer5f.signed; \
> > +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu4_0_release_strip.xer5f \
> > +                ipc_echo_test_mcu4_0_release_strip.xer5f.signed; \
> > +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu4_1_release_strip.xer5f \
> > +                ipc_echo_test_mcu4_1_release_strip.xer5f.signed; \
> > +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_1_release_strip.xe71 \
> > +                ipc_echo_test_c7x_1_release_strip.xe71.signed; \
> > +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_2_release_strip.xe71 \
> > +                ipc_echo_test_c7x_2_release_strip.xe71.signed; \
> > +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_3_release_strip.xe71 \
> > +                ipc_echo_test_c7x_3_release_strip.xe71.signed; \
> > +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_4_release_strip.xe71 \
> > +                ipc_echo_test_c7x_4_release_strip.xe71.signed; \
> > +        )
> > +}
> > +
> >   # Update the am64xx ipc binaries to be consistent with other platforms
> >   do_install_prepend_am64xx() {
> >           ( cd ${RTOS_IPC_FW_DIR}; \
> > @@ -248,6 +281,37 @@ do_install_j721s2-hs-evm() {
> >       # install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
> >   }
> > +do_install_j784s4-hs-evm() {
> > +    install -d ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_3_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_4_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> > +    # Signed firmware
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_3_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
> > +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_4_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
> > +    # DM Firmware
> > +    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> > +    # ETH firmware
> > +    install -d ${LEGACY_ETH_FW_DIR}
> > +    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
> > +}
> > +
> >   do_install_j784s4-evm() {
> >       install -d ${LEGACY_IPC_FW_DIR}
> >       install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> > @@ -408,6 +472,31 @@ ALTERNATIVE_${PN}_j784s4-evm = "\
> >                       j784s4-c71_3-fw \
> >                       "
> > +ALTERNATIVE_${PN}_j784s4-hs-evm = "\
> > +                    j784s4-mcu-r5f0_0-fw \
> > +                    j784s4-mcu-r5f0_1-fw \
> > +                    j784s4-main-r5f0_0-fw \
> > +                    j784s4-main-r5f0_1-fw \
> > +                    j784s4-main-r5f1_0-fw \
> > +                    j784s4-main-r5f1_1-fw \
> > +                    j784s4-main-r5f2_0-fw \
> > +                    j784s4-main-r5f2_1-fw \
> > +                    j784s4-c71_0-fw \
> > +                    j784s4-c71_1-fw \
> > +                    j784s4-c71_2-fw \
> > +                    j784s4-c71_3-fw \
> > +		    j784s4-main-r5f0_0-fw-sec \
> 
> 
> Looks like a couple tabs snuck in on this line..
> 
> Other than that, this patch looks fine to me. Maybe one minor
> thing you could do though, split this into two, one for adding the
> normal firmware, second for adding the extra signed firmware.
> 
> Andrew
> 

Okay, will update it.

Thanks,
Manorit

> 
> > +                    j784s4-main-r5f0_1-fw-sec \
> > +                    j784s4-main-r5f1_0-fw-sec \
> > +                    j784s4-main-r5f1_1-fw-sec \
> > +                    j784s4-main-r5f2_0-fw-sec \
> > +                    j784s4-main-r5f2_1-fw-sec \
> > +                    j784s4-c71_0-fw-sec \
> > +                    j784s4-c71_1-fw-sec \
> > +                    j784s4-c71_2-fw-sec \
> > +                    j784s4-c71_3-fw-sec \
> > +                    "
> > +
> >   # Set up link names for the firmwares
> >   TARGET_MCU_R5FSS0_0_am65xx = "am65x-mcu-r5f0_0-fw"
> > @@ -491,6 +580,30 @@ TARGET_C7X_1_j784s4-evm = "j784s4-c71_1-fw"
> >   TARGET_C7X_2_j784s4-evm = "j784s4-c71_2-fw"
> >   TARGET_C7X_3_j784s4-evm = "j784s4-c71_3-fw"
> > +TARGET_MCU_R5FSS0_0_j784s4-hs-evm = "j784s4-mcu-r5f0_0-fw"
> > +TARGET_MCU_R5FSS0_1_j784s4-hs-evm = "j784s4-mcu-r5f0_1-fw"
> > +TARGET_MAIN_R5FSS0_0_j784s4-hs-evm = "j784s4-main-r5f0_0-fw"
> > +TARGET_MAIN_R5FSS0_1_j784s4-hs-evm = "j784s4-main-r5f0_1-fw"
> > +TARGET_MAIN_R5FSS1_0_j784s4-hs-evm = "j784s4-main-r5f1_0-fw"
> > +TARGET_MAIN_R5FSS1_1_j784s4-hs-evm = "j784s4-main-r5f1_1-fw"
> > +TARGET_MAIN_R5FSS2_0_j784s4-hs-evm = "j784s4-main-r5f2_0-fw"
> > +TARGET_MAIN_R5FSS2_1_j784s4-hs-evm = "j784s4-main-r5f2_1-fw"
> > +TARGET_C7X_0_j784s4-hs-evm = "j784s4-c71_0-fw"
> > +TARGET_C7X_1_j784s4-hs-evm = "j784s4-c71_1-fw"
> > +TARGET_C7X_2_j784s4-hs-evm = "j784s4-c71_2-fw"
> > +TARGET_C7X_3_j784s4-hs-evm = "j784s4-c71_3-fw"
> > +
> > +TARGET_MAIN_R5FSS0_0_SIGNED_j784s4-hs-evm = "j784s4-main-r5f0_0-fw-sec"
> > +TARGET_MAIN_R5FSS0_1_SIGNED_j784s4-hs-evm = "j784s4-main-r5f0_1-fw-sec"
> > +TARGET_MAIN_R5FSS1_0_SIGNED_j784s4-hs-evm = "j784s4-main-r5f1_0-fw-sec"
> > +TARGET_MAIN_R5FSS1_1_SIGNED_j784s4-hs-evm = "j784s4-main-r5f1_1-fw-sec"
> > +TARGET_MAIN_R5FSS2_0_SIGNED_j784s4-hs-evm = "j784s4-main-r5f2_0-fw-sec"
> > +TARGET_MAIN_R5FSS2_1_SIGNED_j784s4-hs-evm = "j784s4-main-r5f2_1-fw-sec"
> > +TARGET_C7X_0_SIGNED_j784s4-hs-evm = "j784s4-c71_0-fw-sec"
> > +TARGET_C7X_1_SIGNED_j784s4-hs-evm = "j784s4-c71_1-fw-sec"
> > +TARGET_C7X_2_SIGNED_j784s4-hs-evm = "j784s4-c71_2-fw-sec"
> > +TARGET_C7X_3_SIGNED_j784s4-hs-evm = "j784s4-c71_3-fw-sec"
> > +
> >   ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
> >   ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> > @@ -558,6 +671,17 @@ ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw] = "${base_libdir}/firmware/${TARGET_C7X_1
> >   ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw] = "${base_libdir}/firmware/${TARGET_C7X_2}"
> >   ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] = "${base_libdir}/firmware/${TARGET_C7X_3}"
> > +ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
> > +ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
> > +ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0_SIGNED}"
> > +ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1_SIGNED}"
> > +ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS2_0_SIGNED}"
> > +ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS2_1_SIGNED}"
> > +ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_0_SIGNED}"
> > +ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_1_SIGNED}"
> > +ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_2_SIGNED}"
> > +ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_3_SIGNED}"
> > +
> >   # Create the firmware alternatives
> >   ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
> > @@ -627,6 +751,17 @@ ALTERNATIVE_TARGET[j784s4-c71_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_
> >   ALTERNATIVE_TARGET[j784s4-c71_2-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_3_release_strip.xe71"
> >   ALTERNATIVE_TARGET[j784s4-c71_3-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_4_release_strip.xe71"
> > +ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f.signed"
> > +ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f.signed"
> > +ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f.signed"
> > +ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f.signed"
> > +ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu4_0_release_strip.xer5f.signed"
> > +ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu4_1_release_strip.xer5f.signed"
> > +ALTERNATIVE_TARGET[j784s4-c71_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71.signed"
> > +ALTERNATIVE_TARGET[j784s4-c71_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe71.signed"
> > +ALTERNATIVE_TARGET[j784s4-c71_2-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_3_release_strip.xe71.signed"
> > +ALTERNATIVE_TARGET[j784s4-c71_3-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_4_release_strip.xe71.signed"
> > +
> >   ALTERNATIVE_PRIORITY = "10"
> >   # make sure that lib/firmware, and all its contents are part of the package

