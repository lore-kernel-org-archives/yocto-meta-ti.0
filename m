Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BB1CA5FAC
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 13:00:39 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12831.1790773228886404015
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 06:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=l6zTrTtx;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=UI17nHCV;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB69px2715438;
	Wed, 30 Sep 2026 08:00:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Gf4ifUp6Iyk5VwZkpjzvtNBRYD+DXvaQiD8F/gtO7
	04=; b=l6zTrTtxsxg+e6P13CeKVLhftFUZhDJEdLdETFoZnfbfVZqFhDiTawtMk
	04QuaFomfgolZFKMfxTpcadkBAh560tPFZfCf/NbgemCHV6dkZpsDDFy1KX0r5CO
	YooYwpGAu1ppC2IkCW7wnXsHYi3++Xv8nwZLpCyQArZcQw8B1+gq1DBOhQnYVuRi
	/X5IJnkcr/wfUEENzSp0/FbLvI+8jkxyv22AkPjHF2Dd/2J9+J79Ka3P6eciTaOs
	1Mscj8erK5qD+4OgW6wgbVojuleXRl73/TYf7aHODcFcfbuYq4rhe1UjmHpnv7Hq
	My+bOZ8vuQmK49bPNBG9XRzhZ6h/A==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012017.outbound.protection.outlook.com [40.93.195.17])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0m9fdb53-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 08:00:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmMQXvvUlilxCG/3msnNFvB2NBhLKL8W2RQ3Nc2UcRuYCjRLJPSxZVtPqC9ueVwyiiyLnT+6ggWVHqcq1T4KHPh7dICGmLacladjK8i7aB85+B/zcpxWFsnH/BWBIF/AyeToYmkx2Ew8WFlitLl8TNYJuuqORy05oHtC4kDO5wGaHyqSfP9LX/P3THMMArBSu0OHxC1W6Q2XA1TKYoXvFp6D7stjilflJRjUqhrOpHNIGST7Xf4V16iC44TMLAycyL5/j1MLx5BXlCjTUtt/UgqjiNjRvYu4Ubc93K6UnGWXp6mvw4gFCus6gTewpLfrzPiLFnj3kJ9S0YFcm2JPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gf4ifUp6Iyk5VwZkpjzvtNBRYD+DXvaQiD8F/gtO704=;
 b=cbldVVrOu7CbJD/eVMpfDJ5na72iyO3sq/wuFhMUzjbkz57j8fVh7RmGpIIgBWfyXNDrrKQNow1OOJJ9em+eYkzXHZy/KYP8tvDriK/EB8cUfB5KndWcZNRA+uV7RK240b3/sZJ012cTgjf4cq/p8kGYKWITHuROXzE50eYR3PBEPJ6mJyefGDa3nYoOpZvqsVS0HBrsglYD/9/XnHXi1NpV+Xn7weYODnDWRMmuUs9OiXzwqIZf58FwWhVMeemz4YOMux46Z7KhUw752g72OSzsKj7woWdMTOY3G5U7nA0qYbfQK82wIi10aa4g3xSZT4Ds1jGiP3WoP2aiLQkMAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gf4ifUp6Iyk5VwZkpjzvtNBRYD+DXvaQiD8F/gtO704=;
 b=UI17nHCVXcniKG+2JOExaRNlOPlSNzitCTQ68LSCnhfE6pugWgo8C4wOkTqnZT87RiHbpD5sJwtJL2eHft8GzvGfqQoFp0wXkC7uoNwda9OOGH65RhCGiIwSlqjkL8V94sX115B5Ra24GK3wUw9GpD41tzDHOh4QcV4iwrvAOyk=
Received: from LV3P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::17)
 by IA4PR10MB8399.namprd10.prod.outlook.com (2603:10b6:208:56b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Wed, 30 Sep
 2026 13:00:24 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:234:cafe::92) by LV3P220CA0012.outlook.office365.com
 (2603:10b6:408:234::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 13:00:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 13:00:22 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 07:59:44 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 07:59:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 07:59:44 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UCxdxJ4098429;
	Wed, 30 Sep 2026 07:59:42 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@konsulko.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>,
        <m-chawdhry@ti.com>
Subject: [meta-ti][master][PATCH v4 2/3] linux-ti-staging: Add dm-verity kernel config
Date: Wed, 30 Sep 2026 18:29:37 +0530
Message-ID: <20260930125938.95629-2-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930125938.95629-1-a-dubey@ti.com>
References: <20260930125938.95629-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|IA4PR10MB8399:EE_
X-MS-Office365-Filtering-Correlation-Id: 67bf66af-2b5a-4a79-0c30-08df1ef2ca07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	cee3dWHed5fnH/FCMe1ow40QnARCJil4s0Qw63pSOTHmtoHvcEKghRw/IgtwjaXE8BXU3QSdP06kEIceYW3BbSV3vYZoHViZBVPBhgd0Hk/CWbBJNU9esFX0s93sbS4lM+uaseKFF9viVooaqsyYu1Mu+t56chDPVJr3hCCN14MQay6XO7Io/zfmkbcZMF9AvBbqUra4Lu4AapHxLvBd3puEihITQDg5Cq6zfoDRCwkl3HelYu8jUI67pOI+MjOfxNEGOXq5aHjX8We6nnfH3eGMpbS80W/WV3FXXxzpCyPoajtvR45RY9MpnJd1zoSyU+l5v/AKqTSj1VQtVB7LThjU9QrDLgl+vNVEqGhEGxzIQ9w/+yEFVc0kmLRFc7jWvHx/A8RkH2SFKQlUxHZGrQvhtCQ2+rv/onnwWiaSa8v+Zj1FzGKCU4FEBp0mt6Y/bL7GfjjbTtiVKR3rFYPwqwsU//uvsyp35NieVs+KrxeARgPeEYBT14KJDhLqOfOCVZvcmMVZlzLOOSd1w9BP8Fexo1aIwSfKIA2BWN9ruWYqE1yu2EpWT3t7aT8d5nfjnSIH8GBRpvaRaDaF2NiAk9lSEeO+mu7KHPYGs+gLDh9E5w9il1bs0ekxevqnr4KhO7nN1+lNBSyuDWSACEStXAEg+NSURFcaOIA0BzpxEhFiGeDxIV6SWQV/g0i4eTiLnVuCBewRHougIOApr54VXg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Rytf7sXYWptDVoBphv/i4ka7mlALMtqysUqbpf6+bDfp1ZoIBcpE9R68hrM4VQ3YOEqzIJMTgxGCIwx++d220Pbp5eT3tDnG7KQYZT61uazVLzNOg/5illF2gcrQLVGmFqducENhcxnxgx+SIpqQAXitbpqPgytfLi5DSgI3PB2k1Whi7LA/CG8yAorRtYZCaXVnm49hOEBrDwIkul9xtaODQWTr2eD9KoyWv7LruoflvL8ygt/M9KSdFcwblQkJWtQggzbnKKrvYK55DwLzoZjxX86nq4Eo6DBgPzvfh3km+L4wSXP0LCpI+0PGCIl1KncZRH8AwCnnBqNMTNfL/gQ6PFPHWQOqK+NkP4fFsetAARhtoATFe/UY8ie08mYmOXtqm21sEfdsz1WUnq7D73/3wrmMeJTNotlQgdv78L+VdenuXC7NQvGUXBkIXhTk
X-Exchange-RoutingPolicyChecked: 
	0RncPbfZ+0VgV/tgiaffakfbrHyDs1bsRWc3qmRBVw8zVKGJQbn5B19YP2IV7tx0fqGIYig2Ebz1XhBmkK6G/5nGnDk01RwgeJ86AqL5O022QOjGJzfxcSV++8d2xxh0eECxNTa2d9ArUxfveKzpnrwAzELIsywBCQZRc3ahLaoOuF0GELvuexKHl4yMJ89Ck2M8pRg/IWV1wNZKuIEJlyBSQ8R+68l2Oc2v0j2BYRogGAXzlR915ve5s/COrc1ruk+goRv8+jAQXS14HiXvzcdSOyLvWWvw1w1TcJV/Px5sxe1RE3ARDdvH1o4Yn0t89QQZMi2W1U3PvBF3yw12Pw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 13:00:22.9146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bf66af-2b5a-4a79-0c30-08df1ef2ca07
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8399
X-Authority-Analysis: v=2.4 cv=VfRir1p9 c=1 sm=1 tr=0 ts=6abd07e9 cx=c_pps
 a=mbkJAKHg+hX/fqCzz7NXWQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=my4mKo85e9fyUbre06AA:9
X-Proofpoint-GUID: fLMKJsbQXdGfBRwtd6nJbUVcF6zqz2Wm
X-Proofpoint-ORIG-GUID: fLMKJsbQXdGfBRwtd6nJbUVcF6zqz2Wm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX0lMYtPvk01aF
 Pki4wZIVuAJEMy8AA3qMAUOriDgdeh2xVGIHHbefMA7idcL9Ywm2muMcE9EGjuSI8H13s1u0x39
 y+eG17UOhQVM8HGBKeBatsWVvvKsv6DiOKKfXxPaNYYSEBWdx6+VCLEfQ3WLlodURG5ioVUDOF5
 GL8UOXCSY/mXAHbsvYqz6UUyMkDXMNmnPoCsa3GMgS8RXkdGRNbKFAQbMC8DVPvPGw/1Ed6N+T0
 vDeQIr3qrXv83xaB5CucHQGKd+uLL6KQgNneN/fyXSUOFSR3WARWKoMH4OdIeLwq76JFD/U8UCv
 fimECe3ksY/Pi4Idwmoi8t0d6WbUQT1I2dz+hvGnZiCAk+eFAj130z4yYyz3h48EJYtFcviYU2Y
 yFhDfZPr6nCm+5yf8LS2MblKNPjyJACltL3a0tZJZGrQPmhV8JJZOQqUbDeduOYmjQadnEUOKR+
 HWzNEHhXBGYOehkg8zw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX9RKF18gkXBBO
 lMQiVybeoVhgrP8UxdkfqKnYZKMeTyWKCJ+UN/Vimi1K+IYTRvySA8aYiwZ+ezXdqpHYiogy0Pj
 KGT+yzn9681cWXvWUSdasflqi9FiKLU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300051
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Sep 2026 13:00:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20424

Add a kernel config fragment enabling dm-verity and its crypto
dependencies (CONFIG_DM_VERITY, CONFIG_DM_CRYPT, CONFIG_BLK_DEV_DM).
Applied via KERNEL_CONFIG_FRAGMENTS, which setup-defconfig.inc reads
and merges directly through merge_config.sh.

Gated on DM_VERITY_IMAGE being set, matching the rest of the dm-verity
dynamic layer.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 .../security-layer/recipes-kernel/linux/files/dm-verity.cfg  | 5 +++++
 .../recipes-kernel/linux/linux-ti-staging_%.bbappend         | 5 +++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/files/dm-verity.cfg
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend

diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/files/dm-verity.cfg b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/files/dm-verity.cfg
new file mode 100644
index 00000000..c50ce403
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/files/dm-verity.cfg
@@ -0,0 +1,5 @@
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=y
+CONFIG_DM_CRYPT=y
+CONFIG_DM_VERITY=y
+CONFIG_CRYPTO_SHA256=y
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend
new file mode 100644
index 00000000..9a380cf6
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend
@@ -0,0 +1,5 @@
+# Enable the dm-verity kernel config fragment via KERNEL_CONFIG_FRAGMENTS.
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
+
+SRC_URI += "${@'file://dm-verity.cfg' if d.getVar('DM_VERITY_IMAGE') else ''}"
+KERNEL_CONFIG_FRAGMENTS += "${@'${UNPACKDIR}/dm-verity.cfg' if d.getVar('DM_VERITY_IMAGE') else ''}"
-- 
2.34.1


