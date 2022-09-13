Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA66C6FA97
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:55:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.838.1663041349273973672
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6E96740D8C
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id seTI-WjJSqz7 for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 41CB940D94
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:45 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E026A174A04
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 56/65] ti-linux-fw: Create
 K3_IMAGE_GEN_BRANCH variable
Date: Tue, 13 Sep 2022 03:55:32 +0000
Message-Id: <20220913035541.2364351-57-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15071

From: Ryan Eatmon <reatmon@ti.com>

For the upcoming CICD flow we need to control the branch for
all of the needed packages.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-t=
i-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 8aaf1559..0d947b49 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -29,9 +29,11 @@ K3_IMAGE_GEN_SRCREV ?=3D "85a70059fc24242ea03653a5014b=
98100e4da2d6"
 SRCREV_imggen =3D "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT =3D "imggen"
=20
+K3_IMAGE_GEN_BRANCH ?=3D "master"
+
 SRC_URI =3D " \
 	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=3Dgi=
t;branch=3D${BRANCH} \
-	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=3Dgit;branch=3D=
master;destsuffix=3Dimggen;name=3Dimggen \
+	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=3Dgit;branch=3D=
${K3_IMAGE_GEN_BRANCH};destsuffix=3Dimggen;name=3Dimggen \
 "
=20
 S =3D "${WORKDIR}/git"
--=20
2.25.1


