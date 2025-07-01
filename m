Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C68C83030
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 00:28:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2269.1751329712740128697
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jun 2025 17:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C2BCA40C85;
	Tue,  1 Jul 2025 00:28:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 70ZvjMBNyJOl; Tue,  1 Jul 2025 00:28:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 756C940021;
	Tue,  1 Jul 2025 00:28:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C6C6816B013; Mon, 30 Jun 2025 20:28:26 -0400 (EDT)
Date: Mon, 30 Jun 2025 20:28:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: c-shilwant@ti.com
Cc: afd@ti.com, meta-ti@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>,
	Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH 1/3] meta-ti-bsp: Split out
 ti-edgeai-fw from ti-rtos-echo-test-fw
Message-ID: <20250701002826.GR18383@denix.org>
References: <20250627202436.582570-1-afd@ti.com>
 <17b5f759-a8f5-4223-8590-339bbb91e233@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17b5f759-a8f5-4223-8590-339bbb91e233@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Jul 2025 00:28:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18738

On Mon, Jun 30, 2025 at 03:46:14PM +0530, Chirag Shilwant via lists.yoctoproject.org wrote:
> Hi Andrew,
> 
> On 28/06/25 01:54, Andrew Davis via lists.yoctoproject.org wrote:
> >TI EdgeAI firmware is distinct from the other "echo test" firmware
> >provided by ti-rtos-echo-test-fw. It belongs in its own package.
> >Split out the EdgeAI firmware from the "echo test" firmware.
> 
> 
> Looks like the corresponding meta-arago patch for adding
> ti-edgeai-fw in filesystem
> is missing from the meta-arago lists.
> 
> We have added ti-rtos-echo-test-fw in following recipes, so similar
> should be done
> for ti-edgeai-fw to ensure that CICD builds [0] have EdgeAI C7x IPC
> firmwares packaged.
> 
> 
> ~/source/meta-arago$ find . | grep -rn "ti-rtos-echo-test-fw"
> meta-arago-test/recipes-core/packagegroups/ti-test.bb:117:
> ti-rtos-echo-test-fw \
> meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb:70:
> ti-rtos-echo-test-fw \
> meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb:61:UTILS:append:k3
> = " ti-rtos-echo-test-fw"

Instead of doing it in images or packagegroups, a better alternative would 
be to list FW images in either MACHINE_ESSENTIAL_EXTRA_RDEPENDS or 
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS, as we already do for most of the FWs.

That way it will work for any distro or image built for the same platform.


> [0]: https://software-dl.ti.com/cicd-report/linux/index.html?section=platform&platform=am62axx
> 
> 
> 
> --
> Chirag
> 
> 
> 
> >Give this a higher ALTERNATIVE_PRIORITY so that if both are installed
> >the default will still be EdgeAI firmware for AM62A devices.
> >
> >Signed-off-by: Andrew Davis <afd@ti.com>
> >---
> >  .../recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb    | 58 +++++++++++++++++++
> >  .../ti-rtos-fw/ti-rtos-echo-test-fw.bb        | 29 +++++-----
> >  2 files changed, 72 insertions(+), 15 deletions(-)
> >  create mode 100644 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb
> >
> >diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb
> >new file mode 100644
> >index 00000000..67150968
> >--- /dev/null
> >+++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb
> >@@ -0,0 +1,58 @@
> >+SUMMARY = "TI EdgeAI prebuilt binary firmware images"
> >+
> >+LICENSE = "TI-TFL"
> >+LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
> >+
> >+COMPATIBLE_MACHINE = "am62axx"
> >+
> >+PACKAGE_ARCH = "${MACHINE_ARCH}"
> >+
> >+inherit update-alternatives
> >+
> >+PLAT_SFX = ""
> >+PLAT_SFX:am62axx = "am62axx"
> >+
> >+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >+
> >+PV = "${CORESDK_RTOS_VERSION}"
> >+PR = "${INC_PR}.1"
> >+
> >+# Secure Build
> >+inherit ti-secdev
> >+
> >+IPC_FW_DIR = "ti-ipc/${PLAT_SFX}"
> >+
> >+INSTALL_IPC_FW_DIR = "${nonarch_base_libdir}/firmware/${IPC_FW_DIR}"
> >+
> >+C7X_1_FW = "dsp_edgeai_c7x_1_release_strip.out"
> >+
> >+IPC_FW_LIST = ""
> >+IPC_FW_LIST:am62axx = "${C7X_1_FW}"
> >+
> >+do_install() {
> >+    # Sign Firmware
> >+    for FW_NAME in ${IPC_FW_LIST}
> >+    do
> >+        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${S}/${IPC_FW_DIR}/${FW_NAME} ${S}/${IPC_FW_DIR}/${FW_NAME}.signed
> >+    done
> >+
> >+    # Install Firmware
> >+    install -d ${D}${INSTALL_IPC_FW_DIR}
> >+    for FW_NAME in ${IPC_FW_LIST}
> >+    do
> >+        install -m 0644 ${S}/${IPC_FW_DIR}/${FW_NAME}        ${D}${INSTALL_IPC_FW_DIR}
> >+        install -m 0644 ${S}/${IPC_FW_DIR}/${FW_NAME}.signed ${D}${INSTALL_IPC_FW_DIR}
> >+    done
> >+}
> >+
> >+ALTERNATIVE:${PN}:am62axx = "\
> >+                    am62a-c71_0-fw        am62a-c71_0-fw-sec \
> >+                    "
> >+
> >+ALTERNATIVE_LINK_NAME[am62a-c71_0-fw]     = "${nonarch_base_libdir}/firmware/am62a-c71_0-fw"
> >+ALTERNATIVE_LINK_NAME[am62a-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62a-c71_0-fw-sec"
> >+
> >+ALTERNATIVE_TARGET[am62a-c71_0-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
> >+ALTERNATIVE_TARGET[am62a-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
> >+
> >+ALTERNATIVE_PRIORITY = "20"
> >diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> >index 7fffc9de..3e4db129 100644
> >--- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> >+++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> >@@ -36,21 +36,20 @@ IPC_FW_DIR = "ti-ipc/${PLAT_SFX}"
> >  INSTALL_IPC_FW_DIR = "${nonarch_base_libdir}/firmware/${IPC_FW_DIR}"
> >-MCU_1_0_FW =       "ipc_echo_test_mcu1_0_release_strip.xer5f"
> >-MCU_1_1_FW =       "ipc_echo_test_mcu1_1_release_strip.xer5f"
> >-MCU_2_0_FW =       "ipc_echo_test_mcu2_0_release_strip.xer5f"
> >-MCU_2_1_FW =       "ipc_echo_test_mcu2_1_release_strip.xer5f"
> >-MCU_3_0_FW =       "ipc_echo_test_mcu3_0_release_strip.xer5f"
> >-MCU_3_1_FW =       "ipc_echo_test_mcu3_1_release_strip.xer5f"
> >-MCU_4_0_FW =       "ipc_echo_test_mcu4_0_release_strip.xer5f"
> >-MCU_4_1_FW =       "ipc_echo_test_mcu4_1_release_strip.xer5f"
> >-C66_1_FW =         "ipc_echo_test_c66xdsp_1_release_strip.xe66"
> >-C66_2_FW =         "ipc_echo_test_c66xdsp_2_release_strip.xe66"
> >-C7X_1_FW =         "ipc_echo_test_c7x_1_release_strip.xe71"
> >-C7X_1_FW:am62axx = "dsp_edgeai_c7x_1_release_strip.out"
> >-C7X_2_FW =         "ipc_echo_test_c7x_2_release_strip.xe71"
> >-C7X_3_FW =         "ipc_echo_test_c7x_3_release_strip.xe71"
> >-C7X_4_FW =         "ipc_echo_test_c7x_4_release_strip.xe71"
> >+MCU_1_0_FW = "ipc_echo_test_mcu1_0_release_strip.xer5f"
> >+MCU_1_1_FW = "ipc_echo_test_mcu1_1_release_strip.xer5f"
> >+MCU_2_0_FW = "ipc_echo_test_mcu2_0_release_strip.xer5f"
> >+MCU_2_1_FW = "ipc_echo_test_mcu2_1_release_strip.xer5f"
> >+MCU_3_0_FW = "ipc_echo_test_mcu3_0_release_strip.xer5f"
> >+MCU_3_1_FW = "ipc_echo_test_mcu3_1_release_strip.xer5f"
> >+MCU_4_0_FW = "ipc_echo_test_mcu4_0_release_strip.xer5f"
> >+MCU_4_1_FW = "ipc_echo_test_mcu4_1_release_strip.xer5f"
> >+C66_1_FW   = "ipc_echo_test_c66xdsp_1_release_strip.xe66"
> >+C66_2_FW   = "ipc_echo_test_c66xdsp_2_release_strip.xe66"
> >+C7X_1_FW   = "ipc_echo_test_c7x_1_release_strip.xe71"
> >+C7X_2_FW   = "ipc_echo_test_c7x_2_release_strip.xe71"
> >+C7X_3_FW   = "ipc_echo_test_c7x_3_release_strip.xe71"
> >+C7X_4_FW   = "ipc_echo_test_c7x_4_release_strip.xe71"
> >  IPC_FW_LIST = ""
> >  IPC_FW_LIST:am65xx =  "${MCU_1_0_FW} ${MCU_1_1_FW}"

