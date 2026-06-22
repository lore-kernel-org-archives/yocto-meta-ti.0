Return-Path: <s-joshi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E011CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 08:57:41 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39091.1782118652940309844
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 01:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=LJJDwVj5;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=dWamXxrQ;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: s-joshi@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65M59nKo516388
	for <meta-ti@lists.yoctoproject.org>; Mon, 22 Jun 2026 03:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=+4WRm5qX0tKGd
	sHM245DTRlcGsYHt9cNm4Pe5RTwcN0=; b=LJJDwVj5uJy4sxbb8YcyPdNDLZJY5
	nBX9TkTODnFPLUSF2un4sDlf2Kj5u+kmfsu6fSf/dTezwTyQqMYd3PJUaAL0evI3
	CxOjWNT33qmeiq8GEvkmdPU1TgNZAbK33w0NANOjxrmIRkeVYt/16StHZjSF4162
	WhiavPElF6lva3/4c9Isl+u5tWy1tlRBtxaka0X9ZyRCfftji1I044cHiiyT7kE5
	QOiJCFL1gkpfKa/r6uYjeYmbfD6bImapWoLdFOSpu7abfMpdP61WpoutzFDfE17X
	iT/bBXVJVLkcbGqKGOoTrjpBZ9sNRn36WZRTwGLjz7nM01wir63btrJWA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011028.outbound.protection.outlook.com [52.101.62.28])
	by m0384305.ppops.net (PPS) with ESMTPS id 4exctn4qpy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Mon, 22 Jun 2026 03:57:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXhHw9pAgwNZ49Pc7D3PDRlZ9yYTv4dZhxiciRKx0Res+YoxZuY8e6oNdXH4oWeKIphgdD4RmyQ12D34VQMNrmmugOT3yWjQoVTHhczn4LHRsN0un+WYtmoeSNkWA2O57KoAZEPP1cAee3oNdhs6oMkmUCxEFve0XZyeKv9CtdFEBR+JIA5df5MbVBchBUmLC2uTcP5I//JznyNu8an3INgzEcmaQ6IeLDl7wYYAk/z75rIp5ef0m07tynQqUlmWAxL2TAkke1utGKwWp0SZkePSSTnGE7FVLjnX7DWC19fnx8ywJxE/nBQxrI9GhPo1RpwomWBFgaVht/lfA2FJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4WRm5qX0tKGdsHM245DTRlcGsYHt9cNm4Pe5RTwcN0=;
 b=iKbc/jGI4BJkL74Gu2rQ/Kk905o0ecyxPqo8S3skf2c5PsuMHzcpSzvszvzmrWtc1xec9u+nWgPbdO+aEDdVMsYDEc4OH8zPHS5feGXZ91ASSbLjK7JoZ/mrpenfKOgnw3txkKi7Ei0TRtHNHm3wmNErdEkfcHp3QiRRS3Pd4mi9Z446oceXKfBHJ8Da49ie7lFzwgu5oOClCrPC+8YTGotixiRSMcBSFKc1SMmTyXyHCWK8nUZB9/9W9nniz521ns3KyFg5IrWBr6hquT+knwdgtLOglRJjaYRSb5NwZ9f8K16UoERbGQM939j8nsw3fxQhH+J82/aQI2k2dWlanQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4WRm5qX0tKGdsHM245DTRlcGsYHt9cNm4Pe5RTwcN0=;
 b=dWamXxrQj2dlPByZGtINdz466ZTHVase3rxGJ/GQ8bgpOAHjqzRl9mAF/6GnT9aPXrV7/hzmcnkt2yAdsg3+1NBosYx9vTCPNI5m1/VNC29vFrGBqyahItlfR3C2jj3mLuEBiWCt9nR7LPj6mneKymx6VQ0f+5NN35htCaLD3jg=
Received: from CH0PR13CA0032.namprd13.prod.outlook.com (2603:10b6:610:b2::7)
 by DS7PR10MB5134.namprd10.prod.outlook.com (2603:10b6:5:3a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 08:57:28 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::65) by CH0PR13CA0032.outlook.office365.com
 (2603:10b6:610:b2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Mon,
 22 Jun 2026 08:57:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 08:57:28 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 03:57:28 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 03:57:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 22 Jun 2026 03:57:27 -0500
Received: from localhost (ula0507357.dhcp.ti.com [10.24.52.150])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65M8vQ10151623;
	Mon, 22 Jun 2026 03:57:27 -0500
From: Suhaas Joshi <s-joshi@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <kamlesh@ti.com>, <k-malarvizhi@ti.com>, <s-tripathi1@ti.com>,
        <t-pratham@ti.com>, <vishalm@ti.com>, <praneeth@ti.com>,
        <m-chawdhry@ti.com>
Subject: [meta-ti][wrynose/master][PATCH] tfa: Update TF-A for K3 devices to 2.15 tag
Date: Mon, 22 Jun 2026 14:27:23 +0530
Message-ID: <20260622085723.990271-1-s-joshi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|DS7PR10MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: ee740450-7e3e-4e3f-2a30-08ded03c49ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	mnb7Uhulx7ImU5k2kYnmu0Zj/hse9T2s4ljZsPOdIY2ysHxAtl4ftFr2ezzgrWV04cPFdGnU9URCQphuOS7nooMop0O3QtjZorzzbxr2VoCz4iBNzhRhYFQb89DA915v/T3GmJAn1RDlhhNQQYzWqXRFDa6dDwl2ussJ7WkH916/XMXyMlwjYfyYSJ+Vz27ieJPtU8P285M1RqHcq/vnqEqxkzvU3pYWr5rhmuETycSfLXn4TH4rweO0+saITp+5zcaBazBRSkn0wDkC1hnoLSWwilPh3qz+BHMsmQXLKVzdh4La/x82DMFxnH/zfR9mr/0hVqIMqP0Mk1BT3zeONG90QM+BQCebIs12exLRA/YPK+U0BMijnyiSE7sdrcR/Eb2Ws9yzszbXcmtJsGYfQR2KBay5VOxdEfw5VKrvdkWI5g9RYY/Fzzp7dj280PpM2cn8FUxOjZmBZAk4tRqJ8lxcliBbesgM4Jr8GC7dP2qEXxXaozgVt97LshvbWT/lZy/YKOkREgfwnT7xnn+DrROgSuoZ3YRZkcaAj83Hboh/GsiX7OQ8xFVg1Y6YDlmVz7n3XgNerOfbVXKfXRelm8z2Vt/m4QGYSDrTxMSLpgPTPkMcRx7d6kwfObyLbcmjDq/XDZJJn66ruIVjl1uXCW8BwLhytlRm6/8rQP4QIumvY8sx9uw9bozp742Sf4M3hZPs9D9atbkqMU+nhF+t1A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZNrzexmE8JOcRFM64N0MMNVgNqQQMPc/7VoESMVxG95u48S+u6T31BmecvcHUhm3yMIKWZrzhQhsHPxcaEcTi+bq3qBfWgKAs3souSIaPtdra6LhhiuAfTOnK6013Iu5DMI0TC6CF5HrFeQ37lyRhQAl+N/a67CafEB96ppJ1hM4P4oXwATxwttxz7l74LFCaropRaebjoHD46YPtPeJHi7wMuhhmO7x2wX5xxJxig85lkZ14E9EyszxeOuId3YVrnEY5Otp1vq9MfyoIZyeBIUXOKigavUnRDbnQCqAUqal4gJuRNP0k+L3JXcu2GtQ1alGeAxTii1NeR3yoS58wBsv1bwYbo8fBPD4NDy1r0xoSp3Iu8J+VZosX4z3HxzDQSV4zBFEwy/7S5nuHdL66fBGbKT8HiOu40FKmQvXYbg68VXoGfD1N0gEwQ9syl4D
X-Exchange-RoutingPolicyChecked: 
	iTOeZS/+iNEr6nlx3cqleNy38GECmatbcFPIvYJqCUuexckPxcJp70o2mal7LsjhNdx2CJmxFagrc9AIH7ziT0bLrydBoCg1hT0+6zC6A/kmoYh+6JXlluBbXxKvktuJQG7YdL4+q/SovKpcgc0L/Z1+hsEnszAIRRY1g5qXcpKnMN90Dj0R5lI++NfoiXdS3lRwjUbTL87Ntp3WwCt+ItZeAvKSCEgQGPbslzxGncdPgjHQbrb0Bo6kKX3YOdrWZVWJqz0QIPPGVlFNSpKjicTwxEU0CWoHbS5saTic2hkIyrPsQHb6xfoBAL7w5atAs7LLYBUReZoNhmndgghvZA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 08:57:28.5022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee740450-7e3e-4e3f-2a30-08ded03c49ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5134
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA4NyBTYWx0ZWRfXwwcw5O0kwSHn
 yLTjYPjvpCi2lxf6e8DNMrlt7VySf/dqxsl7nvzIP5BDvqmwMwOEvYqsZGmcRsQN3EtqVnLQjx6
 DZlRVHhNsIqzqEkvg1DNL2yCFsdujey8H4fFaCcahTT2xbh29E9o3Zybsdb5xOQ5DhjB9zGHV2c
 6aT17bUdqtWouXSzRscbgSDGusQCulVGKavCcNN2xsos7oFrJm4ztTwe1BFO8R45Osw5GsFz29w
 gLKH6h0SSZOhmvNLu0sMUmeNdM3riMdFrniG/u/cSpZ1myfT4JENC38AgOK0DFhmbJs8NMXESom
 5Bdl3yBhJ1/2Mig3PYENZuk+NRJznxV+muEUlfUXnLaMvi0OYq5QyeF6s/7JBaaD+yKlomi+67I
 FDK4I3XvUpHuYEPoep5t8e9scYwkJPYXDK2242tcfHi2fGUszq/EPcVkLPfANEz3NVTfrZKcvyi
 0BqIxz2gSRZzYZ6Vj3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA4NyBTYWx0ZWRfX5tcy/KtuTevX
 01vkwRJmUf+wjRbJmGo7fWH29XoZANqdsG8dJeoXoG6XEqUI6313R/TN/fGRBbF22S9G70Aw/Q5
 YOWlab6hoJwwkxNbr5yEC9gcGPECMcU=
X-Authority-Analysis: v=2.4 cv=L4AtheT8 c=1 sm=1 tr=0 ts=6a38f8fc cx=c_pps
 a=1ZuumbNKwQvJCYYZUadJFg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=b45o4kL6AAAA:8
 a=pG67F-DgukWiQI2rYRMA:9 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-ORIG-GUID: 4exvfCD9bgl-Rg5Pmu6IKTVdu58Fj4P7
X-Proofpoint-GUID: 4exvfCD9bgl-Rg5Pmu6IKTVdu58Fj4P7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220087
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Jun 2026 08:57:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20046

Non-AM62LX devices use upstream TF-A. Update this to the 2.15 tag.

Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
---
Boot-tested on AM62X.
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 10697fa2..82c0441c 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -2,10 +2,10 @@
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/trusted-firmware-a:"
 
-PV = "2.14+git"
+PV = "2.15+git"
 
 LIC_FILES_CHKSUM = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
-SRCREV_tfa = "76500ceaeefcda967d8a1f4e30bb04f9fe0425a2"
+SRCREV_tfa = "da738d5eae93af342fdc4995dd3c05acb4c9d757"
 SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https"
 SRCBRANCH = "master"
 
-- 
2.34.1


