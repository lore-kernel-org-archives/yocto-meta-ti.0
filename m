Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB809C79FA0
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:29:11 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3145.1788859744894528324
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Sep 2026 02:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=L3UOt7sK;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=FEDTslIk;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886PesG1238136
	for <meta-ti@lists.yoctoproject.org>; Tue, 8 Sep 2026 04:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7Dumu/42LAvpnLD2m+prI5jWdX7kFstKS70b4E/Ns
	ag=; b=L3UOt7sKDLwt6jfEL+fKv+dFQzl1fPM33sgeaLYDSLhr2bV5j0/CW09Le
	KaEGAIj2HymeGiQ9MFs8jUwYevs/JhAkc+OFwvuIcqtwMTIJEgRJZC2AbuFcmqW0
	FDxT4yLYaWrEtLXZSn33DyabFrmWoi+372vjg7fKY8xDtzsSEuAyqz4Yb1ZyKrA9
	S8L2fgV91bwQlM2Bynd8QVsQhtiKoWQljKIT1TGnA2WNDOddMKXxJ8VbtzKxACXJ
	etzdHiiaUXPdy2YKdBwaZMjy+l2XnPhTQq6UdRArsoDO89aOOyn+uQDTkeSngHHi
	v2M7qfjcsMZktfGN4UTBa+m24bYBg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gj93qa47h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Tue, 08 Sep 2026 04:29:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b//z2sHZeoMhz2kXLLWACtiHXc/9NlW3DdbprwoYDqsalFbct/uNj8+5iCW6SvVF2A2rqtS2WuODU64rU+hrL4xvEF5QFjG/lNZAqzeg0SDJUP8KKVJ2aDenjhk/vLV9F3gNp0XNNhG3foj7X4NwdQwGHQvRpczzApcjI2tmWShWWuMxlglTF4oNazYD1hD+VtmmdBlcANEcS/zkE4KKh02P0bOMLeDZpE3FLBKscORc03HbiosiX3tlZCbH/h6P3QREm0YMmAWFMK48DtZ2NHl1yT1rOKQKo1swrnickx/Vl2YyaHybnrMKYbsVpupQwmdJT0et7j7iqm8e90NOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Dumu/42LAvpnLD2m+prI5jWdX7kFstKS70b4E/Nsag=;
 b=ZGAPI1DBx44wKyJ9f1IxXrP1Zdm5pXis9c+n6ac9rlHy4k1QVSANwkHNxA8TKe55ILkJceNmwyzP/vxrqUO50jKbhCmsJHzk8ENdJ7lTqHLPik5Nux2yGSip+/m6e0mGwd0KsJ53WHhjh+AoXFIx/rrxRoQ10Fh9PZtWkg6ulIn3W/zdBaDPJOizPprd7bYm4sPTysl2ocrjvSwWlDiGA2beMfX7DeprTn444caU36Oyh3AExOoSlWNacLnROsA9uBj9jxrO3sWW5+cDQ2krGzyaq1nB4TZGJA99rXgZ3Zb5728pc6IDu54aAqA2fHvKpb3yNV5rXvzlywSrq9+mQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Dumu/42LAvpnLD2m+prI5jWdX7kFstKS70b4E/Nsag=;
 b=FEDTslIkVLYaVb/AlzMh1dGtjSb0XK2bZt1yOiAFFd703HAeUNBCiGA/pG0CGWC2ZLfB8Ep4Q9QoYxxzdXDtbcyjxT/23v/OFo1KLeaY9xiuMkeoZpwffnewo4zPn7e1W1iHFzXPfr0MXUDSWHC/lCCFoD4RXsniQlOGsK33k54=
Received: from PH5P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::14)
 by PH0PR10MB7007.namprd10.prod.outlook.com (2603:10b6:510:282::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 09:28:59 +0000
Received: from MW1PEPF0001615C.namprd21.prod.outlook.com
 (2603:10b6:510:34b:cafe::37) by PH5P222CA0009.outlook.office365.com
 (2603:10b6:510:34b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 09:28:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MW1PEPF0001615C.mail.protection.outlook.com (10.167.249.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.1 via Frontend Transport; Tue, 8 Sep 2026 09:28:57 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 04:28:08 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 04:27:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 04:27:55 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6889Rmwt2200400;
	Tue, 8 Sep 2026 04:27:53 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@ti.com>, <m-shah@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>,
        <a-dubey@ti.com>
Subject: [meta-ti][master][PATCH v3 3/3] tisdk-uenv: Load dm-verity initramfs from U-Boot boot script
Date: Tue, 8 Sep 2026 14:57:47 +0530
Message-ID: <20260908092747.4047556-3-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908092747.4047556-1-a-dubey@ti.com>
References: <20260908092747.4047556-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615C:EE_|PH0PR10MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: c2eab095-f6bb-4c55-f79f-08df0d8b9b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|10067099003|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Tidb2sFyzbz+cWJSvQfpvdc5HpGRjpnct/48bIwEGld6dWYXT36+GPmTES0CePRpWOGFmxZvgzAB/5UVI1agH8BlIskTGlPN5uuGswP3cOygRQvXuJSdQ8GJHixKlPli0L9zmjORkvO+a+nW2rnNat1FWu5sitTP0GFNMcJ9dTkyFslVxxwjsmEwxoNS/TzvQYpSDvNXhuoNpTcrsOkLAVNrQ0ZIfbKvXF3lz6hUFBH14N5O3Tu6xIp+AGJnCUOewcqxRdRwFff+oBIw2RRqHXtdtqvNVPuFvhkkciqA4s4/b/r3VDV6kz7armZurVWnCxF1wqoAChLGZc/pUSRwHkEr7hPHXdOtEcKMjROzc9Y+kdR9wU9XWJ1KehEz9M18JAYAZRoh3P8TYxbG7xIpXKm0XUnpbjEAmWPA2r1gRJCCIbsTSCK1Wax7eng1vTjPCnzma2S94ph4nzOC4Nh73bYyfEMmUg0gRxZ5sdt3vNEW5Z0pZo5GNOYHcH7X1n7xtFl2rOMMGjizGupuKVl5IQa2nwNJ7ppoUjjrpD7Q0CbKhvIgawIyncGxM8NoMXDNvGNgd2rosJjHdhrdezfEBcrzP2uoG085pkvlZVVLijR7F4VOmYT4nphN2g2G1r+pui3AnX3hdagq0EYKuRMyQrFqJgw2wIjDumOFxr3AaoVVoXwmVeRHTDWWE5MXOruklp2TMgj6s40x9nHu7m/F+A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(10067099003)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HbswWC/qfBVVUEVVSZViyaQYwjPdkLtZG0A8HeWd2uv7Bf44qmN5kPeE/UtvPVcmNgPDsz2bPgKVASf4cGi45kfvRd/NTWs+UgK+fXxDBTdCAsQb8P0MBHlmI4wgwph90wVZyWFBkf0MNj0rKduOoGAMjsR8MtQKteFDb4Dmg57ZHxcI/zSatNi6MvAxeP8K0SQL1NS+kjQu3LjazTxIVcuJ8S+GyZs7x40fukyDufiykzfYc6I8RiMGhiQ2MV2cxUj+vDQjEw/ldae/vs4Tv7jegISknyN6WmotPxdIPASEiw0FwSC+nUusqrb06UnwZyY0x5t6U+4ur+dll/fVq4j9F4U7gEKmyQ7bqtvpx7+500MPiWSJhwmIs3nM5hosKSZv2Vq44r9BC95yfZu8Y7HTv5GBgsRSLvB+19nV1SeofqKNti6yghcXJQkZFs9a
X-Exchange-RoutingPolicyChecked: 
	3aObHNLcNyQWWVWqJFXktIcCs748zxVsM3K70SN30ETBgOT9eh6tfREF6HCcIERqSCpYmi/WKhPAASMf4TLMjHW/ZIPFBw0JMQrtODhsAjapHJxE2BR8kSYG0D+jOMqvfHYT8NbNu3vqevqQjTT49YghmHKf/vSMyYMN/kbWTJelPQv/BlvoocEcNow4JOLFsrM5gzXAPnDotI3UtPvDX21MOPH5KHKmYy+UrVIJVl5oF1PRoG+GSTgR7+0GKsKgFUWiFAG/+QJxHZj6itmJMB/YEcLDsOu/XPxdzE00jjqtvgkTEI27Rvufq2owfaIZU4RzWjrPwEh29Ilqy5QGDA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 09:28:57.0042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2eab095-f6bb-4c55-f79f-08df0d8b9b8f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF0001615C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7007
X-Proofpoint-GUID: LIc9QXsrnVFNVFG4yq8C9-vFI_xF_R8F
X-Authority-Analysis: v=2.4 cv=FvQ1OWrq c=1 sm=1 tr=0 ts=6a9fd55f cx=c_pps
 a=dlt6EHtatQYmFek7NWVDaw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=SlDpWVFX6tK26vLE_2oA:9
X-Proofpoint-ORIG-GUID: LIc9QXsrnVFNVFG4yq8C9-vFI_xF_R8F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5OSBTYWx0ZWRfX4abbZ/RNclrG
 oMQI0kdpBJSoCakfM4VRuqH3sq+SvS8Ouw7/wDyxch4KcX6dQI/G8qpQCWZe+DzTzTIk+dCtW2F
 MjGmC9QxCEwYaiafMPJ3KiYTD8NShv4NQ8q0MXgms48wDLuib6WNFJpdMlpnOewMjf52xaIPszC
 kDLCphKagsG/IuZDHMnhevyXbsvSKTezxTvqBBg0x5CtcRMKEdCZnF9BedenaUdHSCntQVYWp5c
 +/+zHiMU1yuvWZUt9W8oriExX7usUVVmviOMbiNnAKNjy8PN7p1PA3ZhcqUywmLy2saeQ4mr/hg
 WKyfW3REj5X6fhtRsO1JjQirXOfS7eqri9YAg89Bah5WxXoPzOIgqqGau8mEDeHmW/LWhbQtJ0B
 NuvbRCUyVvrF0CiFtt003P3Mi8b30+4oYzOxW3veIOozZ+5AwrNpdeXMCahkL4W8S2YsmqC3aUK
 vM2BllyoCteVz1ka4TQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5OSBTYWx0ZWRfX0AnprKXfipgl
 6LMAcz26h9VvNDsEdIQ73oZB/y2wkwW/0zGRlN8uuc84KW0Sg9MNjoEOm6ibX0GM6+DdAZAvPMj
 4J6E2hxPsGRJ8pKZcwvM+riDSIgM6oA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080099
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Sep 2026 09:29:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20346

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


