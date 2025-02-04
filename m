Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1479BC02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:49:38 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.116668.1738676975766428271
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 05:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xOWuCUUP;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 514DnWpt2402904
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 4 Feb 2025 07:49:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738676972;
	bh=psSqggAT0eIK0wGiv+gYlgZRvREn2j5dABNpp8Ar+6w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xOWuCUUPVtzgY864PDPj8IvDtWQUcKufdEjsAgRZMjQwllPKXwoHb3v1PtLZgMpFv
	 HJ8pkIztJ31t1m8nnEbqIHkJwo7K3D4CwspzuiC7thVcbhS3dmP3QRRvgn0777Rdo6
	 c6iC+yDQJ3CBpCUKHDH1oVT8nMy+1YQB18unaMdE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514DnWqa114229;
	Tue, 4 Feb 2025 07:49:32 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 07:49:32 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 07:49:32 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514DnVtf043425;
	Tue, 4 Feb 2025 07:49:31 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH 1/3] trusted-firmware-a: Switch TFA to TI fork
Date: Tue, 4 Feb 2025 19:19:23 +0530
Message-ID: <20250204134925.968150-2-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204134925.968150-1-c-shilwant@ti.com>
References: <20250204134925.968150-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Feb 2025 13:49:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18256

- While TFA patches for K3-based AM62L platform are under
review upstream, temporarily switch to TI's GitHub fork
for all K3 platforms to prevent disruptions and ensure timely bringup

- Also update the PV & LIC_FILES_CHKSUM as well

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../trusted-firmware-a/trusted-firmware-a-ti.inc         | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index ebb13bbd..e4a9c49b 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,7 +1,8 @@
-PV:k3 = "2.11+git"
-SRCREV_tfa:k3 = "58b25570c9ef91753b14c2103f45f4be9dddb696"
-LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=83b7626b8c7a37263c6a58af8d19bee1"
-SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
+PV:k3 = "2.12+git"
+SRCREV_tfa:k3 = "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
+LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
+SRC_URI:k3 = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https;name=tfa;branch=ti-master"
+
 COMPATIBLE_MACHINE:k3 = "k3"
 TFA_BUILD_TARGET:k3 = "all"
 TFA_INSTALL_TARGET:k3 = "bl31"
-- 
2.34.1


