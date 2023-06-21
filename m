Return-Path: <d.schultz@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E983EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 07:58:35 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web10.5849.1687334310305063117
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 00:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@phytec.de header.s=a4 header.b=K8x9b8E3;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: d.schultz@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1687334307; x=1689926307;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a04ZUPVk1KbmLtkHUqIO2iL8kD2uYbvOJvN0acfP5i0=;
	b=K8x9b8E3UfCCRWPeF621cKpmeud9E1Io4YbC/LcinyPi9rQgdPdsLRj0Y7+EXtRN
	ZJ1X0KQORRlTPwAQz6DPANQ5iAg9pg98Ltk7hP1gfDHSpmwIsVzZOsESaVQHutjT
	0ZhB36071K4zO4+oyeyP5GeTBZknRCgbNoJ71JOqPvk=;
X-AuditID: ac14000a-923ff70000007ecb-5f-6492ada33584
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 8C.BB.32459.3ADA2946; Wed, 21 Jun 2023 09:58:27 +0200 (CEST)
Received: from ls-radium.phytec (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 21 Jun
 2023 09:58:26 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <meta-ti@lists.yoctoproject.org>
CC: Daniel Schultz <d.schultz@phytec.de>
Subject: [kirkstone+][PATCH] ti-img-rogue-umlibs: Make x11 dependency optional
Date: Wed, 21 Jun 2023 00:58:11 -0700
Message-ID: <20230621075811.1998481-1-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsWyRpKBR3fx2kkpBhs28lvM/XKLzYHRY+ap
	R8wBjFFcNimpOZllqUX6dglcGVNnHGcu2MFdcfHENKYGxsOcXYycHBICJhIPnlxi7GLk4hAS
	WMIkseb+DFYI5wGjxP6TK5hAqtgEtCTubJnLDGKLCKhITNw2D6iIg4NZQEOi/RlYibCAn0TP
	6pOMIDaLgKrE4vfnwGxeASuJj51/WCCWyUvMvPSdHSIuKHFy5hOwODNQvHnrbGYIW0Li4IsX
	YLaQgILE7G2TGWF6p517zQxhh0ps/bKdaQKjwCwko2YhGTULyagFjMyrGIVyM5OzU4sys/UK
	MipLUpP1UlI3MYKCT4SBawdj3xyPQ4xMHIyHGCU4mJVEeIP29qUI8aYkVlalFuXHF5XmpBYf
	YpTmYFES573fw5QoJJCeWJKanZpakFoEk2Xi4JRqYPSqYu1bV3gvc7a0FNeGgNKfjTO+2awI
	+f7KOIzzpcqhq4ciFIvn5c9lfH+4arvvLr2DAhNvh5YE2F5XYdp6XeuLlqG2iJ3OhN/c2Tw9
	mo9+bAziC8t3jZ2dN3v25jOpvvxfFzAlSERpz55n0Bh5IXdOxgT3Hk25CEWm9PWsn1Sn87eV
	bUh9pMRSnJFoqMVcVJwIAPOkjDQsAgAA
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Jun 2023 07:58:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16757

libx11-xcb has a hard dependency for x11 but is included by the
libvk-rogue package. Only include libvk-rogue when the
DISTRO_FEATURES "vulkan x11 wayland" are enabled, which is identical
to the RRECOMMENDS variable.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 .../powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
index 26090038..23596895 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -33,13 +33,16 @@ do_install:append() {
         mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
         rmdir ${D}/lib
     fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'false', 'true', d)}; then
+        rm -rf ${D}${libdir}/libVK_IMG.so*
+    fi
 }
 
 PACKAGES = " \
     libgles1-rogue libgles1-rogue-dev \
     libgles2-rogue libgles2-rogue-dev \
     libgles3-rogue libgles3-rogue-dev \
-    libvk-rogue libvk-rogue-dev \
+    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan x11 wayland", "libvk-rogue libvk-rogue-dev", "", d)} \
     libopencl-rogue libopencl-rogue-dev \
     libopencl-rogue-tools \
     ${PN}-tools \
-- 
2.25.1


