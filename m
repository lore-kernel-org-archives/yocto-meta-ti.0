Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8208C54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 16:02:33 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15064.1785254544776158291
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 09:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=kwPOCdVD;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=II2KGtk+;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66SEdoCP4025014;
	Tue, 28 Jul 2026 11:02:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=+pRyDb0CJEe4W
	5eJ+hN4XNXy0I/lhia4fYBXuA4pnPw=; b=kwPOCdVD70LDjWFlCr71jG8ktMEgw
	6lITXSjOOg9wP7m4rBS2IQCVIu+t7mI/Zt2GzRVvH06Um2fwuWYxtALlhAfGJn51
	AeZDaHrJqyMqNBkBmyzjeCEwVv60nXK4qeFHI1rBAsbOVBrEozfVpmDsQi1GyDdp
	PPHtH3GPept/2WsShRSrDr0XqEPtWtQcO6NfzMvxrHVHC6fomr81ObsIdGiCeVP2
	tMluwZoGnk3CDaLeWU3X/PpcLcnm8b9aL4AwtTZEkM2bNbitwqcLxilwAgGrc9wd
	F1wMZulvmY1wS9JUQNVGAd7Vp2brUDIDeNAAgxcyJ+qCL4TqeyAc0tJDQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012013.outbound.protection.outlook.com [40.107.209.13])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fpufxt1r8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 11:02:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RODOQfBO/40FHb+e80JjhazRSBUDkAnTHodNuStr11Jg5qUUdNhmEp2+bLhdzCLNSF0cjR1GCoz0Ss1rZku2ECdt9r90xZpJv+MvPLIQc1Rm3rBREoz+nO3xdsqEtOCXHI35fQH52Zno0Y5QgsWTvCquLO9EHpPSzH2EWtVlSzpw8oQfoRlvgHiUamUtiyxWGl+IjH0WZVZvYb98kOTvlqcD5SWinI+vzS13xWhSQTIMYtcx4cOrCwwxJUw24Hvx2r/0ExOPEK3u4ckoNmz7EI9WM+dX7qBMJoer1Pc0MzNFfLgn+zqIFu4ys/V+v3eD+ar6XlPMSW5OjKOpvSlBmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pRyDb0CJEe4W5eJ+hN4XNXy0I/lhia4fYBXuA4pnPw=;
 b=POOvJ7xMl4U8tfmh0FQyqFs+U7muPrm/ga3a6DMUt9J/ulkXPR6ApZOnPvT+XE23pXubVp3K6HvT+bl0hq/q+2ebCjB7XEv1UA4mb7jKATw9hUE4iDO1SCUKLnx2ePqEYG0Z0EeXZIdxfKuY1sMXVflefHSeYGYFOnLx2/KoniupIiokSGjdut6doibKLxFH4+fbaQla36fNRDeTF+QBTHP9LKoJzPUG+QzldZN211AOAkmZaQLoJZGmtMC3hd6tX7c47VmC/j65lUCq0kQQfz4HQaFdssy9Mb9uXyMyAHKkPWFhATacvGpyT4W2J6dVCqOi+G0Vwu4m7aTMCMPFVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pRyDb0CJEe4W5eJ+hN4XNXy0I/lhia4fYBXuA4pnPw=;
 b=II2KGtk+YrFREWfmiR12+7NaNVbIwbWYHyKY2YRoObdpglO2dnz5LyQ8LLBmG/BKZe42Clwv0dK0Ttd7feCVK2JuyhH0mGjsylLq22c/itZw+EHI5ftnhegC7DelGiLU1RCEdXaplmbL5QI/m8b1g/Dd724VRQyTJH/ldCV0RWg=
Received: from CH0PR03CA0108.namprd03.prod.outlook.com (2603:10b6:610:cd::23)
 by CY5PR10MB6047.namprd10.prod.outlook.com (2603:10b6:930:3c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 16:02:18 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::3) by CH0PR03CA0108.outlook.office365.com
 (2603:10b6:610:cd::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 16:02:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 16:02:18 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 11:02:06 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 11:02:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 11:02:06 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SG25bN3002162;
	Tue, 28 Jul 2026 11:02:05 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wokFp-0000000BzFG-3PSq;
	Tue, 28 Jul 2026 11:02:05 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 1/2] packagegroup-ti-core-initramfs: Move the inclusion of initramfs-module-netsetup
Date: Tue, 28 Jul 2026 11:02:04 -0500
Message-ID: <20260728160205.2857025-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|CY5PR10MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: 3063333e-f9a4-4f68-8f93-08deecc199b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|6133799003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	wlAhvTqolUySxAjduI20jgymbRtIHoL7kvFO6al+DKkXnJUv/KdJJ66Z7ih8TbcQd80B0M9Y87nAyu7tAzegzZzrN4jRf9NhqwCrMPo9C/utQE8mxnbavMfQPGiA3Fd814ujoemJQ7ycX0F6SckdUHf4rZ2OwlIYPqcSpv/QcdGH+MqZzdaJ9J3U5bPxA2tuAW54ryMYeHdYVlPLHFa6YM6eiBRxowus0gnIP8QwO0eLuxcm2XPkS+IfQxGu0dMufAiVg4uor0+o8awkaYN91DmgKk9u8pomE7EYaWbOMiQ++he6unwCJ43cNSQRmtFArIh7yXWkCAKrJRx3x6H6QYkK5+5yHSyOOQEVOtt1vPu/YPeFUtnfb3AkRMN5HEn7jtHUwAKNTxtN5VKTpLWd0d3/bCGJSoo0azGtpdvP8YCfdGfDYmrjKdTwgb2RyWkzcx048p7hCJQ3xaVkcfVdHWMhIvTpE9gcnoTuoBVELQvKvcWLJJWkRlIP60EgJwU7GzZ550cMi01B1dhW8rrCbEsZOR+PpSX1weHc/UKKFBpVm8kztvi7K/duOHWcbPaUw3cQIjhzALypNghktPQQpCYL79GEA0GDWypviAlvcT6gWMRKRRV8o5sMkIo7gvEv5ARKTVWI55gbMSeXwpvY2ZRtv5FZirG2hBo2Iw+1//C2TEUxFYTSfxEhWDGr6MxKwyLuiiw7G6W74KVu5AJcsw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(6133799003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2SMz7T4eXryah/MfKmSOEtGddN+NxrgpTIPyYo1sj6LaEoZjrK3OIpfTErTzTUjDdIdjMCrgmt3/lu+QS5YtWtZBzH7jZ+gVQraaU3Y1YByQMmT1pTrvnh6q0td928ebHFZ0AcVaz0qvhFEzGwDIX6RYckSXnMW4Vr+SJRAvmROJ54Z979JfXVen4SbV/5EB7G35MMTrNIS1OrdXvALoPWlmX0pMMGVuaGEDlmp2ZOC3nsThqiWUixNFD1h+Rstal8ys1fkwGYtVmWWbr4vdutHM4JbLJVpHkRTnv/h0ozbumIyY03r+cYfwPtkTKHeNwM3tFO6vfDOilFo4FKuYJsHnVRe/fSdzuAyVB4+XrqQQtvFJp72y0OTSzmYBZiZj3cj66LSOKZT6EOJyiqCUH69oMp+oUWL4aLnlZ47yjGS1CcP4j1jiwJY2JHStBFQO
X-Exchange-RoutingPolicyChecked: 
	kPK4vthkmFmo9VEiVQp+HuQWJcy9476wjDOfMGFKzCS2zF+SPcJM4FatRaUhJhpn/Bilc/aiXZ2ckcT9DcQi/63ximkBDkXW/jWt2z2F7JHnWC+HiPxYgx6y2td7/I0VcFFd/Nd/ZJzpoLPTqlB0htryh70R19fkUArLVu74A7Fwa7yn8Fbalp822OEpF1R/2/7LZcraUaAELV6GSGY1ZKOY6ByNWE4s4dg6gNaoim7Sqcb3pUs7cRoU8iHnPTohedUqBxSQbtlcjDk8s1FpYGnixGdKxaqxc0vXFmRzJgF8CosM0hOIJSXk/Nqlk1X4PlFKdri6x3No9bdbfnsVeg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 16:02:18.3723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3063333e-f9a4-4f68-8f93-08deecc199b2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6047
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE0MiBTYWx0ZWRfX1JaUrSkPNQth
 BMy3u//TvqwpaRnLjo8X0KOvY0zKaqQ1YDrq0+YGbbzaEmDaNPVsp/3m/bGzw54rWnLrmq1yVbf
 +thKPTyLKJ2A7GZXWzJH3VZFkjH6aJxKZow0TuzDYmm6MzH1b+jTLhj9yLMXqiNSY4AMPmXv3Sg
 reH4WXldnlGYIB3toiyRdCyG3LT3ud9syD4QIDfmuKnFkbwLSRauGxnrzLFlnHABhGYqiv1Ej/s
 msSx0m4PB8r8QF5YzyGf8JSulkQDFqzgpfk/2gijBcbhZmUyIscMt1qQh3YcTcsRHoiDPEsts/R
 ErWLQJUbbSAX8KCbDC8jn2nhaZGzr3rFwHnHcqmLwgso21Q4DZNx3BioJBsqPwhpidywDANtf4P
 np4IDinCqPiv9/HUmErbjBEAegmKV6rg8LfdKTCvr7Gc6+cueIqtgPFpLFAXoTweQd1BNM+/iyX
 X4mD33tYvZlv2yj9n5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE0MiBTYWx0ZWRfX+WPKnFOiB7vI
 vrFJ4OhxJmcrtauOyijmFXjXNbuKWqeVYn3bM3RTYlbahlGraX5auHPjpLlz75ZLw4Ye94/7aRF
 ROwoBCxMnkET4slTc45rFxGt4BuyRvY=
X-Authority-Analysis: v=2.4 cv=a70AM0SF c=1 sm=1 tr=0 ts=6a68d28e cx=c_pps
 a=XYUUcOYeOu1iXYjTrsocvA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=X38TZnBBf72-zIk4YpgA:9
X-Proofpoint-ORIG-GUID: Zbuv5wejS9ZjdY36R5aYqlRFu_pWVydU
X-Proofpoint-GUID: Zbuv5wejS9ZjdY36R5aYqlRFu_pWVydU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280142
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jul 2026 16:02:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20203

The list of what modules are required for the initramfs has changed as
of 7.1.  The CPSW driver is no longer built into the kernel and is
required to be built as a module and included in the initramfs for all K3
boards.

While the existing solution for including initramfs-module-netsetup was
fine, it did not trigger the building of initramfs for all k3 platforms.
It would just include it if the ti-core-initramfs was built.

This change tells the system to build and include the needed packages
for all k3 and makes sure that the ti-core-initramfs is built for all of
them.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix bad character in subject.

 meta-ti-bsp/conf/machine/include/k3.inc                        | 3 +++
 .../recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb     | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index c08b5612..b571d544 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -31,6 +31,9 @@ EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-image ti-kernel-fitimage"
 
+TI_CORE_INITRAMFS_EXTRA_INSTALL:append:bsp-mainline = " initramfs-module-netsetup"
+TI_CORE_INITRAMFS_EXTRA_INSTALL:append:bsp-next = " initramfs-module-netsetup"
+
 TFA_PLATFORM = "k3"
 
 # Change the default memory location for all k3 devices.  This requires an
diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index b4e6adff..a9eff847 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -23,5 +23,3 @@ RDEPENDS:${PN} += "\
     initramfs-module-nfsrootfs \
     nfs-utils-mount \
 "
-
-RDEPENDS:${PN}:append:bsp-next = " initramfs-module-netsetup"
-- 
2.43.0


