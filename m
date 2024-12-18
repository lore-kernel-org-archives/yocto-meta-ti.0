Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3CFE7718C
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 20:49:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.115330.1734554966437140678
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 12:49:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BB9DF40AC9;
	Wed, 18 Dec 2024 20:49:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMUrTI2jiZDG; Wed, 18 Dec 2024 20:49:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A206E40CB0;
	Wed, 18 Dec 2024 20:49:24 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 63CE5164135;
	Wed, 18 Dec 2024 15:49:24 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH 02/13] meta-beagle: create a separate layer for Beagle platforms
Date: Wed, 18 Dec 2024 15:49:12 -0500
Message-Id: <20241218204923.2601088-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218204923.2601088-1-denis@denix.org>
References: <20241218204923.2601088-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Dec 2024 20:49:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18132

From: Denys Dmytriyenko <denys@konsulko.com>

The new meta-beagle will host all supported Beagle platforms that
use TI SoCs and hence need to depend on meta-ti-bsp. The default
BSP for the platforms in this layer will use BeagleBoard.org
official trees for the Linux kernel and U-boot.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-beagle/COPYING.MIT     | 17 +++++++++++++++++
 meta-beagle/README          | 31 +++++++++++++++++++++++++++++++
 meta-beagle/conf/layer.conf | 15 +++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta-beagle/COPYING.MIT
 create mode 100644 meta-beagle/README
 create mode 100644 meta-beagle/conf/layer.conf

diff --git a/meta-beagle/COPYING.MIT b/meta-beagle/COPYING.MIT
new file mode 100644
index 00000000..fb950dc6
--- /dev/null
+++ b/meta-beagle/COPYING.MIT
@@ -0,0 +1,17 @@
+Permission is hereby granted, free of charge, to any person obtaining a =
copy=20
+of this software and associated documentation files (the "Software"), to=
 deal=20
+in the Software without restriction, including without limitation the ri=
ghts=20
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sel=
l=20
+copies of the Software, and to permit persons to whom the Software is=20
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included =
in=20
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS =
OR=20
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,=
=20
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL =
THE=20
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER=20
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING =
FROM,=20
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS I=
N=20
+THE SOFTWARE.
diff --git a/meta-beagle/README b/meta-beagle/README
new file mode 100644
index 00000000..a17e6433
--- /dev/null
+++ b/meta-beagle/README
@@ -0,0 +1,31 @@
+OpenEmbedded/Yocto layer that extends meta-ti-bsp with BeagleBoard.org p=
latforms.
+
+It is hosted on http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/ with =
the
+source repository at git://git.yoctoproject.org/meta-ti
+
+
+This layer depends on:
+
+URI: git://git.openembedded.org/openembedded-core
+layers: meta
+branch: master
+
+URI: git://git.yoctoproject.org/meta-arm
+layers: meta-arm
+branch: master
+
+URI: git://git.yoctoproject.org/meta-ti
+branch: master
+revision: HEAD
+layers: meta-ti-bsp
+
+
+Send pull requests, patches, comments or questions to:
+meta-ti@lists.yoctoproject.org
+
+Please note - meta-ti mailing list requires subscription for posting:
+https://lists.yoctoproject.org/g/meta-ti
+
+Maintainers:
+Denys Dmytriyenko <denys@konsulko.com>
+Ryan Eatmon <reatmon@ti.com>
diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
new file mode 100644
index 00000000..0dac4946
--- /dev/null
+++ b/meta-beagle/conf/layer.conf
@@ -0,0 +1,15 @@
+# We have a conf and classes directory, append to BBPATH
+BBPATH .=3D ":${LAYERDIR}"
+
+# We have a recipes directory, add to BBFILES
+BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbapp=
end"
+
+BBFILE_COLLECTIONS +=3D "meta-beagle"
+BBFILE_PATTERN_meta-beagle :=3D "^${LAYERDIR}/"
+BBFILE_PRIORITY_meta-beagle =3D "6"
+
+LAYERSERIES_COMPAT_meta-beagle =3D "scarthgap"
+
+LAYERDEPENDS_meta-beagle =3D " \
+    meta-ti-bsp \
+"
--=20
2.25.1


