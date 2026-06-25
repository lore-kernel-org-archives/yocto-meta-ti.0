Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94500CDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 16:07:21 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14873.1782403638712633635
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 09:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=FLOt+xEW;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=FbdzRuGY;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65PFcqUU3391981;
	Thu, 25 Jun 2026 11:07:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=XUiYQTJKm0vhM
	Ng0JPeNaPXtXbIAPEeVZ230aTcH5B0=; b=FLOt+xEWGpCqPa3rKjfkjPHU+5Yvp
	6tGKgT/ZszP2A6Nja80jRcYKbXpOnKDxQ3jopmJuhds394agg/yptFqD2fNst8uo
	iOJp9UfxEYXiQqYdyOe2+5PaTsrt7FG86yjX2q6mFP30qQ8yyeloNobSs4oCuX0M
	lMIHh4sHy6y7dTFdjNEWVxskDeJW8w0lLvYZJ2FSz+3H5xDsI6y2mVSR2IXyQhMf
	Eh8kIKqkeuuXj6nxerBtt+fvRqIANHpkrE4/O2gM3OOJTF0gAE8DvxIa/u4Stewh
	SSq4jr/i7xYcSq1v/ohSIo1G/K9PbPsB0Rn0zByOJBfFqOGo+MJVDPzLA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012053.outbound.protection.outlook.com [40.93.195.53])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f11m4t8p4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 11:07:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOVS8J4IQYUw974wCIMV4RCZ6WDT482DutRldNhkcw6YW1pJEfiZal+zWKi/QFvfVW7GdqJ+6Gxsac+xZ5rfqfMHO1WXbsOD6/fT+slq3UZQBUrgXRsOWokWGungSmGVsM7bBvnGUHrz5Cgb6/Vv4nrlbFGoCbHCUkfTQl5IXsIK8ljuRk3D+OIPsU7sSXMFxccDYYmkAslTnqaYC/tyUCXRLfv1waMZadEa/g8nQSS6T8kRB0rxJAaOqfk4PxAroBS8PY/BSp/PL+jPgqpjy6z836z+9E2g+R3UTj31wCRMG0saxUa/6C6CzjqQ17YxlSxxWy/KjGITxSSNoBX0kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUiYQTJKm0vhMNg0JPeNaPXtXbIAPEeVZ230aTcH5B0=;
 b=XNTf58xs9TnUQmyK+CC1m7Sv3EbgSPGqgPNvV0omNzwk6fHabQsr6eX0jjCD7OMScCYBqFrPCIIxsSg+NWPBn8jtdt4MfH5qtU5JFTUPULhtGrbCCLrkfJ43gM3RRqySf8v5w1oFbgY18oNme8BDYNpmWDTNKZ/JJgh9wAg1mEzvHPTAUqxv1YZvCztAoYFTeJNKDIGZLLmEkiLQ77BwsliXnMK0tlfcMFIAien6lT5LGYFlRRiYRnCUSg8MH/C8ENRyni4B+DsNwfDv3DZvLGxy3sE1WLUPdWC2pBJeTFSlZ+/56Sat1+ET6lQaLsor4oLNTKF1fqib7QnzLysKxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUiYQTJKm0vhMNg0JPeNaPXtXbIAPEeVZ230aTcH5B0=;
 b=FbdzRuGY2wHoxCjcuxBt/xU9SOQL3G73dra5KxsCbSncbFaPXyE455lyUwdBIJbKRipUDrCzxBgH7mkvIC7AJKgd5vrouedgfdnfMyPlUiiPh1dI5jRRdrdkk+t8Mj1OTgOTnxxVs625ZWeTXqBTkgrWuC02Wi0zBe2IVmm6sbM=
Received: from BY5PR04CA0021.namprd04.prod.outlook.com (2603:10b6:a03:1d0::31)
 by CH3PR10MB7562.namprd10.prod.outlook.com (2603:10b6:610:167::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Thu, 25 Jun
 2026 16:07:15 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::55) by BY5PR04CA0021.outlook.office365.com
 (2603:10b6:a03:1d0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.15 via Frontend Transport; Thu,
 25 Jun 2026 16:07:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 16:07:13 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 11:07:02 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 11:07:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 11:07:01 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PG71903099926;
	Thu, 25 Jun 2026 11:07:01 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/wrynose][PATCH v3 1/3] libdce: Runtime depend on IPU firmware not the other way around
Date: Thu, 25 Jun 2026 11:06:57 -0500
Message-ID: <20260625160659.29619-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|CH3PR10MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: ac1e36ec-8916-40d1-2e34-08ded2d3d21c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|6133799003|3023799007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	YNrKhwYRmzhGS1A/8lVQBS4GpoAUMma8C1Wxd/XNkL+Yv0mMAf0RSDaEUwm1moWuGjk677Nt1NiPN8GBwUp0vY/Qj9Eg8Dwvh0VjroY1Bnrp8+OMKxaHgCDgF4rgL/eje0D1W+W2CCcuXG3T3/Jz6hAjqO2VFSP5+x3QhuZhxTHasruZjZGgaF0yXhgS1h+U5Jhh6UxtffNiGQaDnaEE13ff7qqSYdGhvpKW6XYBZH3ucm2J+NCPq+PSVAysI4vkecozddodAfnwYvMHso8jSSZNkGuZPH16Je1oPcD2qsCLI8cSirak+9y6pE7ipBNVTWRT+yDeFCcCyts4T6zJFSPXQyDbH3JZcz/6ytXcmCuLMtaSZpQpgYIjXUj9mjXc1n1dYgn1YnyCT8zhJ07rnGi9b6faaFWF2j7xE/B6vbZoyN1jmhVWJ/F8OD2eQXh2I9GmPUcVyc9rU23u8jxrYsrtnZTgF+2CQgQswdOrEF03C0gI4587Wo5zBJsuiDX1/nLkCuXq0SuT92mLRZPRpLbKGKDi6o0fMNsz0rt9pqTbotTk23KT4/ph0pc7L/7cFDN96kIReqHndgikM+vy1cIP7zlazil+K7gV9vnOcLbaTxEhhTWuJP/GjC1XQnN7hlRNovSE5krsEghRivfjICiV5jpE32vfqWstRlP2HeS5wmE3+Iua1CTkuVRUJ8vNlsDyFQOXx5GIeO5IsG2ErA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(6133799003)(3023799007)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bKccQPHcqqRAHTDZdJEWJfeEGNhHHk7i0VjP6GcIKVyCk6G9FhcanYpQHV9dOtgoHu1pZghqVvsmGupfq+F6L5kSzoOjnbokbu5wZ6Zc/9YhvFpykZ/oBmvYLNkcFFqJDo/Xr1GnywdykopEJVBoPD5a52DeMliye9p2WbWBhDQhCp69Ezi6C+zkpxeHrKZDjVObu0e3to3bHfLTlD68cg6WiE3NvYd5BY5me064wVEJk+mgysZh4KpB6qInKecZrpzWX96ea1ZrMSo+4D6O8CnUOOBaL+KJkRZ73qFoKo1g8CLs+pnkVBBG7unQB+On7fbCt3/j4zq5C1sD/iXMeWAOgJ+5ZoK5lHXe9Jgdph1+e7mh5nVqbnIAmUERdJ+C8PB9F+LGd9YKMUFEnfCeO58blYi0kUSPG6VOfsVd6/2BV4u2sE598x75K8n17zcD
X-Exchange-RoutingPolicyChecked: 
	niWcEalOvDTkjn6mdwh86SCdLCdSdewijQC240Gb7P5URMAd8QX+kULf3ggPluplZKNos/Ij3qb1UW0XG3947oZ7w2qmPfkcbYIZrayp8XPc0Pw9OXLI293NlrhxD/KzOadCYTrIqVPpoISQ2CWr+O+dEs387QmvwvsN4MSyh79KK7sBJp27o8SP/qr/3IxhKmov/Ad90wbOWd07r0aIP4px3dLWhPzc3BlWG5AGT7z5YdsChuPStlbg3Vxe+XXmEtxbMC3eFZ+QLR046J1zAE2RILDDlfa5RSCGvD2loq5mwwrnlt9I3plE1xo2TaLDeLhncyd0Ckfg9M43fPkJDg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 16:07:13.6945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1e36ec-8916-40d1-2e34-08ded2d3d21c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7562
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEzOCBTYWx0ZWRfX1R7duqyff9On
 Md4aNpe+R3lXQ0npbxhsLxsJSAxPY9JxPmmeVgDBIpmEnEeKucK/3ml+XQqUQEEULjPKDNa/MQC
 CvL/8xMQ6snvtbThrl+MnoJP0AcRo2A=
X-Authority-Analysis: v=2.4 cv=TbumcxQh c=1 sm=1 tr=0 ts=6a3d5235 cx=c_pps
 a=25df8hqnvvr9QcO7WBwFwg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=a-luKpXRQnbFmFYlrtsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEzOCBTYWx0ZWRfXyjKZ1b04Sn20
 FA4nZ0O0A+QxQzB6xeYtVv3+IOX1qXGt5MaGjOMnpURJ47H0V/6AqzxPg8yDRPnqI/e/gI4qvta
 igKU960fGB4HwSxaRpr8Z/9uiRDrlYKDQ+6sU0mmjp6AuKAIDkL9N0OVzLBnmCBF5SN85onouR0
 5t9usWBAF/1Qvx0jU9HHYYUFR1MtEK1oYdEBY776CLquTaQ0isc9wrTtPSJz6H7uipfnPfnJiJ0
 xhPIQOu3dz/JBVQoWZDFmC2Hln4w6R84u4BMzXt8k1uH3aE4XXYeD1c4D3JMvXHWqklzWiw73Dr
 VhpiW90QQ0FlvPKVFme0z9NVObslYoYyRZmMjATJEeyUykmSLiW539ck74o+1DeAXQxRfeLYo2w
 ThjU1WTc9nmfbUf+MWobkgzrwP2vdjwBqOXqpQsdjl6iZR9SU9hkI4Reqd5+2fcWUksacHE1x5o
 cTB49nptb8a68Xgtphg==
X-Proofpoint-GUID: yD6K_qFhqJ7QACwVAg89GrNdiuqUZeAq
X-Proofpoint-ORIG-GUID: yD6K_qFhqJ7QACwVAg89GrNdiuqUZeAq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250138
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jun 2026 16:07:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20091

The DCE library depends on the firmware to function, the firmware has
no dependency on any one userspace library. Switch the runtime dependency
around here.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v3:
 - None

Changes for v2:
 - Use += to avoid overwriting any existing RDEPENDS

 meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb           | 2 --
 meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index bca91df8..246255e3 100644
--- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -9,8 +9,6 @@ inherit features_check
 
 REQUIRED_MACHINE_FEATURES = "mmip"
 
-RDEPENDS:${PN} = "libdce"
-
 SRC_URI = "git://git.ti.com/git/ivimm/ipumm.git;protocol=https;branch=master"
 
 SRCREV = "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
diff --git a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
index 2ae44086..afbfd1cd 100644
--- a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
+++ b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31
 inherit autotools pkgconfig
 
 DEPENDS = "libdrm ti-ipc"
+RDEPENDS:${PN} += "ipumm-fw"
 
 SRC_URI = "git://git.ti.com/git/omapzoom/libdce.git;protocol=https;branch=master"
 
-- 
2.39.2


