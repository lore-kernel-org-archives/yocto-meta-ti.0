Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7240BC282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 20:30:54 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
 by mx.groups.io with SMTP id smtpd.web11.37017.1742157045051273661
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 16 Mar 2025 13:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@valla.it header.s=default header.b=LJ7HH2KS;
 spf=pass (domain: valla.it, ip: 185.56.87.9, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-pdhm.prod.antispam.mailspamprotection.com; s=arckey; t=1742157045;
	 b=ZoM7AMFsGPA+zRWN5RzCGeLqQHnkPIzHwJ87nHjnA/coq0EusxR1s9u7fBxocN1iNUR6Y+GG0X
	  wg6VHCyGJBmUqNbcw7Scir/hin1Zi42SfXtFYzZfEzC7QU8OyvU/ETYcOfL0j21Mb+GIVxm/k1
	  6+1eXU+lgUKvTeyN1HNpfeLQDC93spU/2Vp9pcd09T3JLumOBW0/w2fTMi/S1ldVd12iMxYov7
	  HeYOxh2Die5y++s/HxifpxiTCZ2FdHex1OSr2g74xUsvcofgqT1w86LcuzZomiOCb7yYqMQVSA
	  bLJUvKsd/akFoO0w+YK1eGAaMYBLVwrJnnf0OgV0YTybCA==;
ARC-Authentication-Results: i=1; instance-europe-west4-pdhm.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-pdhm.prod.antispam.mailspamprotection.com; s=arckey; t=1742157045;
	bh=ZfFQw9kRABBIXhwmPveexab+vUqoYiiWSqcgRGHxi3Y=;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	  DKIM-Signature;
	b=UFIpWGcThdonLLZe4cTbTXEoYFm94KKN7lwxZ/bbLxuQBsDziOSN4bJkC3IEzJjvVr3efQA/42
	  RA+sZXDn3dQDAYZat5c1l+QmQaaYaefStN3cRscRticHpa6ZHBZ7mLQDTMeviguyPYtIaniuWG
	  aAlEW9BmVA/FO8NkaEUoU2qcskHp1Gp1K/sJLSxIuH1FkMUQoWXyqTnajG8Md4x8ftZcbfeW7x
	  VxKJIhv1Zpr7EPK6eYlHJ/StQM+BIFW6PIr81dp6m+u6ZiAw/pfwhSb6puurhrzmaolGburMyj
	  zoyTs1D07+62BgoSHSLPtqfIkg2TDqPmo9XkwZYfWgHhkQ==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-pdhm.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1ttud6-00000004Ug3-3Zje
	for meta-ti@lists.yoctoproject.org;
	Sun, 16 Mar 2025 20:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:To:From:cc:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=iY7HhgL4YwDlaI0MncsrXVUwGKohI8m6oAwTvZU8P5E=; b=LJ7HH2KS4HAoaqs8dLc0vA046E
	pFeeP3eMOGhitn7lVh5SiQqpjs9JOu4gNUlPr25dMnmbkyQ6nwHc8rSiCwsFFQ6A1Pnf7DkvPtgDp
	AFhwcJVdwbKCrYZZlfqHJ3hlXYZ5ICPF2pGRHUuwaAVGrz9Tbi1/gxFhjeDCgX/SsXT4=;
Received: from [95.233.219.167] (port=61336 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1ttud1-000000006RM-3Q8K
	for meta-ti@lists.yoctoproject.org;
	Sun, 16 Mar 2025 20:30:36 +0000
From: Francesco Valla <francesco@valla.it>
To: meta-ti@lists.yoctoproject.org
Subject: [scarthgap/master][PATCH] optee-os: drop custom handling of embedded TAs
Date: Sun, 16 Mar 2025 21:28:48 +0100
Message-ID: <20250316202847.2709587-2-francesco@valla.it>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 27adfb255b55e06f55bbc8b0c0a3de46
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-pdhm.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 16 Mar 2025 20:30:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18391

The meta-arm layer, which is the provider of the base recipe for
optee-os, added [1] a separate optee-os-ta package for the embedded TAs
that are compiled as part of the OPTEE OS build process. However, the
TI overrides for optee-os include the embedded TAs inside the base
package, leaving the optee-os-ta package empty (and thus not
installable).

Align to the meta-arm behaviour and simply add a runtime dependency on
optee-os-ta for optee-os. While keeping backward compatibility, this
allows to install only the embedded TAs - reducing the required disk
space - on platforms on which the OPTEE OS is loaded from an external
boot image rather than being fetched from the root filesystem, like the
K3 SoCs.

[1] https://patchwork.yoctoproject.org/project/arm/patch/20230630112340.3314395-1-r.czerwinski@pengutronix.de/

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 .../recipes-security/optee/optee-os-ti-overrides.inc       | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index 5756f3ff..ae6cca74 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -47,10 +47,6 @@ do_install:append() {
     install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
     install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
     install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ || true
-
-    # Install embedded TAs
-    mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
-    install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base_libdir}/optee_armtz/
 }
 
 optee_deploy_legacyhs() {
@@ -73,7 +69,8 @@ do_deploy:append:k3() {
     ln -sf optee/bl32.elf ${DEPLOYDIR}/
 }
 
-FILES:${PN} += "${nonarch_base_libdir}/optee_armtz/"
+# Make the OS depend on embedded TAs
+RDEPENDS:${PN} += "${PN}-ta"
 
 # This is needed for bl32.elf
 INSANE_SKIP:${PN}:append:k3 = " textrel"
-- 
2.48.1


