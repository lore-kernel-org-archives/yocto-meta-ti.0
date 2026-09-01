Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BD9C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 07:32:44 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2517.1788247964470278411
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 00:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=op0ncci5;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=WExHalXc;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6817AMQ53107792;
	Tue, 1 Sep 2026 02:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=V5VdbBFQUAPy0
	O7kNFl9bkRfxlSNTkQiExRSwAz045s=; b=op0ncci5z9N66n9YPMif+vvt/jb0C
	2jplyNwifUHj6BOyTzw86AaALMdf19zMeDLPj9qvMTTuDSj+5G4BnBEN27CwmER3
	x0FzX5rsu5ItEpuO1f08gGn0vJpfbKRcJzOUvus9oQ3AOmVOoEwM7B3VrVXBh5Yb
	rz/P2hoiu4srcZ53AyASMGZ8O1knzwJd8WffbVuXOOdD45QS2/m4IlXrs4MnWMiC
	0FaechXF3vmBTaZETmSvvtJeOHnGYo0EWLwBw681x2Ae4J2I17yOWISLcjf1y8cc
	PhyHqKCUOzXPgZsOiPuLFsqNM/vvfK74V4JcpzFPAGfWP9VZXal9PWPxQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012046.outbound.protection.outlook.com [52.101.53.46])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gdpfah8bc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 02:32:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h98vhYiiF7StctD1EFqx+MK+5iJEo6o0ZKGHAGk94dratvfMo0whgGSdvLWivyR6kHHs8lkNNyJkM8W5HmZrhAJniF02CVS3iHD6QdIgaybHZZ8qvj419ehkjKVKCMIevXEGXeKTl6JtG/ua1loMRq8lmICgV9SJuGQF+Xa25hZGTHCrYU8fdJ0nKugJZif0Vrgdx+JJe/5Zh4weFgtob2r57hwLkMmthBBMrIDlMdXMJYiCOmdeQXGz4XfjmdiiNjg7y1I5+h52oRqjbn1IQ1SdkPi0iWTntOn+wp4A3Y4nlCm2R8vwEbVGXV840IqiY+xJPaffECyGfmqkc4Fp1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5VdbBFQUAPy0O7kNFl9bkRfxlSNTkQiExRSwAz045s=;
 b=hsaDPsTHWb0c5NOYrgI1UxbWT7oHcPfIIAKvJf4K+dLYqjkXi1t45DXIf+6iSVU8iWdjFspxFLysOVC8pjAyjyeAa9PoAUmSZqps8CPYYVvy2VlCEaxb0Y/A18Nj2mmp1XYx4HETSj0g1fMzxo/CukZNCwjS04HHpwmWE1sqvzgM6Ip3MheBWdLXhHBSaVGl4qim1220+rH+XSw+DAYKX5eiTVz/80vQWw39K7v7Yl+8ZUiMPaIIVGImpFwCvpi51OZiRQhA8bUZs4rplo1bLhDOJBgs0cM1OseEwDYTref22di4cUOd1tOu7A94GEUOcOH2M3HCJjMFTgkGLmvHFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5VdbBFQUAPy0O7kNFl9bkRfxlSNTkQiExRSwAz045s=;
 b=WExHalXc9gYAd56ZRVLZQJBQcjEAyizJPCbRZMlXhIKkjBccWL1TnovuCTpwsieRBJ6RwjH9jjROHJlBuTtdbTBhp+eitUu48LQ1H/MllxDln1rCnmhSNAokuJrsG3wv18crS8QgKKqJG1NGztZR019VO6RlNsJU1e+D79IM3vw=
Received: from SA9PR03CA0029.namprd03.prod.outlook.com (2603:10b6:806:20::34)
 by IA4PR10MB8587.namprd10.prod.outlook.com (2603:10b6:208:55c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 07:32:38 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:806:20:cafe::7c) by SA9PR03CA0029.outlook.office365.com
 (2603:10b6:806:20::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 07:32:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 07:32:36 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 1 Sep
 2026 02:32:07 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 1 Sep
 2026 02:32:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 1 Sep 2026 02:32:07 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6817W6N72360194;
	Tue, 1 Sep 2026 02:32:07 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>, <afd@ti.com>,
        <v-singh1@ti.com>, <p-deshmukh@ti.com>, <j-sahu@ti.com>,
        <c-shilwant@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v3] ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
Date: Tue, 1 Sep 2026 13:01:28 +0530
Message-ID: <20260901073128.1118254-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|IA4PR10MB8587:EE_
X-MS-Office365-Filtering-Correlation-Id: c0370162-d326-4b61-ee13-08df07fb320e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|10067099003|56012099006|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	XTBhZKN+smkrRWvwQD3UdaqhG/CT8cPydFD6iqYHCjEmcx7ua1ci99sFZmddvPqNDEbhcSqW7OFWTfYe//0LixlqTqczKbFw6wQGOUEhUC7LhrCczYj+2ShVTl88gAknyFPUJXs2aE+ETsGZbbVXtEJ65RBympkuYmofRoUiSdCZkCOHuzStDHdgsysiPkUhg4yrUrmS+Ofx5oWVMqPlyKaNNKByNHGwZntX8m62FyZJFLl5MTbz1Dj/jlrzj/3EDzA7pMOPiWsPnvq1znpPuG2fFYOoNmI9hkeQBBuL7gz0E+cJNXFb7Ys7uDdd6FSN0M0h8MK5UBaU3TFqOdmsjHzvxeZxA0rTlXEwjiBfAsun6PZM5d0+eNzVAZsh7vHGw+zn/BnpFX+x7XqQ4vVnm+OxkvHVxgz49pAU2hAaLk7I4UbYMoQRg96l5LQo7+4xTRvM06r0maX0M2DFfOS5lixd5eWYiLfLVn1HhBZDOOx1riwFVCUp5uhr7i1DGNJrWYyxrrMg5546LEF+Z0N70p1ITjsxJ26mEdyAZqZtrteIF/xyR0LabYEUkiVoXJoEuU3MEG9+5nqO+etdQSW6S7RwoYnqQeVBscccHlI8j/VkkxS6fi+JAVI0/bbWH6K9UQyQ9NCk51g7UYZgV+OZsA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(10067099003)(56012099006)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0sSZg3PZBy3LVZhr3wiu/oa7ffR/6yG3/C1cU9dfZOR1i+4qeYdHE0zx7SIYQn6UNjKhGLG/ZK+DYeg98YO6ZR9BrXuMg5zRVLFBW5OQ9QKQPkNQBf3qx4bJ39YaLlI4PhzDDY2vEcg+8gpfqKP5npWQR7qlub0JNrO27KFizZEujgQX3HxifvMqDDYyatTO2ZlfDVUqMdtmb2JsNjLZr8ZgOQ7WZROPRyRdXwsRYgbDdku7+1HduQccEQPd5wdFXtbtvXMydcL8xfccVrcyqk2cL/vker4w5vTQ88FYEau30hosy7fTG52JrprmlxHj5kSiOUM3SVIL/Z5IYixld6V7UHEjgbiW4hjhwlbyrr0AoIZR1bzuthQXe0at1DZYzgBiJPSEHXMiRZgNUUs6XuvIePpOb1K9N1Ee1/WkuhZph5sXRMr3stHTHXV2WfjJ
X-Exchange-RoutingPolicyChecked: 
	Ecz2J2E1b1q/VkPQ16h1+cfy7wZywVX0N3T8/4KdTVRVXsA1WPtGZxeh7wZI1dT5B0GjerJRWWQuCSOwiW8+y/ETTV8xx2LwpeuYSIjN4pZXB1wuhMF1T3d0XwzxyIjIkN0k6Q2qd7rzeYQLh/sTTgpJPj3giWH+tBwDXZw6s8ZzDByYZFG5vin67VFKdPljBLCSjn6B0QiAEED/LlLBGindL3bnb1ApF+anZhNIj1/8TntKhP+lYQ2mqLRo5hoCM/zi35utNQeIFtdFJBX76Y33Rq+DEFMq5dJiWeVpRRno3vyJCMSpZTC2G6kk8ib/Ypa9RCqrQH8BdubsC1I1rg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 07:32:36.7134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0370162-d326-4b61-ee13-08df07fb320e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8587
X-Authority-Analysis: v=2.4 cv=Cp2PtH4D c=1 sm=1 tr=0 ts=6a967f9a cx=c_pps
 a=H8Bh8Ha9hE1t7kEFpXBZew==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=GjcEPfTXUfHWH2LR4BAA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfXz3saetFM+ivz
 nZIToZi6PkEdOcF/ayz1lWtjogPnoQVH8eCY5MmnQFqx8oD2k/z0yPpmU7GJ7OFM0t0y/h1uT4w
 FwnymT8TSGcvbXzyVgwIxzkuuRQvkKlhJuwkjtxDdvJXFEEODGefEXRaIayozE5POV6XDxx0Lic
 IUNhNLKGDU0r3Aez/mm3BImPfDVHNOq6qEN+VGS8FzpZ0DYDoM8B9OJfyrZeCxsFymMrw/OS77v
 eDoABtZHHihBJOAbCkcOyfMpOeN5Cwl25HWJJb3XMQq7rQsbgNNdjcDLKCpRJvWj7spkfznIoYB
 AqZo9FanhS+C4mvHKKmgyz6jiuHQ953TfR20ZBAdVM7KA0BPYWDay8xKewvbX8GMdeJAEM8y+fJ
 PeIF2/Up+QaJEuiqOWWV+JgFZJ4ocAJPvWUHj0E9H1akfeoYRQtBs1cEWH3ft/oXUKLyPSUNm6X
 bVZG2FjZVaYauuim+GQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfXxNlVJhO+gc/w
 EAw3MVX6F76rfbzai+D46uXQbVDuKYW6Ez9qPoNlL83tkiTCRW6BTHLdOjGo1In054vvO+kKvyT
 p/tOB58fdZOprmPpEVVr8uYJb52XtIg=
X-Proofpoint-ORIG-GUID: 6JpSvUqtW7mlXFqujmmcKNeVh9sOqQNN
X-Proofpoint-GUID: 6JpSvUqtW7mlXFqujmmcKNeVh9sOqQNN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010066
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Sep 2026 07:32:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20319

Set dsp_edgeai_c7x_1_release_strip.out as the default C7x firmware for
AM62d to support EdgeAI and DSP based audio pipeline.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
Change log:
v2->v3:
	- Remove meta-ti-bsp from Subject
v1->v2:
	- Updated name of firmware.

v2-https://lists.yoctoproject.org/g/meta-ti/topic/master_wrynose_patch_v2/121010659
v1-https://lists.yoctoproject.org/g/meta-ti/topic/master_wrynose_patch/120772787

 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
index 20c6b531..aad5ea06 100644
--- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
@@ -47,6 +47,7 @@ C66_1_FW =         "ipc_echo_test_c66xdsp_1_release_strip.xe66"
 C66_2_FW =         "ipc_echo_test_c66xdsp_2_release_strip.xe66"
 C7X_1_FW =         "ipc_echo_test_c7x_1_release_strip.xe71"
 C7X_1_FW:am62axx = "dsp_edgeai_c7x_1_release_strip.out"
+C7X_1_FW:am62dxx = "dsp_edgeai_c7x_1_release_strip.out"
 C7X_2_FW =         "ipc_echo_test_c7x_2_release_strip.xe71"
 C7X_3_FW =         "ipc_echo_test_c7x_3_release_strip.xe71"
 C7X_4_FW =         "ipc_echo_test_c7x_4_release_strip.xe71"
@@ -101,7 +102,6 @@ do_install:prepend:am62axx() {
 do_install:prepend:am62dxx() {
         ( cd ${S}/${IPC_FW_DIR}; \
                 ln -sf ipc_rpmsg_echo.mcu-r5f0_0.release.strip.out ${MCU_2_0_FW}; \
-                ln -sf ipc_rpmsg_echo.c75ss0-0.release.strip.out ${C7X_1_FW}; \
         )
 }
 
-- 
2.34.1


