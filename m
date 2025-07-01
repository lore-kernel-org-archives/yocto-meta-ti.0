Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F81C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:05:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.978.1751385899996892492
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 09:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 27D2F40C76;
	Tue,  1 Jul 2025 16:04:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DZErn_tq7gGt; Tue,  1 Jul 2025 16:04:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CB35740B13;
	Tue,  1 Jul 2025 16:04:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3181816B0E6; Tue,  1 Jul 2025 12:04:54 -0400 (EDT)
Date: Tue, 1 Jul 2025 12:04:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Andrew Davis <afd@ti.com>, c-shilwant@ti.com,
	meta-ti@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH 1/3] meta-ti-bsp: Split out
 ti-edgeai-fw from ti-rtos-echo-test-fw
Message-ID: <20250701160454.GS18383@denix.org>
References: <20250627202436.582570-1-afd@ti.com>
 <17b5f759-a8f5-4223-8590-339bbb91e233@ti.com>
 <20250701002826.GR18383@denix.org>
 <bde3e8c3-5900-4ba8-9ceb-7882bf64c15b@ti.com>
 <4db33de9-b674-4221-a3f9-35c5be146efe@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <4db33de9-b674-4221-a3f9-35c5be146efe@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Jul 2025 16:05:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18748

On Tue, Jul 01, 2025 at 10:39:12AM -0500, Ryan Eatmon wrote:
>=20
>=20
> On 7/1/2025 9:45 AM, Andrew Davis wrote:
> >On 6/30/25 7:28 PM, Denys Dmytriyenko wrote:
> >>On Mon, Jun 30, 2025 at 03:46:14PM +0530, Chirag Shilwant via
> >>lists.yoctoproject.org wrote:
> >>>Hi Andrew,
> >>>
> >>>On 28/06/25 01:54, Andrew Davis via lists.yoctoproject.org wrote:
> >>>>TI EdgeAI firmware is distinct from the other "echo test" firmware
> >>>>provided by ti-rtos-echo-test-fw. It belongs in its own package.
> >>>>Split out the EdgeAI firmware from the "echo test" firmware.
> >>>
> >>>
> >>>Looks like the corresponding meta-arago patch for adding
> >>>ti-edgeai-fw in filesystem
> >>>is missing from the meta-arago lists.
> >>>
> >>>We have added ti-rtos-echo-test-fw in following recipes, so similar
> >>>should be done
> >>>for ti-edgeai-fw to ensure that CICD builds [0] have EdgeAI C7x IPC
> >>>firmwares packaged.
> >>>
> >>>
> >>>~/source/meta-arago$ find . | grep -rn "ti-rtos-echo-test-fw"
> >>>meta-arago-test/recipes-core/packagegroups/ti-test.bb:117:
> >>>ti-rtos-echo-test-fw \
> >>>meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cons=
ole.bb:70:
> >>>ti-rtos-echo-test-fw \
> >>>meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd=
k-addons.bb:61:UTILS:append:k3
> >>>=3D " ti-rtos-echo-test-fw"
> >>
> >>Instead of doing it in images or packagegroups, a better
> >>alternative would
> >>be to list FW images in either MACHINE_ESSENTIAL_EXTRA_RDEPENDS or
> >>MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS, as we already do for most
> >>of the FWs.
> >>
> >>That way it will work for any distro or image built for the same
> >>platform.
> >>
> >
> >I like this idea in general for most firmware, but our remoteproc firm=
ware
> >is a little different in that is has multiple valid options and select=
ion
> >depends on use-case. The echo test firmware is probably only
> >useful for test
> >images, and EdgeAI firmware might only be useful for EdgeAI images, et=
c..
> >
> >So selection of remoteproc firmware should stay in distro layer IMHO
>=20
> Is it possible to specify that two packages cannot be
> built/installed at the same time?  I think there is a way.  For this
> specific case I think we should use that.

Yeah, FW packages already use "alternatives" from update-alternatives, wh=
ere=20
you can adjust priorities to select one FW over another, when they confli=
ct=20
each other. Specifically, you can install both, but then a symlink gets=20
created to point to one or another based on priorities, plus you can chan=
ge=20
that at runtime as well.

The default priority adjustment should be done by a distro and we've had =
some=20
instances of that in the past, where a generic FW gets selected by defaul=
t,=20
but then a more specific FW gets selected when a specific branded distro =
gets=20
built.

Here's a remnant from it, showing how this can be done:
https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/conf/distr=
o/include/branding-core.inc#n8


> >Andrew
> >
> >>
> >>>[0]: https://software-dl.ti.com/cicd-report/linux/index.html?section=
=3Dplatform&platform=3Dam62axx
> >>>
> >>>
> >>>
> >>>--=20
> >>>Chirag
> >>>
> >>>
> >>>
> >>>>Give this a higher ALTERNATIVE_PRIORITY so that if both are install=
ed
> >>>>the default will still be EdgeAI firmware for AM62A devices.
> >>>>
> >>>>Signed-off-by: Andrew Davis <afd@ti.com>
> >>>>---
> >>>>=A0 .../recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb=A0=A0=A0 | 58
> >>>>+++++++++++++++++++
> >>>>=A0 .../ti-rtos-fw/ti-rtos-echo-test-fw.bb=A0=A0=A0=A0=A0=A0=A0 | 2=
9 +++++-----
> >>>>=A0 2 files changed, 72 insertions(+), 15 deletions(-)
> >>>>=A0 create mode 100644 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai=
-fw.bb
> >>>>
> >>>>diff --git
> >>>>a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb
> >>>>b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb
> >>>>new file mode 100644
> >>>>index 00000000..67150968
> >>>>--- /dev/null
> >>>>+++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb
> >>>>@@ -0,0 +1,58 @@
> >>>>+SUMMARY =3D "TI EdgeAI prebuilt binary firmware images"
> >>>>+
> >>>>+LICENSE =3D "TI-TFL"
> >>>>+LIC_FILES_CHKSUM =3D "file://${THISDIR}/../../licenses/TI-TFL;md5=3D=
a1b59cb7ba626b9dbbcbf00f3fbc438a"
> >>>>+
> >>>>+COMPATIBLE_MACHINE =3D "am62axx"
> >>>>+
> >>>>+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >>>>+
> >>>>+inherit update-alternatives
> >>>>+
> >>>>+PLAT_SFX =3D ""
> >>>>+PLAT_SFX:am62axx =3D "am62axx"
> >>>>+
> >>>>+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >>>>+
> >>>>+PV =3D "${CORESDK_RTOS_VERSION}"
> >>>>+PR =3D "${INC_PR}.1"
> >>>>+
> >>>>+# Secure Build
> >>>>+inherit ti-secdev
> >>>>+
> >>>>+IPC_FW_DIR =3D "ti-ipc/${PLAT_SFX}"
> >>>>+
> >>>>+INSTALL_IPC_FW_DIR =3D "${nonarch_base_libdir}/firmware/${IPC_FW_D=
IR}"
> >>>>+
> >>>>+C7X_1_FW =3D "dsp_edgeai_c7x_1_release_strip.out"
> >>>>+
> >>>>+IPC_FW_LIST =3D ""
> >>>>+IPC_FW_LIST:am62axx =3D "${C7X_1_FW}"
> >>>>+
> >>>>+do_install() {
> >>>>+=A0=A0=A0 # Sign Firmware
> >>>>+=A0=A0=A0 for FW_NAME in ${IPC_FW_LIST}
> >>>>+=A0=A0=A0 do
> >>>>+=A0=A0=A0=A0=A0=A0=A0 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-i=
mage.sh
> >>>>${S}/${IPC_FW_DIR}/${FW_NAME}
> >>>>${S}/${IPC_FW_DIR}/${FW_NAME}.signed
> >>>>+=A0=A0=A0 done
> >>>>+
> >>>>+=A0=A0=A0 # Install Firmware
> >>>>+=A0=A0=A0 install -d ${D}${INSTALL_IPC_FW_DIR}
> >>>>+=A0=A0=A0 for FW_NAME in ${IPC_FW_LIST}
> >>>>+=A0=A0=A0 do
> >>>>+=A0=A0=A0=A0=A0=A0=A0 install -m 0644 ${S}/${IPC_FW_DIR}/${FW_NAME=
}
> >>>>${D}${INSTALL_IPC_FW_DIR}
> >>>>+=A0=A0=A0=A0=A0=A0=A0 install -m 0644
> >>>>${S}/${IPC_FW_DIR}/${FW_NAME}.signed
> >>>>${D}${INSTALL_IPC_FW_DIR}
> >>>>+=A0=A0=A0 done
> >>>>+}
> >>>>+
> >>>>+ALTERNATIVE:${PN}:am62axx =3D "\
> >>>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 am62a-c7=
1_0-fw=A0=A0=A0=A0=A0=A0=A0 am62a-c71_0-fw-sec \
> >>>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> >>>>+
> >>>>+ALTERNATIVE_LINK_NAME[am62a-c71_0-fw]=A0=A0=A0=A0 =3D
> >>>>"${nonarch_base_libdir}/firmware/am62a-c71_0-fw"
> >>>>+ALTERNATIVE_LINK_NAME[am62a-c71_0-fw-sec] =3D
> >>>>"${nonarch_base_libdir}/firmware/am62a-c71_0-fw-sec"
> >>>>+
> >>>>+ALTERNATIVE_TARGET[am62a-c71_0-fw]=A0=A0=A0=A0 =3D
> >>>>"${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
> >>>>+ALTERNATIVE_TARGET[am62a-c71_0-fw-sec] =3D
> >>>>"${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
> >>>>+
> >>>>+ALTERNATIVE_PRIORITY =3D "20"
> >>>>diff --git
> >>>>a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> >>>>b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> >>>>index 7fffc9de..3e4db129 100644
> >>>>--- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> >>>>+++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> >>>>@@ -36,21 +36,20 @@ IPC_FW_DIR =3D "ti-ipc/${PLAT_SFX}"
> >>>>=A0 INSTALL_IPC_FW_DIR =3D "${nonarch_base_libdir}/firmware/${IPC_F=
W_DIR}"
> >>>>-MCU_1_0_FW =3D=A0=A0=A0=A0=A0=A0 "ipc_echo_test_mcu1_0_release_str=
ip.xer5f"
> >>>>-MCU_1_1_FW =3D=A0=A0=A0=A0=A0=A0 "ipc_echo_test_mcu1_1_release_str=
ip.xer5f"
> >>>>-MCU_2_0_FW =3D=A0=A0=A0=A0=A0=A0 "ipc_echo_test_mcu2_0_release_str=
ip.xer5f"
> >>>>-MCU_2_1_FW =3D=A0=A0=A0=A0=A0=A0 "ipc_echo_test_mcu2_1_release_str=
ip.xer5f"
> >>>>-MCU_3_0_FW =3D=A0=A0=A0=A0=A0=A0 "ipc_echo_test_mcu3_0_release_str=
ip.xer5f"
> >>>>-MCU_3_1_FW =3D=A0=A0=A0=A0=A0=A0 "ipc_echo_test_mcu3_1_release_str=
ip.xer5f"
> >>>>-MCU_4_0_FW =3D=A0=A0=A0=A0=A0=A0 "ipc_echo_test_mcu4_0_release_str=
ip.xer5f"
> >>>>-MCU_4_1_FW =3D=A0=A0=A0=A0=A0=A0 "ipc_echo_test_mcu4_1_release_str=
ip.xer5f"
> >>>>-C66_1_FW =3D=A0=A0=A0=A0=A0=A0=A0=A0 "ipc_echo_test_c66xdsp_1_rele=
ase_strip.xe66"
> >>>>-C66_2_FW =3D=A0=A0=A0=A0=A0=A0=A0=A0 "ipc_echo_test_c66xdsp_2_rele=
ase_strip.xe66"
> >>>>-C7X_1_FW =3D=A0=A0=A0=A0=A0=A0=A0=A0 "ipc_echo_test_c7x_1_release_=
strip.xe71"
> >>>>-C7X_1_FW:am62axx =3D "dsp_edgeai_c7x_1_release_strip.out"
> >>>>-C7X_2_FW =3D=A0=A0=A0=A0=A0=A0=A0=A0 "ipc_echo_test_c7x_2_release_=
strip.xe71"
> >>>>-C7X_3_FW =3D=A0=A0=A0=A0=A0=A0=A0=A0 "ipc_echo_test_c7x_3_release_=
strip.xe71"
> >>>>-C7X_4_FW =3D=A0=A0=A0=A0=A0=A0=A0=A0 "ipc_echo_test_c7x_4_release_=
strip.xe71"
> >>>>+MCU_1_0_FW =3D "ipc_echo_test_mcu1_0_release_strip.xer5f"
> >>>>+MCU_1_1_FW =3D "ipc_echo_test_mcu1_1_release_strip.xer5f"
> >>>>+MCU_2_0_FW =3D "ipc_echo_test_mcu2_0_release_strip.xer5f"
> >>>>+MCU_2_1_FW =3D "ipc_echo_test_mcu2_1_release_strip.xer5f"
> >>>>+MCU_3_0_FW =3D "ipc_echo_test_mcu3_0_release_strip.xer5f"
> >>>>+MCU_3_1_FW =3D "ipc_echo_test_mcu3_1_release_strip.xer5f"
> >>>>+MCU_4_0_FW =3D "ipc_echo_test_mcu4_0_release_strip.xer5f"
> >>>>+MCU_4_1_FW =3D "ipc_echo_test_mcu4_1_release_strip.xer5f"
> >>>>+C66_1_FW=A0=A0 =3D "ipc_echo_test_c66xdsp_1_release_strip.xe66"
> >>>>+C66_2_FW=A0=A0 =3D "ipc_echo_test_c66xdsp_2_release_strip.xe66"
> >>>>+C7X_1_FW=A0=A0 =3D "ipc_echo_test_c7x_1_release_strip.xe71"
> >>>>+C7X_2_FW=A0=A0 =3D "ipc_echo_test_c7x_2_release_strip.xe71"
> >>>>+C7X_3_FW=A0=A0 =3D "ipc_echo_test_c7x_3_release_strip.xe71"
> >>>>+C7X_4_FW=A0=A0 =3D "ipc_echo_test_c7x_4_release_strip.xe71"
> >>>>=A0 IPC_FW_LIST =3D ""
> >>>>=A0 IPC_FW_LIST:am65xx =3D=A0 "${MCU_1_0_FW} ${MCU_1_1_FW}"

