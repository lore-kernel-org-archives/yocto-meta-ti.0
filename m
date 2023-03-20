Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AD1C7EE33
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 04:12:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6791.1679285564444610627
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 21:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B8EC440C5D
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WZ0ykiEtydd8 for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 04:12:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AEB9940C50
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9D9731637C3
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 00:12:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 10/54] optee-os: Lower log level for am62axx
Date: Mon, 20 Mar 2023 04:11:57 +0000
Message-Id: <20230320041241.1293077-11-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320041241.1293077-1-denis@denix.org>
References: <20230320041241.1293077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16114

From: Praneeth Bajjuri <praneeth@ti.com>

Lower the log level for am62axx platform

commit 27641e1f2d7f ("optee-os: Lower log level for AM62x")
changes the log level for am62xx platforms.
This patch is to extend the same for am62axx

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Reported-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend b=
/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
index 662a3c31..2aa34530 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
@@ -7,6 +7,7 @@ inherit ti-secdev
 EXTRA_OEMAKE:append:k3 =3D "${@ ' CFG_CONSOLE_UART=3D'+ d.getVar('OPTEE_=
K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
=20
 EXTRA_OEMAKE:append:am62xx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
+EXTRA_OEMAKE:append:am62axx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
=20
 do_compile:append:k3() {
     ( cd ${B}/core/; \
--=20
2.25.1


