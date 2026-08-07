Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323F7C5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 07:39:06 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37815.1786088337178416798
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Aug 2026 00:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Wq2gEkQI;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Ul+lVLFe;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6777bFQU2372698;
	Fri, 7 Aug 2026 02:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3FWNBj+mjIvd2G5dRP9IUkcPHE5JWohQy/sdfLKJu
	5c=; b=Wq2gEkQIn5H84PVX01d4tnzC2G/YzD6e+ozafU8QKxGMAgGk8mshesK9f
	Lv3gxVe3dhmcabw1S6MWo7OgNvgvCA64BaGupj0f3KbGDO90j5zq+nCdFabPV5cL
	nssNFahpiGV99cp/47wCZDou0Em3yxYU7WBWDiqnYjR8xt/Pxc2n0Mk7V8IDloZl
	vxOr465JZvrmCCdl9bVFUknAD3ZQLPHzkSwBYJfWkmx22EEZd33Y8iiLl/ZrvxP3
	11pGeSAh56PvMiS4HagPv3m9d4e5cyPILlb4g0id+EypvmtUGfMnHqSVgjpQ5VA3
	7fqc1cNTgbznNHQfdKIYAdkphzNCA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013050.outbound.protection.outlook.com [40.93.196.50])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fwb4rr0c8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 02:38:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rnhc1SKqQufZ/T7XkcVXOOBjY29fdEccp6IwBAxAml4rgufyNkMzcJzykGs68DkFhLwOwMFJWOO5TENgkTrC0y6tIHevFa2CiJxQh0LV64LKhYfhPp3BMzVWrkH2lQ0lLbnFFFCA3IoGV5Q/r0XziOxgeqEFZ1nGgsgJuVo73WAEVftBLrtO8BrVAKg6kXvPsDpcQB1YY2uEpYhO31/xoMuDBoUbfBKCmwon6MGPeW8TTYS3v9+B+T57+hjQYf2DFt5O1gIPiDwD7YqkqbJGi88hEyaW6Sr6TLawhy+phmgz59Xt4lXqtYJkPwNvh2kwcgf4zhMudt80ct7Y/YBfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FWNBj+mjIvd2G5dRP9IUkcPHE5JWohQy/sdfLKJu5c=;
 b=d3g0sx/WJVp6CbGHLlWZvGWG8Gax9PtRMaeojwAnz1AtCY04hbEbMrl0dMWvW3+raWHaKMt4IEW7ojCC7qUWDz7TUGBiq+6/7dGEJ3EI8zZ/7Tz+V138DWLn44W9QOndnep82fVKad6y50yjygxOD/XQwS4YI6ZAPIV0T03bRfwOwsF/VA8YPeLEI5MbnCHhMFco5BgLS5DeaFytSVuNqjpaFa0YoDhFf7sDnA8TpaXgsrwrBbFRZHo0XC/zsDsAoY1y5FR/RlFXMV5wff9DCuIshW8hPBYdtEQKh5Dc98pwGR45RfynOrbnUZkYwPlfpWfaruIwGDj97NjbAZiLdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FWNBj+mjIvd2G5dRP9IUkcPHE5JWohQy/sdfLKJu5c=;
 b=Ul+lVLFeOpnR+g8mMJoyBVG7kGxrrtqIkJZytnc4Iq6mBi64zx7bl/7lzcyrXEacJ3xXq3RdyCAumOZdOrz4Qzv4QAkd4ddUdIH8c1NoJVZkgjGwsh5kQWu2gFBW7U2SFLddgaqA5YbOVP0FYL9s1+iWpaNYgHFGr0uCSbvVlSc=
Received: from DS7P220CA0099.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25d::18) by
 DM4PR10MB6718.namprd10.prod.outlook.com (2603:10b6:8:112::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.19; Fri, 7 Aug 2026 07:38:47 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:8:25d:cafe::99) by DS7P220CA0099.outlook.office365.com
 (2603:10b6:8:25d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.24 via Frontend Transport; Fri, 7
 Aug 2026 07:38:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 07:38:45 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 02:38:44 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 02:38:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 02:38:44 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6777ccMr647375;
	Fri, 7 Aug 2026 02:38:41 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [meta-ti][scarthgap][PATCH v3 1/4] initramfs: add ti-core-initramfs image and packagegroup
Date: Fri, 7 Aug 2026 13:08:34 +0530
Message-ID: <20260807073837.1394655-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807073837.1394655-1-m-shah@ti.com>
References: <20260807073837.1394655-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|DM4PR10MB6718:EE_
X-MS-Office365-Filtering-Correlation-Id: 20268873-0cdd-4dff-166d-08def456e9d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|6133799003|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	gEoldOi0m03IYM4ZhzWfdfeMYwU7zcTUwq0PhXsEVWrLk6q2MoeS5eGhwKL5GY+SMd2oVLaFOIprj1Kb36vzxMKqEKn/5raLHr+pmYWOceof4pwianIObLORpT6iekJfKAe4QYHJSWfYc8KyRJ1Cbs0wh32mBFadKIVj5gAnWcByuvcf2Vx+wxEsW4+m5sAphO/VKPO1Jr59WQDgxzWeYeKnhxFpJpYVukWThxJKg2/CHJHIn8+T9dzqytA1zs8q6rm8xgu8kGRGdYgsNE0sbFHMNEhYYu2Ogl83CK+QcKW8PgBwB/a4I0ySgI729hmMwAOzFL2l8xDvqyDWK8+hF8AM5Q6ZaFM4X9dOQctvV67eTjDNXi6SAXt/HBi+HhsvlEgnEg0o1SaaUANefJeIIeYNahdVgwG7zCU1RPvtgSi/lkZ+SrygsiJ0D0mf80DGijFMHh7lijJNTyjOJow+SdfCo8BLq3ezEJSDeEcsmAmG3x/9LnqFtDqqJ07vcbg8nFuBUkVKWnNw/Lx+oDSmy1prfCwI/H8CIJAfTd0GEBU4EhlgNM3HT29pD2ojv6ZMS9kaMfVt70IKmclNVxpb5ZmErp3/uVvRXbdCVcdnewq5gDlEmvRyRKZEh5pPoYk6lXhG96CT9smIXKZU0bBc32cUKoJ9jWqAYmjQKlTfpkz4RWN3wJDTGx8SIxKfL5A7Sqj0SF+I+3mV38bRPetdTg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MUwCrv+eIjvuWit8JaAyJOAfyEuqkpxlStd0q+147W3Vr9R/hKcXpDG3+mRGIUfy8ACpfj7SxWj/QouiEbDh7FRxShqjkRGWiktfF+qINDAU06ssmrQ//3eNsSsOtMFhqgSpZUxYvTx0nYi4KhekSDhJ6AIVMc9TPxNDYy7pvXMrMkom5QiHw21GEhbO/oXU6rAz9sOzn9EeucCAMI5/Wq64KxnrJSDHgI16P6U5rjnKZKXScgbQGDTyBQRqbAH7GzdezMbgotl/yxcpw3STLvjdw6e0ltnmAQ3Ab/mnm4FAaz+S1WMuzodtuhAMLuq5+qOBxnfm9Ek9i0w/X/l64iz6b2xHbq88DMeffZ1yq3YGfaBghNNt1nXWiYPifd80C0iWr/tylYRq1XRgBzc5cciyMDo/LihGbWKzhzH9i3edDRNeBQaKW3R/yShI56R3
X-Exchange-RoutingPolicyChecked: 
	HmtC1A36C+GdbJW43+k5B4gYQbTirIaoDyGDiIAoBGofL8ZcPoF9aNOjsJlfxrU44wk9CdfybRX08pcNOr0r5n1L+vYBk1efE1vU4MLr4W9JFcIlYoHPavOHrT242vX6018iNhlfVTZav/c4x6CDCBQ+vHwYy/6dlJc9TqfVbzjpKETDnpVzNlWVMBZSjzBkI3zGvr2qLVGWGAMeC+yDip33BsqWeeMP17B6rtduDIAz2MqI9umKjCjiBmFaMXRm7dhu7HwddCYpJO6y/geeMREDOUO7vM+bype0b3Lvb+qQ1nKIdR1Uu/dojUqv1IAEpXZVqCOxV9/K4KM7CWHyjQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:38:45.9821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20268873-0cdd-4dff-166d-08def456e9d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6718
X-Authority-Analysis: v=2.4 cv=LI9WhpW9 c=1 sm=1 tr=0 ts=6a758b8e cx=c_pps
 a=TdY+Vr9RQ+qa4geS/iuwdA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=_X8Bcqz0ue9J94y1HSkA:9
X-Proofpoint-GUID: fRm5j5tEE5ePQKnsSSqjYkUbJ7QQS_9l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1NSBTYWx0ZWRfX6dNrQ4HxDtmp
 O2I2SBFZ+KIpDAWNvxWQEJ9JMXjHGUxcwemwQK/DzJegTQirq9vNOLWu+ifBbqrIoWZd+s9oXGp
 3YzAIx4ogGBtPvp8BAg4poJ8D8uevMAS6BoqkMGefKdq0b1biR6IFHIPnE0G+3HIqBVrMXgezll
 LaIoEQbf2qdiUprECqsdyZuencqgw9XNcaGzNhpW44x92JMhf2+yzPapMQQJjJoBEHF9+BCx/hk
 vJQjsPV3+AkfZh6d6eSo3PrZZDiBGXGQSo7RgogFaRed+Ev8S3vTv4dpPNlOpRf5Exgm/+QzscK
 zl82c1iLNiNm3K4ER3X1gqZVN1dj6qAAW8apIdrQRi6oEZl7tWrnMJmcrw5Zdx8e9y5Oegg7S0S
 sz2upkOK6Jo9ViB18OnK+41xunTr136F16DyES/XXV9S+G+TbmjkufVN5kQypfHC9pHtV+xvTWG
 +P/aLTTofuNlCn3CgMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1NSBTYWx0ZWRfXyPcF6n019COn
 YduwJ+1ZZqWGsaLRb3FQC0Wots5m+ZmGWhljtC2796mzLo/FbCOX/gVShnqF6S32i99ikZhFrTP
 BmufFxoHg+3tfITntm+nWPKg37j505k=
X-Proofpoint-ORIG-GUID: fRm5j5tEE5ePQKnsSSqjYkUbJ7QQS_9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070055
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 07:39:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20236

Introduce a minimal initramfs image used to probe boot-essential and
other modules that cannot be built directly into the upstream Linux
kernel image without growing it unnecessarily. ti-soc.inc wires the
enable/trigger logic (ti-core-initramfs.inc) in so any K3 image's
do_image_wic automatically depends on it once
TI_CORE_INITRAMFS_ENABLED is set.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
v3: Add missing PV = "1.0" to both new recipes
v2: Simplified subject line

 .../machine/include/ti-core-initramfs.inc     | 23 +++++++++++
 meta-ti-bsp/conf/machine/include/ti-soc.inc   |  1 +
 .../packagegroup-ti-core-initramfs.bb         | 27 +++++++++++++
 .../recipes-ti/initramfs/ti-core-initramfs.bb | 39 +++++++++++++++++++
 4 files changed, 90 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb

diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
new file mode 100644
index 00000000..15c05e04
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
@@ -0,0 +1,23 @@
+#------------------------------------------------------------------------------
+#
+# To turn off the ti-core-initramfs.cpio creation just set:
+#
+#   TI_CORE_INITRAMFS_ENABLED = "0"
+#
+#------------------------------------------------------------------------------
+TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
+
+TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
+TI_CORE_INITRAMFS_EXTRA_INSTALL ?= ""
+
+TI_CORE_INITRAMFS_IMAGE = "ti-core-initramfs"
+TI_CORE_INITRAMFS_IMAGE_FILE = "${TI_CORE_INITRAMFS_IMAGE}.cpio.xz"
+
+#------------------------------------------------------------------------------
+# Apply all of the needed changes to create/use the initramfs (if enabled).
+#------------------------------------------------------------------------------
+do_image_wic[depends] += "${@ '${TI_CORE_INITRAMFS_IMAGE}:do_image_complete' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
+
+TI_WKS_INITRAMFS ?= "${@ ',initrd=${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
+
+IMAGE_BOOT_FILES += "${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
index 438dd6ab..c4472113 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -3,6 +3,7 @@
 SOC_FAMILY = "ti-soc"
 require conf/machine/include/soc-family.inc
 require conf/machine/include/ti-extras.inc
+require conf/machine/include/ti-core-initramfs.inc

 # kernel, initrd load addresses for the fitImage in all TI platforms
 UBOOT_ENTRYPOINT = "0x82000000"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
new file mode 100644
index 00000000..7f62dd19
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Minimal initramfs for boot requirements"
+
+LICENSE = "MIT"
+
+PV = "1.0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
+
+RDEPENDS:${PN} += "\
+    ${TI_CORE_INITRAMFS_KERNEL_MODULES} \
+    ${VIRTUAL-RUNTIME_base-utils} \
+    ${VIRTUAL-RUNTIME_login_manager} \
+    ${VIRTUAL-RUNTIME_init_manager} \
+    ${VIRTUAL-RUNTIME_dev_manager} \
+    ${VIRTUAL-RUNTIME_update-alternatives} \
+    netbase \
+    base-files \
+    base-passwd \
+    initramfs-framework-base \
+    initramfs-module-udev \
+    initramfs-module-nfsrootfs \
+    nfs-utils-mount \
+"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
new file mode 100644
index 00000000..5688044e
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
@@ -0,0 +1,39 @@
+SUMMARY = "TI SDK minimal initramfs image"
+
+DESCRIPTION = "Image meant to probe boot essential modules\
+ and other modules to reach the userspace, which cannot be\
+ built inside the upstream linux kernel image.\
+"
+
+LICENSE = "MIT"
+
+PV = "1.0"
+
+INITRAMFS_FSTYPES = "cpio cpio.xz"
+
+INITRAMFS_MAXSIZE = "131072"
+
+IMAGE_NAME = "ti-core-initramfs"
+
+export IMAGE_BASENAME = "${IMAGE_NAME}"
+
+TI_CORE_INITRAMFS_EXTRA_INSTALL ?= ""
+
+PACKAGE_INSTALL = "\
+    packagegroup-ti-core-initramfs \
+    ${TI_CORE_INITRAMFS_EXTRA_INSTALL} \
+"
+
+# Ensure the initramfs only contains the bare minimum
+IMAGE_FEATURES = ""
+IMAGE_LINGUAS = ""
+
+# on the kernel image.
+PACKAGE_EXCLUDE = "kernel-image-*"
+
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+IMAGE_NAME_SUFFIX ?= ""
+IMAGE_ROOTFS_SIZE = "8192"
+IMAGE_ROOTFS_EXTRA_SPACE = "0"
+
+inherit image
--
2.34.1


