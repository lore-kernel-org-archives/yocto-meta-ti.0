Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AB5C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:33:44 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5310.1789500817804843744
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Sep 2026 12:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=mjm/4YrF;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=A2hCvSH2;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68FItufA2525248;
	Tue, 15 Sep 2026 14:33:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=f6jejmilu9DKKk+IFU32Q8ZFbl4EUrYm58sBAMHMF
	bw=; b=mjm/4YrF9lCcK4+kKi9QSiMod8Ar9rrkFEIzp3Kw+UZ4kiC6MYqqYjdvC
	aDUN9bOqUU3Wau5QKsXMQMzLEs9VyCLYfw2JV86Ny9BEVdloxN/aXjrMjZV2UCuo
	ndcHk7usj0EpTkRspYKXuEqjSrRnQgGphRiiCf/4WG+pmMg4yjEq+EMUWCKzklPO
	fKxhcDoOI45hDPQOMn8iEBPcLwwnSa3Mj8sog/Hq65Tu8rcYkGpUiolKlmbHFTEk
	xBN0uZQLsMpUMoEtp2zvmcc2kg6f3bqVFdPEaA96oVM/n1NkykjQS8HEinLcUGUn
	DYztm6Q1Qz1C9cfLAeXcY3kEESnKg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012042.outbound.protection.outlook.com [52.101.48.42])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gpvpa6eer-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 14:33:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9bonjiZAPUni+Byfsz54vU9myroDxDkVY5D+kxoQakJN6eEC3lE9Snawe9cdwOuvJEtN3yrmD4PKxxuBK4fliCdmdbYJ2N7Xr5UanDzkOzcweoCDGPZ2VXKgbWcgPjP8HeOxxMvcjBVUImUhCyC3mbZeZh7Pyd4koIhWfPKUV/Eu+K3ObahBb8OEHGm76IjSJx0Xupnlqg61FeL5E5vBuHRHTHJehXL4/pYiLHA3Xnr67kT7wcgGhPOWuLWJaR09tVDAufzyJNtKEvYOkQG2gMIcpVjeEjYahe5SHOGhu/BjpwY2KwxKdyFJgz/tMQvcPkJ5BUuWtkwfQ7nWyJ1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6jejmilu9DKKk+IFU32Q8ZFbl4EUrYm58sBAMHMFbw=;
 b=Tctphlh9646FkHhVohGGDWEW2W10mSSiTdJzQSSR5ct4EiB6/nfLs12AsvLaTBWcTPsrOei+YcB3xzkfIAN7VlTucLZhqAFG1RQvWg87BLqpdsXAmnKimSB5/TIRPsuJ4HZmS19rkmCkcEkoLrY/Yd+Mds5BSCa7qSWM+WlPa/dbZ8PpMIcDYF+y0AH3edWXAiqGlY2H6m1P8cr5NX9ByYIcfEzsumlywX83HPQYcmxpyDbInmMb5+TgxrC3bu/nxQKweQJguQ8d+QRhFIY6M3yw2Q9KCSaULrvo+VHgE3uXdnc/zMXVBxeBElPEFJbkHbe9k4qiWjcpX38zmNiF+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6jejmilu9DKKk+IFU32Q8ZFbl4EUrYm58sBAMHMFbw=;
 b=A2hCvSH2e6gmxKZCk524jKxlgj8a9TWS8XE91ekCBy3696BMrUExOWiDMc6vMTfgeuDyJTrYkGP8hFNPiq2Nrgk0pVRrUpJ7vSkGGAqOceZjOBjtlfkFG4iRJ69CY7D3DHx9hqp4nX9eg/z0UqmxoRp6UDb6PdgiqR8LstoyUMQ=
Received: from CH2PR18CA0056.namprd18.prod.outlook.com (2603:10b6:610:55::36)
 by MN7PR10MB480521.namprd10.prod.outlook.com (2603:10b6:208:637::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:33:33 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::30) by CH2PR18CA0056.outlook.office365.com
 (2603:10b6:610:55::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.11 via Frontend Transport; Tue,
 15 Sep 2026 19:33:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 19:33:33 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 14:33:11 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 14:33:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 14:33:11 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68FJXBMT3817102;
	Tue, 15 Sep 2026 14:33:11 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x6Ytz-00000009wQY-0rPe;
	Tue, 15 Sep 2026 14:33:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 2/3] Revert "u-boot-bb.org: Fixes for OpenSSL 4.0"
Date: Tue, 15 Sep 2026 14:33:10 -0500
Message-ID: <20260915193311.2369532-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915193311.2369532-1-reatmon@ti.com>
References: <20260915193311.2369532-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|MN7PR10MB480521:EE_
X-MS-Office365-Filtering-Correlation-Id: 46bd36f8-f7c2-496f-e6a8-08df13603abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	DdYKDUv2pAR4ELhHw038JfjFTaoLa8evRvFH5J7IBB/7gZO9b/+Uc0heeNV4RLhmPWeMz0EaToGGYsV54DxMlNq9Pse5gtpW53lc3F21rtU9A0mC+kA50XrrRXvwjbWO98yIR4rELi00/3RG1dJNxQBxTHD0L4x0mPYXU9D0FP3RrZXvp88eIyHNZHK9g7sxB321TKuUwmVI+4bQOCfqXm6s9pZ2dQAhXT1a+NVSdBpSbRqymb3IF1x3aCokHXP6gtEOrZnOFc6oQaeF1CY9Nv4yQTxbwKoQ64fsfI22x0Nkx64bx+MXvj8W9QR6UHZri7K6BxCmguuzEyFjA/4pj4bIzRUnIKTjiqQFeSq2RQQdLJ0Fb8+Gm77E7lDwLXXKn0tgOJg/pZfKBtpp8er3/gB6PbBz6mdvuIk1vMmYWTkBYCKgMh+wNC9cK6zTfdhtlJT8OtXP2joiEJ06WYBphmKXB8yP7WXzzoM3FuQQGI6qM2FE8bY6hssCN5mHBx5BXSOwqpz06EOukhlcJIXHQVzGURoryz1KydWPGTI2cgV1Yag2XB85iJDTfoOTF5pd5t15oWG5qDhtomzdHaOY/TblQUX7n+n/kwW+PxWCTbkIrUiryDDpRQfJuvRmG6jWR/Z9ealo5beUvYiYm1P2R42oyYzoqSzfdG5v7XoroAlixTWQJvAV2ltChSh/KcDta5DWnfQjjFkDUV+OzSNTvg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Smx/0zL8BpgKbj+BrSKaUquQzLbEeW+S0csNuWSCZugztBmFw3E+CxujbkQ1emcD4bK086KMfjIMQfIc0Pb2Go/rmkuwnB7UnslajObpWl4On4IwMNusUosO1c9j9LF96jd0P/4rbbfoKCP3d9AKnhcaK31gTtcHLZt+QfuPlLMaoYucOand2sUG1+yJ9Bsx0CaajcNl5Ef6sKMM638NgZosSrInLywRLFTcJdtVXFVKZI4K/ukAu6wuySktKvSs5kg3JbcVtBZ9YQ0A58aj9soQNB+imuNOqlgpFuWM7y6/WC8zN9NG34q4BO9r5fdDznJeTkdLRYX/ulCTQLkxaC4r36qbm9FYfYHFk+AW90RmMDv+NrIx/e8FvHaFEC9At/zkHyhq93S4+gtsnhEGIS1sEq28dh+OIcy4lGjI1DreUZACA6QKfSptR7WtWo7g
X-Exchange-RoutingPolicyChecked: 
	XIQO6rG5BOz1EIgXx8sBH+bBJucKJubOusIduzGDXL2qDH61oaRGK9q0az860+vCpUEyFBaehvGM/S8Sg41h9RdpEzLj45FhkPFmDJc3VnEoLtDEYtwpM97kQybUJjaapVYI4WbO0n5jH2lF+kX+IG/LI2LZ2x4vCB8c5ITpNgibadSn++ebamfedr0IYLr2S5erdxihkW9UTjORAgfrzVvxEvTxUXp6O/QRYjGeVkTv2gT84GQYvujmKNOOX5KE8z+0owguQaUqy+h4lvOa5GJNbxjpgvGgkU27Abl2mvV4D4Lgnusv160Ofm/0yGvbXzdAKuAdM4wsJ1PZN97PMg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:33:33.2054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bd36f8-f7c2-496f-e6a8-08df13603abb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR10MB480521
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI4NSBTYWx0ZWRfX8x+DR0m7iX6C
 RL2UXKVX/yFEG0uNOoYVNtc14lrPVZl0b1QSJqYdSwE7Z9TDvEF5sM0CoXfRsoiDR2n0Jakd8nI
 5WFHSiwtq3iKITdLp9DPflfr0N4dF7tKw1sXZIKEj+Pbt9GkbxtQlfCHNT18+GwqUg0qcx2/qhl
 f3LE78qAtSyOFU+nJa4YY26uJGbd8pd5TOIYO52dRjBKoEeJf3dySp1AFgJCvBVLMN2nDVZkfZ2
 nAReC1aZ4/84Na4k7nfJaaE+hKLpuK79dgvt2KTnbm3Nrmi+Zc2QQcFwSyGHzpnrMtf9kURJC5Q
 Yir0nNYCw2JPxZZYGhTNsdr69oM1skCiA4sd/ZUu+2FppyN74ymJ2v0alEPagakmIGmc324X8cF
 4WIqxkCN5PAPzNj04+ucKu5ihu8+YEecHE4fAhOpaNkaEZ/PezZ+hc8xUmp8C1irsKn4Rkl/4wG
 sBt7OFooxIOaylPNVoA==
X-Proofpoint-ORIG-GUID: NxPL0EBu6BnLyX8m96E2Vx9kH7nAm8gF
X-Authority-Analysis: v=2.4 cv=U7cHnuru c=1 sm=1 tr=0 ts=6aa99d90 cx=c_pps
 a=jJ4xAez9KAo77aFOr1Lg9A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17 a=DYtVRx_rAAAA:8
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=wXMz9V6F6Y2Hp7c1pJEA:9 a=K1xa12UCscBrvhdHlanD:22
X-Proofpoint-GUID: NxPL0EBu6BnLyX8m96E2Vx9kH7nAm8gF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI4NSBTYWx0ZWRfX99HUmF2103wP
 dOHfHYgoUkKA7v+4VuV9GyoFcw2mE21tnr3JNBMBr7oFrC1KDGHqbsiTAjdCOad0TKt7bc1IoyE
 zce3k/ZXHhzBE3sjhQmXfTOmMIY/Yoc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150285
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Sep 2026 19:33:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20380

This reverts commit 7c0c6e2117fe312d575ca682b2935076859d20be.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Add Signed-off-by

 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb | 1 -
 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
index 868baffa..23a5a3af 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
@@ -8,7 +8,6 @@ PV = "2024.10"
 
 SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
 SRC_URI += "file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
-SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch"
 
 UBOOT_GIT_URI = "git://github.com/beagleboard/u-boot.git"
 UBOOT_GIT_PROTOCOL = "https"
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
index a329f7df..a6284193 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
@@ -20,4 +20,3 @@ SRC_URI:append:pocketbeagle2 = " file://bootcmd-ti-mmc.cfg"
 SRC_URI:append:beaglebone = " file://0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch"
 
 SRC_URI += "file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
-SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch"
-- 
2.43.0


