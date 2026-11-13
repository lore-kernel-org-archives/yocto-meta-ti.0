Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13642.1794582625831967773
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 07:10:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=KjBFW9Gy;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=eC4Q3fEz;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADEdFCl2314849;
	Fri, 13 Nov 2026 09:10:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=NNQ8+KKWNbTJ2
	G9Wj2jzAnMZUs7lUL8o6KOIe0/7JfY=; b=KjBFW9GyGOshWFAgxD5//v46bgM0e
	Kw6LpFc5UfzjeyNsa0QMkCHuEf//dGbR9crIjlSD8lU/35GJlyKo1oAYwwQJjcxS
	10I8ijqKR36Q6jFxtXrSQ99WjIX093Evv0p6a+iZstCVToNnfSwsV+TeDe9jv54k
	mGYvKjuUV6ItfuDPLz2V1vJj2X8ny+Dk1YSs0cCUZJ81kv1y9q5qmmz5EcihjGmj
	iBjTUXOdnLEQ/np0R/atH+mBny9QK+44GVapOBoMj7MgtAprNj/+CeClDeDUIMvq
	0ndvCt/lWYiJ158aw4yRJR7Y3AezxXInjbPw+hnR1yuDK/wBnZliFkzgQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011036.outbound.protection.outlook.com [40.93.194.36])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hwg9rxf2e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 09:10:23 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGZI6ddu8aFtKPMCtG6oy4hIUQhewfSihPJ7HioPsc45267wcPILI88/xFOumxbxReJa006IP4plBgennc3B3M2ZqfFpAeN3X0XfDuVcyttLnhknUpUSjteVwH/LjxL3yikOvU6sFIOhitVG09PUWYeTKCLRiDHLlfUYr/B+9nsbpBJUERudeK/5sAgkW/wLW7ynKbViYKef5nt1pc/5IUV0Lrf3r1rLyGkcVrotkxnzRbBy7m0w+nh/ad/bNZ3L6bAYIQ/QJuSm/iAmLt29PwDexEVt2oHCORdKdh6ClPZtxe87svk5EL5zKGpUo08PO4yXmeu5X9xk7pTDyYJSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNQ8+KKWNbTJ2G9Wj2jzAnMZUs7lUL8o6KOIe0/7JfY=;
 b=Jl4ZMOcuZC7azyCw6MQA4agmDQOd7AGJrzNmQD0xsfZRXGaJ1Ak/TMdqHYqDAv02sVeM4QZ8rBiyR8NKIKI1846RNOAhTmKJXQEdvL1xWwYh+VHS7PBoeX3z7snxOhDTvkRAWuf60gxTsKPs9dldORqUWYl95o6+IVq88vvWQmDRfdxr3SJD4H9EHy9jHT0tFoj9u6H/w5PhJNQIKsZg3P/Q4A7s7kSDYzGFV2dOO1vTy3w0JYuTHPzwPyqmQ8IePw7vFybAWLeDfh3bHU0ouoOBa9FvVS+a10/owbd8Ya0cWDeqNKASrxlLkTe6AtHxXv1qbXZSySbxEHOLO6Lh1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNQ8+KKWNbTJ2G9Wj2jzAnMZUs7lUL8o6KOIe0/7JfY=;
 b=eC4Q3fEzfYHUlPCq5JALuc5SOCI9k6TIsMkQzptLGj5/Uww2mW2J+5+tyASQ6S808bcisL6hGgmzz+SYNzzNUwbm2DCfr2ZHE4o5U0GCPwXzfn2lj8Xw/Qn+EbH5ZkxqvNy1q6ePM+rFnRgydHxOHcXaK3GUu6WEolPHJ/TRp4Tlc9Kpfc6q6Q44oYYEY4VH/HOx4Juau9pfGu9mwrcVwKtwt7oEowC/4WK94iRUOGsPlSfvA10vLSq0HDZItA/PC/43oHSUBgfcJJSJaQqwZB8vOPQAJdLeNBXmPlT75f5NRCqfFhPUZDuwxFr3DMW8Pr2jcxbvd0ORJ1zd6yCDpA==
Received: from CY5PR15CA0060.namprd15.prod.outlook.com (2603:10b6:930:1b::6)
 by MW6PR10MB7616.namprd10.prod.outlook.com (2603:10b6:303:249::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 15:09:18 +0000
Received: from CY4PEPF000392D6.namprd03.prod.outlook.com
 (2603:10b6:930:1b:cafe::18) by CY5PR15CA0060.outlook.office365.com
 (2603:10b6:930:1b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 15:09:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF000392D6.mail.protection.outlook.com (10.167.247.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 15:09:15 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 09:08:55 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 09:08:55 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 13 Nov 2026 09:08:55 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ADF8tGl1117333;
	Fri, 13 Nov 2026 09:08:55 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 8B4AF2A67; Fri, 13 Nov 2026 09:08:54 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202611121800
Date: Fri, 13 Nov 2026 09:08:54 -0600
Message-ID: <20261113150854.495239-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF000392D6:EE_|MW6PR10MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: b98a6bfb-e89d-44a2-83b1-08df419814e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|18002099003|6133799003|261009223027099003|261009221227099003|3023799007|260925022911599003|260925021311599003|56012099006|260925021911599003|10067099003|261102123227099003|261021121427099003|261022075727099003|261026121527099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: IRyrp3HcUFGndpPOSJH7j4uz2kSi62WgD96cMx1bIvu4m3YCfN4/1S4cwx/DvVzjq0hjNRTS/0Yl2bmPqBCMXJNfgDt6q5ddWkyOl6Emyc3aiaZWHw+IPIXti9bT5Quwb6AkHDp6rKxw71E+otv3qIbqBUV2SKtN7ZeevhyzZWh4nFVFxy1/eFrTaHqgY5Y19pngD6mNldEh2VHBxYNod0conb4KjRnsYGJ+2JKScVIaUyCFX1inYkI+rfAe/knUWKa4dMZzd/DY8Z6kdhdtx5uoK3b0lC6yZVsPNgQigXRpP1CcOSJw6FZZgSPDt7eVeJRgQe5n0MgReloB9Ic9mpNi5ogRMd0axmA5BWXqR5eW0M1/qKjRLQBBNqsQqAQXIje9n9usGqhAImiUsK9ceFmoV8nYBmUuxXW2jPMEG2caoBlRonlJpvgEHskbesiVJrWKSIvhA7Q30QMkhAGj6BGurRRwZduqxflLdcRRIMpYDw5XKYUe+3+L+xjmYSE5BUhTERXdenB5MtMcTlKK/yMF6KREw2ZctTHyX9PeBohpl9YiE/DfEE+MGnYo5PJQbMMY+eqrKtbyeznomqY3+0fCvCFlIk7AGxeoNWT+a3iZOP//p+l69o7f5RN+E1ILf1lRHiQ8QKXHQA4DaTxYXA06d0fsmD8G8lNS64KM60qgrd1ibOPVZjkgzyEoI2Ufp6YiAb6IbZ9fL5btblUn5w==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(18002099003)(6133799003)(261009223027099003)(261009221227099003)(3023799007)(260925022911599003)(260925021311599003)(56012099006)(260925021911599003)(10067099003)(261102123227099003)(261021121427099003)(261022075727099003)(261026121527099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uDau/js3YFJv0JnXFb/c5TUjZLA9qHPCSru/Hkb33qCsqnqrNb4NjvoWqzRIZwbs939kS/oqB5Ac4x43eR1bWp21enQKDjz8ABF+XP43yg44ZwoFBlisvTB4BlKhrUsNzJjmfoYZNtN1cJhp75KV6POWWZ8ZhHXgXMozt67Sa7MSXkqtB5X5wyT9hQF3SXD7tPl4bR+G2x1pQQ8+WRDD+3ncOcp9m58o4UqgvGX94HPAsvZ/VFddRSS2FmchCZIfbV91kF0pqty2c5EHL1KDRWaTfKga6RnraMTkqx6BqYp6/BORd/hABaWhzSpZaqzxDq2Gtd3SZg3yx/uvI8rPm+20BtxguSb2psEdTSxPbfY2bAe6dDXGjrPbkxlUIeULkH3gAVNFPhCCrPX+/rFXElTPf7SpVsox0yPQDx4VpyPADxjLs2jmjJ/ebdNnvjWs
X-Exchange-RoutingPolicyChecked: x0orXdJW6VX7uMfbHOVLhdSbOZ7zSUCJGhObs/prnuD4bsrQ1J7rNiZwzonXf0XdhkJkYOILZmmPkL8LMMkTMDk6OoaJrFTcPQRrBns+ypOdKHidTuHiVzYdDgoAm2efu3JMFbMmx/iW2gEeieAuC8eo83K7sS1wojhAmDXqE4yVhY53aZ8/RkU0kAhiESnj8G5AmcRxcWNC292yTDOmT++FQsO3z56T4c8Gvye22cK6vV6ExAI9Y7yrL99RSAMp5ibmtvyRuNuEFwMDtT0ADMUw0N7qO2byQ74icG7MAU1R/a/mIUbUeMhF8n4a0IHNpg44tReMhMGPb4Zj/WDIRw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 15:09:15.0890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b98a6bfb-e89d-44a2-83b1-08df419814e5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF000392D6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7616
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MCBTYWx0ZWRfXw8sTJ8zHT3bn
 0WXTFxAT3pwYAm9wwv5IiduIHxNGH8KKESNxlvFtgjCvzb3470S4c5J5LbZlbVhcSZQElupSa06
 29wn0vb6myPfxeCfh/DGb/n2yZFXkv3UjbeWN5tz9Rp6s0LAJ08DO43rN6CWC/qaOb+ABt3kGi6
 81Om/tlcZQIwK9x8ymNv+wh/Fj3Zkdv4iEzyfAPLLovXySWDvsSCd0zwF+bN9Lk+yUqDywv7K4K
 Uftj8cnIovaOTnVrQwqbKvdxr9oNDkpZckfbV2CMmcaIj6yCHDDkr5iYQc15vftMpj+l7HnW3t1
 iD1y6V6KEWmw96t/KywNE4Z35nW/Rla0WN+EIoILkI50r0lV7f4UG+sTRihhLVvZbuBWta8C42u
 K+t/cIbK9HxWVndIcGvZHoD8pzFvSntR6DGD1xtNktU8lu9NUVukJjBWxd9ssY5NWfIneupUzCM
 VWQTs6f9NRSax3K+IaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MCBTYWx0ZWRfX4CCAwFIOqu0v
 XUODHLcTUU2zQlAh+qm1IXFwjmIb6CEebQ/L4jYcVi5JIAR+wcZ2+dF/O9tvH8w4o36L7e9BL4L
 829iptNoJIdjxKcr9bYr9HfPQS8CRqE=
X-Proofpoint-ORIG-GUID: asg0qPaY8yHek1b_Itzn195Q4R9R5OsG
X-Authority-Analysis: v=2.4 cv=b7oncdGx c=1 sm=1 tr=0 ts=6af7285f cx=c_pps
 a=xjw7YmzweVlW3QpdpNkTiQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=b45o4kL6AAAA:8 a=NEAV23lmAAAA:8 a=w2JMJCVvCQrmogEvZrkA:9
 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-GUID: asg0qPaY8yHek1b_Itzn195Q4R9R5OsG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130060
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 13 Nov 2026 15:10:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20538
Content-Type: text/plain; charset="utf-8"

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging-rt_6.18: PV_ARM32,SRCREV_ARM32
  linux-ti-staging_6.18: PV,SRCREV
  ltp-ddt: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=b925982b33874847866c99bc3b2709101220b19f..9ad14a1a97699561e45da56e1ec4e59476ca94b6
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=d5ed5d0765992529e310d6cd2d29aa367c2fab36..3bb6367dd98310c1651974402f23ad03fb408ab4
  linux-ti-staging-rt_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=1f84651ac37d934edde4e92c30741edd5349486b..e548aa37d51312e4dd4f383eb99820e6e0e64d22
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=d09e8381cfd8ab035871464a796c1ffc080b7c0c..fe51a7637cfb7c37e90778949da9338daac552f7
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=31cf1d0c9a98b9089c203c72706424cf7f02b374..eabafcdfc283007d86b1dba7f22c5e13b02a98a3

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc           | 4 ++--
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb  | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb     | 4 ++--
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb     | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index a9f7fc6b..5ec9b0ff 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,13 +15,13 @@ CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.8"
 TI_DM_FW_VERSION = "11.02.07"
-TI_SYSFW_VERSION = "12.02.00"
+TI_SYSFW_VERSION = "12.02.02"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
 
-TI_LINUX_FW_SRCREV ?= "b925982b33874847866c99bc3b2709101220b19f"
+TI_LINUX_FW_SRCREV ?= "9ad14a1a97699561e45da56e1ec4e59476ca94b6"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 3d6baec1..0bc9d717 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
-SRCREV_tfa:am62lxx = "756dd70d3ef34d7a308370d941c9ff126cb6af30"
+SRCREV_tfa:am62lxx = "4606f78ef878a640e9b7fd412a2afb0837057972"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-tfa-2.14.y"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index ecab9ee1..831c9db7 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "d5ed5d0765992529e310d6cd2d29aa367c2fab36"
+SRCREV_uboot = "3bb6367dd98310c1651974402f23ad03fb408ab4"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
index 43d763a5..a2613d9c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
@@ -10,8 +10,8 @@ BRANCH_ARM64 = "ti-linux-6.18.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.18.y-arm32"
-SRCREV_ARM32 = "1f84651ac37d934edde4e92c30741edd5349486b"
-PV_ARM32 = "6.18.60+git"
+SRCREV_ARM32 = "e548aa37d51312e4dd4f383eb99820e6e0e64d22"
+PV_ARM32 = "6.18.63+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
 BRANCH:ti43x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 1d53a6e2..718f1574 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,8 +22,8 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "d09e8381cfd8ab035871464a796c1ffc080b7c0c"
-PV = "6.18.60+git"
+SRCREV ?= "fe51a7637cfb7c37e90778949da9338daac552f7"
+PV = "6.18.63+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index c7e4a5a9..14737586 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "31cf1d0c9a98b9089c203c72706424cf7f02b374"
+SRCREV = "eabafcdfc283007d86b1dba7f22c5e13b02a98a3"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5

