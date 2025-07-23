Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0ADC87FC5
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 21:33:01 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.1948.1753306380048009607
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 14:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AYJ4ih+g;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56NLWwQb1805367;
	Wed, 23 Jul 2025 16:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753306378;
	bh=T0VTbF83VbdnzpU3QKGorFedY6lkQxUPgJEGOfJ9tJQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=AYJ4ih+gQlw3l2BrlkZIzVxlqc+NJqXs9Vel+O8vxDaVHkZ5m87CGHParuWa3e/as
	 r3j+L9dNvTrCPOxd9gNuIIhPflmvt3385qER68qRGOK/7e8U64Sqd6kX1MjE4KpDsC
	 8foQa3FeGaj5H7jVpJKblWvbI+0b6C7GhvSRYVA4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56NLWwBg1011927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 23 Jul 2025 16:32:58 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 23
 Jul 2025 16:32:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 23 Jul 2025 16:32:57 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56NLWvOO3317481;
	Wed, 23 Jul 2025 16:32:57 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ueh57-0004S5-0x; Wed, 23 Jul 2025 16:32:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v2 2/2] meta-ti-bsp: Add KERNEL_DEVICETREE_PREFIX logic to Poky images
Date: Wed, 23 Jul 2025 16:32:56 -0500
Message-ID: <20250723213256.17071-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250723213256.17071-1-reatmon@ti.com>
References: <20250723213256.17071-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Jul 2025 21:33:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18818

The boot partition for things like the wic image, use the
KERNEL_DEVICETREE to populate DTBs.  But for the meta-ti-bsp kernels we
tend to rely on the KERNEL_DEVICETREE_PREFIX to glob pull in DTBs
instead of a single list.  So using dynamic layers, we can inject the
proper code to properly resolve the KERNEL_DEVICETREE in each image
file.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Changed guard variable from poky to ti-soc and renamed .inc file.

 meta-ti-bsp/conf/layer.conf                                      | 1 +
 .../recipes-core/images/core-image-base.bbappend}                | 0
 .../recipes-core/images/core-image-minimal.bbappend}             | 0
 .../{meta-arago-distro => core}/recipes-core/images/image-ti.inc | 0
 4 files changed, 1 insertion(+)
 copy meta-ti-bsp/dynamic-layers/{meta-arago-distro/recipes-core/images/tisdk-base-image.bbappend => core/recipes-core/images/core-image-base.bbappend} (100%)
 copy meta-ti-bsp/dynamic-layers/{meta-arago-distro/recipes-core/images/tisdk-base-image.bbappend => core/recipes-core/images/core-image-minimal.bbappend} (100%)
 copy meta-ti-bsp/dynamic-layers/{meta-arago-distro => core}/recipes-core/images/image-ti.inc (100%)

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
diff --git a/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-base-image.bbappend b/meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-base.bbappend
similarity index 100%
copy from meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-base-image.bbappend
copy to meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-base.bbappend
diff --git a/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-base-image.bbappend b/meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-minimal.bbappend
similarity index 100%
copy from meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/tisdk-base-image.bbappend
copy to meta-ti-bsp/dynamic-layers/core/recipes-core/images/core-image-minimal.bbappend
diff --git a/meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/image-ti.inc b/meta-ti-bsp/dynamic-layers/core/recipes-core/images/image-ti.inc
similarity index 100%
copy from meta-ti-bsp/dynamic-layers/meta-arago-distro/recipes-core/images/image-ti.inc
copy to meta-ti-bsp/dynamic-layers/core/recipes-core/images/image-ti.inc
-- 
2.17.1


