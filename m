Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E2BC54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 14:11:32 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12372.1785247882287212904
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 07:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=CVfbIV73;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=s8xp+DRD;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDPGHj3789191;
	Tue, 28 Jul 2026 09:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=XXgPDIPoVd3u8FKWgjJwaixX/k1CiPHmZsULv/lE/
	yo=; b=CVfbIV73pvObURAbhiv2xHuOge5b/M/9picz/3lXw8sWKHRLm4I/A4ANr
	nglR8mX/NNbYjVJ/WHeuA14OLKfnlf8tdHA00Dtr/Aj0vKp8najmZwPGDiZtxZVC
	FZvtV0BJeOq/YkCIbK348DydqkVCkQFrjNrQE9TUTajLh9cpxrd4Fseq9iaouNI7
	jL3zqEBMfiL5ujJd7hjv2y4XbXFBDha/T00hQtf4XOpsRftjWiud+wEPqf58/nSD
	ZKXAmFuovSnJMKelrvkpvYr4NomGVWpiiPPFS4wj0jLEra8BUL0CCxiStDHQTgQg
	mRxaCY/yVa2JCqyCok0F0wmZ+u3lw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010003.outbound.protection.outlook.com [52.101.56.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpvexgr5h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 09:11:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugekaaE53L4TanH+tspp+QO2DpQdL/k/oN+CdIt2Aghhi9MNNRS/wJFzA/qtIZZ+UdchKeIct9n6EAgfIDBhwWhILM4gwMOk3DV1PTfICHM/tJBDgIzbyLakxFcpRn7kvJlnL6PX4EOBw1+3UzWOQqRI4yiEmchGNTiFHwegJc2z3fSWCRU2Pq8yiJE63NzubPGV8TI0szfLUq9bNvvy7w65YLF5YUL6OZ8QepJpQzrIRqSNVhpS6szv13zN1isezTAARs8/1ISKuIh8uBtkGS0c8PAKCEd9xKMoVr6U/wK2XQWE6gHhYwjN4hgZZLf5TX3ACrn64F9BBvM9lg3Tng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXgPDIPoVd3u8FKWgjJwaixX/k1CiPHmZsULv/lE/yo=;
 b=BlPkvCaXAHyPaUJmVH83dmuMf67/1FAa8nqeWM+fTiwmhRo9XJw+qLsU3UKqojyS87psPFuy0husI13UAxUslZ8hs+id0s7IrEnrCLMq7b4gmadFE08d8S7XY1lBjpHJ4KhyYQQ/usQ0nkYZQPVBu7V1N+3hV4+LNbb2XL+85lOL+eXXR1Fq6MsYzMykxConqq2R45cPv+AnBraNa4h5bF7pVOX/ozyinq7h0ippUTXAGqJQriCKT8BG0Y9as071Xup1PILuWJd44pzeTMD96HRr88KCdAF1dC+hLFNIMpbiWipaZIFgNtYFWoixe4wAhCjgk3/QQS9FSlLxbpbbag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXgPDIPoVd3u8FKWgjJwaixX/k1CiPHmZsULv/lE/yo=;
 b=s8xp+DRD9N5DsPyIOmGZq5EwlqrIkawUSENd/BFIHw4Nm+Lu/ynAJBsUOesP8ooB9VN9D+03AHbqwSZhJAvFLPTTf3+c+Xt/JrxoUISqEOG6U2M7jXpNS7YuuOk1fXhRoYfW31GjyrjPaKCm2uQsbC6l2os30ni3AfoDSsH5NEc=
Received: from BN0PR02CA0028.namprd02.prod.outlook.com (2603:10b6:408:e4::33)
 by PH0PR10MB4551.namprd10.prod.outlook.com (2603:10b6:510:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 14:11:17 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:408:e4:cafe::6b) by BN0PR02CA0028.outlook.office365.com
 (2603:10b6:408:e4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 14:11:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 14:11:15 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 09:10:51 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 09:10:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 09:10:51 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SEAp6n2823712;
	Tue, 28 Jul 2026 09:10:51 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1woiWB-0000000BxiF-1Qg7;
	Tue, 28 Jul 2026 09:10:51 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH 2/2] ti-core-initramfs: Decrease IMAGE_OVERHEAD_FACTOR
Date: Tue, 28 Jul 2026 09:10:51 -0500
Message-ID: <20260728141051.2851131-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728141051.2851131-1-reatmon@ti.com>
References: <20260728141051.2851131-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|PH0PR10MB4551:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc4ac6b-988f-45da-3b7e-08deecb21632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	lMj35IEYx9RaG9xaogcySNZluvav40Unv3uK09JGbkgHjcpMWPDf3tngXXCnGdRgLkv7uKpKbVRFpam6ia+rpKq4U6bYs8rFChebRRKJnuTewxXX3FrWcsOv5kZ8mJSY8Vuub5kL3zU0iM+9elfYNOCWu7ohLPid9YDzMSd6BWqxyjrrPilio81MSWROEGhJopFWRGUbHR+fyYKQ5OE60yPe/6B7SV70VYHCvcIh6RPghfYdJVltYVaMNmbqV+pLO93HRZP6f5T1k2x1X5un5bWlOceGVhZknkPRIQMJiuuTx4dypadfyMYK4vRYFBIerHoR1nrNOvb5KTey1YejHB40xty9jdDWd11vlJVKg5m/c8Pv09oTOrwy5Ce91zGPejxn1h7pDnz6Ksj1LgtzErlK8nHqKzoQvCsjCt7sh3rlSdNIUJ4xZSJ5Gy4KQ3SXHTOe6cs48lp9dTmFF0ldFMAlfpJpsvkC6pdtaFhys/dVt2Mk7ywvqg6l73RUbfxfh8P2aPGL0NmJ7l7c91FiWrHHyxixFRQ9LjkS/rsugVv/3LUrFtnOVwdB70PW3lAdUPAN85//7iu61O0KbQwJZcs+slRsuVz5j+K3A373BqnutcxObW2ywLD/pVeJ1JDJ8j9/ASdbQASOMCuALJQLObyovrjfOFEuFWFB0TtzJbHVas8NFq1u3Ck5A3blHFSKbW61V0flyM0WzNXyvcGotA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TCm5tfXRd72BD2mA3JygZ+yGMawB28DZJS0+tsf5bVRpg2q90PflhfMtluHZWwEadzLG/op8s4+/BV0U+8dZP73hRIMUwQHMUW5VulMtkdM4/0Zwk+2/P4GSsFTrfgHZPRvhQ3T0+oZ/YVrLOpiKYjVyJCP8dly3HBUrskHyG36e9SFxrKNupX6IYryi9Z+YVzvm+g2kAZ7diWUg3Snmtq7lDX1ldjllXONYM8su6UoBMmocmg5iKGRNkc3sJ6jXXSTUTNEr62wpaK2estHN/LLD+2dBX5nTvFHdQtBMpBVpE4Y3/V0LGs8la/sVQZesfXQhU5OtoV8C/+khtghWTeUa9aubFjKUHjfrEgV/MOnkXj58dutDJRTIb8M/L3Prvc2ADqOYkHBefR8D3S51n9q3MFh2uaHuCrJMk6k0KXKTRQvzYt5pKdyg7rqkgK9a
X-Exchange-RoutingPolicyChecked: 
	AnqMebt2W5WIQ9LlhwOcBnBBkbJWAo7lx4/tOKgYwHlhF8G2spb9pneBbvhQUxXawQ3P/NEIPTvzDrYZZGWa5AQwTSRArwaJMnvZJY5F2qBzLisZzYCFQSFtTJPZBhJY2rmkUx+mR9/CKJwo+facZfRdrB226b5NCgtbBb6LNkxS2S5ZvH1/i2P9gidQt66joUfF3MX2ANisdgJKZE9Rp5ebMxelqb9be/ZQYzTLGsRP2CNfGdNX4HKin6ajePVZZvan11z992SRbGFwXUO/KxTVHSKq/qnVGroAQ3gzMcWjoPxbma19ia6o0wIACshZaQDBFYk6i/AWlK0Icf969Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 14:11:15.2682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc4ac6b-988f-45da-3b7e-08deecb21632
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4551
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNiBTYWx0ZWRfX/fH48paVMyyi
 qhPsjlSY1hdYbQ/g/kaOCTHmBxw4bsx+GliB0k0XiSl4+L2HzeBqAw6tYUdPKupnl8UIeE5aubi
 ZOGoi1oDHUpXZzpwTf8BcKPmSTupgOp/2DMPKq3qB4ssmnt8jQEMWWtNZRCsWPgfMO3VdQ+lFN+
 cTKpfhIHwM9NTDJFun300w41k0a4yi/UEqH12mJmZ9Scg2QkUYSu1MJdbraxCRb4Ynbk2yActaK
 9l+cJ/hgdu/b4eTa+kcvpSC6fFEA5chAfFDhbEhe98snNwehqCh1SeGuLeewtDaBp5SUEfCq+eM
 JAdP/ViRvGz7wmMdld/lbYgX1qK0tvbqrlnKU0NwbiWEVkTIlC/TupnKLU/15Ezn9gm5Cfgl50n
 Kf+EulpeT59lSr82EarlPlFKA+nzje4kNxARySp/EohiK8+d4zz0Sub6QqDY4T6UHZbQFwF4HjV
 OYOVyriuoDuUPzu8nhA==
X-Proofpoint-ORIG-GUID: Zl2mDxPEXxMH4HIb5wu4WDRGglrKh7rP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNiBTYWx0ZWRfXzyblX2nRiJkF
 9ArR3MhZUGNvwAzYFG9cre8AuIf9+62Cevx9v2L69UNMjxF0Rty8sFd3mdYavlWQO3B+3MzKabU
 ks3BNxtPwuzqRYJBt65dujsnQSwklb8=
X-Proofpoint-GUID: Zl2mDxPEXxMH4HIb5wu4WDRGglrKh7rP
X-Authority-Analysis: v=2.4 cv=IYW3n2qa c=1 sm=1 tr=0 ts=6a68b888 cx=c_pps
 a=miQpwXaPIJxEFudIojRT/A==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=NQSH5FigIGbJV3VoHFAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280126
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jul 2026 14:11:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20197

Adding in the initramfs-module-netsetup has grown the initramfs by a
small amount.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
index e5834656..d6981131 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
@@ -11,7 +11,7 @@ INITRAMFS_FSTYPES = "cpio cpio.xz"
 
 INITRAMFS_MAXSIZE = "131072"
 
-IMAGE_OVERHEAD_FACTOR = "1.25"
+IMAGE_OVERHEAD_FACTOR = "1.20"
 
 IMAGE_NAME = "ti-core-initramfs"
 
-- 
2.43.0


