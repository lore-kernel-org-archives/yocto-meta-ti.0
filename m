Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AD6C5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 06:22:55 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36805.1786083770975655926
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 23:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Bpp3UzI3;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=VUABOJOK;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67767tmD2309723;
	Fri, 7 Aug 2026 01:22:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=zruCWt09cbABJ+oQdg5iykRhpEdxwFrbFIJc3nPzl
	zU=; b=Bpp3UzI3Lmfyaf6S5iShmn+Cyrr3Kt7Q54sQU295ezqBAkny1XIryja2s
	l6TjiMKMDGLuqTqMj/wZTLjy5BO/678mKibMxeYZLmnJ4YIyZjE6SJAQrlXEZjZs
	SnfmbspI+D+w/tvipK9NwRnWLiwM/ZA80qkZ1IaAP9oMCG2h7R0pSDGeGO77DWBN
	Wfqhh5iaDGbA0cL4pPxEkGRzlgWzt0Yc6bkCsDLJJj5XqllsTj/1gqjJUHBo9HLo
	c1C/S6OO8+mcpLTYH8iqtPECUd6SBgpDg7qG2WO1cvGnKQpGPp7aSXYbTutI1x7I
	Wf7LtoPUyq6iBcFxgTXV6MzWz4cfw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012013.outbound.protection.outlook.com [40.107.209.13])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fvqjgg3x7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 01:22:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5PgIhXfMG+/G1LEttNb0Kso176rINKyGvMuHH/HKIZqJCtNbMYk41OFJn5xOv31NaHVtjHdKn3wzRLudq4THaPdp/BOfTYLRX74/IDD0feDYK4VahHPyWZR33crNipi0+R2eie8qTtwc1GZFu+V5NAKlTjcgnSZoWxGIxEnCcbTjd+YPX/eGzawszmMjbyMwxM1zJFgo5hJVsECrp1qI0mwAEavCBlq0Vlb2sdzACPF5QHK50mOPg0i0h5Wi9aL5ZxjhPiet4bTbC1Ia8+ouVWDJZYEmzL4WXMK7XMUH+O+KrMi0C9iWPgRRwCFSN7emMZH5vXeBd/Kfdnd6lazzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zruCWt09cbABJ+oQdg5iykRhpEdxwFrbFIJc3nPzlzU=;
 b=wwauv9mp5/pZnOC9UMd+Gn0KqWE31UjPq6Relj/S9x7IKGDaNDIVv2eydWqsadsLsFoprNu0ztIh1fjOgGq1xeB8uqqBa+ya+l9yJQov5oKC1qSjRtw4YPAr+CB4TernqQL83WnB9/Ezh8pXswbp+egrJOiaJiOfhNoRgB5oyXM4iVzpf0Ol8NffLYW4b24r9hxgskKyo682t9hkTw005Y/el/GmG3Z/L9V7ibAfIW+NtigIiTC5JWBwIrtTvPFrCXqOTJPNHqE2bhwpH+dok1jg+5+jWWMKAGIOvDHaw9sWuYgMYISqwVUmErHoDpXnESmcPygHURPVJ88AkqkA1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zruCWt09cbABJ+oQdg5iykRhpEdxwFrbFIJc3nPzlzU=;
 b=VUABOJOKDCRrRLYz6wJnxQp9/9EJowNS0Q6khmeDMJMBRPKZx1ROsUtuxHZArEThC0ReuwyAChvWSCFL4qekJ48Vv+0hYrrzd0asvaJdKyLwj/tc7Ykh1U5fYwhAOHU2I1NtGt5JzXPG2/zLzerWcUn7JB1kBEFZFT8r0mUEIx0=
Received: from BN9PR03CA0585.namprd03.prod.outlook.com (2603:10b6:408:10d::20)
 by SA1PR10MB7737.namprd10.prod.outlook.com (2603:10b6:806:3a7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 06:22:43 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::76) by BN9PR03CA0585.outlook.office365.com
 (2603:10b6:408:10d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.24 via Frontend Transport; Fri, 7
 Aug 2026 06:22:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 06:22:41 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:22:08 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:22:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 01:22:08 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6776Ltrs537827;
	Fri, 7 Aug 2026 01:22:06 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [meta-ti][scarthgap][PATCH v2 4/4] initramfs-module-netsetup: add j722s CPSW proxy-client kernel modules
Date: Fri, 7 Aug 2026 11:51:54 +0530
Message-ID: <20260807062154.1387339-5-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807062154.1387339-1-m-shah@ti.com>
References: <20260807062154.1387339-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|SA1PR10MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: be6b03a7-cf31-4b4b-64c6-08def44c4957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	rtYkAS/DIDZsPBehwxdSo+hHiofm3KGhGw1Y0gOEpHZNMGg6HeZnrOmbui1+h/12rr1faDMu++gYCfwVIMgAqRqecDR+t4mBo1Va34cAvrKqgFzQkd2AcU8lpe4DJylu581F0wfqPAoKufDjt/xuCmT0YgQb3G6dDauovyNSwzbCe0wMKwPSS5XyqKfct3MGUluq5Z65MWN+LYgtipX1j+X1s6zRTwByRlTXo+hsMTiKo6LnQRCbKkBDTFCIdvwDFeLVxQTquEzCkeESBAr1bs8e3FfLCjg6kznlafSasjzhgRES+eUu5GsJZLN25I8YUPbCcxJPJ72UHkz6ZO+rRfcNiw4cKUrUwVr9iWQQ7fRF2viHJXOpaCzAJazM0VtG9ioNQOKcRjtG9FFyuWQ/+7d29tLiGSEqcRcvFn7DEzjqJpcw+A8Fa2cNTpAJ5Or0uwa+2UD2hdGsBrgORtZ1t6Q2pe2uGYRMofOqhSo6x7RjxDfzO50UZMu3FnPhQLwi46HW5ZUcdKC9pSQlbxEkduBG2vuu9+U6AveA9Xu4Kd1cmt3aWpjIDgo4Fwi9SP+JzSH/THWH7DTyhLMKMUHoi3TfttIamYt7BT1Ybafc0pIiEWVufRubMVMTrrTpgnX9/1DQVxGv2Thf7oeV13kB+4oH6gtXAJS9mDWOG0u0hk/Phk9deUY7QvfxTXnz+B8cd2tOzKWfSHMGK9ZV2c2m/g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0FEEFNuzD2vhVrCR/1KC7m5XZ6a3oNeokG2HIfPzoimDiLakzIkros/ZuSPPrgrlss/AQpAEhAHysoEVBht74jFPNjv36gFNP3dk3n4wXZ2usfz0gNfZc8ZvmhMLH6MCEGVIV/JsJm+Iz79nCco+YXzq+e4knXTruxcIG2AaIe0NfVrDZo0SfEQdNLUY42MqCGlJo9Eo4GkNzzWg+g3Y30wvopAjz8fyu9BZVaFSMY89gW/SBawJVsxYLpDpesVuXtTMgtiyOlIDTyNbOET0J8zScAsV7EIGuakoPwedgr3RgHHmB31OU5troWnpoTsMvKnGNCo3punFU+w5h2M6pRkfMcUa0VwuXOL3pUB+jQs3/Ej59Q3S+MD+2eN4UZI4rPrGKOdVpgNxfyOvn4jLL2Aocb9OJbwznmApVWQLi1kFhAgmK4cqGhrhuepckYQi
X-Exchange-RoutingPolicyChecked: 
	TkEEHVT1lzdF0qQMpOOz0wcx1YV7/vJFJJnXBuZglZ2l29OUkfnjsjPzOe/IY3QqPVuZvO0uo4ujrMG5exaL3zyJjcd9Ya5Bz0qcBNEpviVm27myFka3zmq/qEaZ7NTW4lWny1jx4fA3Oe4+MzlPfE9c/WGZ4JTxRIdwnKGQdkrH3s7ooX/GO+Cx33ah5Ll59zPhWoXeq04aG9uUGiJHs8h+/vYZgeFsoC9nwUkJTpAwAryqEgbQGSasFOVaIubVSGVPIgbU26GDxmuqZo/F5Pg51bfURBCbV1v6VNFju6FSP91pW8NYwL7LvgrV2FCpRLRS2llWTn8potlV11v98g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 06:22:41.7230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be6b03a7-cf31-4b4b-64c6-08def44c4957
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7737
X-Proofpoint-ORIG-GUID: CtnENc894C9_kFxj4bRtbH5rdCriy1Sq
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a7579b9 cx=c_pps
 a=XYUUcOYeOu1iXYjTrsocvA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=7Gtq72NAoEWf9HPsqPkA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0NSBTYWx0ZWRfXwJpMEB1AgRtt
 bw76DGX5uJBGVIIijxyA777RCmC1Bwgx4xET/wscY9QRNF5zZQ2QThjyo+ytk0w1qPUIYQJgUYY
 Vxv591aY4SsPqQmZSqSuyECXFcuvedA=
X-Proofpoint-GUID: CtnENc894C9_kFxj4bRtbH5rdCriy1Sq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0NSBTYWx0ZWRfX7oeJFcR+LCJZ
 g4wgKJHN0dlKCuKvRtE8FoK3n5oVOVESLMSOvqBh3NkRGl/GtMdmv0+DdDUijmu/QbDFYRAZRzn
 9P16VlE+g4WMpdKg0FpDngNmjfz8EequBcnYyua+XvJhFRAX075T7sDTqPsnYgPoY+d3fem7yv1
 IjPB2QsEaHgGHVRC/9CMAALXt2Ue4lbckGcd46BjEWx2fdDEWurWj7XCDSp4ZRY8YTeCg+Kydxr
 PJhChY8zbQPTMhSGHXUS3P3HK/6DVCrPa61fFvXpwtAMYjc8wZOGknx8WWsXdyS1AkaNPIzD+PS
 iXBPrKRbHbskUyqNdzKt503DVdi0UmMPoknhS6VnnpbRSr69a4CkbZE+ambpq6HgtzFCFV347FM
 RSPpK4D270ZWW5W3kZeuUWRlhFapdJk1iG+03ctuK/BHGlJGVsGdXLYdM68xFi3bUC0EmbV72GN
 iZUIFOBg67PL1tltC9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070045
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 06:22:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20233

Add the CPSW proxy-client and remoteproc/rpmsg kernel modules needed
for NFS boot to work on j722s.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../initramfs/initramfs-module-netsetup_1.0.bb    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
index 6b465462..a10d98fa 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
@@ -28,3 +28,18 @@ RDEPENDS:${PN}:append:bsp-next = " \
     kernel-module-mdio-bitbang \
     kernel-module-phy-gmii-sel \
 "
+
+# CPSW proxy-client path: CPSW is owned by a remote core, Linux talks to it
+# over rpmsg/mailbox instead of driving the switch directly. Scoped to the
+# j722s SoC family specifically (not the bsp-ti-6_12 kernel branding) since
+# this is a chip-level hardware architecture, not something every K3 SoC on
+# this kernel necessarily builds modules for.
+RDEPENDS:${PN}:append:j722s = " \
+    kernel-module-ti-cpsw-proxy-client \
+    kernel-module-omap-mailbox \
+    kernel-module-ti-k3-dsp-remoteproc \
+    kernel-module-ti-k3-m4-remoteproc \
+    kernel-module-ti-k3-r5-remoteproc \
+    kernel-module-rpmsg-char \
+    kernel-module-rpmsg-ctrl \
+"
--
2.34.1


