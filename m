Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2914.1794373005626408731
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Nov 2026 20:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=aK4I5tet;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=bqLJwbEM;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: r-sharma3@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB3nMLY3111897;
	Tue, 10 Nov 2026 22:56:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=AZUKGe2FRMeT/
	Voyx4JBavycysh7ynzOJF6MhNLF/js=; b=aK4I5tet4ITz08WsNl87yoztXiXEB
	0qGWouaWdUTQR8ysl/R17CshaP3DlCtfEqxcoKQPwBO2j2NLMaD9Zu3/JfQDwEe+
	hG+9OeCc+BLOD3GEZqEE/YV4k0BF71qhDn+SGpa2BBJuHNgJsY/hxvwUBY44Wuew
	DmWCblsTFWxCbfnGiukYJZ91nf4ZbpBiZ7fDXmByRm1JWN3UgPuy/zxMRpoqoJYq
	WlHmB3ygac0iptasXKCfG0jj2HWpTTTM0fHHvghcmG9whTL8+u76X9QdVii3Yrau
	ee1KSGLMXzK1uLOzoLNNRtT2DNtAwiUnzIgVSzFGrfsNirBtYMglXWd4Q==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010000.outbound.protection.outlook.com [52.101.46.0])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvgsyg8k4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 22:56:43 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMFQOD5mfPW4m65sDnTvkVLMdtZiqMLmcmS6CcGVX8bkZaXLx71IiD3Ghn9GW4MRrV/ZvJFE/wzPb+TQxH3ynVVlaMkjERIsE7uAIBPNdN3B+58LG/xjiEMnirHesbwPs7lsHPl2TNplc/Cf9iJObLFdAoCZdKr8zpAtyTcJh+wRVonRnaENlhauzjkl/Yo/whEFyhEHLyc2wGvanip1e1Ix6+ql+P8e3m9DFbGypBaf0YaEH1TEp43RGoIbyMC+Zn5vij7imTHUyYFPMXfEOkZxEf2/hOByW4x962IdlOcmTMGE/nLB1U7U6rxVDGnZYP4Wl159/0cim093OZXMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZUKGe2FRMeT/Voyx4JBavycysh7ynzOJF6MhNLF/js=;
 b=ULodUCNy6Hm1N/nysL3Eh2NgDGjeoVzCg43YM7ODt8vXGW8aMg9ewFDhUDmt7USyQiTPzJpKkU9r97niUyA/pO3lmjdc4XJ7A3HX2ezhc03pFk23pJQsku09VtoYHCcO4IzinnIFKyx95e2iLkfpiCzSWofJMl1e4L32M7n04vwIO7v5QQzYXXiCUkhDo4DWlrIsMshiem38HQGsBByWc/mhdyqH3O9Odc/EDk0F0I3UtUbZJ9lDE7SjRmubB0WikebkSm/VetX3BwC8qWgmhvHfFAgnHab7B00qQyCasYphIXIT7tkJwDiDYgU3z+dRoc7yRDN0RlHRrBs5Du3ocQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZUKGe2FRMeT/Voyx4JBavycysh7ynzOJF6MhNLF/js=;
 b=bqLJwbEM7MOTMccnzca6MNWCH6aWuSmSgcOPusNCvPKLjEyz5oItZuYEaCi0VxUcZ1ENEz7Ln0kXchgovncsY+XEAhgxcp4nydnZBaRQ892KEID1sK5j7dCV/rMBHhYTB34y1TcxT5SvPEzh/IatvliPl/SDYU8csotUe7b6tJA=
Received: from BL1PR13CA0425.namprd13.prod.outlook.com (2603:10b6:208:2c3::10)
 by PH0PR10MB4696.namprd10.prod.outlook.com (2603:10b6:510:3d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 04:56:39 +0000
Received: from BN3PEPF00022BC1.namprd04.prod.outlook.com
 (2603:10b6:208:2c3:cafe::58) by BL1PR13CA0425.outlook.office365.com
 (2603:10b6:208:2c3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 04:56:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF00022BC1.mail.protection.outlook.com (10.167.248.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 04:56:38 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 22:55:56 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 22:55:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 10 Nov 2026 22:55:55 -0600
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AB4tr0p2196049;
	Tue, 10 Nov 2026 22:55:54 -0600
From: Rahul Sharma <r-sharma3@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>
Subject: [wrynose][PATCH] Revert "am62lxx-evm: Add DSI config fragments for display support"
Date: Wed, 11 Nov 2026 10:25:51 +0530
Message-ID: <20261111045551.3719301-1-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC1:EE_|PH0PR10MB4696:EE_
X-MS-Office365-Filtering-Correlation-Id: 883f4782-935c-4a45-09da-08df3fb02b3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|261021123027099003|56012099006|10067099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 3SDkCVFndwWdr9EihgFhVrCxcyhbWRIeZVg6kvuwlSUJE+ftWi4Otc05G7j49H+5c8qYtv1SPzruUrIOk6bOZk5mfufu381TRW0GCsINF2j1OJMQE6fjY1o/xttvK2JVu+QSpHsJtjYcjHmho3BxLGlFTmguGiLc9ykmxRw01gxBy2HC0zSS5IVNqriGRNBMmLjqqMQB61EUcz3wsFur7N8HuJmF2m3ki0hwsRGKzZZs/X4MiHuoPfbII+OH2GF14QbvbIIlZ47eu+hVGK5X18+QnX1ibC3xzwcq0pxnDQHJoaYyglR19LdPtGaDr/xukyrnLBmuzHjIpzwC2Q2VZWkvWUDrrj9uAwPGLUOGZ+EjYdvv5XJ6c+9xPoZ+wec2RNUnFBj3NXvsvnhzm4zNXJovQ2v9+WhgOBJEzxeuOXHNzY6c27AhOagEuLSXKgQyCOSwJS9wBay7lJJ7dHXsCtjrH/xLyqwFPJVF0eYBP5TjZBrEWfmkW7mtXWuhprKzrq5H7DdkxqSG3sm2zvNrNnOZwyOP1vkrB2xCoU6vR1h8dK33aZ7JCm0vHsZ1RVCSHRemJ44laDQAlBdOKi6JHlCssuji4JOBG66h2RzAkXrbg/5UGCcXhWqiWagcMsrGSyIzddi6ma9uXyIr0FEbfQvvaWmKky6E+WViN3x7bjcNHOz+B2M+TG63t/9oAPwYwfyA4VGXxhcCRCeqUDh7EA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(261021123027099003)(56012099006)(10067099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sr0hW+2Jv5kBBFrDiuASPKzBML3BrsQd5OJPwnl1cuGSevJyOCoI+9Zy/FWYhS9yHtXoFixZqLkWo3wWulXKEj17AgEKz2kTA+YZ39e136Ur5fyA9va4tJGqkHyk91LEnHn4ZZFv+CxvIHqZM45oeJVGpBAZrUodD1lr4pxEfwAOexrrlU5Hs3Mwme4z8ZEFcFIeQB97iwt68iZ/JoIMerNcCMW6UGJE/AKLDxJzAMCd+govrZePNcvRD5iLSiSExMIVX91R2O0glpgbRsuLSkVsxs0/aOaqCfYsNPypGi6rNo9E4ftR+7DuDtiKslr3B2mFp+BzM0Crng+MRGd84FHlc4x7CvrpQkIezhXYz1Q+9XsnUOIFY+jrcqLxDtsjHDir/Ie9lWVtPxv21J9q5Jpdq1A+efiMDsrnsNFuxWBCMiErQcMyJCp1kuYnb16r
X-Exchange-RoutingPolicyChecked: lOyD/RPqvq42scZ5+LFu16iDYAeQXucPHMIekia2ia3dFFQIQ7Q7OrXB9jqNxFzUp01UPRyMaT4CQ/YAGVIZSfRIHxRA5aDeMFrhbmmZnJcXIK+ks4csJsn+emkZiJeqm/gsx2FXTICEBWeZtfjykMAiag1vX5wcLCtDarEhDwtC5c2o+yKxSVzwIeb/MlWV1aWoFbFvsGOOya7giYxkforZV+LlaHUDg/amCJq3WRWHMIrglOym4JCj9s9eI5Bad7dG5CjVRaBEY43GR2jpLFieXCMgg3lQkRpU1yRS8HSwAc7Y1Nw0kCvKFQnvj9MhCvjPSMraup1dNUPkrwncpA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 04:56:38.0847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 883f4782-935c-4a45-09da-08df3fb02b3d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4696
X-Proofpoint-ORIG-GUID: 51UwX9Ij3zzl08b0aaAqZ3J6uOSclTnB
X-Proofpoint-GUID: 51UwX9Ij3zzl08b0aaAqZ3J6uOSclTnB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxOSBTYWx0ZWRfX9uXwvBJyMq2P
 jzaNpZVHfkmaN5KyCXLwSFRYjn1+KdqVPCsmXa4+ZshaRvP3mKoqglZNcLhH9vN+5iGXNIHUCWL
 ACWs7O0pMx9Ql0XpuoYepJZFLLkL2WtQji18pVQzmlfh7A89rUUET1IyeR+FKiddFMiHxf7YM7b
 mXnq2XvpCH0JOgbhgQgjB7dtWKo05vuhlPcueU4fnjrNcuPEGI5Aav811kAzjb/iK0fDZETifbY
 nvBB1E6sYzTI3YGTAByMXMDFFaeuKxNDd5uMsyhxMikLmo/7OxA/iCdTQgVfzRVb+hNQYpWChRZ
 XD/Pprie/XR1+Ievc5Uq4GanviKGxep14lrU2kaOFu5auTOKIq4x+df1mGE71sfpGhlAguBmRI4
 qkbizge3Le5/Gegkbj5SO2bJ89YfysphGsNWK8U8yjDk97sBhDFSxSQFKnce8g/J6d313Fr42Xr
 JPFiFD7wyH1r0uciSaw==
X-Authority-Analysis: v=2.4 cv=SpcFe/O0 c=1 sm=1 tr=0 ts=6af3f58b cx=c_pps
 a=fUX3CcU6CI0WA5Nw0mDYKQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=SZcDOoyzyg5uqRn5QIIA:9 a=ZXulRonScM0A:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxOSBTYWx0ZWRfX8n5dOyZyYnC4
 SudjeDu+BjBn/pq/41Tubr7iGUfuIt8rurcHemF34KaSZOxYZ9o3CdhDOV0b7+Zoy44OVs8cTsA
 DLYxSPHBw5ZqPjKa4JyK2N1+mvIVJzc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110019
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 04:56:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20515
Content-Type: text/plain; charset="utf-8"

This reverts commit ce7e8077fa980d8e634db3340f6f9e8d81a12123.

AM62L Linux boot hangs without simplefb overlay when the splash is
enabled on AM62L.

Requested-by: Rahul Sharma <r-sharma3@ti.com>
Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
---
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

