Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5027EC5AC82
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 07:39:06 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37817.1786088344707834301
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Aug 2026 00:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ebI4D+Le;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=itt0g0dG;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6776MBNV1663698;
	Fri, 7 Aug 2026 02:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8k9EekO+nLH5yKMGFg5n5xewcAOBSrXfNn3SukG/F
	uU=; b=ebI4D+Lee9ZDGts2xP7Py4sCWbE+oWIgKPKbnHlHs0JAuoX0XA5uOiXRh
	zx+J31v1Mgw+hTyGUfI/m2Rxdr+K26wcf9lYqGE/kAQu94mp1FlEeMveI6SUZNCN
	hdzb0TzBdBaoApFMRwuQleE6GyCn0pkKHnlLyfCapkZN1pzV3Et0K4h775ffb5gI
	02D5kK2wOdu3fXuGtT0bAfcQI19w1SyN3AeebPK02Y0otFtlMepmZzfELcvbIlr8
	h+iqAsCD9cH/GS7tAuZPX3k/Ui2UqMtq2LeYMczO9nKlcy2Vag6Re4EOVy0CE+X4
	5w8WV+17Wln4KHax5y/Sn6UO8s/tg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011009.outbound.protection.outlook.com [52.101.57.9])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fvsrf7s37-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 02:39:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSApvP6y4X5t4SY7GABLlMyt+GMtmIGvvtrWXZLP1boR7PYfmqbXBJAMjkbouotX2U3NaDkSb8J9xpT9usXx7ottwh75KTBM7M/lO2H9FOnOIyDD/0sehZi6pt8QKlAA9dBb2syw7jADeQd8yUo2/g9ZF7Dv2zSt7EHcD83U9H3Esh8PbeVO9DpWmfnTA8NP3TWVkT1YZwdzRGvL0BSatEoOwHnnr8Q8FxKUc2zwElXZYm8TZ1lBGoiktOJcfJtS2lu2oPYL8aLBjfKXgxrR3RKr9CPCdYggl8hIAgDy4rZmlRgBjBawuRvcyOTuqZRQWN/zLbwIJQeli/pzw2W2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8k9EekO+nLH5yKMGFg5n5xewcAOBSrXfNn3SukG/FuU=;
 b=AAbqyd/adXGLGYfXJ3oa9qygQZgnDd6TAEf2l8DC5tGrqe0DC7fUKWnmtPQUx+0JB2vYBFpP3l2DpM7/L+7G1HobdwMzGZaeCVhEu18EzlAPhdHIyOPIg5XFHzFSh6mBQ5T2L4DI18D2IDX7a6D8JeEYtb21hLPL752N62IOm06q+wRFObjKhvFM6D04CGJvq/RIqt2Ja0cZ8nrYbeS4bRXTnxaM3AuxtRXJGyVED5IYHa/jQgL98rKO1eEEGjMuToksiuLIyEmHYye6p46O96q8qyKosCzdmEII1eIanbwyURw3UuOgmmrQtIOI7Hx1xpU+o7BeoQQd/OEAfllUbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8k9EekO+nLH5yKMGFg5n5xewcAOBSrXfNn3SukG/FuU=;
 b=itt0g0dGLRiof0OH9/LN4oatwa6cZkQr+dOnOyJr6Vc9fl7wDri7cGPWrK9nCCrvpxU8QQzyU2L/tWlNesyeRYqWT9IBTAYvm6oUlNEzLRJHCNO9BEFqxVs9ohSKMXdu6XI6TEr5luiSfAvZLaj5Du8TMsJ+xvJNZzQZVEFFsHE=
Received: from DM6PR05CA0064.namprd05.prod.outlook.com (2603:10b6:5:335::33)
 by CH0PR10MB5162.namprd10.prod.outlook.com (2603:10b6:610:de::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 07:38:56 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:335:cafe::37) by DM6PR05CA0064.outlook.office365.com
 (2603:10b6:5:335::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.9 via Frontend Transport; Fri, 7
 Aug 2026 07:38:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 07:38:54 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 02:38:46 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 02:38:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 02:38:46 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6777ccMs647375;
	Fri, 7 Aug 2026 02:38:44 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [meta-ti][scarthgap][PATCH v3 2/4] k3: fix weak IMAGE_BOOT_FILES assignment
Date: Fri, 7 Aug 2026 13:08:35 +0530
Message-ID: <20260807073837.1394655-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807073837.1394655-1-m-shah@ti.com>
References: <20260807073837.1394655-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|CH0PR10MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: 46386c53-5ea6-46c1-aa63-08def456eec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ipToeCb+zhV37nN8KjyWIdfI3cgsQGwDC4VrMTtGqTXG5cBUMaAiAS/2EuFM+6JwA0UXOqkXh0xum7ezoWydmLVs9SfCo+XzsOFNNESQ45LgzurCNQuPrpzyLZylvRuFvqVZ42He+8r0aBQNRBZLVvqvGd+fnp5Fprr8KMfFD/aoWIBaNGk8mGMXwkmvozR4oyvWVY6m/eW1eyVKxs4Jfv/9CeqBu+qcejiTYBSUbZ/Ab2zV1lrKQ5UUIu8/6Y9oYDnusrFd0pNZ2/DJ3ocCmCpuGvwvXMamdbHizE9x18HHOQ5Yo9KdZn/9wgftJ2iudvjRUryrM2GvoZDk1jOY1ghoeqnXM0zBOgSuiLx72a0mEtIvL5ujb4eY3cYjFxfcq77CpRxMXEGco3Rbip4/yMajcHdoSutFOrFbH6B0NLhLY8XiwAE0NYPyK7BwGu30eg7yE+bUD4eFfCYipVRt3z0+8yXOn3nfbIsq31VY7SZZVPHlE/Hl7sPNDxh+enX/SoFn/q6j+hOS/0RtAm6tDCWHiFfwoVGhl9QIIJ0ZYbrJTRwitxvXOlrw5SiCKzTmyo/LQXWgfEhezkmGpCjfo2pxrrXJHda8+dcb7HVGMdShOTLxothZxDUBDw2NJ97BFy8xTWULpQHJQOD8YiOXJfI+NPf8PMG2IK/7Zsyv6yu/uIoqSO3JPT3L+sBkfPekswCj9nNc6RW7JQy9rizkTg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	U1xyWlX/DhaIyKDhPnmfY/27Dqv+Fp0dgXtGyZoFQYkegEWNt14KXry82XlvAb9lrhmJSACRrV99+IjrhSP0RU9ATHc7oAcqcR1Uxh8aCv8kvwQZKX9SzZeWpVQcnIv4iNUAOdmShO8OIMN4h/mc9e1NZo4z8aIoGFwrx/sNr3sKe+hU+kfy+IfkAcU8BITG3oUCPTfkUX22/5tzXzRkf22bLwCUJcZslZHbS8DGEVH62zH1ZpmX1x1udktS9E+lV6sggA5Sns+lT3PbTlrdVMQ1QEzBJlK0Jc1qLLE7S9AIUoDFPheN1W3yvgmgNZ5OLUwbNMkT6gbEXH/QuBx3X8Aw/wRVqwYH/2XsQ8/Z0QP5XuRcUZ83WyMHO4j9OklwjyJMVO1q32AFEnMveTG+DYI/CO99rZKcQgio6HRGy6Lk66ct7irdYH+QiNJh0COf
X-Exchange-RoutingPolicyChecked: 
	lGhcqAYEK8E0AiHfbXiTbq/dYVzyvKlJ/WEeaLmtCDCVeBn4Og4Nx7AZtfCXXAC89P+Z3l4T/JjQ7pMPKoJENVGGd1pnmUD28hkJ/3phKDeGGONbDkOrbcJY8yh0tSVfL20rj+A84EKRpqmxyULq7dj1xHyqD+2vrh4sgvwcMt7tdgjl3D72nYh9aRPYo601gRCmyhdvSUS78tvONAQboZgm1c4XC+DJUDOcdE2SoTjR2tnnuXeyFNTGnbskRkSJyQ+SfjY1sbzGeu+A5KZ5SKa5/N11Tr6vxiHhOMN7wbEoGIkCSw40h16iW5P16ZiMCLb8SX3J3XhTUpk3LetzEQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:38:54.2372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46386c53-5ea6-46c1-aa63-08def456eec0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5162
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1NSBTYWx0ZWRfX5uu1jsGugV1I
 y1nT+vcyeXulz8wpkg7FuvvRAMCDlhPKI8MOPmiQ9E1X+M49vHV2kLFQ2qOM4L/6xB5QysPPs4/
 qIhGEVGe1hYEmy7e3bTDMOfIXCveFrxl3VrJwJn2uT48rG5H0iy7Ie1WDqX1juonbsBwi09r8Bn
 xtZocIYh+Yj0QTB3hs8YNFmTr+ClDk0a4PEbuQpj1HyEnCc3NXVtX9K2MuLcNeJ1MgqqCQroS6W
 SoShcOdHjDZdeciDurmQy6d/vAYn87BmSw8gwn1l5JBVVbD2EoKzUgpgVHxxOD2hpwAh0bJHBt7
 6z2pZk5UKv2WRDKvcoGLm1rSvFPUNJwJT6lON0EnCPz0lrTmtVoElBSrOSFZV8+vmOuRnvgQcCy
 8rfW3wVUIda2319svPXjSEKzeFZl3GZINbzRF7CLoDbeZFU5rIZ7fEewixS6RWZEEhqbpi9D75S
 a4K1kM5V7BTAw3DsbXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1NSBTYWx0ZWRfX9r0MGkgubtc2
 lrkQ3m3R1aXEusXPU2g8k5Gpb0xaenjTbVEPQa1kIxEkY6PWgzbWHXcBRQx+jq79CDjXaOiV/b4
 qvv/xp5A4NyuUxVQ6HLTmvwsParv6KA=
X-Proofpoint-GUID: T2z4coPAIlzRnGr9-IZuxgRyLRYsrlwL
X-Proofpoint-ORIG-GUID: T2z4coPAIlzRnGr9-IZuxgRyLRYsrlwL
X-Authority-Analysis: v=2.4 cv=C+rZDwP+ c=1 sm=1 tr=0 ts=6a758b96 cx=c_pps
 a=0F+T9beUwIReeq27KEkavQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=2TSoTu2kLeWY2qruTVAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070055
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 07:39:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20238

From: Ryan Eatmon <reatmon@ti.com>

ti-core-initramfs.inc appends the initramfs image file to
IMAGE_BOOT_FILES. A weak default (?=) elsewhere in the same variable's
assignment chain can silently drop that append depending on include
order, so switch k3.inc's own default to a normal append (+=) to
guarantee the required boot files are never clobbered.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Moteen Shah <m-shah@ti.com>
---
v2: Simplified subject line; added my own Signed-off-by alongside
    the original author's instead of replacing it

 meta-ti-bsp/conf/machine/include/k3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index d17ae71b..21738316 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -44,7 +44,7 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw"

 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"

-IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin"
+IMAGE_BOOT_FILES += "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin"
 IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"

 EFI_PROVIDER ?= "grub-efi"
--
2.34.1


