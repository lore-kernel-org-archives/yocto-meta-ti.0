Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308ABC77B73
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:39:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6423.1679283567071273695
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F41040C60
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nB0HnycJIZ05 for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:39:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6413E40C62
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:26 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4DD291637C7
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 03/53] optee-os: Enable OP-TEE TRNG in AM62X
Date: Mon, 20 Mar 2023 03:38:35 +0000
Message-Id: <20230320033925.1306823-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033925.1306823-1-denis@denix.org>
References: <20230320033925.1306823-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16063

From: Kamlesh Gurudasani <kamlesh@ti.com>

Enable trng support as trng support is added now in OP-TEE

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Acked-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/met=
a-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index c1adf6de..d483f25b 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -3,8 +3,6 @@ inherit ti-secdev
=20
 EXTRA_OEMAKE:append:k3 =3D "${@ ' CFG_CONSOLE_UART=3D'+ d.getVar('OPTEE_=
K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
=20
-EXTRA_OEMAKE:append:am62xx =3D " CFG_WITH_SOFTWARE_PRNG=3Dy CFG_TEE_CORE=
_LOG_LEVEL=3D1"
-
 do_compile:append:k3() {
     ( cd ${B}/core/; \
         cp tee-pager_v2.bin ${B}/bl32.bin; \
--=20
2.25.1


