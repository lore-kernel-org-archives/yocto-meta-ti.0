Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A991CDE001
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 16:07:41 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14882.1782403653909756684
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 09:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=J8JtdVlJ;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=guAYmsMq;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: afd@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFdBCd3683370;
	Thu, 25 Jun 2026 11:07:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=apI7Z1UDXx69WOVTx0+iD4ik3tDpEnHjB3lQZkF6J
	kc=; b=J8JtdVlJQM5BwUey9WRBZZYWPDwGHHrMy9xUtHqYVAr/DLcsvM8LwkQsI
	LZj2X5+aYIjOA8Q6V2PcSwbZnKRw/iFBwwdgjJXPMNnXesJK/7EABmZNdPuSjSNH
	eRu5fKMQuUfbbWZYQEG1fsyhbZom6iZv+w1J2N0lrgbnzYLpOn+ryZvthULPiuKZ
	c2kROTDlIMWoQibJ3xLn8dQwX6eF5elUGD4c6R3VJGpGGSzZKKc1RCSuCHXoguVx
	TUEzPI2ZOaogk7Vo1zHDuqMXZfi/PHfi2eCPG/6ZNdnA3K/Sdl1Mdsp4Q44iLmF7
	NsAgu2KGU+tt9MfcOL5WxUmlSEtyQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012036.outbound.protection.outlook.com [40.93.195.36])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f13a0sras-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 11:07:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D82gK+i7dCk4m/qVMv311sHabotnYC2r8j9ZYmEBJ70LDRmbteJJfZb8Qz0S//anEEjDR+ooVJaPbzjHOmls3otqmyrWF4j3Z/KUcboUengmGbnz80CBZw6l08dNL08D8jjxY4r/r1JhWW7zdIcBTvjVDlDmwmBSrfmV3/RWC0onIXeQHHeYPpocpgnbD0+0rlpdao7FremBp6G4N3yif+rqRIrypLHWRKsaNIemJ0/NQEssE4ihJRfpFLiW83OBWuIakXMh3XN0UqMBY5EZkci5qqwmG3wt776Bf0sB9jkxI1FL9pXVLTRK3F9LxXWYgVe+88AXEPToEAXhOU4M2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apI7Z1UDXx69WOVTx0+iD4ik3tDpEnHjB3lQZkF6Jkc=;
 b=CBfiGxsObq58g7OFsntolCsECWAmYgOn+DCxOL95HhMF8MabtgT3QV/cyeAVzZ43ZfKoLzVtq/FOAQX8YbXFviCii5fGK0zedQti+Bryqj2t015zb2euo9eUIIVMlxi0lMGFNqramBxPS0dt8D+ZcwCKae0sd7DhMs16Y8jJSTqmArU1J93Ji4twl9bRxgCCCxiGKVKW3HP5dfGrU/2mEwc6IBtJiVU0YETQ9tYD3GaKBY9nMjaWbr8CKLh8d9cL5d0Ws/maBz/k8b0UJlXRmwckX7L7p+WKy/YHxeeO1ztkqDE4CAC/R3kAGv9RQnCfb0SQxu7rneOHJXzxim27sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apI7Z1UDXx69WOVTx0+iD4ik3tDpEnHjB3lQZkF6Jkc=;
 b=guAYmsMqEfxacilKt6wHMB1SMiEibGU8Zmq5UEDBhOCfgsVB36x6sOYS+v0tC9YHEzZRnJVNWds3Frn8E4tSEf79Is2BzHKyL4kWQn0zwYv7HzHKzIhExLw0FIK4JNeRzaNfy2MGpVcaxqLCkXvLKJyILADAxOQ1q8uGH+0cFGA=
Received: from MN0P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::33)
 by CYYPR10MB7676.namprd10.prod.outlook.com (2603:10b6:930:bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 16:07:29 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:208:531:cafe::70) by MN0P222CA0025.outlook.office365.com
 (2603:10b6:208:531::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Thu,
 25 Jun 2026 16:07:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 16:07:27 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 11:07:02 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 11:07:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 11:07:02 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PG71913099926;
	Thu, 25 Jun 2026 11:07:02 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/wrynose][PATCH v3 2/3] ipumm-fw: Use prebuilt firmware from ti-linux-firmware repo
Date: Thu, 25 Jun 2026 11:06:58 -0500
Message-ID: <20260625160659.29619-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260625160659.29619-1-afd@ti.com>
References: <20260625160659.29619-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|CYYPR10MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: d70aa839-31cb-476e-1e20-08ded2d3da88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|3023799007|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	/iPismAt4ghWjxz2kjf1oulmfS8mNw3Yp57WRrA7hsgYT+gwX7ytVUSyq2t2CdVERtHReht3A80y+xzwnEaIOoHNXVTaUrXnxZ5j86Wr2oSW+aTZue+Y08cSw8aMA+JkZdx5vkONpI5Ekiq7LnBEasjz9cgHDT7iAjhA1sB9A8st3vrbUCoOAE2ibPckJrtJaew6UyMZtVvgPKw32kFdgSvxauWpHtq/4S61exSiHyVwEaqM/Z5P7SFSB9hl1kXY3CS9vVHCK7pjlEGyffmOnHF0x6F7xwJWOe5CIJDcyOq30PAUP6lV8OZnOEDgXQE5hl17cKp7801HTxl01GGA+HZhDCQJ4tm5cKnODOMGFnxBI3fEsq+0oUMZzUtYjVBOXf4mayeasSHaWUEzFFDOA+Pc8bODGlN6ikoVDXtRa0S8iyVbU7Lmx17H0XZ/6/mwzC0CcKfeq9wx9ip8kUI1oZeFq/v4U0A3Yt0JAtwZSKi60LhDnooqIxYIX5y/KbwdKySvm8ayroS/+xpJHFNWFTBpAqc4+4Ov1SjUbHUKRp5Cfq4TKUi4pzn86AgaMX05dDLpNMxDVVpHaouy17R9FitwrFCO/jFgU8Xg5MMatIrL9L8XmAOmfEWB/KL2C0Uh90nfzzc/xvyrnx8iRTJfBesG1org97mxoCj1pYF9dfQC1RcKCYsOBB2e1HCyto2anw3xsT6iQO/Q1ANkcLrRNA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(3023799007)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ljR6odpbpX7RuK/wvnzUNlgky/U5V+/OS0dwYN+BrYbcTWqSNskfJ6GhwOg4DmMUhb10ycThjqLJQhY9GuBFr4TzIoT5o5Ipzthrl0e4n3/JQmvcISZF+2QT3ui4+l+nqtPO4TDj7Pj3r3lfhSxv2oRrkvxsSJ8xMBlbtI222Y/JPDkTaG1xaI84wVRNwnqbCEFiy8ObUJ94G2+vhXwR0NrUuU1p8mAdibIAzYpcyWiuITwgolkqev6QBGciQJFft+KqdSoxKH6IiC6a756oOzYPdZQ+GCGY8OowUiHfqfNlzEOJCogWL1VaJ/mND8qOEaUNls8ZRATNntDPC9OV/V7PT/84579GkQSxHDbRXD3zj0TNXI/CNmhkHBM7xBUCjJKgtkhEYzIyaYxpplCBc2BRXuGTnhJosJcky1uYVHd6IYMEdLqkFSnaosN8yLU7
X-Exchange-RoutingPolicyChecked: 
	pvVvPcTMMbr310Vbx8AzEx5uhHB/PABklv2zN8Bxpeq68Anh4slxsoBKD8ZBHPooE12bzrrriWD+uefcwirmViLBI64032nrGgUDN1RDJ3626QcPIlsHCdI/blTQKiIs+N0hNTqbICYINEduJUpUhVQ4Eby4Rx9SUDMSZbylVvmjIJNg8r2/vP82wX5tpGOnPrzkW9v9dSFWEy9Vny4/gtiFJVwbZBKlYmR1fEtL8SgDCDu48rpe38hzS35l8CVZ/tvRHDS9SXPY+aWM6ZXRC7UObmgHpS7C4LZkx+sILFR7AebwtK2WmiV0EbEm6dPIQpgI45WMMKpiBiqmLN8GUQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 16:07:27.8356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d70aa839-31cb-476e-1e20-08ded2d3da88
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7676
X-Authority-Analysis: v=2.4 cv=WrAb99fv c=1 sm=1 tr=0 ts=6a3d5243 cx=c_pps
 a=1PMvcOD3Mx+UKTR1GZf1Bw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=JnOcKC7RjAwWKkjPMk0A:9
X-Proofpoint-ORIG-GUID: 1kNeiWYWgf7Q7pbU95whsDMJ5vmhWn1R
X-Proofpoint-GUID: 1kNeiWYWgf7Q7pbU95whsDMJ5vmhWn1R
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEzOCBTYWx0ZWRfX1Who5qJEQLyl
 Xtycs+AuCyLWcXqk85Ed1h4pOgtbPD/fMkgjtYS1TsikYHqyFG6qvMvodVBJgyai9Hth7cezPzP
 Ssfyq30VcOSO1pI61kj2NV+K9zLjA/w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEzOCBTYWx0ZWRfX8E2aykIpJNqk
 Xk2b1zWv3klh4mq7ApdAwMVrjTJgTGyPPHcOm2uUJnQ6APIKFJOwWvOF2bJ6ynF2gluUx46H2rJ
 JEEOpqdIfu56lvK6W8pmAj9P+pNV6BNeCuG8VlBjbWwurgeTpmgV0lxdW0AmBm7UGkXZud5xlTM
 d0WARBtQiZnuhPxmpEw37eU+ASe+F7WZSUbOs25ImObqYjgAbSH16++r4+d31J9X0GJb2IWjS8A
 VgaurWM4nW3abxPdWK8F9pDaH4kgqoumHySpv1Dz8NseNhnznNndCJuFPkAIgwBd12YvQgGRKmt
 gppKixQ9zP6oLGcrGx7wpwkucjjhMRYHQThw2Z8GjfR9coSKdEnlEJik8P2DSPHcTEVeMYrlPwA
 N53bWOTqe9a6aj6QpJBr/nGe8mZiVvAnt6JSIANzooYTMm7+GdUsCKrC5v3bdC2EahAKgVFMzZo
 gRUuMaEFNOo9Qi9OgaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250138
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jun 2026 16:07:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20092

Use a prebuilt version of this firmware from ti-linux-firmware. This
removes the need to build this locally.

License-Update: License not changed, updating to the correct checksum file
Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v3:
 - Add License-Update comment

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


