Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C97C761AF
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:38:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6308.1679283533555865800
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E2F2E40301
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kcNC8voL2RF for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:38:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8814340CBF
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 0293A1637D6
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 18/54] optee: fix the sha for 3.20 tag
Date: Mon, 20 Mar 2023 03:38:04 +0000
Message-Id: <20230320033840.1193963-19-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033840.1193963-1-denis@denix.org>
References: <20230320033840.1193963-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16060

From: Manorit Chawdhry <m-chawdhry@ti.com>

The SHA for optee_os had been of 3.20-rc1 tag instead of 3.20 tag which
had been marked stable. Change the tag to 3.20.

Fixes: 280e7b4b3a17 ("optee: update optee components to 3.20 tag")

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend b=
/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
index b29553d6..a3fef348 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
@@ -1,5 +1,5 @@
 PV:ti-soc =3D "3.20.0+git${SRCPV}"
-SRCREV:ti-soc =3D "3bc3809afe372ca7e8216fc5d7a64e965bb4ad70"
+SRCREV:ti-soc =3D "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
=20
 # Use TI SECDEV for signing
 inherit ti-secdev
--=20
2.25.1


