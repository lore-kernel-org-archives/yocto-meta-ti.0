Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D364AC5DF94
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 06:38:25 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15893.1787639902770147409
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 23:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=WJJ6cLEr;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=otCTiDaN;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67P2Proh475860
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 01:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7Dumu/42LAvpnLD2m+prI5jWdX7kFstKS70b4E/Ns
	ag=; b=WJJ6cLEr7k1Dn1oByZ3ukR1M/QCCHCWhbb2kHhSYKvecF5U5OwJo5oXIO
	fNj8pm9w5+MtKDq/uHvyn3NzZWUvIQU/9ISNExMa5wd6lCXCUK8ZRAVQLNBYioz7
	uIpopJHoedV2ztdQNmxg8VXfhOQFWfmF4jOGKSHvTs6vzI3yo0/3lt84nTUIVIHJ
	4QVS+6YoSccIu0UqrYCAYhJwO2xgOr4HrYxgmiwO9wkXvMGHcfJRr8RVfXArh83O
	g9dYmG10eumY10V1lRkW1yUCjIXHbfsWAtY8fnvm7MwZTW25+YL+6Gz1Hu4YPCB0
	9+DJbHSqj91HKNFHPdTpZn4CrYk3Q==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013068.outbound.protection.outlook.com [40.93.201.68])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g8xga22n0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 01:38:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTAOr4aoKzVE0Y1FwCcvHOaAUhezJqfokubyjCtJUEjNk1QCO6YXXiHi3gGrgDTnBq/L0YtukznJqJ136SIMcQsnZx8XMLULGocB56Y2XXYbtnX+Ku3MCkU6nBhUPujc/DBBVMFRotU6D6ySFz3dWJC/exvYRbPYVfgFRw39FIC540rv3Zx/DITjJvueLZD1Fb0jX8U+xh5rAac8fxleQmfGFCXotUa8nuE6qNq5cFrGYsOxGVPXWkp0QIPpAziLVhsso8qD1fI0XpFdUuyd2QQlrkVasrC1Nh+3lky1ytp9ESt1i5xgimFErp/R6xG1dH+Uaeonaok8EYVq4kOfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Dumu/42LAvpnLD2m+prI5jWdX7kFstKS70b4E/Nsag=;
 b=PNbSzaKXlUNFK7FRKEep8x9BMUdPyQ1O0gy5lRiTkNeezYxL/+OTr8X8HMsrxBrgCSMLopTjw7NSQj70pSdK4G/Kyv+5ntBWLU0Y8x22Qm+ai873txq3D3AE36RThzfNDpRClb4DFXlPalcANcrv9hQ3pqeS2gwDvMywco/7QKR52QHwpe5mE2MrFGVb32F6HcNqmDz6baJdempPIwou9bAjXjeUgA5tLhRx2H1poZ3NZ3SRb9OhVUOjRYcPJJUxyO/3p/yfY7Fpjd4PT28bhL4YV/egV1dYfqpmZSszPeq/PQhQQ5u1QIi9B3vU1eify50fBNQ6yAsxKPnHBHmKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Dumu/42LAvpnLD2m+prI5jWdX7kFstKS70b4E/Nsag=;
 b=otCTiDaNTfwpyZy/Xm5QPWoadaV1fZfrZh0ITG/TsglyCxaSrE30CKs8B3gOB20ES2aQIFXQ8+RSzZEFTkuOY+VAIku+5XBhS8Nagv6uTiTg4tRK9h6i7DG+Z4D1SnW1FWD1wHGJmXM+bz3r9TdxKsGnz6zqoH0RTqiegw32+R0=
Received: from PH7P220CA0079.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::27)
 by MN6PR10MB8117.namprd10.prod.outlook.com (2603:10b6:208:4f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 06:38:19 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::13) by PH7P220CA0079.outlook.office365.com
 (2603:10b6:510:32c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 06:38:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 06:38:18 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 01:37:21 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 01:37:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 01:37:21 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67P6bDV41504567;
	Tue, 25 Aug 2026 01:37:19 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@ti.com>, <m-shah@ti.com>, <a-limaye@ti.com>,
        <a-dubey@ti.com>
Subject: [master][PATCH 3/3] tisdk-uenv: Load dm-verity initramfs from U-Boot boot script
Date: Tue, 25 Aug 2026 12:07:13 +0530
Message-ID: <20260825063713.51497-3-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260825063713.51497-1-a-dubey@ti.com>
References: <20260825063713.51497-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|MN6PR10MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a5a941-6abe-4e1b-7cea-08df027372f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	ih2FOm1IpNMxApPXWJwab4YBVWq1xxThSo6W2dlPq+SZGrumnlbt2YxLx3Wt8dNkQ3JAZCkJ3HcpXJkNCzT6CeALuXvdgC2uvZCKRJs3abP9ZSO6Sl7h/gggCklQUiruQgef54q/alzRlMtvrm7cnyG9PaC095RbCOnDhrj5JQXS4qeDBeiPvqHKeQd04KgwcPIxgvMOL0SIe1+lBYHNlmiMu9+/d/zamEhR2jQqylHEPCuIvZgHD9PyXJnvqFGELVL1yRKid2Ao+6fb5TfaxXSyPbnzlq723LS9rvG9Xsr+kZzoD9Z24SO7+h8bzI518rDp8x3kvJVWXurMfTPQLtLhPCnf7BoUQwlHIiJ5OQYkn8pLiR8N6ipi263u+D2XsDL06lR5qkZnpcexDbm0kgHlagOuIYUyw2MyR1QtcWd3EMwsiUuLqjE0iP+sxZE41NtbRZ7Dy6hJI/SaNPO9YP4WR0IkqTYYW+bb+lHgAEy9gOhnSvdo1LUGcdzv6ytbQTepfXe5SUOKcpFxf5gpeJS91xD1eG15nZGpxsEpzCV8DBBl4pr8BxhFxq7tmLV5ReVEmekM+f6dFPQ9A2JQoRSnQQl5XaXsNbnD4nJYBjN6nWB1mb/XuZHmOSCtRZrvL2eDQU/Qgf7fc5L9RAv+4tEkkbPpN/3yhiWlsvB3hrLji+jsDnpUXId2fNGXlAS7JDBprgf80BkiNS2G7Sez2A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Qb5Z6Ktc3S2nMpDJoQLakW0XA1Xku93ESS6H1euLjDiMGsMGWIh1veEnlJIcxOIxinrbiC7zrkEufM1qMxPDOPhcXAqvErltFe8JMYn7TmqJiomPGKGtWRQWA4EDeC/LWmGKcRU5e4+KtcPdmHhrSBuShDxL3S0+v6pTuY4ugUc97ttoW72eyTLP+XUAas0M7bAsEnKToltJ5NAKOtS/Vi3JPJUeUhb+aUSTfG4Hq84KaI9yivAN3ItfQmV3l1QYj1u+mVL6hlEBqm49nYEupHtwF8AOSn+MaAITjYfrW/VRJEgRDwiX1s3vKhOyCvfn3da0rZ4zDmslQ0oH0KN8/2tQYzxGFTrA/xLGoSpp4h50d4Z6b4p51F6PExf6qM12lYLFdSPla/zWQVZnYpYMV7iuvsdgyPMgWZAqlfRBlUDR8H7ZnM4O/w12ErdEVUu0
X-Exchange-RoutingPolicyChecked: 
	WyUra8Tvd/IHkE9p88OhrZAA33fENL49obOsKOKeRxtA6lAm+VPHyExkzf5PbT8np90owputP+DVo/c+VEo56BEUzv6gp+RIq3Udxpa3JHtAAeWfzQYq7t0YA/Y7DBE8F5rLyTx7Rvyt0tKBB61unstMQtxs3Tw3BgVTS3y+4txEDZAUAg1ETN8T6eqbfSbEKPe+JL3G9JuJ4VbTR+YjCCb5CTIIrg+snVDY6Gx5/EqV8I+bgJP9AC/zcrYSk5Df1PQNG3hZIiCwWEISvc7Nlc1xaEeIwkzmpbRfVQHhZqpaYFZvCQSAGe6aonoAKe+ebJhXkfDK/X656oWtYuCPOw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 06:38:18.2300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a5a941-6abe-4e1b-7cea-08df027372f5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8117
X-Authority-Analysis: v=2.4 cv=SuygLvO0 c=1 sm=1 tr=0 ts=6a8d385e cx=c_pps
 a=THEAVZb93WkyejmpPpFvRg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=SlDpWVFX6tK26vLE_2oA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA1NCBTYWx0ZWRfX9PTJ0Pl/frvV
 sQaZ9otdqgx/Ckc37aoL0YUKp7GBTe8ta1LyNNCX63pJothGFApCNNJ2gkElHZc1E+X9jfSgT25
 LrChbReMNIGXzACvaYEqOtosvz5yVFQ=
X-Proofpoint-ORIG-GUID: 3NeXWpx5hfI2gSRMxo3_iPXIrg6EXpmw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA1NCBTYWx0ZWRfX9BdQgJstTF3W
 k74p4j9jqZH6N0vWm0EdAsizxsgqAlguwGK8CEPeR76p3rzArGGri/0SIsQrvSzbpo8RbKe0qf9
 9S6ADviAUL49wQSzd8+0a3nrJXYW6AvszK9NkVz79OAyjIxuzbDiqka+i1hvsAJD/2lwER1ybxV
 gCfE5w/WEYpU3CDg0aKWLpMuzaHCi9eKMfMmhFxU2C63RWgjm+h8l1hT3Thc0RM5iVecNJYBpcc
 rv/DFJW+fd2c1y3UCWvyovmsGS4gkuqelD61SUrXJ/+J3oNGzml0T9hx2HcMEI9FWFV/2+ZZpWW
 sYbiZmIzslXIKb6X9KomNFiTw1G4jetnxY6kAJ7Q5yD5M8nQPh5tLyffPs2Te5OTHb6HNhPJSEf
 68/wapKLwqQyRlsWAwigf8NZLUFk8QYgm0DKURrNw9Ws17VDQOF8KFGE09870Ck4XnDFeeD5EZS
 Fu0cD5Dat0v5UIt79dw==
X-Proofpoint-GUID: 3NeXWpx5hfI2gSRMxo3_iPXIrg6EXpmw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250054
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 06:38:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20286

Override name_initramfs in the deployed uEnv.txt so U-Boot loads
dm-verity-image-initramfs's cpio instead of ti-core-initramfs.
uEnv.txt is imported before bootcmd_ti_mmc runs get_initramfs_mmc,
so this override takes effect with no change to U-Boot itself.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 .../recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend            | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend

diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
new file mode 100644
index 00000000..ffbd0061
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
@@ -0,0 +1,6 @@
+# Fetch the dm-verity initramfs instead of ti-core-initramfs.
+do_deploy:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'true', 'false', d)}; then
+        echo "name_initramfs=${DM_VERITY_INITRAMFS_IMAGE}-${MACHINE}.cpio.gz" >> ${DEPLOYDIR}/uEnv.txt
+    fi
+}
-- 
2.34.1


