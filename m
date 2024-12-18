Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48C7E77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 20:49:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.115336.1734554968749693797
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 12:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3780240CBB;
	Wed, 18 Dec 2024 20:49:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6rZzJI3QdEwv; Wed, 18 Dec 2024 20:49:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 18FDA40CC7;
	Wed, 18 Dec 2024 20:49:26 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D5F00164140;
	Wed, 18 Dec 2024 15:49:24 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Ryan Eatmon <reatmon@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH 13/13] meta-beagle: Add SECURITY file
Date: Wed, 18 Dec 2024 15:49:23 -0500
Message-Id: <20241218204923.2601088-13-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218204923.2601088-1-denis@denix.org>
References: <20241218204923.2601088-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Dec 2024 20:49:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18140

From: Ryan Eatmon <reatmon@ti.com>

Add missing SECURITY file required by yocto-check-layer.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-beagle/SECURITY | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-beagle/SECURITY

diff --git a/meta-beagle/SECURITY b/meta-beagle/SECURITY
new file mode 100644
index 00000000..367adc34
--- /dev/null
+++ b/meta-beagle/SECURITY
@@ -0,0 +1,20 @@
+How to Report a Potential Vulnerability?
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+If you would like to report a public issue (for example, one with a rele=
ased
+CVE number), please report it to the mailing list:
+
+  https://lists.yoctoproject.org/g/meta-ti
+
+If you are dealing with a not-yet released or urgent issue, please send =
a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master br=
anch.
--=20
2.25.1


