Return-Path: <danishanwar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D44C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 10:40:23 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5403.1783507218412198615
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 03:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=mpLInNBL;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=XJJFAt+X;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: danishanwar@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6689RjdP1945099
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Jul 2026 05:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=6RbmKzd5u46Oq
	Aa8oJS0pJ2LDU0HsdbLAZKci68TKUw=; b=mpLInNBLuk8Khl7tV3wmMAkTkynEp
	aJrGU/JwS9nGCcyom4G86iVtegU1k/4WIeW8XnVR6z0ViGZw0d3JQGw6l/Y33bFy
	f4kBc2oK9LjKbRoXhd3FFB4ccOp1EKcZNzwMbRUkm+DJSQ6JmXtRP29UolTldqV9
	/nwukSecGC5lHaP5SCRz0rb7iwkL4YmYLnYcAuTPAUXpkeWBRjH8jnVSu58MQ9ER
	RE6sQmwsk07aO2fGyjB8710DBUpwfODKIiEgWlv03YavuhiVDEsSx74NFWEmetxs
	zzeb7PF/JW0xSNbFegn0e4LTbOuqt7UcbFD1HWIyRswAh1PTdbkyfCA8w==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012026.outbound.protection.outlook.com [40.93.195.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f9kxk8ag6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 08 Jul 2026 05:40:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VyT51G4vtgCAshuF30XVs4v6vtt5GFSCLQ11vrh5nD3STNe1dMeMfNtoxI2cZlQSdZec0JEoYDdFrjnLDSX4/4xLAqiW0cCu9r6BjzetO/tbQycYuTjSxy/3N9Y578IwlPUE19b7wHyjkQPiXAmr0Gyec0DU3PMcqcI4NWIxsdKlQALDVZCBD+qwbfOTbyxmOdd+q/Qnw65F89o5HiE8XnLSSs1J4lWFQlzZkkRNumwauanrpUSQ9r5vJ3ABVDOMlt0xCVjmnhX2FTN9/ei5IFcwoEyN2n54gSixrPLwJy95HOKPC1PfFEqLOIk3w/hIxVojyCTNa9223GTfSgWFeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RbmKzd5u46OqAa8oJS0pJ2LDU0HsdbLAZKci68TKUw=;
 b=idE79Pfi8LeBmKQ/Vl0i58S/vTDre6SY9A4HQafoXL9GOKgAvbeP52bSJIkb5ObCRSEt0LyE6qAsSic88qKeX1fVlGmYvZIhA3mc7GNy3TNwjiVJrk9IZ1i11x4s4rLZKzWBXRhap67olaHleqPqE7TUPnTyTh4nxdHEmu7lHWIwmUbts/ZT8bOx1S/2QxgDG3hOFLqs9xf9BwAsLICx8RXMIQR+sRQw6+hFkadlbd9bSS7/YC4TqkK0tLHWXorvrwOkjAVAsDpqvwK3SLQFfJbWAz92dUm2vATWOSDIEqtI88YhbM5ffTMqDUHCM594Mzu4KpIGhwv1HL+f5A7Kwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RbmKzd5u46OqAa8oJS0pJ2LDU0HsdbLAZKci68TKUw=;
 b=XJJFAt+XxgbjKveOGf71xpIB0ibUL9QQUHzu58HpLjho0Effq0vg0msxrqtE9IbScymn8ttwvo4twjnmCm+GG7+KESVq8uGulwto+rQqy0Vlvl4E2m79dqunOV2YJ8/P0kD4LGJqmTcSrspBhWAj0j6jz5vKwmxN2EFPXcFT+jg=
Received: from SJ0PR05CA0021.namprd05.prod.outlook.com (2603:10b6:a03:33b::26)
 by CH2PR10MB4118.namprd10.prod.outlook.com (2603:10b6:610:a4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 10:40:11 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::85) by SJ0PR05CA0021.outlook.office365.com
 (2603:10b6:a03:33b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Wed, 8
 Jul 2026 10:40:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 10:40:08 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 05:40:07 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 05:40:06 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 05:40:06 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 668Ae6Yk2441698;
	Wed, 8 Jul 2026 05:40:06 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 668Ae6om030793;
	Wed, 8 Jul 2026 05:40:06 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <j-rameshbabu@ti.com>, <reatmon@ti.com>,
        MD Danish Anwar
	<danishanwar@ti.com>
Subject: [meta-ti][scarthgap][PATCH] meta-ti-bsp: Add pruprp-fw for AM64xx
Date: Wed, 8 Jul 2026 16:10:03 +0530
Message-ID: <20260708104003.1287599-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|CH2PR10MB4118:EE_
X-MS-Office365-Filtering-Correlation-Id: eb66bd2e-1095-4b04-5690-08dedcdd4840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Rt8obZBsDM5sJ8XxxDZt9dIJqTLLGW8Z3JGrMVi/PajelaQnmcBsuMUul3WM4dxvlTYHqDHFK+XhP2/1wHUMmyqNqddZvsft01nfoGvKmLD4dhBtG8bI16gytWmOC1vS5j1wkkKv6yZboKKWumQb1q5m5V70K73Ij/iLznnh/ZCK2q7ld+luzihmcV+Agi85oLmMIwa0y+mj1oA1cKIwULrUiCuOUiVdNW6sLRRw5BZdURbxZE0LZw7grkVp57L6NVLnupvPcROr5D/9+cgtKlfwRJkwdhM0sQJ2rvyW+hN7G8fM7dENJWSMKtGQL/ya4YxzULsmkxP7wPAAgc0bY3aSbimZwXa+AdIf587m9gAAZX3rXdl64/WiDn1gFmAtZZnk6hIgqM8Hrc8yxEpH7k9E9/hULjF+8iJHNlxvTQZCsdjOMeLzTsLawAFEN3aPr9jGNgLFnz0wTJby5dtzn9PkfISzQJRpznU1kui9VGVQ5HbMUfAUhom4ONqxcvMHeoontP0Tp5QOeI+70NB9AkyabMa12NGfnzy6Mjpo/RtroT3MvrRzdCRWWmNH0Nb+drzHme16MXweyWZFqVKF36LsfhDnMuYN1GdusSk9QTuxc7XjdOTAYmN80B1re1QNEAX+ORFtW/BYlIIUhXTIYNyqOG1WtvCL0KTtP7VaCE/c6C57WNlNii+cxMwIhzmD9/hIzCQ2Nesktq9wPUUYOA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hwgezdrOCi8jakfWu9VLcdPOIgQNnxngmhF670LlJ0d9DUa55BzMrah6k/iMYKdXY4SAVz/bbkkCAaOECSJW8kEnUtrjLiz0zrisq4WaabuK5sUdpExeIRsi2KbUxIqcUiWVm2+WvWu3GgWVEHyi2F1uOurs+H9ObmBpqVy3iAhihTQFA9m1PP0tNk4em2dihtsqBV0qlbIU809ytxzQtdpqL1TMuChDkkLECnGXmGy5C/mHWQfAeLhkpGGszz2wD6zWQIpAUScuWwgXYyqM/e9lq1XVCjQo2nyPEjJCJU9UidNRLtkgVzQ31eQXCgAbfLuT1+txrZ/oqrSwY0tc9vk0r4ZezgNAeZXOfS6WAsc0wjhh2rVgy+L45IyM9dupg3+5eJQlrC1mAKw9Ho8BLjsYUGzyil9MUOS0tFm36e5ixYRs3BMpjS3nr8TsY7Ia
X-Exchange-RoutingPolicyChecked: 
	oRSqOPj6QY3ipv/xd2ZEo2sCYG997JLj61ReqUTSM/GxEmmPvnLmlUYGqnE5C0EDLSZPopSO44pQfYlDIgPT+kfXzbGyqIUiW+bLJgwTjYzNcwNNh/VM0/Qr7urGmNZWPPOrEwC9RRH/sWuD//Mvp2c5TQL9mxuPDt5ta4D/n1ESjlFuQ10bAzA0me0y3G0cgnlhKaSGMeQ7NuorFy0X0aj4NIdLXL3dz84H/4kOYNILg8GB09zW/016+R3hN8aK/ORws6kWgsao9eWP4fwymEc2vQkiK/tflCP/MXaibWkdqIPHuTa4DFaaLwJvpYFnFByL/Qn0s5sQqGzBqKM2ng==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 10:40:08.9997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb66bd2e-1095-4b04-5690-08dedcdd4840
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4118
X-Proofpoint-ORIG-GUID: dlolhWC9zyvX8y5E7eOaKYRLPbfQQrWc
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a4e2911 cx=c_pps
 a=d2CTHFLGvf7JoJ8RUfZBgg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=q7qQGRtnJzqkfgsqRWwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEwMyBTYWx0ZWRfX9uw0I9ODjdiJ
 iCMbEwOd0V1Z+qyH2OdhWftkrB78PjRVbWNE6BwcPSuIh/zqSfOXd8/aBnOVy8PTPg8zoX1CmvP
 3ptSRb/rXZKKuhiLkdMemljUDdTnS/fQi704IvyxA2piclhq5ytYSOjED/vEyOF9etgUXHQjnLX
 LHllvltpqVoIB/ndNsNwZObEgNDDY/P52oj7Eqz76cbE5dYOqTuwP1I4hT9xvLWXCd+56Yl0B3h
 v254BdiIp0McbzKF9Yi5wP0qkn3PgnKr4NQ8N/Zca70Zz2lZ9o4MzdNeRmRRbNC/EasVO2TwW3i
 kfhEiJP2siYHRd0BXjtGCTfXBV+5NBk7w9Al1mD45+PGl/myjZ4o2UuYuwgcgSMogM1r9VatHjA
 ihoJmjRRsDuLcL/CILjUklBMXEeAbQl5KLYp+dafnGANTGpiNHLX5WY0ELaLb7fdTDiGHRAThvw
 Rc6G3ubIUSEHL89Naug==
X-Proofpoint-GUID: dlolhWC9zyvX8y5E7eOaKYRLPbfQQrWc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEwMyBTYWx0ZWRfX1fmnMVa4eVXO
 8PRuUNgW+xDQUlVnejfASN+2dncP7MaTY/PptX4gfl9V/Aa7qazXbLKb81mKIW5kPRBAzlLOlzG
 gJxVTKjOFHgfW0/du7ia6T9j3EXzZzM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080103
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jul 2026 10:40:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20125

AM64x supports PRP. Add pruprp-fw to AM64xx so that this can be packaged
for AM64xx

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 meta-ti-bsp/conf/machine/include/am64xx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 33fc6240..aa2dd1ec 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -28,6 +28,6 @@ TFA_BOARD = "lite"
 
 OPTEEMACHINE = "k3-am64x"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw pruprp-fw"
 
 TI_WKS_BOOTLOADER_APPEND = "console=ttyS2,115200n8"

base-commit: 9a30c7b97a979fa66cb22b2c2ce1d3b7d466ee24
-- 
2.34.1


