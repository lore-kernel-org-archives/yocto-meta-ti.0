Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6772.1794394206040904909
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Nov 2026 02:50:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=lBSsj9vU;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=aSSBV6Wk;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: r-sharma3@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB7MDQa088623;
	Wed, 11 Nov 2026 04:50:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=R5vS7JOX19wFU
	2VjzpRz7XIVyOv3kEtMCT+O/tVES48=; b=lBSsj9vU9hOXIQpVrQ9Y6NrpLT7BF
	oJdjC5UiMsAguqRuXjBfLZnM0AWiDhXK/AKsmXDeAf3hbgcuNrPD7lteYPaSfEM3
	9HrsMlmBSBDO2QVXXiMuEpcyPkMliBPRVFOAYew1PH277osVUahQzPrcTEcNihax
	v5tK9DM7raIjkdDVCc2Zo1yUTIZJ9RcjqCKSGEefCmBVKR1TvQWTfGXMexVXR4Cj
	jEDShl/wwxGCjfcGGhAj0YFI5H5HbmPjFTM5oCteE5iVgQEQSaYDGLHFi39zLIaV
	whHSGP+JI9nSWUqu723EFG+3hXbF+LvX+GmQPhHLV+Lm9ccBErLXjyKgg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011037.outbound.protection.outlook.com [52.101.62.37])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hv9pjv8yp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 04:50:04 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbHw1PAubl89dE+7VmKFtTteJlAryI4JRZMrsIi1hUuuLh3/FhXnSNwEg5oghZ95LzQpKhDTAagyr+Tf9EL7qBgAms6idx5AyvpRw7v6cTwTJZmSUw55M0rVWArC9jUxbBpUtfSLs1498Rq3QMWt9Dhkfi1gwM/47Z5c7lCOKo45KSpaCOAvMkuLKn8s7MtyLfejaQvTUEubQc041G35YXjam3RNa62Dfaqs0MLdP/E7sAuQJzu31AlR5Iw29nyAH5YLanuCdC6suNgEUiQEOgv/JELl1jaff2ooxksXmF+ziciEztRUo3haQHPCAmmnUyLQ6SkctDdpe6KD4N9dWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5vS7JOX19wFU2VjzpRz7XIVyOv3kEtMCT+O/tVES48=;
 b=chr6YCAPwxOurBjD0dMAvbetZQohwiklKPfM+UWW+mYGS+Xky0OtnW8veSBjnE6we9113aNCe3nnHdi/bqLLgxQV+MWrwcCjLrE6nh49Q2oHl0xvFiap2SokOqD7rTcH/YcHktUb3/4sxWGyXIWYNn/q6OsRsKGYG/QQTNqUyqpBl4nXmrO/Vlu8rEIVktYJ4sCpc4Kks7QInGnxrO5DMsl2yfFdj9RMe8wYAbD0NKHyd6Y65v5loOgodaqWyWQHV3AyItOGScEt741HeEv5lERkArGNbs3h37CGXTeen9pBZf2VcHDQSE18jXVyIPhdhK8Y1pgcZA8XjsyB7XVLdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5vS7JOX19wFU2VjzpRz7XIVyOv3kEtMCT+O/tVES48=;
 b=aSSBV6WkmIYmiSKGyvSiEq23AAVzsTK0e/r2kmovEllm5N/K8OvBWL922x+GPf8S70flnOP1iXsUOF5v2n315SZy8Y1QWrI25AksjBc4pnChpFQ76tacV0ASRzlM/Qvmz39XfYe7CVZX/+tMdd97f02DEsY2d5aaWlggtVQ67d8=
Received: from CH2PR08CA0005.namprd08.prod.outlook.com (2603:10b6:610:5a::15)
 by SA1PR10MB6664.namprd10.prod.outlook.com (2603:10b6:806:2b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 11 Nov
 2026 10:49:55 +0000
Received: from CH2PEPF00016D49.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::35) by CH2PR08CA0005.outlook.office365.com
 (2603:10b6:610:5a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 10:49:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00016D49.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 10:49:54 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 04:49:31 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 04:49:31 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 04:49:31 -0600
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABAnTAF3749975;
	Wed, 11 Nov 2026 04:49:29 -0600
From: Rahul Sharma <r-sharma3@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>
Subject: [wrynose][PATCH v2] Revert "am62lxx-evm: Add DSI config fragments for display support"
Date: Wed, 11 Nov 2026 16:19:27 +0530
Message-ID: <20261111104927.3231132-1-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D49:EE_|SA1PR10MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 512f3a31-5f40-4a34-0dc6-08df3fe18551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|18002099003|13003099007|10067099003|56012099006|261022105027099003|261022075727099003|261009223027099003|261021123027099003|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: aVVGmkm7Xmg47Eyjj8MAY/UUiGWenf+Is6JwpZ5h2Jre8udcI6IJythZ+eGw8uB382tCNsFGdS4hP6Kd37HECYC9m3LD0JuJkgaWovmL4DaGhXNSrtIdWnAtobxLBv3zO3A4QfuNMcX6WIj42/VqJH0Y9aF9Kdqr8bl3OHwS/Luw+CaASiNNNo9b0BWppoX8Lh7rEn4DxewyzdHFsc24aaE6unS2aR1b+BlrcqeqVXUcxBCS/53haqyaWbVizhNjbCVybITeiku6SNtFeS1zvCOGM1pzgTSRXKkwnoTXl2JBFTB9VIxL3XLTOkhB6LsfB67YpfoU4rPSj45KwoNB2B5Ly2QP/C+muP0EwWKIciTE3Gri2EAPJ/zwLmH0bIQiRRfPqF3+d07TP9hcFekcet43PVN1ENq56o1QxaU8Ogn7ed6eYSdxyWuemsDJ5R84WERLmjm5e6/up2ywktuhZSsrTcMjYUf9j2gtqVRCx87+IoZ/4/uw4kdkjwk1vpstN1PVHONJwevYVZVD/p9AhUydpls9yQuouL8SasMzfkmC2rVrOA44VjLoPzV8HgrOFBnoCWM5VqMgS2ztxfyqmhWgRxbmfEELgyOgCFFA8bI1AdZ0715aqfxRhrm62L40OVaiTQg00ce9qF/jNfh541RDRhU0qvwgGFe2tIHn1ik=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(18002099003)(13003099007)(10067099003)(56012099006)(261022105027099003)(261022075727099003)(261009223027099003)(261021123027099003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jnLeNTU3o18U49HtVm3MbO4MC/IR9RwTGxlkLcctwdxwnDb0m9uXzrEouwfjojWm/tj3mbyOw80mbatM+xIoF+SV5OvGOUug2Ll/Mg0bQCea9XKmwZPwar/fStGcbLkp/+Gmrkn3LMDMwnTqhYVte88wMgwbJEfxzdcEaRqTmS+Jy6cQkXa2XPMxeyh5qfjDCz3dNAiwfBDFL9/ip9UY7NDJNUMdgB04YrfWY5vOxcWgXeqX23VatevZLgmpKbOrarDjRozO7eiF2GG1XTz9AjfKM9E/SAhOKc2Mqj8OSDToeFLTmyofeheqhGlCxAwF+LRlIyaR0QfIIQQMfxI9bsW6CF9wJIhQc81mDyLGOENC6UnArH+dhj2iH21lrJeL48PYYTcsO/IjS4ob8FYz/SITidVcevwLgsEeDd9l0LG3x37fLNoO473qdgTntq5X
X-Exchange-RoutingPolicyChecked: MrD+DExiOVQBW4yZc050KCEZEqpBV1c4xmaWCJKReeVrn79Vg3UjzNtstD9NIy0qTlM0Ujem6jJhS4W5DPu1pOWEIKeMr0jkC7udQYr/HWVIyDspMzgHZXHdhSF+RbJQVkcLca+9Mp/lPUwELjc05hTZff5AtlPbhfXbHTivMKvfttJAOUzHYd59gA1E3WopmnCCajOLNhqopDuW0ZSbLvXfc4qoq7hi3wGLkt8hkH/VdEXCIequN5C7QGQnrQwshzL2PlxdIfZgrfnXf/pUM5Xq2KXp9YEDBcAzKxUrbOc56c0db2IurAFNJAhyoNUdmTB8vc8vec/aA6rPejXkiQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:49:54.5827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 512f3a31-5f40-4a34-0dc6-08df3fe18551
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00016D49.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6664
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MiBTYWx0ZWRfX3ROOeJV5xk/N
 N/dpdLMbjIU8KhA8Qr/3hIH2T+QBqQZY9NLTu7FRysZyCe6uGFBfSUJbndXvZt182QSESpZtEtu
 wGbBL7ISx2W5A/8T8zU8wOlwjrqacbPSqzz1jDwWrlZfmDvDY/BBHBlUZYwjK1MOg6J43W6pPG5
 0dtlEhEfmlD6w8qnOhFgdaPK01s61AtlAdp9NoEwu6AqMW3e0lzfbw6NhJWMecRl9UodR73CQGA
 D+yixih+pD6rFk0Am/2STTWnC+6ivfXmiQoi5j8GfthSTbiv+aAXgCp+YEqJOo/BNv92sr1+1nm
 AkiYZEj2Uw2n/FenhYEVhisafPbyn//dEzMhSm4NdsFNgAdyiEWj4TwkQxjBHXV/bUThDNEXeoS
 CeTv60WZFgJKVow+EQQzpQTC1xspF6TmogLAkf7m/h+qZo5EDOWzmMT5AmhSkCckOHEtWmtPuYb
 dmLYafQvmamN2mAd8Ug==
X-Proofpoint-GUID: Pf0_P3-v-AorJVBvg5fDcTn2t4Bdc8ma
X-Authority-Analysis: v=2.4 cv=ebOo7LEH c=1 sm=1 tr=0 ts=6af4485c cx=c_pps
 a=S2IqtmjrQAXuShkhhqPLog==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=MuvPAC5r1YZWxbEUYukA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: Pf0_P3-v-AorJVBvg5fDcTn2t4Bdc8ma
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MiBTYWx0ZWRfX7kEyTNq7VpTa
 fou97Rvi/daPAM8CpDlMbE9og/vGIB9hRk9yF7kGBshzxNynlqTOq+qRI/0T84McaLYSkGx1fIO
 bdRH/nD9q/pO5LF8Rfod0k8RkLkpel0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110042
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 10:50:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20520
Content-Type: text/plain; charset="utf-8"

This reverts commit ce7e8077fa980d8e634db3340f6f9e8d81a12123.

AM62L Linux boot hangs without simplefb overlay when the splash is
enabled on AM62L. Due to this, we are not enabling splash by default in
the build. Also, the main reason is the config fragments should be
handled natively by uboot repo.

Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
---

Change-log:
v1- > v2:
 - Updated commit message
 - Link to v1: https://lists.yoctoproject.org/g/meta-ti/topic/122207381

 meta-ti-bsp/conf/machine/am62lxx-evm.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
index 0799becd..7a422617 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -26,6 +26,3 @@ UBOOT_DTB_LOADADDRESS = "0x84f00000"
 UBOOT_DTBO_LOADADDRESS = "0x84f80000"
 
 TFA_BOARD = "am62lx-evm"
-
-# DSI config fragments for display support
-UBOOT_FRAGMENTS:append:bsp-ti-6_18 = " am62x_a53_splashscreen.config k3_a53_dsi.config am62lx_evm_dsi_rpi_panel.config"
-- 
2.34.1

