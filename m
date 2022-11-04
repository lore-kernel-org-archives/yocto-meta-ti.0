Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EEBC4321E
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.204.1667598066618296233
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 179CD40D52
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u5qTLGe9a83l for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:41:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 48D5A40DA4
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 00F501636AB
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:53 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 37/47] j721s2 and j784s4: Correct serial console device
Date: Fri,  4 Nov 2022 21:40:45 +0000
Message-Id: <20221104214055.1221197-38-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214055.1221197-1-denis@denix.org>
References: <20221104214055.1221197-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15272

From: Ryan Eatmon <reatmon@ti.com>

Serial console in J721S2/J784S4 EVM config was set to ttyS10.  It should =
be ttyS2.
This caused sysv based systems (eg, tiny) to apparently hang because of n=
o login prompt.
This didn't show up as a problem on systemd systems (eg, default) because=
 systemd will
automatically setup a serial tty with the console option passed in on the=
 kernel command line
(using console=3D...), which U-Boot correctly passes in as ttyS2 for J721=
S2/J784S4.

Signed-off-by: Jonathan Humphreys <j-humphreys@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/j721s2-evm.conf | 2 +-
 meta-ti-bsp/conf/machine/j784s4-evm.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/=
machine/j721s2-evm.conf
index 77fc3e66..46d5dbf6 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -4,7 +4,7 @@
=20
 require conf/machine/include/j721s2.inc
=20
-SERIAL_CONSOLES =3D "115200;ttyS10"
+SERIAL_CONSOLES =3D "115200;ttyS2"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
 TFA_K3_USART =3D "0x8"
 OPTEE_K3_USART =3D "0x8"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/=
machine/j784s4-evm.conf
index a8ad25f6..278b393c 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/j7.inc
=20
 MACHINE_FEATURES +=3D "gpu"
=20
-SERIAL_CONSOLES =3D "115200;ttyS10"
+SERIAL_CONSOLES =3D "115200;ttyS2"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
 TFA_K3_USART =3D "0x8"
 OPTEE_K3_USART =3D "0x8"
--=20
2.25.1


