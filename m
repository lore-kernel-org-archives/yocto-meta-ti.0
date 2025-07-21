Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A30C83F26
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 16:45:34 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.46119.1753116333381258055
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 09:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Zh/lrp7+;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LGjVwi1300805;
	Mon, 21 Jul 2025 11:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753116331;
	bh=01o7BC+qrSnyizljIxeeBGGGbvQfys7dQczG4So+soQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Zh/lrp7+vn5eAY8bbOtZTlnTMxpkofj4uKTc5SHh5oDC/vv4iaW5tqnum2brrzntr
	 MoxX7j6bzrIZoa9BTzDyf86L3RXev9tFvfsP9QVII36BMtM4FKui+2Ee2VPNEUtmQF
	 ixUN0kwOJ7A01efi2eiv/hNQD1elXyu4K1WEn0q8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LGjVxp409807
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 21 Jul 2025 11:45:31 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 11:45:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 11:45:31 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LGjVWk4146530;
	Mon, 21 Jul 2025 11:45:31 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1udtdr-0001qU-Au; Mon, 21 Jul 2025 11:45:31 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH 2/2] meta-ti-bsp: Add KERNEL_DEVICETREE_PREFIX logic to Poky images
Date: Mon, 21 Jul 2025 11:45:31 -0500
Message-ID: <20250721164531.7051-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250721164531.7051-1-reatmon@ti.com>
References: <20250721164531.7051-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 21 Jul 2025 16:45:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18803

The boot partition for things like the wic image, use the
KERNEL_DEVICETREE to populate DTBs.  But for the meta-ti-bsp kernels we
tend to rely on the KERNEL_DEVICETREE_PREFIX to glob pull in DTBs
instead of a single list.  So using dynamic layers, we can inject the
proper code to properly resolve the KERNEL_DEVICETREE in each image
file.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/layer.conf                                   | 1 +
 .../core/recipes-core/images/core-image-base.bbappend         | 4 ++++
 .../core/recipes-core/images/core-image-minimal.bbappend      | 4 ++++
 .../recipes-core/images/image-poky.inc}                       | 0
 4 files changed, 9 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-base.bbappend
 create mode 100644 meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-minimal.bbappend
 copy meta-ti-bsp/dynamic-layers/{meta-arago-distro/recipes-core/images/image-arago.inc => core/recipes-core/images/image-poky.inc} (100%)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 02519f76..828814ce 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -25,6 +25,7 @@ LAYERRECOMMENDS_meta-ti-bsp = " \
 BBFILES_DYNAMIC += " \
     meta-arago-distro:${LAYERDIR}/dynamic-layers/meta-arago-distro/recipes*/*/*.bbappend \
     openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
+    core:${LAYERDIR}/dynamic-layers/core/recipes*/*/*.bbappend \
 "
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
diff --git a/meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-base.bbappend b/meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-base.bbappend
new file mode 100644
index 00000000..b6c70dc5
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-base.bbappend
@@ -0,0 +1,4 @@
+IMAGE_POKY = ""
+IMAGE_POKY:poky = "image-poky.inc"
+
+require ${IMAGE_POKY}
diff --git a/meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-minimal.bbappend b/meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-minimal.bbappend
new file mode 100644
index 00000000..b6c70dc5
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-minimal.bbappend
@@ -0,0 +1,4 @@
+IMAGE_POKY = ""
+IMAGE_POKY:poky = "image-poky.inc"
+
+require ${IMAGE_POKY}
diff --git a/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/image-arago.inc b/meta-ti-bsp/dynamic-layers/core/recipes-core/images/image-poky.inc
similarity index 100%
copy from meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/image-arago.inc
copy to meta-ti-bsp/dynamic-layers/core/recipes-core/images/image-poky.inc
-- 
2.17.1


