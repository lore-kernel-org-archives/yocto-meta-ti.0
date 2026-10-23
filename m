Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2244.1792742163826446377
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 Oct 2026 00:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=VVTHkGZd;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=L+ZmZ+Ce;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: r-sharma3@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7EE9R1984993;
	Fri, 23 Oct 2026 02:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=x19RyTbn1Bt6OkVkq8gnFL603czdVYj7gcjPqGFMg
	xM=; b=VVTHkGZd5OLXGMCGxafMZR4Lsr4LNbHgQ1krZymvlM9/vsxbgzF45BZDr
	WjaKZE+QYic5a/a9omoFBF2X9P/ZGJXRIdCtkorEO8xBYv1ndu3R7PGj7+fFzJaU
	Oigzz46lVOWL2i0knsmjMwaJ6tlYgCCvTH2V/6MWwI0Tr9p6cf/oWYYXyeM+NUlc
	KBerf21TC61iWcBTdhx53afuLwiYVirdzXgUvtDGYhaC107u/edBe4PIecjlvuQC
	EAy6DPAjTQqkaQapci5kyNuYbCCY2pRi5mOLVzoCGZUoTV52MIxjTa9kh7CBITDx
	Rr9le9lvz0Bm31cpOzKt7jXzDHtQQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011041.outbound.protection.outlook.com [52.101.57.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hfybthdt0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 02:56:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EigWXCvA2k5ujCVqmk3yYUhx9X/mho8RNC7kumj3lwrxYYLsuZ8HfjKtMBOoYJJ4McOV7UVD99hxn/BoKkqnsjcK6FPIiHbMmSVAgRW3nAtUhsqs1qwDg0+vrjbomW/qS4aK1LqwkUIcKARkdACADP8GnfdsqZFeb2uCm2oizL75z6n4YuKGy4YTYB6bAo/hN0lqPE5FKWKi1DqYxUWcmJR4zBNwUP4ec2y5ZcafONLULVjenQJqV0vO4zMJC8MM9zwPrsjiHzEV+rC8Fe5+raVjrPfTQ5N+6GruZ9tIGGfW5w/Q8bFjOlNdpTNO8NJpD6MztychI4W9VScFNC+6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x19RyTbn1Bt6OkVkq8gnFL603czdVYj7gcjPqGFMgxM=;
 b=JRbYPEJGuayoXG9WQLBT7PlyIMambJo32O4IE/+Ah8q+Nj4itwrChoU1aMN8JsqIqRmiDGkN+QFgzZPmXyEHLje8Kwo0ZqckBsNgl6nXxeSglajgtjkadlolj5m1H2J9WjxSjOrg6TBjJeD1htE0L7EsGPz7PYU7gQXmM24dv7wYVibcgOYJJfWoD17t9gL/42H2+a6oYeLqvHVRP0bcfTYvK1uMNtm3S/AXvG6MCwFBJB7y2swc36N6NjRMOiUmAeub6XedWkooGiRPFzASlKaSKgfINGn84uzDVsHb8OiYvjLZPHfdosdrIlLbeW43fC4/O5VnXaHIMtfzZqBCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x19RyTbn1Bt6OkVkq8gnFL603czdVYj7gcjPqGFMgxM=;
 b=L+ZmZ+CefXBsHAl5qIiAS3ObkG35t7oSabguWqwyRGmg0AJCdjylh/80AEZW5bWQuuukkR5YfJpxNx2MYYVtHBab9eD8r3YaLK1cpwf2TRYIVGRtzjsyXRiOocZIxNJXbMQ/kW/1cjuYiSyB9Fs0FUxxfPZQyvZYIIMj6J7rNYI=
Received: from CY5PR15CA0194.namprd15.prod.outlook.com (2603:10b6:930:82::12)
 by CY8PR10MB6516.namprd10.prod.outlook.com (2603:10b6:930:5c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 07:55:58 +0000
Received: from CY6PEPF0000004B.namprd03.prod.outlook.com
 (2603:10b6:930:82:cafe::a) by CY5PR15CA0194.outlook.office365.com
 (2603:10b6:930:82::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Fri,
 23 Oct 2026 07:55:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY6PEPF0000004B.mail.protection.outlook.com (10.167.247.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 07:55:58 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 02:55:46 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 02:55:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 23 Oct 2026 02:55:46 -0500
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69N7thfu2033407;
	Fri, 23 Oct 2026 02:55:45 -0500
From: Rahul Sharma <r-sharma3@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>
Subject: [wrynose][PATCH v3 2/2] am62lxx-evm: Add DSI config fragments for display support
Date: Fri, 23 Oct 2026 13:25:40 +0530
Message-ID: <20261023075540.2577479-2-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023075540.2577479-1-r-sharma3@ti.com>
References: <20261023075540.2577479-1-r-sharma3@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004B:EE_|CY8PR10MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 98295627-443e-4bc3-ab48-08df30db12f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|56012099006|261021121427099003|261022075727099003|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: pxIccS3vyAUZHS4JRWSZDXwtKR0FDL11NzVZnn+pai7jf1rsrlK1o+CsZfsXyy/kQ5bM+fF6caopiHqKX3zLeyijMwMLZW8NDCJWnSQF6qlu42B5Xz7Wl/kG05LDnGmn+nsDP14Q+OgLzALPbMVIn5jY1R/NMC7/1cIen/teU2KxQ6RYDnnJBhZDtiM66t6RtiQYwKfRttcrk+SIWE1mbzw4KNkHduBiM4uNtl2OXPgBdI+Pxte+50MmMVGQDAIEck3aCjom6ogU+2h0UIsQtxuQNpJg7DuPImWBEiSBhlt8dby9fIfT23F7teqFFQH9DtvTo0MlU6z+YXDuB2SFB5XZlQRzv2baFHqNuSsRQH7c+FdRMcZzta8Ic8BgfeM5BouZKtxuL0re6uOqmlqeXhlw9nZMQjyoX8Cuz5gW0vOBBch3rL2ks6toOHN9likbRi7KQaDt/iiuIpyDNZZuIYzWuMvufeQ86wuaz129ryNHHqkf0y9dz0JeXnHWzYnw9uoyMUW+2Z6DGcDAlG2mxz3TBujCpvZGYDEbCblIeilRveiBj+/DSl/73WZiJ3zA6msK/5/4UMWF410F5vFBAd0AAfj5P4lz1mmkM9CnReS6x1HJsYP8eLFRZuhrGNjbrlubna+81p6X/pqomAh3ShliE+6SjxdyRa8bx+GNFi5GHeYK5Av65IPPTzseL/rUnTaE/+GVl5YX8CizDA8Uog==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(56012099006)(261021121427099003)(261022075727099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: p8hrUZa5GAj9934hvAvxRFrkSnH4j9aTWAo0JUQST36Q/KnrJRjYyvLOOc+tOTxaeNIq27ZAQRA4qVg/WUowurrNHg9SdsP6GABLYvKaS68GkCUEjLzj8BRzPkYJxKPOYfky1PSdN2ye39tZIAH6+S8g1sZABa7aFPUyNNbZKZf48KlHkGgzVhi+72e7th0bo7LZVLaQy/7FSSfFrPW4EP+lpkQT9/HINGULG7PYYVv4x133zhu0vJN/iWIi8RLGos8XtarHZkhGhn37y4NT7ph0+JQl8uN7ZRIEERovB9TDudt7GROvUAnIl284QX8ITGS4eqbZc6uyvvd3icaB/Gx6Z2dOEY/O74SJK3gUe3ZRpuXNOFxtr8+eEHJP43EvnUOKw3tX6Fk7XuQuCabbU0i0rKKisOqXRsHeRzJHMWSv2nUBUdxwSsmnGgZmDjug
X-Exchange-RoutingPolicyChecked: 1gVKtEODN/8UjY4wDaB6ZQN1B/3GhuQkN4hmNXtkvKDcraBnwfj0yALRAkcjoEsbxCvSPDQWY2thMkAEKACqA4ACaHn2M5VCpT8DWmKPIWHpzHiyIuyYXElZzF5Vbx6OdHpOZliXkhssTY2wEsX3NaT1zmCts8cHYpH7Y4CWI0zgEHKV6NoJcQsl2EN9cm4SLLGbNSiQfp6fXouYxWnTkOE9euLy6GEOXkqiQEaxZcAaENfh/pzqxWQ7sNeKyW65lEGw/yLiIX0bjAPbD4kzvce7E0sME813yCURbyuUAX4tSLt/dbKvUIS4I/pKju0j7Ri+lSvuuZcuh9Yn6hY56A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 07:55:58.3023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98295627-443e-4bc3-ab48-08df30db12f3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY6PEPF0000004B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6516
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfX6mze1ABGz5f4
 sb3rQH4yTgvFpG7sWATbrtAuudUVK6TwYndhDHpkVWm5kvIXUSq8oIX6zHAWFjn37eDwkXM77db
 NXY3l/izE5lKT8/tbvglFpmNFUvumYo=
X-Proofpoint-GUID: HyT6CzuQOcwebH8jdCSglmK-rqDLU5ZM
X-Proofpoint-ORIG-GUID: HyT6CzuQOcwebH8jdCSglmK-rqDLU5ZM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfX/WmFCU1HDLDn
 D9zh9nio6vlckMnJWE5CKdEILoV6e4ZOkUGQ7TwhDeKa7mAOxYXrGG+dNUP7ewD+P+nMbqCjH82
 RQGgDIoFmw0342pwBiVxrR/YMCiC78G//bvSqePCL34XSptiWW/vSq2/1rXi0VDYE6QRAAyThIY
 RtdGPK79hJA0rR/0qrTtBvedl0BgSPsPvtX4SYb4IIU4YsuQSfivgM1gv3hvDokN7LlJxpRDsqs
 BAkjmLnKn1gm3O7EQ+J6xqWetQocRasVWZ3VfvoDnAmlyYCf0tb8lC9gqgcMPkWt89atvxUUs3p
 iMFRBTkux7jC3PXFaKZkgnCbXHgJl/8BGLvCumsx8g07OmpnJtNyhSN9bRLjMkoZQSSzU+qhIHL
 MHX1xabIpjKfzTslnB/3DHvS9SIbGwRlqPzGZUBe9ueSSOG8oB8mDLhz0cwnBH4xkQJEizmilPw
 A7sjxZdl7vU1yDE0GAg==
X-Authority-Analysis: v=2.4 cv=ZYaIpcVA c=1 sm=1 tr=0 ts=6adb1310 cx=c_pps
 a=QmrQXVULtgJTkzLS4HxzTg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=u5AcL_Ogppa1QhdG11UA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230031
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 23 Oct 2026 07:56:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20491
Content-Type: text/plain; charset="utf-8"

Add U-Boot configuration fragments for DSI display support with
Raspberry Pi panel on AM62L EVM.

The fragments enable:
- am62x_a53_splashscreen.config: Splash screen on Cortex-A53
- k3_a53_dsi.config: DSI support for K3 Cortex-A53
- am62lx_evm_dsi_rpi_panel.config: DSI Raspberry Pi panel support

Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
index 7a422617..0799becd 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -26,3 +26,6 @@ UBOOT_DTB_LOADADDRESS = "0x84f00000"
 UBOOT_DTBO_LOADADDRESS = "0x84f80000"
 
 TFA_BOARD = "am62lx-evm"
+
+# DSI config fragments for display support
+UBOOT_FRAGMENTS:append:bsp-ti-6_18 = " am62x_a53_splashscreen.config k3_a53_dsi.config am62lx_evm_dsi_rpi_panel.config"
-- 
2.34.1

