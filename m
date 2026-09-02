Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCBDC624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 12:49:27 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11678.1788353365565510944
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 05:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=FLMuRly1;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=t9AdEHbG;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 682CV4lO974149;
	Wed, 2 Sep 2026 07:49:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=1R3RkXFqknyEW
	w+EaGvFGVzgiESgoW6+B1mlWRLlb2s=; b=FLMuRly1MA+W+0olz0sxC+euu3JJu
	MD0Tj8rWHHYIeGSWo6Qa4fNIrjgqXB2CshH6681iZaWBzXTNIxRYYM1JYz6ZH4KI
	1t/xvUW4XdlApKfACw8q6F/VopxiH8w/FJChmztv/X3ZqA459Lsvx/Iu+O/Pcjnl
	3z4wrbBJ50dkOLfwdTQ/MuGYsund6gNs+RQ43lyNGIvEtTurjtSJG5b+2b/2ZEjN
	I/PCVvoz0hoS9VQJu0LXjAO/C3u9PDo8QPwl/UfUAm5rQ4P2w9P/OnennMuLxO8Y
	P6+P4VMMUYomG/Ku5vKHm84H51W1ztK5E5W7rOALp8ki0UYuI67Q1icFg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012070.outbound.protection.outlook.com [40.107.200.70])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ge7cgc10f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 07:49:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zp83uT/5URmUP4jgTV+Pg8h68i70F6pFrh/5EcDD4DDxIbsAKuFMtrgPCZwQmAqeZUKJyJQaZFNaSDRyJ0yoXarJFzL929qNAl4iJcsf47K/eeOM6p9OCeFsmT+HogRJazxn4PFDsfdRWDIbnLqqJ/1pGK9hJuPoC5WYOdFOs+eWxH3+DBugcNx3ldke2NHL5s1aHvloKZhd1r7y6NZ8l40FSK6h2wjyDWA9wI19ZR+Dxtm+BHrsSI1FCMYUHoJTuv1gzpfpRL+J4OfoxqBYWoXxesCsHHWMQITFRYIeHQrg2ltAu2tkTXRsuPSwBhzgX80Rc7ftQpM8oADxbC6/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1R3RkXFqknyEWw+EaGvFGVzgiESgoW6+B1mlWRLlb2s=;
 b=MFsdAfhex2e71hUz+2ZBWhUuu0NM9nmEQOIjkZm+F90+418+KlClarxg9vXOhu4w8eKh3b4372OvsMSFL2OaAtyazvHzJeZbRKM6r7BeZ47IDlBQ2WBxsgDfC+LgQ3dfZoinSPc/OpH3xH0u/SLa6bDfB2aFxtwU3TSFL/WAA7ESGnx2p2xnA07b76VR9Lr1WBWWTSKcrJ4L5j8i5wk7oCMBBdrS4/vdTHyxYhzdKqtB5u559CX3fyA9+JJCVppBhQkql+BOp7M2GLcFrm5aJEvnLyLGjmTCB4bRniOVZS08m2UPzRg+oePMG1ZH3m6d4fDTrla+wo1sDa5F52lBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1R3RkXFqknyEWw+EaGvFGVzgiESgoW6+B1mlWRLlb2s=;
 b=t9AdEHbGC3UHIxjSCyL+qD/sDyK2vGJTwxSl2sazSmn4pdclyqSjvTq9Rj1qFFHk6fUhhOyaQgAa5AqLbxP4V8TPtKiCmoYWf129zcCqfbYcs4gBzg236IPRBCw+TIyGRZBEvUkPPK5gwdoj1fzw9v02bMSMyHAsqDMvCqgeqdplx0I2v3RIW4BAlDz+LxUM2WuYCto+7AQa/UxmDISeFXT4frvGLkypxGgrqyfCJhlqomj+I91CVTN/aeB6aDb2ipc5WbRphaRVpHIobTyK9+UYq28yOI2Y3zn5cBhySK93iUGmyMBCyTMH0SGi2e7cQplKiD5BU2GID7/ssD6Nrg==
Received: from BN0PR04CA0015.namprd04.prod.outlook.com (2603:10b6:408:ee::20)
 by IA1PR10MB6124.namprd10.prod.outlook.com (2603:10b6:208:3a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 12:49:19 +0000
Received: from BN7PEPF00000091.namprd03.prod.outlook.com
 (2603:10b6:408:ee:cafe::92) by BN0PR04CA0015.outlook.office365.com
 (2603:10b6:408:ee::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 12:49:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN7PEPF00000091.mail.protection.outlook.com (10.167.245.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 12:49:18 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 07:48:31 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 07:48:31 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 07:48:31 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682CmUOc3672765;
	Wed, 2 Sep 2026 07:48:30 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 4F1AB2A65; Wed,  2 Sep 2026 07:48:30 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202609011013
Date: Wed, 2 Sep 2026 07:48:30 -0500
Message-ID: <20260902124830.837257-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000091:EE_|IA1PR10MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: 32296921-74c9-4944-095b-08df08f09a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|6133799003|18002099003|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Raloi7BU8ZYq0VayOQVJxzu0PcalwGgzL0rsrAt+u341mNfjsntG3tS7MR7GhZ7DCbpfmhckPBMqqX23DitjmX69yAAZDBSJKXuWaCCY9yJRkw568bEADE0/95xlYs2c2BAmrVYhShfgV4MRsm/NN3R+XnTmJbNtlC2S/HFwnDjXdrEOZdw+EkYdJ27xVOk67ObZt7wPYKJXzP3RBALCj5JdE77wemO51Nj58pXQI74aj//A7HubsLZt4Cgm18XoQfZlIDGv5fzI2in6pA/k7PCddBM+KABaNBZ6fYui247Vvda8i6wVSGjDUIkWxSetWAmK+Y5XjY+tS0oQ728Cx1W6T2GAw9LkQNfOQi4Zunf2v2cS4/BznqHJ+yBGYEhhjfpGbWCpFDJVVwztMCQ80JgLFpFOu4/S4J0zZx0a4Lt7tO9h4nIiKDVkHpikco36ImQF23LUA60I/n94tZaNXVtw7kjnCxXRoNgx/Eo4N/jNZzsnF6H/6+8T/x/G25eJsrfjROpr6KxgwvadtSRCt1SJUwuODL1pssCNjsr6as7y0+tTOPJ29fP0PQ994yh1J/zNq9a9PbaOdG4Rl6X6lGY8L5OhnAr4vwhTPo29r3/v+t+GWQTO85Dp2lwRiBwjNrmyQ9gI8GGuRa4TLGlaeZnl88aIByeTuCZXuhizG8i5fLRXpl+znJrBJclKgBT8d+5n7RDTv074C6sDu8Uz6g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(6133799003)(18002099003)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bkBg24Y/g7QPOlfXNm5dTHMGkix8FoFmCySnfwZVtYiGqiE7R9vFyMKeT2NbZshAJY+BMNyCM/7QyODj+QlD59ORwkf7rpof3TM9euPItO2Q2O2xbo284ST1ayTb0epm9VLWTWtpBXpvJ2nY4yLbxqkdZngoXiKKtNRyH/wYRUGFUngtohgZ2YGXwgD7Y24Plcj6CFith/PU4PbNhXaFszGaBF4PKzhJJGhCYxc8SpiR6O1vgfpDKj6R6gh0UrY4pIqL/vQJl/6yDhWf/FbkQg8vhvXU3wJ6tZ1ORVm4pWf2EjaPIicgsEup5kfT8m3BGAioWxOOBOK9o+mZxsNv3F780OaiKxOpF6kAhuDLsrrkt0fxeBb7CDzPElhbEfyYzKz9o++CVzy9C3T72UWyBaczH1lWcbmD9H1HzSbSQ7ZYsgIZuTmtcPlyyA8ru9aH
X-Exchange-RoutingPolicyChecked: 
	JxN4IrtTgZ3gG0yVno5H5CERmSIGPW2yosAjwssqTAng3jYPa/wa1v52iYLUsf8Gz77Q2lLwc8l9X6FpbGAUI/uTNvA3AgDg12cmD3cnTlaRQdOa42gYzCm5FAwsngZZ+H1gB2FxN8CcYpHF60woVBef9O4dGx3Zs31Ot7vwA1UWgZGke6Tk4gU7oZhGAk77GpCd44PvGBSXTA25bO7xPMWpXGWf9WZxOPOrwUDax+FHWsyQruzSadi/G10KZP/ONifADspplXWrBk6SnXzfU4f8qyxS3bhyirEzNlBQlNm36u/CIY8PLLSRQf7tHXsXn7zs/9LabdQaqNQVVrpKHA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 12:49:18.2818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32296921-74c9-4944-095b-08df08f09a50
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN7PEPF00000091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6124
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExNCBTYWx0ZWRfX3Yd6yszo+Qkj
 OeXkwfdFOmnpLAMqy8SQovLQ2FwGwiDDmmrsdTiw4bYcQAUlQb2k5lDkxGlPWwP6K41jmDGbsB2
 CGiMwYq3yghCrjS+W+4JZlnAjxMlNlI=
X-Authority-Analysis: v=2.4 cv=Ka3idwYD c=1 sm=1 tr=0 ts=6a981b53 cx=c_pps
 a=XGLhMEKp2bz25O9eZsCnQw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=EQq8FFkIX16rlHgwlwEA:9
X-Proofpoint-ORIG-GUID: gBfFeaLJlpvN9ViPUD1zrf0o5okwfJVX
X-Proofpoint-GUID: gBfFeaLJlpvN9ViPUD1zrf0o5okwfJVX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExNCBTYWx0ZWRfX7q0opF+FP6ul
 8NZVWPVyg1x438ZTbdJqiEPGA5xnlGfpuHCoeJwVMmxFEl8PAGbJiyGYC4n6sft7qwD20yWhxCA
 /jM6S2LCoWFaub/AKX1mnJ2UBybBvzXhnwy9zAISdKufAz707IyGcTxP2HCpIviUwfdzdeeSAqr
 DE+hVQRXtayUWltzwVdxOGXaVfFsJJLGo3jNz/LlSN9l2cKlMk9SDQY/3OAunUMGFde54jC4pIQ
 RZZWATOgfQClxIxYlNuS5wPJFqrC4O2zY0vn/etOMEisJgNzQ4V3P6oKaUbfog0eersabv7x7J+
 FTmCf/yd8r24BoH2H5u2uDiMPOsXr2N7UIfD8HEZjxCMH8AH4BM1B0KwcRYQg5oDcKWkVFWupTr
 irMlxpFiAwGQjwGVx0wRB6jxzkuD0IxHoFfODv5peGdyzFU9fgyCmFxJd/6Sp1WbAEKP+r2UlSB
 KXUs6fUBO/hwDCqHdpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020114
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 02 Sep 2026 12:49:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20322

Updated the value(s) for:
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging-rt_6.18: PV_ARM32
  linux-ti-staging_6.18: PV,SRCREV
  ltp-ddt: SRCREV

Changelogs:
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=8a78938c2d8a270d851c66abc2cb9d8fcf77c690..2a85f4bcffc50ddc8b443d8e4162e9e46ed0f200
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=66c3ddf05d9d378cc4f8f43fd2a7cd491e9265cc..2cb14eda73fdb89b09e5cb92ce9d691a6a36c250
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=76fe5cfa8d2eb4ae1681d49f8313bf02a68e38b2..38638d15d7e5797387d43b56708a16b3af52f2e4

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb    | 4 ++--
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 58d335a3..7637cfaf 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "8a78938c2d8a270d851c66abc2cb9d8fcf77c690"
+SRCREV_uboot = "2a85f4bcffc50ddc8b443d8e4162e9e46ed0f200"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
index 71fd330d..96b3b2b6 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
@@ -11,7 +11,7 @@ BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.18.y-arm32"
 SRCREV_ARM32 = "65cf808e0410dd16ff0bb1f03a1bb7e67cbd6c32"
-PV_ARM32 = "6.18.38+git"
+PV_ARM32 = "6.18.47+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
 BRANCH:ti43x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 66d31755..da8ece3f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -25,8 +25,8 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "66c3ddf05d9d378cc4f8f43fd2a7cd491e9265cc"
-PV = "6.18.38+git"
+SRCREV ?= "2cb14eda73fdb89b09e5cb92ce9d691a6a36c250"
+PV = "6.18.47+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 6f4728ef..044244f5 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "76fe5cfa8d2eb4ae1681d49f8313bf02a68e38b2"
+SRCREV = "38638d15d7e5797387d43b56708a16b3af52f2e4"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


