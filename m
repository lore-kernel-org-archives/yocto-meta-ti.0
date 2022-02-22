Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8945.1645503245149762853
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 94ED240C8F
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n07_STIUNQiz for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 808CE40C86
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 492BE174774
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 09/17] ti-ipc: use fuller path when including common files
Date: Tue, 22 Feb 2022 04:13:53 +0000
Message-Id: <20220222041401.2840172-10-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041401.2840172-1-denis@denix.org>
References: <20220222041401.2840172-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Some .inc file now span across layers, so use fuller path to find them wh=
en
including.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc | 2 +-
 meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc b/meta-ti-=
extras/recipes-ti/ipc/ti-ipc-examples.inc
index 66cd5d32..c34a6078 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
@@ -1,5 +1,5 @@
 HOMEPAGE =3D "http://processors.wiki.ti.com/index.php/Category:IPC"
-require ti-ipc-common.inc
+require recipes-ti/ipc/ti-ipc-common.inc
 require ti-ipc-rtos.inc
=20
 LICENSE =3D "BSD"
diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb b/meta-ti-e=
xtras/recipes-ti/ipc/ti-ipc-rtos_git.bb
index abef3195..60230a07 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -1,5 +1,5 @@
-require ti-ipc.inc
-require ti-ipc-common.inc
+require recipes-ti/ipc/ti-ipc.inc
+require recipes-ti/ipc/ti-ipc-common.inc
 require ti-ipc-rtos.inc
=20
 DEPENDS =3D "ti-xdctools-native ti-sysbios doxygen-native zip-native"
--=20
2.25.1

