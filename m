Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6DCCDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 20:48:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17268.1782334084583950029
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 13:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CFF4F40C8F;
	Wed, 24 Jun 2026 20:48:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXyoLiarOdbc; Wed, 24 Jun 2026 20:48:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 850B340C1C;
	Wed, 24 Jun 2026 20:48:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3A9CF17E278; Wed, 24 Jun 2026 16:48:00 -0400 (EDT)
Date: Wed, 24 Jun 2026 16:48:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/wrynose][PATCH v2 2/3] ipumm-fw: Use prebuilt
 firmware from ti-linux-firmware repo
Message-ID: <20260624204800.GE10186@denix.org>
References: <20260624195533.1152173-1-afd@ti.com>
 <20260624195533.1152173-2-afd@ti.com>
 <596d414a-053c-418f-92f9-16db0a0889de@ti.com>
 <b382a8b3-b5c5-4a63-9c11-129137747d5d@ti.com>
 <20260624202915.GC10186@denix.org>
 <6604c729-7bd3-45c6-bda8-da4a0d2e5195@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <6604c729-7bd3-45c6-bda8-da4a0d2e5195@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 20:48:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20084

On Wed, Jun 24, 2026 at 03:42:49PM -0500, Andrew Davis via lists.yoctopro=
ject.org wrote:
> On 6/24/26 3:29 PM, Denys Dmytriyenko wrote:
> >On Wed, Jun 24, 2026 at 03:19:33PM -0500, Andrew Davis via lists.yocto=
project.org wrote:
> >>On 6/24/26 3:08 PM, Ryan Eatmon wrote:
> >>>
> >>>Missing License-Update: in the commit message.
> >>>
> >>>https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.h=
tml#license-updates
> >>>
> >>>
> >>
> >>Hmm, so in this case the license isn't changing, just moving location=
, would something
> >>like this work?:
> >>
> >>License-Update: License text moved from source manifest to standalone=
 file
> >
> >Aren't they both standaline files? The old one is a pdf and the new on=
e is
> >presumably text?
> >
>=20
> The old one included other information, in fact it probably wasn't even=
 the
> right file to use for the LIC_FILES_CHKSUM, it should have been this fi=
le:
>=20
> https://git.ti.com/cgit/ivimm/ipumm/plain/SRAS_3443-TSPA_Click_Wrap_Lic=
ense.pdf
>=20
> But that is an mistake someone made many years ago.. So what we are doi=
ng here
> is moving the LIC_FILES_CHKSUM from the source manifest (incorrect), to=
 the
> standalone TI-TSPA license file.

Can you just say in the License-Update: tag something along the lines:

"The license stays the same, just use the correct file for checksum"


> Andrew
>=20
> >
> >>Andrew
> >>
> >>>
> >>>On 6/24/2026 2:55 PM, Andrew Davis wrote:
> >>>>Use a prebuilt version of this firmware from ti-linux-firmware. Thi=
s
> >>>>removes the need to build this locally.
> >>>>
> >>>>Signed-off-by: Andrew Davis <afd@ti.com>
> >>>>---
> >>>>
> >>>>Changes for v2:
> >>>> =A0 - Fix s/suppor/support in SUMMARY while here
> >>>> =A0 - Move PV definition to ti-linux-fw.inc like other prebuilt FW=
s
> >>>>
> >>>> =A0 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc=A0=A0 |=A0 1 +
> >>>> =A0 .../recipes-bsp/ipumm-fw/ipumm-fw_git.bb=A0=A0=A0=A0=A0 | 52 +=
+++---------------
> >>>> =A0 2 files changed, 10 insertions(+), 43 deletions(-)
> >>>>
> >>>>diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/=
meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >>>>index 126c46df..88992e60 100644
> >>>>--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >>>>+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >>>>@@ -20,6 +20,7 @@ TI_HSM_DEMO_FW_VERSION =3D "11.00.09"
> >>>> =A0 TI_PKA_FW_VERSION =3D "2.1.0"
> >>>> =A0 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
> >>>> =A0 PCM6240_FW_VERSION =3D "1.0.0.0"
> >>>>+IPUMM_FW_VERSION =3D "3.00.15.00"
> >>>> =A0 TI_LINUX_FW_SRCREV ?=3D "ec029baad8b4b147af8331a5e099ef891e5ae=
1f4"
> >>>> =A0 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
> >>>>diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/=
meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> >>>>index 246255e3..fbc6d956 100644
> >>>>--- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> >>>>+++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> >>>>@@ -1,7 +1,7 @@
> >>>>-SUMMARY =3D "Firmware for IPU to suppor Accelerated MM decode and =
encode"
> >>>>-LICENSE =3D "TI-TSPA"
> >>>>+SUMMARY =3D "Firmware for IPU to support Accelerated MM decode and=
 encode"
> >>>>-LIC_FILES_CHKSUM =3D "file://Texas_Instruments_ipumm_Manifest.pdf;=
md5=3D5cc572579f07af266ab57fc17d762c7f"
> >>>>+LICENSE =3D "TI-TSPA"
> >>>>+LIC_FILES_CHKSUM =3D "file://LICENCE.ti-tspa;md5=3Da1b59cb7ba626b9=
dbbcbf00f3fbc438a"
> >>>> =A0 COMPATIBLE_MACHINE =3D "am57xx"
> >>>>@@ -9,59 +9,25 @@ inherit features_check
> >>>> =A0 REQUIRED_MACHINE_FEATURES =3D "mmip"
> >>>>-SRC_URI =3D "git://git.ti.com/git/ivimm/ipumm.git;protocol=3Dhttps=
;branch=3Dmaster"
> >>>>-
> >>>>-SRCREV =3D "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
> >>>>-
> >>>>-PV =3D "3.00.15.00"
> >>>>-PR =3D "r7"
> >>>>+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >>>>-require recipes-ti/includes/ti-paths.inc
> >>>>+PV =3D "${IPUMM_FW_VERSION}"
> >>>>+PR =3D "r8"
> >>>> =A0 inherit update-alternatives
> >>>>-DEPENDS =3D "ti-xdctools-native ti-sysbios ti-codec-engine ti-fram=
ework-components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
> >>>>-
> >>>>-export HWVERSION =3D "ES10"
> >>>>-export BIOSTOOLSROOT =3D "${STAGING_DIR_TARGET}/usr/share/ti"
> >>>>-
> >>>>-export XDCVERSION =3D "ti-xdctools-tree"
> >>>>-export BIOSVERSION =3D "ti-sysbios-tree"
> >>>>-export IPCVERSION =3D "ti-ipc-tree"
> >>>>-export CEVERSION =3D "ti-codec-engine-tree"
> >>>>-export FCVERSION =3D "ti-framework-components-tree"
> >>>>-export XDAISVERSION =3D "ti-xdais-tree"
> >>>>-
> >>>>-export TMS470CGTOOLPATH =3D "${M4_TOOLCHAIN_INSTALL_DIR}"
> >>>>-export IPCSRC =3D "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
> >>>>-
> >>>>-EXTRA_OEMAKE +=3D "XDCDIST_TREE=3D${STAGING_DIR_NATIVE}/usr/share/=
ti/${XDCVERSION}"
> >>>>-
> >>>>-do_configure() {
> >>>>-=A0=A0=A0 oe_runmake unconfig
> >>>>-=A0=A0=A0 oe_runmake vayu_smp_config
> >>>>-}
> >>>>-
> >>>>-do_compile() {
> >>>>-=A0=A0=A0 oe_runmake
> >>>>-}
> >>>>-
> >>>> =A0 TARGET =3D "dra7-ipu2-fw.xem4"
> >>>>-TARGET_MAP =3D "platform/ti/dce/baseimage/package/cfg/out/ipu/rele=
ase/ipu.xem4.map"
> >>>> =A0 do_install() {
> >>>>-=A0=A0=A0 install -d ${D}${nonarch_base_libdir}/firmware
> >>>>-=A0=A0=A0 install -m 0644 ${S}/${TARGET} ${D}${nonarch_base_libdir=
}/firmware/${TARGET}.${BPN}
> >>>>-=A0=A0=A0 install -m 0644 ${S}/${TARGET_MAP} ${D}${nonarch_base_li=
bdir}/firmware/${TARGET}.map
> >>>>+=A0=A0=A0 install -d ${D}${nonarch_base_libdir}/firmware/ti-ce-fw
> >>>>+=A0=A0=A0 install -m 0644 ${S}/ti-ce-fw/${TARGET} ${D}${nonarch_ba=
se_libdir}/firmware/ti-ce-fw/${TARGET}
> >>>> =A0 }
> >>>> =A0 ALTERNATIVE:${PN} =3D "dra7-ipu2-fw.xem4"
> >>>> =A0 ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] =3D "${nonarch_base_l=
ibdir}/firmware/${TARGET}"
> >>>>-ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] =3D "${nonarch_base_libdir}/=
firmware/${TARGET}.${BPN}"
> >>>>+ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] =3D "${nonarch_base_libdir}/=
firmware/ti-ce-fw/${TARGET}"
> >>>> =A0 ALTERNATIVE_PRIORITY =3D "20"
> >>>>-FILES:${PN} +=3D "${nonarch_base_libdir}/firmware/*"
> >>>>-
> >>>> =A0 # Disable the "buildpaths" check while we figure out how we ar=
e
> >>>> =A0 # going to address this issue.
> >>>> =A0 #
> >>>
> >>

