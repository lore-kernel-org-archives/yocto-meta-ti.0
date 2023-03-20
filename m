Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4BBC77B60
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:39:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6333.1679283570087271848
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7167040CB3
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tXW_aMHkHf1k for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:39:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D154F40CB7
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:26 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id DF5DE1637CB
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 17/53] optee: update optee components to 3.20 tag
Date: Mon, 20 Mar 2023 03:38:49 +0000
Message-Id: <20230320033925.1306823-18-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033925.1306823-1-denis@denix.org>
References: <20230320033925.1306823-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16088

From: Manorit Chawdhry <m-chawdhry@ti.com>

OPTEE tests is not being upgraded due to a newer python dependency for
the build

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-client_%.bba=
ppend

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b=
/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
new file mode 100644
index 00000000..19db3827
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
@@ -0,0 +1,7 @@
+PV:ti-soc =3D "3.20.0+git${SRCPV}"
+SRCREV:ti-soc =3D "dd2d39b49975d2ada7870fe2b7f5a84d0d3860dc"
+
+inherit pkgconfig
+DEPENDS:append:ti-soc =3D " util-linux"
+
+EXTRA_OEMAKE:append:ti-soc =3D " PKG_CONFIG=3Dpkg-config"
--=20
2.25.1


