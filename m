Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.21296.1643238559645047608
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 169B240CB6;
	Wed, 26 Jan 2022 23:09:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PuTFE5tEwRkk; Wed, 26 Jan 2022 23:09:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 01CC940CB5;
	Wed, 26 Jan 2022 23:09:17 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C503F17472F;
	Wed, 26 Jan 2022 18:09:16 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 7/7] meta-ti: move beaglebone-specific components to meta-ti-extras
Date: Wed, 26 Jan 2022 18:09:10 -0500
Message-Id: <1643238550-20765-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238550-20765-1-git-send-email-denis@denix.org>
References: <1643238550-20765-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Move beagleboard.org beaglebone componentns to meta-ti-extras.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-ti/beagleboard/beaglebone-capes.bb                            | 0
 .../recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh                  | 0
 .../recipes-ti/beagleboard/beaglebone-capes/cape.service                  | 0
 .../recipes-ti/beagleboard/beaglebone-capes/cape.sh                       | 0
 .../recipes-ti/beagleboard/beaglebone-getting-started.bb                  | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/gadget-init.bb     | 0
 .../recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules             | 0
 .../recipes-ti/beagleboard/gadget-init/g-ether-load.sh                    | 0
 .../recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh           | 0
 .../recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh              | 0
 .../recipes-ti/beagleboard/gadget-init/network-gadget-init.service        | 0
 .../recipes-ti/beagleboard/gadget-init/storage-gadget-init.service        | 0
 .../recipes-ti/beagleboard/gadget-init/udhcpd.conf                        | 0
 .../recipes-ti/beagleboard/gadget-init/udhcpd.rules                       | 0
 .../recipes-ti/beagleboard/gadget-init/udhcpd.service                     | 0
 .../recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh  | 0
 16 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/beaglebone-capes.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/beaglebone-capes/cape.service (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/beaglebone-capes/cape.sh (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/beaglebone-getting-started.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/gadget-init.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/gadget-init/g-ether-load.sh (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/gadget-init/network-gadget-init.service (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/gadget-init/udhcpd.conf (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/gadget-init/udhcpd.rules (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/gadget-init/udhcpd.service (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh (100%)

diff --git a/meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes.bb b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes.bb
rename to meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh
rename to meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape.service b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes/cape.service
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape.service
rename to meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes/cape.service
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape.sh b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes/cape.sh
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape.sh
rename to meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes/cape.sh
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/beaglebone-getting-started.bb b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-started.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/beaglebone-getting-started.bb
rename to meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-started.bb
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init.bb b/meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init.bb
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-ether-load.sh b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-ether-load.sh
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-ether-load.sh
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-ether-load.sh
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/network-gadget-init.service b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/udhcpd.conf b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.conf
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/udhcpd.conf
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.conf
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/udhcpd.rules b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.rules
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/udhcpd.rules
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.rules
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/udhcpd.service b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.service
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/udhcpd.service
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.service
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh
-- 
2.7.4

