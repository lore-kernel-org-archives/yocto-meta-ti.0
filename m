Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A51C7EE24
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 18:43:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4740.1683830585846303766
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 11:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2D2AE40CA8;
	Thu, 11 May 2023 18:43:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sF8Zs9lpLyNY; Thu, 11 May 2023 18:43:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0AE6F40C93;
	Thu, 11 May 2023 18:43:04 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 04955163843;
	Thu, 11 May 2023 14:42:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 1/2] optee-os: only activate customizations for TI platforms
Date: Thu, 11 May 2023 18:43:00 +0000
Message-Id: <20230511184301.1075335-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 18:43:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16517

From: Denys Dmytriyenko <denys@konsulko.com>

Avoid inheriting ti-secdev class and adding unconditional dependency
on TI_SECURE_DEV_PKG and other variables, when meta-ti-bsp is in the
bblayers.conf stack, but not building for TI platforms. This solves
yocto-check-layer signature test for Yocto Project compliance.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../{optee-os_%.bbappend =3D> optee-os-ti.inc}  |   0
 .../optee/optee-os_%.bbappend                 | 116 +-----------------
 2 files changed, 3 insertions(+), 113 deletions(-)
 copy meta-ti-bsp/recipes-security/optee/{optee-os_%.bbappend =3D> optee-=
os-ti.inc} (100%)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/met=
a-ti-bsp/recipes-security/optee/optee-os-ti.inc
similarity index 100%
copy from meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
copy to meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/met=
a-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index 4f052996..0067cdc7 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -1,114 +1,4 @@
-# Use TI SECDEV for signing
-inherit ti-secdev
+OPTEE_TI =3D ""
+OPTEE_TI:ti-soc =3D "optee-os-ti.inc"
=20
-EXTRA_OEMAKE:append:k3 =3D "${@ ' CFG_CONSOLE_UART=3D'+ d.getVar('OPTEE_=
K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
-
-EXTRA_OEMAKE:append:am62xx =3D " CFG_WITH_SOFTWARE_PRNG=3Dy CFG_TEE_CORE=
_LOG_LEVEL=3D1"
-EXTRA_OEMAKE:append:am62axx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
-
-do_compile:append:k3() {
-    cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin
-    cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin.unsigned
-    cp ${B}/core/tee.elf ${B}/bl32.elf
-}
-
-# Signing procedure for legacy HS devices
-optee_sign_legacyhs() {
-    ( cd ${B}/core/; \
-        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.=
bin.signed; \
-        normfl=3D`echo ${OPTEEFLAVOR} | tr "_" "-"`
-        mv tee.bin.signed ${B}/$normfl.optee; \
-    )
-
-    if [ "${OPTEEPAGER}" =3D "y" ]; then
-        oe_runmake -C ${S} clean
-        oe_runmake -C ${S} all CFG_TEE_TA_LOG_LEVEL=3D0 CFG_WITH_PAGER=3D=
y
-        ( cd ${B}/core/; \
-            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin =
tee.bin.signed; \
-            normfl=3D`echo ${OPTEEFLAVOR} | tr "_" "-"`
-            mv tee.bin.signed ${B}/$normfl-pager.optee; \
-        )
-    fi
-}
-
-do_compile:append:ti43x() {
-    optee_sign_legacyhs
-}
-
-do_compile:append:dra7xx() {
-    optee_sign_legacyhs
-}
-
-# Signing procedure for K3 devices
-optee_sign_k3hs() {
-    ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${B}/core/tee-pa=
ger_v2.bin ${B}/bl32.bin
-    cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin.unsigned
-    cp ${B}/core/tee.elf ${B}/bl32.elf
-}
-
-do_compile:append:am65xx-hs-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:am64xx-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:am62xx-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:am62xx-lp-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:am62axx-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:j721e-hs-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:j7200-hs-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:j721s2-hs-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:j784s4-hs-evm() {
-    optee_sign_k3hs
-}
-
-do_install:append:ti-soc() {
-    install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || =
true
-    install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ ||=
 true
-    install -m 644 ${B}/bl32.bin.unsigned ${D}${nonarch_base_libdir}/fir=
mware/ || true
-    install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ ||=
 true
-}
-
-optee_deploy_legacyhs() {
-    cd ${DEPLOYDIR}/
-    for f in optee/*.optee; do
-        ln -sf $f ${DEPLOYDIR}/
-    done
-}
-
-do_deploy:append:ti43x() {
-    optee_deploy_legacyhs
-}
-
-do_deploy:append:dra7xx() {
-    optee_deploy_legacyhs
-}
-
-do_deploy:append:k3() {
-    ln -sf optee/bl32.bin ${DEPLOYDIR}/
-    ln -sf optee/bl32.bin.unsigned ${DEPLOYDIR}/
-    ln -sf optee/bl32.elf ${DEPLOYDIR}/
-}
-
-# This is needed for bl32.elf
-INSANE_SKIP:${PN}:append:k3 =3D " textrel"
+require ${OPTEE_TI}
--=20
2.25.1


