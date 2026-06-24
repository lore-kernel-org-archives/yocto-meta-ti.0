Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA0ACDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 19:55:53 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16169.1782330948720117777
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 12:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=HhWTW2Xu;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=OXgfqAAs;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: afd@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJsJ5M1332361;
	Wed, 24 Jun 2026 14:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=XY/IkHioy6g26Qw8kWtEq2X+ZIMHONCvsEk7JqXjd
	HY=; b=HhWTW2XuMMlRB6942KUblexV92xx9uV4QAiJVQwfKBLMhhuNkjfKUb7CO
	1xbHfqVTqywe/sX5gMmM5rBgmBD7NylD8oBl0f7CkjNfAgP9X8Q/Y3NmIRRGMTNb
	A7PguTg3kIIbZWYzsvn8aN0CzHg+4MbpY4XNqkUWpvXarNcTj/vdhoSLEaXAtbGX
	/M+B7+0xaV1IZiHqqBCNpNjU3LV7yGbADU/qpKSyjhCEsV8m2baD3G6T+9uHDh+D
	Q0NwygzKtKhbi7ttQmE/bbZ2gDg/ajw+mBkhKaP7f+fy525tkDCm9M3Uh5PMnnBY
	/ZUXjDhkzipXUmLw2s+lYsqWPov/w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f0aspcctm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 14:55:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDNtLAmVmfj1LA5wLMmOFGt5ZHXrSwokSRL91TFhxBj9iFEITu6oFraRlbSn9GjvaBQilJWB+LsQqHFi2YUZrTnLcJisUVFOj6k0iwScecVTHYcKoYCTuwGBiIwysXBbQGuICQ+KrAdy+Zvzek1BqGSf+5YnVusaPrYesfUyt0AFrgcICPTnz2Fn9xdf2W5YRMsm1PIXutzJdYCRLpK13YTxLdyxWfTQcFXhqk/ivH5/hIGBVMY7mL8nsbV6L95Hv9L4uTzBy35WL+WP217fQ4cVCTqcpnUao9qTzDwuAoBYStH8uVvenotiWuOtpOPtQZ3vKReIrtk/5hBZxSlvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XY/IkHioy6g26Qw8kWtEq2X+ZIMHONCvsEk7JqXjdHY=;
 b=esN0bRzZ6gPURXXAd/njvl1LzQzogHAr7CIa6URaiTZTo7N/7SCkNCT3RbqAbhF5v9r6/eUOA+nONhJQTwWMJgU2ZbBkFj+Ca6g8crynlA5M80DH+DF0uIWA/bnSwGmX37WDdBvcXyRNOq4uGhkBYSNWQSN8VaeyyRw70v3lICQ1NJ0GPvyPbZDAmh+K+5sT+BctyTMyPWzwQUuj7rb+68IRPvzDByNek3n13VwT5oUi53d7dL0Ka5M3u+RIktVfOlY9VYj6SoyqFG2oxVRaaiosXqPLkZ+phO74Cdu7Vj4uA8HINBbTVRNa7KkhX+X+jB21wTSd1inuAn31Fdxy+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XY/IkHioy6g26Qw8kWtEq2X+ZIMHONCvsEk7JqXjdHY=;
 b=OXgfqAAsdATHvcg59zG70mPbGxYi3DSu1e1R7gYvfASC7T6HoEgs3n726URSv3HaOEhOe4cMjHobKCzJZMPnGsiVNvDVsG7HIik49gQg2YVNaW2NjEwmSmWYkWB0o3BBNakqjSI6oCx3osh4WutDCejThBvXhFRFqLi+pkDoCl8=
Received: from PH7PR10CA0009.namprd10.prod.outlook.com (2603:10b6:510:23d::29)
 by SA1PR10MB6294.namprd10.prod.outlook.com (2603:10b6:806:251::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 19:55:37 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::7d) by PH7PR10CA0009.outlook.office365.com
 (2603:10b6:510:23d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.15 via Frontend Transport; Wed,
 24 Jun 2026 19:55:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 24 Jun 2026 19:55:36 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 14:55:36 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 14:55:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 14:55:35 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OJtZQj1723418;
	Wed, 24 Jun 2026 14:55:35 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/wrynose][PATCH v2 2/3] ipumm-fw: Use prebuilt firmware from ti-linux-firmware repo
Date: Wed, 24 Jun 2026 14:55:32 -0500
Message-ID: <20260624195533.1152173-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260624195533.1152173-1-afd@ti.com>
References: <20260624195533.1152173-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|SA1PR10MB6294:EE_
X-MS-Office365-Filtering-Correlation-Id: fd1f9dbb-4ae5-47bc-ec48-08ded22a8f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|18002099003|22082099003|56012099006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: 
	4HHuZnG4bBh3jP5ygjLfKulBQ89r8WdVFegynhdh11MCbERRCZfsilU+yTwEhoxFlPvJL0DK+vloJvNEpyXtMK0Lduj6uhV04+uEGmSjyCoqstHYLQmDlKpcvFj1ASyKXSUVreuhzgVbq/0CgM882nD2ufswITeYFgRzOwTMPj36/MeuzS4ZdBZFZkWss1OO4x3NNeHbeh+yncMRerhuhin+jM+P6Z8lw4Ll0zDAbnvkTPZnQHOfMZ4WTtK+xs6RNme7xWawswOU0SzWBzUCybB9FPZEEaQZWd+T6y6CFOnBdmcP2oz2ThunJvhaX3I+nZ1DUvt8H0pvT6HaPvH/ZhfTpkpTySmwKDV6cZ5Kcn7Fc9n3QXhYp/+PFNIqqRKSS7eHB3bgUk2LAi7N0MgKuplA0g+WFxwjje/nVz2uGj+e3s081EAa9AdkQ6Y28yVDIVwcPZpE4L2U3bbkUxBEX4VbSOrPZJxiK2RINqM8PUkZdPOFdrpvL1z3hjovcH1/2B+d55dofSuV224nreC3KN8Wi4IsWn8lU/0XZLr2oK7LVw+lotYGnOAtEAldTrEWYIqGPYAL4wMdZwYOZAjfK89QelqMp0YdcRUIq1eh/Y0/+Il0H8llolcZ3gF0Ym/cIYaQIpT5L50Xns2ulwfKN8bVYJSM0iQp1sHOCGRWYLeSgbGYmhE9RyPwy4uiTWyiHFPG0xwPoeC+Rtb/ZLui7A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(18002099003)(22082099003)(56012099006)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	w7mZbgcGbJSw2N7xPphqB2P9tfMVGUOB+QpKNqo2ugCFurqZPpT4gqNf7MDf3gEWkX9bnIjLSimlDcQWNp/Bmrth/2HORhYPYQ2Bqs9yn6acUABCJP/KeU0wLwJ5lW7gBL7Q/gh33b1Oif45epQz1/1yK9mlqb0iIJ3xfuJjGmmu890sgQT0QHFco9d/LbvzgmEUN2n+TQAXG0eww7AbbEhuIWQcDD2WyCjTSocCZ1/BCQxC5OhA8wtf7QVuxRN/TlYL8ByFROulPkpjKILMTQxYUKfWRgmfgYPuwOniNcSWRHJsd5pZEIYLcJaRj41jeTPKhkMTya0a4uiW92cgqlhQ3c4CpkyBCfPAHv2jhe+JoNvXGEex+tdAN5+R2Ll37qplurKqGo3YKnJRGUeFpwYnoW8Om6eFwgyqR1l0b7gAh3SuepjbTGtoHmpNfO0O
X-Exchange-RoutingPolicyChecked: 
	Rl3EBmzuATDYu4vme5K27VC2BJQvCZWKjTUIWndVBhJqH6X/g5bH0CjMbooe5OrNisNghW5fpBpChlD7X9KhWT5/W9Aehw6qDiMTlZQXG/6EDHAVcBmkuw7QRs84jkZbyL4yEIK98CednF3iUPIN+lA0F+KFbkRTbuaUIclDiNT8NLLxjAck5tytFqvctNKoiGL7xZ+J6dJj778S2gOoj4Jmn0XDKPEDGjggXAuMESulBSzbA7nTmFNmh3TmiblOdmVHRkqO6pp2NDKdxrI7S9P67Z76GhKfmtUVhn7ldLgBHM7Xficji92ZOkEUk0FxLQ2qDRwP89OdZnbxbdub6w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 19:55:36.9178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd1f9dbb-4ae5-47bc-ec48-08ded22a8f6b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6294
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2NCBTYWx0ZWRfX2JbYKep7kUx0
 lf3CzZH9N0tsbq/7XKqlsPKU2ktXvYkuwA1StjVvfxI71Eq9lE8H/L7K/YMuwl2/S5B38wHK9OM
 mrXzVnUKgwfMfaU+6lXnMzAxpmvTWEQb4+5+J8PIeYoWFUNGz+VDezoHy5vNDsS9hwvZPvGJlXm
 KBdfHMgGdPO11kOVkj6k3E11yu/BuwFu9bIGsdBa5/BStLCZ7Gz9OZwerFAcUTyM8YOIBIFkC6n
 StNAhea6mfeopMR/7Ll0+2GHEaHxALlhMIbDQUvWxjl+EWctjjemDATFz8ructRVSXrAcfpuL0B
 OneEltGahBJFvXRUvi4pk5hQzU/yUig9FsivyClkhUpzATbdK+pBlhMK/6MZZMGPr9hK7czB9Ea
 KaTLt9JBeTL1BFL53AFaQg/IUp9Oqg==
X-Proofpoint-ORIG-GUID: RSYwkLQbv1NPpPFFel1kDDBmqJ5d6AAq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2NCBTYWx0ZWRfX75AIQz6IGWDK
 2NOA+R2pwnWIjIJNWh7keqT2VtP2kK1gcLbvlTcOIVb2wHj3GYBcNaguw3tUBL5QXN6R99Izixk
 PCsqNYDAhxb+b5naDW8S1WlGjOmz1dg=
X-Authority-Analysis: v=2.4 cv=RMCD2Yi+ c=1 sm=1 tr=0 ts=6a3c3642 cx=c_pps
 a=HW5a8e7WWDX24nvVw4Uo9w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=ctj8w7iXLTENQ5lagEYA:9
X-Proofpoint-GUID: RSYwkLQbv1NPpPFFel1kDDBmqJ5d6AAq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240164
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 19:55:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20072

Use a prebuilt version of this firmware from ti-linux-firmware. This
removes the need to build this locally.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - Fix s/suppor/support in SUMMARY while here
 - Move PV definition to ti-linux-fw.inc like other prebuilt FWs

 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
 .../recipes-bsp/ipumm-fw/ipumm-fw_git.bb      | 52 ++++---------------
 2 files changed, 10 insertions(+), 43 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 126c46df..88992e60 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -20,6 +20,7 @@ TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
+IPUMM_FW_VERSION = "3.00.15.00"
 
 TI_LINUX_FW_SRCREV ?= "ec029baad8b4b147af8331a5e099ef891e5ae1f4"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 246255e3..fbc6d956 100644
--- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -1,7 +1,7 @@
-SUMMARY = "Firmware for IPU to suppor Accelerated MM decode and encode"
-LICENSE = "TI-TSPA"
+SUMMARY = "Firmware for IPU to support Accelerated MM decode and encode"
 
-LIC_FILES_CHKSUM = "file://Texas_Instruments_ipumm_Manifest.pdf;md5=5cc572579f07af266ab57fc17d762c7f"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENCE.ti-tspa;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
 
 COMPATIBLE_MACHINE = "am57xx"
 
@@ -9,59 +9,25 @@ inherit features_check
 
 REQUIRED_MACHINE_FEATURES = "mmip"
 
-SRC_URI = "git://git.ti.com/git/ivimm/ipumm.git;protocol=https;branch=master"
-
-SRCREV = "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
-
-PV = "3.00.15.00"
-PR = "r7"
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
-require recipes-ti/includes/ti-paths.inc
+PV = "${IPUMM_FW_VERSION}"
+PR = "r8"
 
 inherit update-alternatives
 
-DEPENDS = "ti-xdctools-native ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
-
-export HWVERSION = "ES10"
-export BIOSTOOLSROOT = "${STAGING_DIR_TARGET}/usr/share/ti"
-
-export XDCVERSION = "ti-xdctools-tree"
-export BIOSVERSION = "ti-sysbios-tree"
-export IPCVERSION = "ti-ipc-tree"
-export CEVERSION = "ti-codec-engine-tree"
-export FCVERSION = "ti-framework-components-tree"
-export XDAISVERSION = "ti-xdais-tree"
-
-export TMS470CGTOOLPATH = "${M4_TOOLCHAIN_INSTALL_DIR}"
-export IPCSRC = "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
-
-EXTRA_OEMAKE += "XDCDIST_TREE=${STAGING_DIR_NATIVE}/usr/share/ti/${XDCVERSION}"
-
-do_configure() {
-    oe_runmake unconfig
-    oe_runmake vayu_smp_config
-}
-
-do_compile() {
-    oe_runmake
-}
-
 TARGET = "dra7-ipu2-fw.xem4"
-TARGET_MAP = "platform/ti/dce/baseimage/package/cfg/out/ipu/release/ipu.xem4.map"
 
 do_install() {
-    install -d ${D}${nonarch_base_libdir}/firmware
-    install -m 0644 ${S}/${TARGET} ${D}${nonarch_base_libdir}/firmware/${TARGET}.${BPN}
-    install -m 0644 ${S}/${TARGET_MAP} ${D}${nonarch_base_libdir}/firmware/${TARGET}.map
+    install -d ${D}${nonarch_base_libdir}/firmware/ti-ce-fw
+    install -m 0644 ${S}/ti-ce-fw/${TARGET} ${D}${nonarch_base_libdir}/firmware/ti-ce-fw/${TARGET}
 }
 
 ALTERNATIVE:${PN} = "dra7-ipu2-fw.xem4"
 ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] = "${nonarch_base_libdir}/firmware/${TARGET}"
-ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] = "${nonarch_base_libdir}/firmware/${TARGET}.${BPN}"
+ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] = "${nonarch_base_libdir}/firmware/ti-ce-fw/${TARGET}"
 ALTERNATIVE_PRIORITY = "20"
 
-FILES:${PN} += "${nonarch_base_libdir}/firmware/*"
-
 # Disable the "buildpaths" check while we figure out how we are
 # going to address this issue.
 #
-- 
2.39.2


