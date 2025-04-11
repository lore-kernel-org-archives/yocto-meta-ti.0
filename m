Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4BBC36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 15:44:41 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.29838.1744386273097793644
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 08:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bTlAqfPj;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: anshuld@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BFiWqK1483512
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Fri, 11 Apr 2025 10:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744386272;
	bh=CgGwunhkhZaI4nVdWqK52Kw6W9eRzByDv5t+UwLmD3w=;
	h=From:To:CC:Subject:Date;
	b=bTlAqfPj+Ul1t1sSo+CuwU2BE5gWFA/S4pGcXrujH8iFJDLptEm6I1TysIX4z4+w9
	 5K4KbRE7y9X+Lvwjj486Pgf8u2DE/6dP63ZM08jX2iQdKdNViJerrOmV7m+oWxt905
	 ShEUc3HC1mCMe/wTtxOtCxPfJjuaZL2ov2m5EmJg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BFiWfc031262
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 11 Apr 2025 10:44:32 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 10:44:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 10:44:31 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BFiVxu017580;
	Fri, 11 Apr 2025 10:44:31 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <vigneshr@ti.com>
Subject: [PATCH v1] bsp: fitimage-legacyhs: add default dtb support
Date: Fri, 11 Apr 2025 21:14:17 +0530
Message-ID: <20250411154418.2951391-1-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 11 Apr 2025 15:44:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18461

FIT_CONF_DEFAULT_DTB config specifies the default dtb file for the
FITimage when multiple ones are provided[1].

Legacyhs fitimage does not currently support this feature which is
required for repurposing the same class for falcon boot.

This patch adds support for FIT_CONF_DEFAULT_DTB without affecting
existing platforms that rely on legacyhs fitImage.

[1]:
https://docs.yoctoproject.org/ref-manual/variables.html#term-FIT_CONF_DEFAULT_DTB

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 .../classes/kernel-fitimage-legacyhs.bbclass  | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass b/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
index 5e1fa56a..61813555 100644
--- a/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
+++ b/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
@@ -316,6 +316,7 @@ EOF
 # $4 ... ramdisk ID
 # $5 ... config ID
 # $6 ... tee ID/name
+# $7 ... default DTB ID
 fitimage_emit_section_config() {
 
 	conf_csum=${FITIMAGE_HASH_ALGO}
@@ -370,6 +371,16 @@ fitimage_emit_section_config() {
 		final_conf_desc="${conf_desc}"
 	fi
 
+	default_dtb_count=${7}
+	if [ "x${FITIMAGE_CONF_BY_NAME}" = "x1" ] ; then
+		default_conf_name="${FIT_CONF_DEFAULT_DTB}"
+	else
+		default_conf_name="conf-${default_dtb_count}"
+	fi
+	cat << EOF >> ${1}
+        default = "${default_conf_name}";
+EOF
+
 	dtbcount=1
 	for DTB in ${KERNEL_DEVICETREE}; do
 		DTB=$(basename "${DTB}")
@@ -386,12 +397,6 @@ fitimage_emit_section_config() {
 			fdt_line="fdt = \"fdt-${dtbcount}\";"
 		fi
 
-		if [ "x${dtbcount}" = "x1" ]; then
-			cat << EOF >> ${1}
-                default = "${conf_name}";
-EOF
-		fi
-
 # Generate a single configuration section
 			cat << EOF >> ${1}
                 ${conf_name} {
@@ -524,6 +529,7 @@ fitimage_assemble() {
 	ramdiskcount=${3}
 	setupcount=""
 	teecount=1
+	default_dtb_count=1
 	rm -f ${1} arch/${ARCH}/boot/${2}
 
 	fitimage_emit_fit_header ${1}
@@ -544,6 +550,9 @@ fitimage_assemble() {
 		dtbcount=1
 		dtboaddress="${UBOOT_DTBO_LOADADDRESS}"
 		for DTB in ${KERNEL_DEVICETREE}; do
+			if [ "${DTB}" = "${FIT_CONF_DEFAULT_DTB}" ]; then
+				default_dtb_count=${dtbcount}
+			fi
 			if echo ${DTB} | grep -q '/dts/'; then
 				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
 				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
@@ -660,7 +669,7 @@ fitimage_assemble() {
 	else
 		teeref="${teecount}"
 	fi
-	fitimage_emit_section_config ${1} "${kernelcount}" "${dtbref}" "${ramdiskcount}" "${setupcount}" "${teeref}"
+	fitimage_emit_section_config ${1} "${kernelcount}" "${dtbref}" "${ramdiskcount}" "${setupcount}" "${teeref}" "${default_dtb_count}"
 
 	fitimage_emit_section_maint ${1} sectend
 
-- 
2.49.0


