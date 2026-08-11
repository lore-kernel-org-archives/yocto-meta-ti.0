Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2433C5CFC1
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 21:57:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.745.1786485447760753675
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 14:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A5D9F40C79;
	Tue, 11 Aug 2026 21:57:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VKcvEfBvvWYD; Tue, 11 Aug 2026 21:57:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 83CE040B88;
	Tue, 11 Aug 2026 21:57:25 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id A7FDF1741B6;
	Tue, 11 Aug 2026 17:57:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH] kernel_legacyhs: fix building/installing DTBs
Date: Tue, 11 Aug 2026 17:57:23 -0400
Message-Id: <20260811215723.45269-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Aug 2026 21:57:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20255

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

A recent change in OE-Core kernel-devicetree.bbclass [1] changed appendin=
g
code for devicetree from exported do_*() functions to :append to their
unexported kernel_do_*() variant. But our copy of kernel_legacyhs.bbclass
doesn't define those, using kernel_legacyhs_do_*() names instead, due to
how function exporting works using the class name as a prefix.

In order to unreak devicetree building/installing, we need to provide
empty stubs for kernel_do_*() functions for the :append to work and
then call then at the end of our respective kernel_legacyhs_do_*()
functions.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D350281188=
267d0ad7c7e44a6ae3990edcfbe0300

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-ti-bsp/classes/kernel_legacyhs.bbclass | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta-ti-bsp/classes/kernel_legacyhs.bbclass b/meta-ti-bsp/cl=
asses/kernel_legacyhs.bbclass
index 56130047..13e11e25 100644
--- a/meta-ti-bsp/classes/kernel_legacyhs.bbclass
+++ b/meta-ti-bsp/classes/kernel_legacyhs.bbclass
@@ -354,6 +354,10 @@ addtask bundle_initramfs after do_install before do_=
deploy
=20
 KERNEL_DEBUG_TIMESTAMPS ??=3D "0"
=20
+kernel_do_compile() {
+	:
+}
+
 kernel_legacyhs_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
=20
@@ -398,6 +402,8 @@ kernel_legacyhs_do_compile() {
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
 		oe_runmake ${PARALLEL_MAKE} ${typeformake} ${KERNEL_EXTRA_ARGS} $use_a=
lternate_initrd
 	done
+
+	kernel_do_compile
 }
=20
 kernel_legacyhs_do_transform_kernel() {
@@ -458,6 +464,10 @@ do_compile_kernelmodules() {
 }
 addtask compile_kernelmodules after do_compile before do_strip
=20
+kernel_do_install() {
+	:
+}
+
 kernel_legacyhs_do_install() {
 	#
 	# First install the modules
@@ -498,6 +508,8 @@ kernel_legacyhs_do_install() {
 	install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSIO=
N}
 	install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSI=
ON}
 	! [ -e Module.symvers ] || install -m 0644 Module.symvers ${D}/${KERNEL=
_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
+
+	kernel_do_install
 }
=20
 # Must be ran no earlier than after do_kernel_checkout or else Makefile =
won't be in ${S}/Makefile
@@ -665,6 +677,10 @@ KERNEL_LOCALVERSION ??=3D ""
 # helper function oe.kernel.get_localversion_file
 export LOCALVERSION =3D "${KERNEL_LOCALVERSION}"
=20
+kernel_do_configure() {
+	:
+}
+
 kernel_legacyhs_do_configure() {
 	# fixes extra + in /lib/modules/2.6.37+
 	# $ scripts/setlocalversion . =3D> +
@@ -689,6 +705,8 @@ kernel_legacyhs_do_configure() {
 	fi
=20
 	${KERNEL_CONFIG_COMMAND}
+
+	kernel_do_configure
 }
=20
 inherit cml1 pkgconfig
@@ -807,6 +825,10 @@ addtask sizecheck before do_install after do_strip
=20
 inherit kernel-artifact-names
=20
+kernel_do_deploy() {
+	:
+}
+
 kernel_legacyhs_do_deploy() {
 	deployDir=3D"${DEPLOYDIR}"
 	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
@@ -857,6 +879,8 @@ kernel_legacyhs_do_deploy() {
 			fi
 		done
 	fi
+
+	kernel_do_deploy
 }
=20
 # We deploy to filenames that include PKGV and PKGR, read the saved data=
 to
--=20
2.35.3


