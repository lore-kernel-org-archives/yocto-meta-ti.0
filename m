Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A258C4332F
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 17:44:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.214.1651772675624105878
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 May 2022 10:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 190B340C3A;
	Thu,  5 May 2022 17:44:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ogukmjlPmWBx; Thu,  5 May 2022 17:44:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0818540C3E;
	Thu,  5 May 2022 17:44:34 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id AEE8C174921;
	Thu,  5 May 2022 13:44:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 5/5] ti-rtos-firmware: remove duplicate assignment
Date: Thu,  5 May 2022 17:44:22 +0000
Message-Id: <20220505174422.334666-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505174422.334666-1-denis@denix.org>
References: <20220505174422.334666-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 May 2022 17:44:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14708

From: Denys Dmytriyenko <denys@konsulko.com>

FILES:${PN} is being assigned twice, remove duplicate.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index f3912784..93429570 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -33,8 +33,6 @@ PR =3D "${INC_PR}.0"
 # Secure Build=20
 DEPENDS +=3D "openssl-native"
=20
-FILES:${PN} +=3D "${nonarch_base_libdir}"
-
 TI_SECURE_DEV_PKG ?=3D ""
=20
 RTOS_ETH_FW_DIR =3D "${S}/ti-eth/${PLAT_SFX}"
--=20
2.25.1


