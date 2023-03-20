Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684B5C7619A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:39:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6440.1679283571938812803
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A7A5540CBE
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LsupWR9ixlzb for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:39:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 63F5640C62
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:28 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7D0DF1637C7
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:56 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 52/53] linux-ti-staging: update to the latest from Dunfell
Date: Mon, 20 Mar 2023 03:39:24 +0000
Message-Id: <20230320033925.1306823-53-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033925.1306823-1-denis@denix.org>
References: <20230320033925.1306823-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16104

From: Denys Dmytriyenko <denys@konsulko.com>

Match the latest sha used in Dunfell.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb=
 b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index e872b86e..c950fc80 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-5.10:"
=20
 BRANCH =3D "ti-rt-linux-5.10.y"
=20
-SRCREV =3D "fe20c3f42e9028a31cb79439c40d3e18d2207342"
-PV =3D "5.10.145+git${SRCPV}"
+SRCREV =3D "c1a12919117a6978f40e723d6e0c67c744e026b9"
+PV =3D "5.10.168+git${SRCPV}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 8e6bd788..8bf92590 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -22,8 +22,8 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH =3D "ti-linux-5.10.y"
=20
-SRCREV =3D "8b51d20b6e6e1b9277b59b7aaed8a97eff43097f"
-PV =3D "5.10.145+git${SRCPV}"
+SRCREV =3D "2c23e6c538c879e380401ae4b236f54020618eaa"
+PV =3D "5.10.168+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
 MACHINE_KERNEL_PR:append =3D "b"
--=20
2.25.1


