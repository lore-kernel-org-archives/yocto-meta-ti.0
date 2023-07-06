Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36665EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 19:31:42 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.33902.1688671893375869508
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 12:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7C5E040C16;
	Thu,  6 Jul 2023 19:31:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YvKzaEIXC4U8; Thu,  6 Jul 2023 19:31:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 61C2C40A2F;
	Thu,  6 Jul 2023 19:31:31 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1F0C8163BED;
	Thu,  6 Jul 2023 15:31:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] conf: switch k3r5 multiconfig to baremetal
Date: Thu,  6 Jul 2023 19:31:22 +0000
Message-Id: <20230706193122.1891075-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Jul 2023 19:31:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16821

From: Denys Dmytriyenko <denys@konsulko.com>

There are couple of k3r5 components that need to be built for the target
and they are self-contained and don't use glibc. Moreover, when building
a cross-compile toolchain for k3r5, there's no need to build glibc and
all its dependencies. While build-time speed up is nice, the main benefit
comes when packaging a nativesdk toolchain for distribution, reducing the
number of packages and the resulting size of the toolchain installer.

To avoid potential namespace conflict in package feeds between nativesdk
binary packages of Linux glibc and k3r5 baremetal toolchains, adjust the
package suffix accordingly.

This also requires a rather impactful change in the deployment structure,
which affects CIs and user experience. By default different TCLIBC builds
(e.g. glibc and baremetal in this case) are built in separate TMPDIRs to
avoid conflicts, especially on the nativesdk side. Also the default confi=
g
has DEPLOY_DIR residing under corresponding TMPDIR. Of course, this can b=
e
changed by local.conf or <distro>.conf, which meta-ti-bsp has no control
over. Unlike multiconfig-image-packager example that can access deployed
artifacts across multiconfigs to package in an image, we use wic and its
IMAGE_BOOT_FILES list to package a final image. Unfortunately, wic cannot
access deployed artifacts across multiconfigs in separate TMPDIRs, as it
uses DEPLOY_DIR_IMAGE to collect the artifacts. To overcome this, we need
to set up a "common" deploy directory for images and sdks produced by
multiconfigs, which is located outside of TMPDIRs, set by TI_COMMON_DEPLO=
Y
variable that can be changed or adjusted by distros as needed.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/layer.conf            | 4 ++++
 meta-ti-bsp/conf/multiconfig/k3r5.conf | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index bb286c2b..db6f9de9 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -23,3 +23,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
 "
=20
 HOSTTOOLS_NONFATAL +=3D "truncate xxd comm"
+
+TI_COMMON_DEPLOY ?=3D "${TOPDIR}/deploy-ti"
+DEPLOY_DIR_IMAGE:ti-soc =3D "${TI_COMMON_DEPLOY}/images/${MACHINE}"
+SDK_DEPLOY:ti-soc =3D "${TI_COMMON_DEPLOY}/sdk"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/mu=
lticonfig/k3r5.conf
index deb07210..04b9a746 100644
--- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
+++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
@@ -1,5 +1,7 @@
 MAINMACHINE :=3D "${MACHINE}"
=20
-DEPLOY_DIR_IMAGE =3D "${DEPLOY_DIR}/images/${MAINMACHINE}"
+DEPLOY_DIR_IMAGE:k3r5 =3D "${TI_COMMON_DEPLOY}/images/${MAINMACHINE}"
=20
 MACHINE:append =3D "-k3r5"
+TCLIBC =3D "baremetal"
+SDKPKGSUFFIX =3D "k3r5-nativesdk"
--=20
2.25.1


