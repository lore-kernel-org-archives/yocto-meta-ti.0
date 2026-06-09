Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D6CCD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 18:48:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3081.1781030914903495094
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 11:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5400C40CE8;
	Tue,  9 Jun 2026 18:48:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nqXAj4xnFWL5; Tue,  9 Jun 2026 18:48:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2F66640C82;
	Tue,  9 Jun 2026 18:48:33 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id ED4A417ED76;
	Tue,  9 Jun 2026 14:48:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH] README: update and clean up
Date: Tue,  9 Jun 2026 14:48:32 -0400
Message-Id: <20260609184832.2659176-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 18:48:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19990

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

Update READMEs as follows:
* Don't point to CGit interface, as the old URL is no longer valid
* Use https:// instead of git:// protocol due to deprecation
* Add missing revisions and use the same ordering
* Correct some sub-layer dependencies

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-beagle/README    | 15 ++++++++-------
 meta-ti-bsp/README    | 13 +++++++------
 meta-ti-extras/README | 15 ++++++++-------
 meta-ti-test/README   | 18 +++++++++---------
 4 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/meta-beagle/README b/meta-beagle/README
index a17e6433..c8a73150 100644
--- a/meta-beagle/README
+++ b/meta-beagle/README
@@ -1,20 +1,21 @@
 OpenEmbedded/Yocto layer that extends meta-ti-bsp with BeagleBoard.org p=
latforms.
=20
-It is hosted on http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/ with =
the
-source repository at git://git.yoctoproject.org/meta-ti
+The source repository is hosted at https://git.yoctoproject.org/meta-ti
=20
=20
 This layer depends on:
=20
-URI: git://git.openembedded.org/openembedded-core
-layers: meta
+URI: https://git.openembedded.org/openembedded-core
 branch: master
+revision: HEAD
+layers: meta
=20
-URI: git://git.yoctoproject.org/meta-arm
-layers: meta-arm
+URI: https://git.yoctoproject.org/meta-arm
 branch: master
+revision: HEAD
+layers: meta-arm
=20
-URI: git://git.yoctoproject.org/meta-ti
+URI: https://git.yoctoproject.org/meta-ti
 branch: master
 revision: HEAD
 layers: meta-ti-bsp
diff --git a/meta-ti-bsp/README b/meta-ti-bsp/README
index c5780531..ceff85ed 100644
--- a/meta-ti-bsp/README
+++ b/meta-ti-bsp/README
@@ -1,18 +1,19 @@
 The official OpenEmbedded/Yocto BSP layer for Texas Instruments platform=
s.
=20
-It is hosted on http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/ with =
the
-source repository at git://git.yoctoproject.org/meta-ti
+The source repository is hosted at https://git.yoctoproject.org/meta-ti
=20
=20
 This layer depends on:
=20
-URI: git://git.openembedded.org/openembedded-core
-layers: meta
+URI: https://git.openembedded.org/openembedded-core
 branch: master
+revision: HEAD
+layers: meta
=20
-URI: git://git.yoctoproject.org/meta-arm
-layers: meta-arm
+URI: https://git.yoctoproject.org/meta-arm
 branch: master
+revision: HEAD
+layers: meta-arm
=20
=20
 The base BSP part of meta-ti should work with different OpenEmbedded/Yoc=
to
diff --git a/meta-ti-extras/README b/meta-ti-extras/README
index 1b38921a..c424cf03 100644
--- a/meta-ti-extras/README
+++ b/meta-ti-extras/README
@@ -1,20 +1,21 @@
 OpenEmbedded/Yocto layer that extends and supplements Texas Instruments =
BSP layer.
=20
-It is hosted on http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/ with =
the
-source repository at git://git.yoctoproject.org/meta-ti
+The source repository is hosted at https://git.yoctoproject.org/meta-ti
=20
=20
 This layer depends on:
=20
-URI: git://git.openembedded.org/openembedded-core
-layers: meta
+URI: https://git.openembedded.org/openembedded-core
 branch: master
+revision: HEAD
+layers: meta
=20
-URI: git://git.yoctoproject.org/meta-arm
-layers: meta-arm
+URI: https://git.yoctoproject.org/meta-arm
 branch: master
+revision: HEAD
+layers: meta-arm
=20
-URI: git://git.yoctoproject.org/meta-ti
+URI: https://git.yoctoproject.org/meta-ti
 branch: master
 revision: HEAD
 layers: meta-ti-bsp
diff --git a/meta-ti-test/README b/meta-ti-test/README
index e3a41e79..d5bf8e54 100644
--- a/meta-ti-test/README
+++ b/meta-ti-test/README
@@ -1,27 +1,27 @@
 meta-ti-test provides an additional packagegroup ti-test and some of the=
 recipes that go into that group
=20
-This layer works with the latest Yocto Project release (currently 2.2+) =
and tracks
-the stable/maintenance branches (currently "master") of the correspondin=
g layers:
+This layer works with the latest Yocto Project and tracks the "master"
+branches of the corresponding layers:
=20
-URI: git://git.openembedded.org/openembedded-core
+URI: https://git.openembedded.org/openembedded-core
 branch: master
 revision: HEAD
 layers: meta
=20
-URI: git://git.yoctoproject.org/meta-ti
+URI: https://git.yoctoproject.org/meta-ti
 branch: master
 revision: HEAD
-layers: meta-ti-bsp, meta-ti-extras
+layers: meta-ti-bsp
=20
-URI: git://git.yoctoproject.org/meta-arm
+URI: https://git.yoctoproject.org/meta-arm
 branch: master
 revision: HEAD
-layers: meta-arm, meta-arm-toolchain
+layers: meta-arm
=20
-URI: git://git.openembedded.org/meta-openembedded
+URI: https://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
-layers: meta-oe, meta-networking, meta-python
+layers: meta-oe, meta-networking, meta-filesystems, meta-python
=20
 Send pull requests, patches, comments or questions to:
 meta-ti@lists.yoctoproject.org
--=20
2.25.1


