Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12195.1793368568372324104
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 Oct 2026 06:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Vm+DNuz7;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=CW7t8rcf;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDruno1566045;
	Fri, 30 Oct 2026 08:56:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=l58m0S1Jwehhc
	XnE+xXDghNS6RD7+mOE98vtbJwXgrk=; b=Vm+DNuz72wuD+HOuWJdkz4wM3hSkJ
	IGFtqDp3qVWBUTB3+Wx5vJMRpmgwyZ4iQhharp5sQsJ+nE5dZJ6zkqAdwShcAlIU
	FvGsjFL8j6LgQwEwMZ/5roQGR6WYOVKhHRkMA6BZ+Wbeqdmk9QiAgQgEMoc8/Elc
	LpR6u858qss6nhirrorWPmPn18qb/oajBzyNP3q9dxjGL+uyUv1NYi45UXJKZJ1d
	uQGaZ50A7ckEmaMWnuxNunD3Q6l1LjNzRJ2JwivGOeHmrb9dpZFOcO4cCQmoacux
	ArBauDQnGTrW/GH3EgX62kMbVlt1U6g2FWDuK/KgRAIEMSCN+jUZ5GFRA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010038.outbound.protection.outlook.com [52.101.46.38])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hmq7n9qj7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 08:56:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVJ6WMl/D/8Ro9YHPRyd9rqzBTJDUZk5xZnw+/bbwVkcDoDddnZ6HwDnFfi7xwRn+Y67ip18i5jOX+UDcrbq8Cd/iEhaRJh8a1vW44FLfvcGgkZqglOnYBH/lhQZTy4FNezYFWXIisdrYQhJdWMQ6xfKVJtvd0IC//BOVq8RJpkT/qM0jOgWsCZ2sf83I4h8vZ8psTzJWCb4q0SGgBhLLRdKLBnQnMVh9Zgk10ddXZK81FxPxwMO6IwWqL/i0K90G5gsaPMQj2NGDsaXRQGn67wofSYSTW+b/qGGh3Vc94cNrOv7LKDruDhjK4G6zXDhGbFNegdiYnrpxFWeZrVn7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l58m0S1JwehhcXnE+xXDghNS6RD7+mOE98vtbJwXgrk=;
 b=GE1uhnYp0aMKmEVtshkBuWgh2kyxXFSLGZB52rXI1SjsdjS6C/S8SXTIcsnpShYlHFQQcgdyrRD6nE3/T7Ti5FJpfiFjgiF3m+oUoyFVGeM60JoT8GpNO9UUPbyWZ+4dPgkFBk1PfNJJEv0rqmdJooe9zynro9tPpMnMGRZolT1xuAeFCvCLmxHkaN0XrX8DOA9E52j4oWtk5talM6ErQGdpjhvU66F/b9/xvbxZ9c5mTlJlEEHA//zRYCDiYxpoyuPqo2x+z6CdIQfwbYhObYuIIqg2saTHF5HC3emTPL5yqXcNr7Bay2l9SZj7zsjw5E7XcXCDwpscFy46mLhz2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l58m0S1JwehhcXnE+xXDghNS6RD7+mOE98vtbJwXgrk=;
 b=CW7t8rcfbcGK/4kcyYjcNUYcY977mQFLWdOuJjs329/30eHKsZbHnIVcnUVKR1mqBDebEJK+JuvhhotCzLy40aHMeFRzsBSVJAUsTxR7eTxSu0OLYtl8Zy7NCq30Y4pg5EnLZQtRP+Ng1/5kdqDyTWHwDBBV4xttehdY+iX9LBj7Gw+Kni9KkJb2xu9Lk3ZbWimWq7waR2tc3ePip6Gvw4vM0D8HF6XlRmwOuedx1eJdgQV+59WLI7E+bKs+JoFMOQxPg7CopJW9zODfs6PlMukSPTQjIdkOOHgSItcxZGWpWhd4sIG/iMOUEnzno33oU55ObDsakFMPDbAuA6Unlg==
Received: from CH2PR03CA0012.namprd03.prod.outlook.com (2603:10b6:610:59::22)
 by CY8PR10MB7267.namprd10.prod.outlook.com (2603:10b6:930:6c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 13:55:57 +0000
Received: from DM2PEPF00003FC3.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::6d) by CH2PR03CA0012.outlook.office365.com
 (2603:10b6:610:59::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Fri, 30
 Oct 2026 13:55:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DM2PEPF00003FC3.mail.protection.outlook.com (10.167.23.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 13:55:56 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 08:55:15 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 08:55:14 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 30 Oct 2026 08:55:14 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69UDtEAi1266798;
	Fri, 30 Oct 2026 08:55:14 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 31FCE2A61; Fri, 30 Oct 2026 08:55:14 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202610292122
Date: Fri, 30 Oct 2026 08:55:14 -0500
Message-ID: <20261030135514.1078936-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC3:EE_|CY8PR10MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c944d8-cbcf-4a5c-c866-08df368d8534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|261009223027099003|261009221227099003|261021123027099003|261021121427099003|261022075727099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: NnmJHKneH1fnMzAEFezdETnV8CX1v6BEGKqpGYU1iQTmSZ330o/rvmKyuaO9b2lOLaAqg6xPU8vidv/S0UqosK/YudVDghC1wGvZn8RtNVa9Y4xdEKqWtreDUf+WFZiHRbANmkdwqJvBEZkQEnbNnFJLVsqI1UOsO08h+Zm52duMzBC6r3DGkbCCJpwMxiOmGxlNNrT3J0lU3UT4x0KAM/ScvO8p5W+VOZ6A+jMmPg1FxDBHToH48RqR/QYL3vqGJxy9wibLOJDgW3D+XYMP8SqLh+2m0qwCkl9EE439EwXDXfZxRZ860s8mTFrXaoaZA8x2zc4+CCsqBheLf3gSQ2WNQQl2icgehFbD0A+gbShlJ47ubBqYY/YgDA9Mt4zc1mh1NRE84i8SshUzSQ3HzV8d4qtDFWHjIrLWfwWPQoplIEM0dht2HKE/iOUZX3BhRvIMlnZRPgAmrb1zOolG/ljGFESGf/f2rgRI+eQg8iYlFcrgxXEsMuhDL/Nxqy6W9lA/c1NnuTas320SIJhiBk5eZdWmfFd+Kl9H0R9sLgbfw6PtuyOOhdft1DQiYkGQ1jmkRNAgtNSQA4Q15swPFzp59r7Z1ZgasUastVR+qA1Q6fnILE2rRKbVATYqRou+SIe9uWhr1aGcGfWMGCUwFTGS/4dVRIf7+QfCetfGWMRfAF7Lf+OHF2dB4w7CQe+XZ5iHSocaVQNviNXPIhXa7g==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(261009223027099003)(261009221227099003)(261021123027099003)(261021121427099003)(261022075727099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aNLFVOMyy0b6W8F8EtpXkeyAZ0jaP+caJSAP0ReHbVrBDO2uIkfMkbhfv7mHfC5/hRqdfZ1dV0j0V2bDlUQoJbA2RB2zCG8TypylR/I00LoNqrjmK9KnZB4IEgGmYwWZmA780//g8+9WPyQSTHP9ZqQ1LWjT8XtTOVIA6qPHnpJSEL6V0AsiroIQPiYjvF+jRZHG0BHCYRGK30wi2lkgbYzxiqiJpBnNzrsZZrSTDGr9Ika02LSlGvVBeU+lVN3MszUcqoKI0U+RN4PlK86BNVOa+ZE1Ey+QcWyeAfMEQA7ZGMBa3LSUE+H+9upc/p3KX4LIJqvTLG0KhxC3mwepHId50hnvCSWHrInRHhsAJMRld8wKc6BYanV00qSlX5iq0eGBTMdvORM3Fv5JxnuggCMvaPmbh9z1Ehb1EHMjZrZxCD9TxvCZsjVFZw9fQBZk
X-Exchange-RoutingPolicyChecked: U937SawLFkJm7kEvK3zKT0ZTNA0mJJWl0gbSEBbvAPV2xuN9lvvOlwCEu9YJwIX2W2gA/t7YMdunLjAVFGtD/tqGrOKjUFjASF5AaQTaSSR87kyoRoQNYqRe0i2lWjns36u/LZ9S5LV1iOb8/y33kqPV/CFs5zg5FLzImnHqtMu9sPD/IrnMIAuOCaE4l0BnzklrRZjn6G5ItkPenCuRc7kJ7aMBi87ELrFNaX7FaP1Na60zyoYoLrfDT99ofjUvj47zuOXPKqMSsu7t+shwG4pCApfqHMtEe9X/l2+5dKUWfANZhu739vfAK2A6aQKad1CusAAZkHCMLRre3S4rcg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 13:55:56.1977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c944d8-cbcf-4a5c-c866-08df368d8534
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7267
X-Proofpoint-ORIG-GUID: 9_RaFMU9plnnW9SlJFqPdbzAqFiERegU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NSBTYWx0ZWRfX2ka/gBiTva6j
 iH9pXN+8/TLlfOvLbA6vZOKSf/ExUAEqmImfflAX6ZgL88CEg6X0n5Hg+M5kY6ZzxBHoStPs3j/
 oKy+vnLutersqTEISUca5vDesWZcW8Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NSBTYWx0ZWRfXxKg2vxFQCz4P
 bX+gBjzTz7+HAH+PHpclnJsaXOhbYKGye3aVVFmkZqvnjQF/OcH0K88yHwEWAA1plHR99BQGrPK
 feunsM2IP8gegLylMwLc0/CvQWuecKBsJUSItm4epCWBScOrt49VD7TbkDXNoy1mzOjl8g12TzH
 P8iX0y84dB7iAuR+9OQ/nGQ/eoXUekquLbRjzPjRNe8cBz+XyKwmFIlcTipFPMUbkpjgBtRI+2s
 oV3XqAFUbIpydvP3mUcSLjpF1lkKLiSsD3oZcWRDKMfjG9JQjff72ghDlX+o50o9+espq75sGFt
 RjMlbYQ6f3t535BnDJ7nszwXE33Ock9HspCvfETta368i3rpPKLhgtqcmv0tDpm2d0whN8O4U9M
 uVNSeqwBru9OLjC64rZx4oNFajeoRqNTjyBKv1tLmj5GqZVzPqOEbcgl3qGGS6cN+4VLacZXTsK
 /wrn0dwe6F8thHeddhg==
X-Proofpoint-GUID: 9_RaFMU9plnnW9SlJFqPdbzAqFiERegU
X-Authority-Analysis: v=2.4 cv=bqTZl0ai c=1 sm=1 tr=0 ts=6ae4a1f5 cx=c_pps
 a=aFbGVCYh9COm6MyaDWiF6Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=M5Cl15kkPEniBsbSjXsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300055
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 30 Oct 2026 13:56:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20503
Content-Type: text/plain; charset="utf-8"

Updated the value(s) for:
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: PV,SRCREV
  ltp-ddt: SRCREV

Changelogs:
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=a0c21f799732ae350ebc31da24297d12f3e945f4..e8e50d58c24a0d2d0e5839fc8bf32ce87cb3c877
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=97becb13b81c314c1d17fcf2226aac9a32086f3d..51d57671f1f51baf253b4ed9251f6190469f885d
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=9ba35283d2ce7c97e633d16abb4edc06bae02319..b809e9f77f5cc7ff9fca18fa48d79315323cc100

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb   | 4 ++--
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 5798316e..7fbfdbd5 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "a0c21f799732ae350ebc31da24297d12f3e945f4"
+SRCREV_uboot = "e8e50d58c24a0d2d0e5839fc8bf32ce87cb3c877"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 8f168a1c..b62f58df 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,8 +22,8 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "97becb13b81c314c1d17fcf2226aac9a32086f3d"
-PV = "6.18.57+git"
+SRCREV ?= "51d57671f1f51baf253b4ed9251f6190469f885d"
+PV = "6.18.59+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 3a379a86..d166ecf4 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "9ba35283d2ce7c97e633d16abb4edc06bae02319"
+SRCREV = "b809e9f77f5cc7ff9fca18fa48d79315323cc100"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5

