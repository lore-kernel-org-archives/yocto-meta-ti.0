Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAACDC83F17
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 21:33:01 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1868.1753306379475603440
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 14:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bFHY8IP+;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56NLWvGC1805363;
	Wed, 23 Jul 2025 16:32:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753306377;
	bh=kTowLiWOxzFYrnCxtBlg+hOCzLe2uBqijqD89twLQjc=;
	h=From:To:Subject:Date;
	b=bFHY8IP+f1aJrdzE/XbtrH9gVEoCS9shJyKw9XNX21VK5G3bLxGTe0GBvH7eevBW8
	 +4VwSsZ6cs+UQiVnl/+0cF51R7JB6jrIapI9aYlnfGWOmBR7XIMeT07FWvA7Ags3vJ
	 JcQoppaoKl3q2Mr8q7SbIDm7vEBaq5EaadnAGfPU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56NLWvMu3089162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 23 Jul 2025 16:32:57 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 23
 Jul 2025 16:32:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 23 Jul 2025 16:32:56 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56NLWv193611207;
	Wed, 23 Jul 2025 16:32:57 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ueh56-0004S3-TX; Wed, 23 Jul 2025 16:32:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v2 1/2] meta-ti-bsp: Add KERNEL_DEVICETREE_PREFIX logic to Arago images
Date: Wed, 23 Jul 2025 16:32:55 -0500
Message-ID: <20250723213256.17071-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Jul 2025 21:33:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18817

The boot partition for things like the wic image, use the
KERNEL_DEVICETREE to populate DTBs.  But for the meta-ti-bsp kernels we
tend to rely on the KERNEL_DEVICETREE_PREFIX to glob pull in DTBs
instead of a single list.  So using dynamic layers, we can inject the
proper code to properly resolve the KERNEL_DEVICETREE in each image
file.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Changed guard variable from arago to ti-soc and renamed .inc file.

 meta-ti-bsp/conf/layer.conf                                   | 1 +
 .../meta-arago-distro/recipes-core/images/image-ti.inc        | 3 +++
 .../recipes-core/images/tisdk-base-image.bbappend             | 4 ++++
 .../recipes-core/images/tisdk-bootstrap-base-image.bbappend   | 4 ++++
 .../recipes-core/images/tisdk-bootstrap-image.bbappend        | 4 ++++
 .../recipes-core/images/tisdk-default-image.bbappend          | 4 ++++
 .../recipes-core/images/tisdk-thinlinux-image.bbappend        | 4 ++++
 .../recipes-core/images/tisdk-tiny-image.bbappend             | 4 ++++
 8 files changed, 28 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/image-ti.inc
 create mode 100644 meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-base-image.bbappend
 create mode 100644 meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bbappend
 create mode 100644 meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bbappend
 create mode 100644 meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-default-image.bbappend
 create mode 100644 meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bbappend
 create mode 100644 meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bbappend

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index e3a28628..02519f76 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -23,6 +23,7 @@ LAYERRECOMMENDS_meta-ti-bsp = " \
 "
 
 BBFILES_DYNAMIC += " \
+    meta-arago-distro:${LAYERDIR}/dynamic-layers/meta-arago-distro/recipes*/*/*.bbappend \
     openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
 "
 
diff --git a/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/image-ti.inc b/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/image-ti.inc
new file mode 100644
index 00000000..31c6b6f7
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/image-ti.inc
@@ -0,0 +1,3 @@
+include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
+
+do_image_wic[depends] += "virtual/kernel:do_shared_workdir"
diff --git a/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-base-image.bbappend b/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-base-image.bbappend
new file mode 100644
index 00000000..db5a0dc5
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-base-image.bbappend
@@ -0,0 +1,4 @@
+IMAGE_TI = ""
+IMAGE_TI:ti-soc = "image-ti.inc"
+
+require ${IMAGE_TI}
diff --git a/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bbappend b/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bbappend
new file mode 100644
index 00000000..db5a0dc5
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bbappend
@@ -0,0 +1,4 @@
+IMAGE_TI = ""
+IMAGE_TI:ti-soc = "image-ti.inc"
+
+require ${IMAGE_TI}
diff --git a/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bbappend b/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bbappend
new file mode 100644
index 00000000..db5a0dc5
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bbappend
@@ -0,0 +1,4 @@
+IMAGE_TI = ""
+IMAGE_TI:ti-soc = "image-ti.inc"
+
+require ${IMAGE_TI}
diff --git a/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-default-image.bbappend b/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-default-image.bbappend
new file mode 100644
index 00000000..db5a0dc5
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-default-image.bbappend
@@ -0,0 +1,4 @@
+IMAGE_TI = ""
+IMAGE_TI:ti-soc = "image-ti.inc"
+
+require ${IMAGE_TI}
diff --git a/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bbappend b/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bbappend
new file mode 100644
index 00000000..db5a0dc5
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bbappend
@@ -0,0 +1,4 @@
+IMAGE_TI = ""
+IMAGE_TI:ti-soc = "image-ti.inc"
+
+require ${IMAGE_TI}
diff --git a/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bbappend b/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bbappend
new file mode 100644
index 00000000..db5a0dc5
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bbappend
@@ -0,0 +1,4 @@
+IMAGE_TI = ""
+IMAGE_TI:ti-soc = "image-ti.inc"
+
+require ${IMAGE_TI}
-- 
2.17.1


