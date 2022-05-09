Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE46C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 17:59:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.600.1652119191388180720
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5F65140C87
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id guQ8nX3LvIQv for <meta-ti@lists.yoctoproject.org>;
	Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4065F40C56
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id DEDFB174923
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 13:59:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 02/10] recipes-kernel: setup-defconfig: Use SRCPV to
 update KERNEL_LOCALVERSION
Date: Mon,  9 May 2022 17:59:39 +0000
Message-Id: <20220509175947.1994132-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509175947.1994132-1-denis@denix.org>
References: <20220509175947.1994132-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 May 2022 17:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14718

From: Nishanth Menon <nm@ti.com>

Due to recent security update[1] in git, a subprocess will be unable
to run git rev-parse to fetch revision.

So instead, use the SRCPV to parse the short commit ID and set the
KERNEL_LOCALVERSION variable.

[1] https://github.blog/2022-04-12-git-security-vulnerability-announced/

Inspired-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc b/meta-=
ti-bsp/recipes-kernel/linux/setup-defconfig.inc
index 850a1dd8..1e97acc0 100644
--- a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
@@ -1,14 +1,6 @@
 # KERNEL_LOCALVERSION can be set to add a tag to the end of the
 # kernel version string.  such as the commit id
-def get_git_revision(p):
-    import subprocess
-
-    try:
-        return subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=3D=
p, shell=3DTrue, stdout=3Dsubprocess.PIPE, universal_newlines=3DTrue).com=
municate()[0].rstrip()
-    except OSError:
-        return None
-
-KERNEL_LOCALVERSION =3D "-g${@get_git_revision('${S}').__str__()[:10]}"
+KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV', True).split('+')[1]}"
=20
 # Check the defconfig file and see if it points to an in kernel
 # defconfig that should be used, or if it is a complete config file
--=20
2.25.1


