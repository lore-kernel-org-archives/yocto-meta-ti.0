Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C402C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 15:10:37 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7928.1784128232450225512
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 08:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=qkJQCYp4;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=OPaj3/ge;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE30IC1111875;
	Wed, 15 Jul 2026 10:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=p/0AkMO1h1N3e
	SC77QyocmP9wzDg2wEeFPRQZi/sV2M=; b=qkJQCYp4dNLJg2HbRESl03MZ8v6KT
	F7g2PwwtOTuCDiD8qX/ZRu2FuZNPULWZ2rfXzBNU/wxHpUZMw5kBkw22xzs2hgA4
	S/nL6f9fXxd9VURT0FqGwZ+dEuRBl8ElmNvMD5tumLunD3FVV/oR26GVvWxWznN0
	6DYhakmCl56DBeB0X7Wrr41UqbG3hXKdHB0tpVTSFkwcROC4df8oZbWtqu5a6H9f
	CdMDnnvauR15sqYKDhemaJi112aQTLILR2cv1VHmwsUjghO87AUQQUOQNQ6IN8k8
	1Py8sw7GABQUWYsA8C10C2HvHMRBkynLpapZECkLMsRKUq+J7kmB/T0UQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011028.outbound.protection.outlook.com [52.101.52.28])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fe9jb1dyj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 10:10:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrjIZADUbt7Vd/lI4sIjWaUbhDIm2IuO7jw6ghPt323Fu6DH4l6YR922S4y16dKEVvDywsfz3OFfJoDWXMn+RjwCScHf42oQiXIWxNSx6WWABbRNyQbx/aNXxxoYbkwXLY7c9KmQxuq62oFdkCjQyZFpk1gmRAuwxEhIwd7bmTsG8yvgJkny3cB+XjDf2EyTqwNHROHkm4zOfyS4W73PC4Rbn6BQXEZMggBGNI20GM+CTuyQUWLldfGKpjEQZIgPxRWP/MLpfHn2U8DbPeZUISHObvJxujOCLgyghbsqq3mHnT0PLt4pgUozMsQGOaMPH8oeD6coEzsB9liywYcjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/0AkMO1h1N3eSC77QyocmP9wzDg2wEeFPRQZi/sV2M=;
 b=FoHMqVc5sGa2XHn0CQ+JdCeVF1/C7GJLYrboigZ5Tevi4hmLTiA7/Trj2S79+GLa/sP0KPD/Pv0JfTOEvhNM7GdnZrdAVRhOk20N4fzYMhybZAdGugMsFyw/ERir/IDfRn8dp+UEzAXxAvetG0blqmZCSUd/PRpbInBrPUImnQCREMK9lYAl+asosgwao5FjTNDwhyE8T0/r9lXBr1szk9poCR8z80QvpcUi6m1ufApCzZZeSpHYMrTBv0vriO+dqgr+MlHxI3B7f8EGbeqMNFBQKhgBdJyEbtxLYkRA3RTpQNyTFLL3IohmS3xNjIbbT/W1ulH6Wr/22kNO3WWrTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/0AkMO1h1N3eSC77QyocmP9wzDg2wEeFPRQZi/sV2M=;
 b=OPaj3/gecJB3ZFuQkcnuMqCP7bFqUf/Ovs4qF9fPOs61zxl6aw9aUM9eGSeWwlZx0K7jo6KAOyio1K7lQsE2LR5p7sfmQTAvMU3fuxz09o9GruhPQQxAT+dLKc2x6KBauq6vBNiedjyAloIbUHK27HP7oY8YB8KtODG85E5xl0Q=
Received: from MW4PR03CA0112.namprd03.prod.outlook.com (2603:10b6:303:b7::27)
 by BN0PR10MB4822.namprd10.prod.outlook.com (2603:10b6:408:124::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 15:10:28 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:303:b7:cafe::d) by MW4PR03CA0112.outlook.office365.com
 (2603:10b6:303:b7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 15:10:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 15:10:26 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 10:10:24 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 10:10:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 15 Jul 2026 10:10:23 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66FFANYv3325929;
	Wed, 15 Jul 2026 10:10:23 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wk1Ff-00000001wlv-39hq;
	Wed, 15 Jul 2026 10:10:23 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH] u-boot-ti-mainline: Update git server
Date: Wed, 15 Jul 2026 10:10:23 -0500
Message-ID: <20260715151023.464240-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|BN0PR10MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: e7087b36-4696-4697-f36b-08dee283333d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	W1MZMNt4g2V9S16vGWsOYVMT7H37tL0rUfDiTchtU8Wq6B+x2CbChCFXit4watfvYGz2N8DG08sxpW3PmuoaIzOst1GnmfSB9wLtUcAYawOGDjdF1z9+fmSpvsoYGNWH1DjW5em/QUa1i7Dje6c/6GV+UeI1VIU8mW/Ex9ti0tUSPHFTF6/Q7FbhhZ9APH8qnObjvoj+fcxDKWBl51NDHCiAS9WQa0WCHO5oBQAX7AP7QEHg5N6wMUrgb/Ok7cXC0S/yKYP1aoD9FRM5oS4rSME0iy1Nrmtdv8idOWtJnVD6brArVE+crIsHUD1uB0TSEeSfcw5Li5y/jWXEr06kAJsbIZ2xOuYdo9GCThywIPuIGuZyHvOaxqjjxt5A9VBH4lTBNCrRUpu2O762Q3vybyW1W6PIy/FZNlPsUQRgQwkDTxPHkdNFMeooPpT9SmrUbfor2msQ79qc4f08q4hUZMs2ZbJISLIQ4eFusj2FruvHHrsGcONHp9/V4Bzx0Wksr7s+jWqskRPEdpnmtQAg4RdbqdKojDeem0InRCEXKbSD+OR9YGo8BwU6mSVMSS4sW/Xcus0QCYDNlDZ8EJ5Wu9KXyg+a9o/3p4lsX2B3K+Z+qRNY2G6MdoNfZLBD7FtVLsOHGDiZNpYsEVvCGMX1jw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Q4MPQXfAi3OL/g3YjvQ9IOqr+Jx5P9cXujHmBOhJFE1LioUxt7JahLWHEdvrWHpCUOZ6e+h1x5XAxWxh+44klg7pG5uW99tRC/5lG0y6LXX+Ub2lFR8kLkHPPApLBQk2Xwy9eK+JUYFrBhM9h9BzEulKotMfni4vSaKdt0o46Km6pxsK6q+lc2EL9T3K+5MGYoM9MVnxEHs4caO+RBlC3CqOEeI96ZohcoWWihk1jcuaIfjHTiuCORJTGbtJsaEbOQ7XF2jkMN0WDha/BRWFgGkGO8CH5zZ2Ku7Ubh6Pu95mDpJ86eNkAeyu9GbRvU4/FDzDjUeOKTGv05cKzKbAGTj1rkTfntEqwodIyKJO+OklGlOaCIzUqpHFd9ynlE+sTKVovCvGHaLDdBsgQbI7sTAvWIOymt+7h17BaYdTb1EG8IrrcjH1MUJzWp1JHO3u
X-Exchange-RoutingPolicyChecked: 
	Og6dPiI3vqc+i3WoHAY+UzrqZCuQOiQ0P9lSHvgyXpdvkAlRrjrYuaEhRPXJTr6UkmTTick7QH3XeUudAbVu8M/5QyRiktV9oULQLtKkgvdtsLhIIQnTNvC+xNxEUBdWBLVpP+7k1MWW/BEJvdyjUTj5NrSKRG8OtxA5bmNDK6TprYwK944Uw/msu93Id721wx2Z0ZxB/Qe4j4766TOaXlUttT6Uo0rM4IUArfF556dNuOmYuf+RONhuG4nMyhmiWaA+D4YS+ntvCOFIFjXGl6KeHv2np3tOzlvxFlaorkXmyNMm5ziUSvT96NQ4k5Bjvi2wb3CJTu2Gc0TIUF07vQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:10:26.0263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7087b36-4696-4697-f36b-08dee283333d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4822
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE1MSBTYWx0ZWRfX4aku/A7mbauS
 k2ewhCt77LYKdZiuogGL5LS23isShq3dRyFhCZMjJe/2S4IQeRWoIvpLsXtjCAtZnDsxHkNdvfE
 jwjRlJgSQ969i60wmoeJw0Qjd1f1C/1lh5jb0NXrp1dWbJ0Y7ilr8W4QP9E5d61qF8gfwWS/CFb
 H59rXf8J8+36tT9jqkKkb/5Uj759BRGbzFC3M8r0hFKIwsK409Af39ygIxbjv7pTzrSHwfpXfiz
 hhvexiMHs99PfrApgH54+cjS0YGvBffqk3nEOHo1COCkTW2GtXYocIkZVMXW5xYoImcZx2vZtdO
 riSD7uIDWkHqQZjLRSC4/sT34NmQHIkiNCsq2Ti+/VVmUxlDPU2Zn1wa8fqpcTrVnpwjLRWYtz7
 N3SUtMJ3mnmW6uSoimhKLtUIQUCKWA/1PONb3DE32aH1tWDVQhw5SbByp9pmpXL8hKNBAu+We85
 1dCuCQdUFfO/0MtsJ0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE1MSBTYWx0ZWRfX6Ztl5gtiLDXY
 L6i4dGf4cuqtPXIdF3H4UWzejqkmL28apjVl4I94oELrGWz9stfkFR7VPmlqbUyfD0h/9t8350e
 2FiPC3sFAjy8SZZckCpFhbIvbd/BmQk=
X-Proofpoint-GUID: 5N1CdZubyxCJFMUxkY3MA31z9Di5UGsG
X-Authority-Analysis: v=2.4 cv=ROqD2Yi+ c=1 sm=1 tr=0 ts=6a57a2e6 cx=c_pps
 a=GsI8iPYaTsLAaW3Q0Q+aKg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=1VxDqnHFAAAA:8 a=sozttTNsAAAA:8 a=iPi0NIomD5H6R3yf0SsA:9
 a=aZ5uHUMKh6B-zo3GvD48:22
X-Proofpoint-ORIG-GUID: 5N1CdZubyxCJFMUxkY3MA31z9Di5UGsG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150151
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Jul 2026 15:10:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20144

The u-boot project has moved to a new official git repository server [1] for
all of their work.

[1] https://git.u-boot-project.org/u-boot/u-boot/-/commit/2a6ca4ad04e64488ac41c3683cacd44173a96d24

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index 03fd6193..2daf86f9 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -4,6 +4,6 @@ SUMMARY = "Mainline U-Boot for TI devices"
 
 PV = "2026.04"
 
-UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
+UBOOT_GIT_URI = "git://git.u-boot-project.org/u-boot/u-boot.git"
 
 SRCREV_uboot = "88dc2788777babfd6322fa655df549a019aa1e69"
-- 
2.43.0


