Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DB8C98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 15:50:39 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1045.1790178634512601708
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 08:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=cBefDFmd;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=NucPDL0Q;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68NDKlRq1611704;
	Wed, 23 Sep 2026 10:50:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=ji7Qcir7InW63
	W84Qfc0Sj0BmIBkD5cgeDx3WrN//so=; b=cBefDFmdJUbN4xsd6NmACv+eqIKQA
	/E2TAxskKuNfU5hgX7mLaVOh9gHjVnv6veXiyqSN9Yfq5h6EDK50+gqrATKVXJrG
	oghuESOoxN8kMgq5GhER8zS2ClvNtHq5MVBhsAsuJCqi/S60XHkG8j+bgO1t0em5
	RTa6nYGr9uVUlNlLVQRxghOmBTA00JbtpdwCK+bdrWJQGw6BptQeClSalQJznJmg
	RSjxkfrIByjxDxaNqcYgr1JNNKrYjAm8pAhNnXDK/j0XWUOTIYVf3WtqxAp5m5fk
	0oUC2R8k6//dF+KOF0CqNWbV2q4MiGvz5KF2QXb+qkgCxMKXRKtzBkR1w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013028.outbound.protection.outlook.com [40.93.201.28])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gvb77tstw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 10:50:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIZkqlH71GTMQlWwtxJrlwc/3FhvcI15rd0L2fN5j2n9I1Aot/Jr/0GO5+G9QPN+AL9azXjYpl7h9pGrwsShsdtM/3XA6Ab8QYWtgj8+/uNHhBEJXkDVjrpBATA/bCNnKgm1Bk2wVJBDf94rSOn2G8ycj5RgG55YoeX1nzzEXoOprh/iy2jplHOnvzTOTtDsyETf8M+Fkjy5znkaWlvnLOSVuEV0WSZEBK0eJ0z0Zr525unNNdFvuiodpYVahCLJmJ0Sja9BHThPCNBli6AMS9uylRuV6HU+U15n0gaGYOsSt7aj+lAnG/BMikRl8eDmI/gGiGmevk5VzUhnX4RaEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ji7Qcir7InW63W84Qfc0Sj0BmIBkD5cgeDx3WrN//so=;
 b=TEXs2s8Le+wHBBOXEkFFJMccuabACihnCo3g4oNCLFtB3x1Rya1s6F/skaW8uF79W/wynNxJAebwxjlPM37LR/y0ROXPqLdH59aUSx8VuKbIb1UnB8iaShHeICLABexK4BX4UcWrOwBvcKlOgiyWaibOafJ3puVoW5CSehOAxDtrm5aqQ5He5o25sO0dwkw3bJlb/sCSfGWgy2EpySD22YBZ1e6a3Gylv09LBFosB/jRS6FMO+aUSeDuFqf4vtrVmxC2/l2vGuQiuX2ImcTRhEwfntfKHhvzhTb73Mroyu+MSpo7vQAOZC/oosY1MTruV4jzbTTYNa9KnNu3rFRyVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ji7Qcir7InW63W84Qfc0Sj0BmIBkD5cgeDx3WrN//so=;
 b=NucPDL0QTR64irsXjX98EeUa3SxITsi7UEy5NTBqmFBpiweCVKEW8jog1jxQtC33EhzyK9y3OBKVrX0o2l716bPGCafza8s1LXr1s+G/6eA0B8cKMustVcu3NMesBlwLyrOnjj16lrLAYCi0WAaXzcF4xVisOaH3j4gMsPOj6+/Yv78XqM785jtXGf/Xx/chFpv7ouBgtvuQppr84cH0/3h35uDB+nTD6npDw5k342Fc4gZ1fptMb+Z6vntORlqlksR5WKjXNvIVFiiMIelSF4/OsWcZDjCYqgW4593hCW0xq1nVXhNfyF9EiqkG6Xdu6B817aO782/8WjqJftasMA==
Received: from DM6PR07CA0114.namprd07.prod.outlook.com (2603:10b6:5:330::29)
 by CH3PR10MB7631.namprd10.prod.outlook.com (2603:10b6:610:180::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 15:50:25 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:5:330:cafe::a2) by DM6PR07CA0114.outlook.office365.com
 (2603:10b6:5:330::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.17 via Frontend Transport; Wed,
 23 Sep 2026 15:50:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 15:50:25 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 10:50:13 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 10:50:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 10:50:13 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NFoDpm3211075;
	Wed, 23 Sep 2026 10:50:13 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 2E9C12A69; Wed, 23 Sep 2026 10:50:13 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202609230812
Date: Wed, 23 Sep 2026 10:50:13 -0500
Message-ID: <20260923155013.3300159-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|CH3PR10MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cfe21ab-fb47-4715-0409-08df198a620e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|3023799007|56012099006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	2dylwA1tnvZa9H3HMPnNWuJ17f9CgZtV0FUJWGb5s4im3OpulAvus632nwElHnqzHwXvhYzzDj1ksp69Ym2GA5/WDE0gomORqc+ECFzWEujDNLjbLHNKHkfT6MTLqKPTxwfIcIcP4uIjW8wTZCWKBZrkfxzuCtuooA9H3d92mxVw4FE/rAjpvr0Ud00p0C5/yzVblQmXpny2dEXfkUP+qYn/Fcsb81n9WS2z/3+q3PVuqcnUijnxeTi8kwOXV+OOnJ13iL+QWNV3bkZfsu0JsL+eOmHEpwqknxcx60iNkyHvPD+ZypD9XB4AEcFvhQTTYXfeX0SPBElDA8i6UlrWklkCGpKP9tV03uIKvjV5O7M9UqMdsjSYrHe/N/quR2StR/iURaB9oT4eFX5seeyNWYgiNhFn8yi+i7hPXZuOrlQ6NExDkQiotAi1v33kjYbfH5QpS8m3bMMnwBclI8TH8WUYgspv7+/inaqv9J4o+61MaHKNy/lslj3dGyPx8PEj+cdkgcanzC9tFke9taAgvpISP5tfh4oUZKZOCK6gpbMuNo2QcTrNo8Rff1ccCuVDtOpzn1XcIQ6WZ8YCkNSzUoW2wWYmhEbYpg7qeY8TIJQR8rtmRc0GlHnfQES/4bfE8WzVozUjGWj+vtwHZ1bhWd+CpOGrXHLihmlSh7G+8nJzqr/fZBpqEWMe6HH2tvHsrToLovi5O8GNA9R5MZgJfA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(3023799007)(56012099006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ffeW7Xlza0pv+9sDoIWXFIEVNXXuqiZtZFGotTW+VOxFUbKmR8GDCGTrMabnwFHcOvrwvdOjb43gaI1s7j4S7gsFycp/7OZegtfNTQrTTvK2urIiQ0QIjrCEZBHapVFNOEdgWcenpMcn9SBqFZb41y4P5e+THZnBt64AYQJVGAjWhUx/D9SQ7Q8Gb0+MeOqbFSJgqEUCc55B09Iou2n6zvqvmgypiVThD6vp1QWGG1arLgmWy3k3CGF74CTLdSyhxmwY1/WxYtVvNEKtB0uHuKIWiWeq/SK6m8ERwLoQair8pShtQHmyC+EKbCl8WbV3F4hsm+PfdZYpDQEjVvLmNOZPSoxTvQXh2HrFJWsMPWqogC6mHyCRGKpePC76cU3TtAcINgfSaQ0JnzcTkYactKhYBY4zgg3SxL+c2lhhhd7YEB6ftNsDnqLgc5wP0Y+p
X-Exchange-RoutingPolicyChecked: 
	jusk9u+gEeezgdmwU70rFw4VHmaGG8B9SCS4todxhnZOkQgIoaQKuXQSk8viUI7b7VmLLFZuXPb7HDLrz6LZYwrVNcEctjZWgKchCqoi14wQjU6A2g1bvL8BXhdC09N1A+6u6cnKkDODhPTraSIUEgPjjiHs1F+fpg2fvxFXRjZRiAbNVj3fkMP7MYrUuYOvLBf4zdfQOeqyQODQaq0kqrsoGicFcy5K1OZ3QY0ciJbc0/+fgMqKDanS/mtLWd5i6MFPKUyud+drtl/xRW0HY4UzY3WddE7nZ4tZExDZzUwV8N9B8E+Y3S3Nd5VknUwLPUsL91rK5bdsvKJ8WsS6+Q==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:50:25.0195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cfe21ab-fb47-4715-0409-08df198a620e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7631
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfXwWbL11R1ZLLE
 SqazSvAXZlsxm989L8raDP0guYNtkpJOJCMlQ0PlGxj/QwUCb+K6crK4McbQdmNrzpvTP8w+Fwp
 v9NF20PEPNKevw5dEhcnz08SG9QiP9mQ1zR0udCe6wXV4fKTjf4TAFr+p9f5Yj4eEplCAIsUi/J
 wN0JaOnmzEaQeDjJ8xquxH0NKnF0akKFh7jeSnu3dLQBlAfLWZuF1MP4QHSXN9p1QH220uINAHn
 mRNdiX3h8Pk9L79q19hNQM8bF7lzmWHNDsSHIckI3kRFaT1XY3iEoew5OfMZ51fjLTFUCywaNwE
 FvbLnm1X+0gKl2DZNYAlBP31ad6SXcFs5fbZToH8EFfzEn0N2klHut5X++OEg68HJ4s8V3zoydM
 d7S/fveWDzzuYoTVbpTYzmt0TUlN8oGv/0yMwwhozZHYW6nk8klFzsXeFlo3vMfy97DLHEcfo8G
 VYYz712Kl0f4iQR6sUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX0Lwvnk0BHmTM
 vKwL0X/kJlX8Ootk5YN/s1xOElr/3ZZjf0xdmHYOTW+N4sm0TGzeIxOY9D5y5H1GrDGFQSjCLdP
 Mj3W4QJLAE5g2YB8svEyyQqJIdJNjwc=
X-Proofpoint-GUID: Mpe4tu1keXYsK8jG1cdMOCGvONzJ-22n
X-Proofpoint-ORIG-GUID: Mpe4tu1keXYsK8jG1cdMOCGvONzJ-22n
X-Authority-Analysis: v=2.4 cv=cPt1IVeN c=1 sm=1 tr=0 ts=6ab3f548 cx=c_pps
 a=6NHOJSrb2DrgGhcKreW8mw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=0mZokqb4c_Sat75URRsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230063
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Sep 2026 15:50:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20405

Updated the value(s) for:
  u-boot-ti-staging_2025.01: SRCREV_uboot
  k3conf: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=4ca322ca563a21cccad8c9ba65e386b9fd34dd16..70800b68682ddc7a9e7e6695712a94fc9f62ed37
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=eaa148f9640a047511be89f7652f8b1e93a4249c..5ac4102f15847164e94c94ccd38a77a39246eeab

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index d9f419bb..799bd9ab 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV_uboot = "4ca322ca563a21cccad8c9ba65e386b9fd34dd16"
+SRCREV_uboot = "70800b68682ddc7a9e7e6695712a94fc9f62ed37"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index 75050d16..2b5891cb 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,7 +10,7 @@ PV = "0.3+git"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "eaa148f9640a047511be89f7652f8b1e93a4249c"
+SRCREV = "5ac4102f15847164e94c94ccd38a77a39246eeab"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
 
-- 
2.43.5


