Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9033FC9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 10:20:38 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4483.1790245231630738293
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 03:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=N9hLuOHo;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=QVH1lyXy;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: s-sadik@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68O9HY3O3355212
	for <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 05:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=heOr8/QnW4eJ5
	ba+k959L6TjGzcuVhRGdtvyXwNzQJI=; b=N9hLuOHoyUBubD85WJ/+EJ4ng3WbV
	n6kOerexAkJ4serFDyCzXCqqeGWBEAgnvwu/6M4LCf5SE06l3BMgdFoHGsHwyzka
	tq0YMI9I8LIj5ROk6A4Kx2yUEoFhpYflfyNWtcMzXk2XTBe4vkHVa6HbsXYNQBeJ
	EN56VBHreWfQcBoeLh01q7zCZLF18lYB0zX0xKWwbRHPO8uWwVA5dOkdkWDeG8gC
	30ZF6oNl9lY1owiKcFcWGWYrUL7H9r9q9HC0zu1qSKLSAE/et28LpcIuKq2k3E0f
	EVBhIsS6I4DcLlKTHK/sAVkrtTiHov0Sd1MjChRc3d/DxlOCWVd/Gw78w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011028.outbound.protection.outlook.com [40.107.208.28])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gw13r8a4k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 05:20:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1skizE6lr8psqepxUlFXsUMQNH6uot6CTgCOZoh5e5RVB4jkk1KATx1ky8dtH6sGDtXQ9tjSa8ABhidx9FxqGrms7bFth0WwAsX5BRB/Qg17M6c0T1S6bn3HFoHWxFV7abvSPRdfY5SFZTVEeAC+782oPhSWTvcHd/D/6LY78jcWiJKrN7abH+UxMvTOu+okfTYyAKzaMqmLLcUa57zOFvuu/f88XxDTwL62HFCGc4+qZGyROeWnQ7wAOumKHjg7qM1MEpIH05KcwglZ9kreR0qC6QvotSwtwjmW1+2ii5OtBPtJZRbJSi3+Wbofzhj50m2wIY0xuJTR7BtGxwQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heOr8/QnW4eJ5ba+k959L6TjGzcuVhRGdtvyXwNzQJI=;
 b=kkAhCrrl48q0nnuGp42I/yRGFWNHqUO4NNzCbiqyUotH3xCz6CAAGCwjloL0qC5CyfMqlLLD0qelGt67pM+1CkBFQ4FTMPvhSpvO1KxcWFOTbS3p/1jK3tIbB63dpov/4Xr/9i89irNN7kqOII54qLu+15+axM+Rf/jScYhc89eSbbfS9vKeRpKISacmpr8xcMrSeQQ+SsyVEOsEz/NukiJKrzxx/UNRJ6Gvk0Fu22gMsWkLkm8MdgOYxw6J48+e00lJLqqR0fdTb4X28d6NQHfoqOYU0opKvJpDXkA+pdGw5cp5j58UdPoKfMe58KedqmSwIBHSc8rby4aMtQfqXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heOr8/QnW4eJ5ba+k959L6TjGzcuVhRGdtvyXwNzQJI=;
 b=QVH1lyXyWiUgu794j5vp+pUoixxiChpAeHvouMlhXFZGKWeqQ3p5xB+JJPod3RP30iIoE9JScTZF0onMsJ9uyobZZlQqgZ+Kv/GKBIjW5oMhs2FYZajiuC3zUU14cdLAsAezY0hITCV0QzyJS2uYkGtIrtTuI92WvCw0DDqgntU=
Received: from BY1P220CA0042.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::17)
 by IA3PR10MB8638.namprd10.prod.outlook.com (2603:10b6:208:581::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 10:20:28 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:59e:cafe::58) by BY1P220CA0042.outlook.office365.com
 (2603:10b6:a03:59e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 10:20:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 10:20:27 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 05:20:12 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 05:20:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 24 Sep 2026 05:20:12 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [10.24.52.210])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68OAKAmH3912622;
	Thu, 24 Sep 2026 05:20:11 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan eatmon <reatmon@ti.com>
Subject: [PATCH v2][wrynose] conf: am335x-evm : Bump up max_leb_cnt
Date: Thu, 24 Sep 2026 15:50:01 +0530
Message-ID: <20260924102001.820922-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|IA3PR10MB8638:EE_
X-MS-Office365-Filtering-Correlation-Id: e107f768-c62e-4d73-31ba-08df1a25740c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	gpFpic+eL+0EZZtZVaHZpuoaEbkbNSLWTaBowMZiScbCSuQ+LmLtDABPZTf/2tHqeuDvSjtDxdxaCkiXkJX5heNwIQ8tiOqLFAqSrhrgyb9oNVA+boXttywDoGOG69rU8HBha7lpdtvY6Obud/QFufuL/5wxYIYcZ+0/Rc5xgltMjcTKQIiL4j7MWp3Lb3vXWEtMF3q/d9oS4RDEyuUnrsk+4tmeEGcuPOQr4cPEd1mv2Y6OhmwGabthWvOZ/mmI84Ze5ZZ8gbxC2zXw+wReOxRqUSczsKTPJxm+qrXWFbs0eaKuDJfIP0jt46j8NLBiFXMrxqF4EPUwxpiYjec0qxGnQW7MXq/tTh+zVGbZRP29PUwiwfvOggjSTbFVaXaOBuvhjNQwWe9tGFo/7yB7qYK2Y2ZPZ20sl+dzfhJF3Bl9E+37Z550Fj6HD3QJHlRnNhX9RGFy3i9bTXxjuOhTYrRs41ogLwekQsIvuVt8OhwHk3eswz9hMDua2fEKEN964af3o//VPHmvpPGiRhWouPMkFXnkVCT6Y2KsbPE42EVPJQzXsYB6eTHZJxZzjypn4iMNP78bH+tmaw9KrpGbMgksyftkkPBao+U3ADvmxrGoKy0bFxHCVEYOKBPG9Xl3/+1X4GfBsYt/4Wqg5mTGsG79NHYn3rNuoE7152ho0h/67t50QPwYn0ChG0dDRxVaxIHaWXLWw1c3YXNmMPSoFA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KVjNPzGNoS0CbsTdnIcckIb1fLfaj6ix5jSnqcaGKfEp0B+RNLN6yNeP2c/t8+iz+7BdIMfsJZIQKlRgAnNJ0uoAnC8npJUdeASnvCm7I1doX8fXuFAfQVE8cnPTzx9JwVuYE3uaEPs/0IGe3zWYGoIPsccwROcT7cM3KRV2YXxPvWvw4TysqiuEHs526RilvFmri15kEYCYXUg7Jqm+WywpJBcSBC6Hi1Si00CjRixHqe3uUwWOC3wtYsWe/GeI1aMWCYi3DL1UtvLqF/7mxohElx+U6Xw09oc68NvtsCD2P5bBrISNVJn8Zvw3o2n9UjGfuuLE8VJOiUC8E5vktg3gxcgYdyC0NKSZjBKgZOP3PDNMh++rYWOz3klDpFNeeXCeJfVQd20LG7Flh3lw0PB3WlkxXtPNcv+O8S4k5lJRX21y+rFyJxlKHwqg80DD
X-Exchange-RoutingPolicyChecked: 
	gZA1WKfu29PPKD0VxY79jz9b27fV4bfsf8XltvVjWZzOdJfc/lNECXak2isFr2IsIMHKud9ZHpnFzXQCIsJF3HCkT5Se8PFUp7DrjDBSwVOSn/ZEqzX29AhiAFXNZHwEu6hcE+2MT2f2n/j0WxZCupiBfi/tUtCB1N97nfJCHR6IRHPMeXBM4ZsZUbwQpol62eVuRUylkjbRMbaUs8fLiFWE1KhouCkHvsc9a+JeUpNgYASxILSNBC03RhAMaZcWQVW1LOSxg5GEjlNEg4LbTvdd8NzxgYkrSdUX6GpxGMI8GQFkjpkv2mIr1Oq0TtVF11Ac9dsSYrQ2AZyfyCybYQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 10:20:27.1628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e107f768-c62e-4d73-31ba-08df1a25740c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8638
X-Proofpoint-ORIG-GUID: 6rkjY4EPQCjJrKlnHaSO6m2R9xvX9O4M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MyBTYWx0ZWRfX23vZuGWcjEKb
 oHUsl+K9/TmVPG5Dd36qh+Ag8kWL9Yqj71dSLYydvm3NIOCozfs1eHEULdKKyonmhWm6P0Isdwi
 HuUNB2JMd/zeZE1oWVu3Ynte5kcs3suZHOUDqVR6sd5HW0AgpTOYzUoydj4L6g0T4Xgj5FvNuA1
 zb6A2zwHXgcBusJilwr+fYuT4OFujtaEXyskSnyhRsLvwESQgr6t1iJw8SXbMsRdIDcuVHH3Ute
 /+VHRR8yvIc75oSfX2K2d7zxWZzljI+upLB3Ut7q5Cz3GSou4gJrniGZVqebq7I0FwlmZq52AAG
 RL+lYim+RFOCITIVbe7hQSLY3ZyknPRQqG1KdWAC4EV1uJg0rPrGL3NLcXgZwqqmXd6tLUh4Vac
 4vpnSgMmQUEDskLSnIva2aaGriwKhRTpzuY9DiwF5qTV9W3m65iHAVfc7PjKlvAm3D0PrMRfP60
 7d2CbVmjMZexn4estKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MyBTYWx0ZWRfX1A5Iz8tJl/Cw
 qxZWlZ6RSm873b/MFmKthB799i1JyMlNlRgotW1+4E4/4dwwT18m38uMawqsoCC6LiKlqSf9I2k
 ek+AnygmdJAY+GpF/QM/t0fe1qQZfCg=
X-Authority-Analysis: v=2.4 cv=OICyTiaB c=1 sm=1 tr=0 ts=6ab4f96f cx=c_pps
 a=r8gZD2gelFFA3OdVKTiE/Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=BFAt524beoUdfqecyIUA:9
X-Proofpoint-GUID: 6rkjY4EPQCjJrKlnHaSO6m2R9xvX9O4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240043
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 10:20:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20411

New features added require another increase to max_leb_cnt

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
v1 <-> v2
  update missing branch specifier
---
 meta-ti-bsp/conf/machine/am335x-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/machine/am335x-evm.conf
index cc5d87d7..0dd4e7ce 100644
--- a/meta-ti-bsp/conf/machine/am335x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
@@ -22,7 +22,7 @@ SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 18000"
+MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 24000"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
-- 
2.34.1


