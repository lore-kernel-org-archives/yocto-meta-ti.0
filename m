Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2093C79FB6
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 02:54:40 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5116.1789008870677447329
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 19:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=lbo8IIyn;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Y39tmcfJ;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68A1jBQF4093829;
	Wed, 9 Sep 2026 21:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=kbq+vGT3ZGR9G
	4ltf1isYGa3ohjAIz2zIAEheLCC+Ag=; b=lbo8IIyneLEQ4sfWKR0pE0lVWbEoe
	HyKemKrwzx49IdiXku8bXUGYKrBQnlVvq7PSfxGkaIVLUFrOb1zjDU9HlmPaxVB7
	4ZaJIedCsXpm52NpWxYD8aqIBwrZOz24GExNVA3qLwksuPz9DYKYarx+QS9btL86
	r3Ksk6EexdErk2Tsi38dGsacihQ0HZ+Fpbkp2lP8UWBJoTHi9B4vT6MbOUMgjvBp
	nuSeLbvZq/tYgHqy5AXiZODiMTa+IX67TTnP2efpBxOnGPOTueQRfOZx7kydxpSy
	vjc8hF/2SPPKXkPjuDFVjUBFZGnOeBdZDFXWWS+lSn9jxr9wHojldYJbQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011025.outbound.protection.outlook.com [52.101.57.25])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxgaj15-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 21:54:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNzMm5jguNJ63LdeC9gEGO8ZWooPodButw5pUsWGsgMAzrRovcq1alGyfSE9LpoenXDGl8UlKzTKG7Ddfq+7640/7i4J/BOeMy2fj8MfPsjFy/jbMgFqAHQs8RY2A4o+yF+4l2rfkeu14X524LrlQz3xZgxn0b91T/P9cjHmqcJsupnaxrBEKyfy9SDHVMIZguh8HyL3UK8xrd9HyX6vbRSx9DLEopbaASYjVIdMJ3OJcd/IzmMLfuV3O4PuLJ4EwCcDmqqlifaNf39vJWRBit03xgox7ojMl0T9VyXJ0VnY+LLTCmDO46IbtATPT/Rqz0HDBuE8ZWmfK78aOFISeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbq+vGT3ZGR9G4ltf1isYGa3ohjAIz2zIAEheLCC+Ag=;
 b=oumos9V2B2yd6kyX6cwCZJ1nFAKcsbLqY2+M3EDa4CoJxsfEm4fQxyDJuFuRDu0dVqsk4xjJmrbSZnEKMGJ/3FH0LLMJc5VICf5j0drZGWoGv8Wm+8Z8FeB1ctAXUR06X8dcy8RElAlqQ/Em+hOAnJKEUtrZ+JkeauU8gmTVwdZnfjS50CuHI8iuN9aQnLci+tPA1uQpJ0dWJ5+LzT/RP71NhyZHeLT5hMBZ7QicxOUttP9I1RO9dB4RYq35kzIQFGUvMzlJyscgi8QCslH0+dHrYGRhldYLmxlO4niEsZnLBwNkYEHZk4FyPFvJfrQfYAUIT685jUdWPWcyPsBtSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbq+vGT3ZGR9G4ltf1isYGa3ohjAIz2zIAEheLCC+Ag=;
 b=Y39tmcfJkDnbbqG9BUROQbJLmlQgeZ+TkZL3CwgoVPtFDKDQoGkiCcZjvyLLf20ZUSVZAjtu2Njj9/JhazQJK3eXjluzpv5ObYkrq3Ltzm9gTG48d+WBIUD44JdBs1Gd3gByLgGjkA1Fj9RULxEfgiIkKBOHw2n6JG3iE2vXp0g=
Received: from BN0PR03CA0048.namprd03.prod.outlook.com (2603:10b6:408:e7::23)
 by BY5PR10MB4260.namprd10.prod.outlook.com (2603:10b6:a03:202::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.5; Thu, 10 Sep
 2026 02:54:19 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:408:e7:cafe::d) by BN0PR03CA0048.outlook.office365.com
 (2603:10b6:408:e7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 02:54:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 02:54:18 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 21:54:16 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 21:54:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 21:54:16 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A2sG2X1478357;
	Wed, 9 Sep 2026 21:54:16 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x4UvY-0000000FJ5C-1Cel;
	Wed, 09 Sep 2026 21:54:16 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 1/2] u-boot-bb.org: Fixes for OpenSSL 4.0
Date: Wed, 9 Sep 2026 21:54:15 -0500
Message-ID: <20260910025416.3648241-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|BY5PR10MB4260:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9d341c-c45f-4917-dfbe-08df0ee6cee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|13003099007|3023799007|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	6zRBA58avC1Uay1gIZXsBJ+fqFONYiWVP+uOc3vg/5FLu3XW/RMKMqMBeEO9YXMp6ac8UuKXOo3bsyS/GsbWctm9HcYV6U1nfcA4hqgdMOk6E/8aC0UT50iUP29XeBp6TaPTRSqqhNFobzebweBnJRI+msQmSJ+Zi0NJ0L3CswgX2ERJUWD+re81bHhOCMjoN3JIXCLdpVgOeiHxXvTeqZwrLqnPeaH7dxEdFkC84ceBKrSIlyHIgJ1ccaRxII3EjNGGRe5mUFRWlz2jLtN2PiGnbYIpolMsxz43hR7N3STnKsEiow2tvHsAvRUtHpmOu6tav6HlRZ7An8eTLwntyZS/1DcCyyKekLs4PMj9b9XyD99GKWvT4ipccJftltZc/ocVRsNeFzLJystIdu5xst5SvpHWIn1N+BPolsfy5xIpWWWJ1gdrxMj+SEugvDeZTqtPIFZhfRC5dc9mmXk+RyEaf/4tWl2Vr+WOXzx8Gy7K2rK6iKo4mAGjvIb4KPdOeooQyL4XIYtPESqweXWl/lD+SL0MstnclH9faw9eDNdqZGsZYt4Iz/PWsTsuUjmnXvhBHADw0Z3L2dPLgDL7x2Crw+LZv/gisGY2gcdn4trq3GhlHWMn4a/rJ8jRNHEGwtZY8484Nd9Urad9UzmqrXUNZadX0YTzKQpM7Ik6jJw3KOQoVvkYqN6kchaF2n9UDucjPwOnRhaqBHUPHmsryg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(13003099007)(3023799007)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9nIsPIloXOkfbmPbIIbcHIXkBYmT96HmKcW0RtvtWxwAVS4QbAtkcWiGbREcs6gd4ZMHfPQeZskDG+ffP9QXAAgMcxBGeI5uOe+qDtfcjeza0DDjM9gtsWyPJKxNiJc2rItwCX5rRWQ48T0YaATNMOdIfT0r27SbWi5BxpiBPfuqLmGvHjWSAatRCThcjiEQI6tZDHmURVUCc2R/KBmp4E+AyaahjwVzlkiqUTmilo5KiTo3GoxmuAoj5bqKuUi4lqgm02oAH58IJUOosWmcqbKiTCe/Gfcj/UY1qfpB3TLVwbtY3hpHt+Zwywpyla5bbjEHfsRsxBcE6/WMnwoZU+VaDtpFqJVDg82SYnRtbt6+Zfw4nfYCna8Y2GSAdu82+4otsoGOtnt09heumJ3QyYfP/4SLEq2FEJIuBsf3fZtpr0k7JgYF9PCoJPzTW89n
X-Exchange-RoutingPolicyChecked: 
	3JFq5KCndUk5a06GePaT+nwJcXEfdjrtpPLE/lIaexnb7BWgBkPj8rMuPn92EvJVc/JMusjxChgPusSbeUgSVIFwyZy8lfuIVCILSHwXMEFmDOEofm1slG2uxqGj9H3h/0CmpHKlldbDU8tEqdpSkeNdjfzVIodPok9Ruq0X3nn2IAD2Dd9gHJqQxbkZN+zYFRmZsQfZvk0kJF8fF8scnH+z8TB2GXQVFIJDXBLguWJFB8Av7INdOu8WMXOrzes1SuncMfvUYJzOqPbsvhrTQ2LaTTpsV4gdbutV5ynrsNSFYtedMuoogQw01lXWCt+u0GT9zrLUqIj2p27vSPmZsg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 02:54:18.4788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9d341c-c45f-4917-dfbe-08df0ee6cee0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4260
X-Proofpoint-ORIG-GUID: oNbRMyDNJQ4YH4ZY1gxuVSFQJu-iZ1x2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAzMCBTYWx0ZWRfX0fq56GWB9GP5
 TSlo/rGzFZ3aFpfRyM0QU9i1rAl8gHHfmEEbxRZ/JhLAukSVlgPQNDHxa+UfunCroH7U4mo/Vjs
 EtW6z6fE8VbizsHoplySUvYpJyrnBUI=
X-Proofpoint-GUID: oNbRMyDNJQ4YH4ZY1gxuVSFQJu-iZ1x2
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa21be5 cx=c_pps
 a=bgRCuGbJS/816vsCyv256w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17 a=DYtVRx_rAAAA:8
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=wYK7y7wMFXGWKwEQM0UA:9 a=K1xa12UCscBrvhdHlanD:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAzMCBTYWx0ZWRfXyV26fmd1FBTZ
 AR/6cPI8gpncs40kGGbdMJKAw4NXDh3r66m6ZSHLneKL9B8CpGPXCCXDtzgoobXzVuCXzrlQmTq
 JppmQ4ND2wddyZ874aLWr0nW82O5qzt3tViBXlSYCrANMRrB7sFzZ88AjdFSgLDDbDDp/yKkvl8
 XfoVO6JqmhPtuWKqpH2gl6aTuxgnK/Y3SBWSS0Y/u4D7Yv/VUtyqg9ke7YRTc0Hb4PLbohWiw0Y
 z1YBpL3ZIZlVLffacDQwUkWDW4zpZTDEir/l4p53iYgp/gdJyKFTg3MIis3zkY1D1UsvHs7L5Ns
 Nv91f+E7CbK5UP0loTMqybup3uuNkgf8m0gh34j8t11CM4Pm7vAEiDrFdZlE4P+BdFpS8NPMej+
 hpDDUpzsCbFKulx1l6v3O/0otQetsf2008QSjjSt0qx58fxs3diWS02wPsPi1eObD+WmFGisayb
 6HKHspwGROhvpfuuzHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100030
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 02:54:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20363

With the recent move to OpenSSL 4.0 [1] we need to update the same code
in the various u-boot versions that we support.

[1] https://git.openembedded.org/openembedded-core/commit/?id=20bf704e5809e95036b998f0f45145cf7205b05b

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb | 1 +
 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
index 23a5a3af..868baffa 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
@@ -8,6 +8,7 @@ PV = "2024.10"
 
 SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
 SRC_URI += "file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
+SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch"
 
 UBOOT_GIT_URI = "git://github.com/beagleboard/u-boot.git"
 UBOOT_GIT_PROTOCOL = "https"
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
index a6284193..a329f7df 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
@@ -20,3 +20,4 @@ SRC_URI:append:pocketbeagle2 = " file://bootcmd-ti-mmc.cfg"
 SRC_URI:append:beaglebone = " file://0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch"
 
 SRC_URI += "file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
+SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch"
-- 
2.43.0


