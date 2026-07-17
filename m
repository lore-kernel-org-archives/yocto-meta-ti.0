Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6689C4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 14:49:16 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15400.1784299747409386229
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jul 2026 07:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=YZJdWUqA;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=gGogvSIU;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66HE815M2709292;
	Fri, 17 Jul 2026 09:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=GjnFPqUT83pZF
	8joNwlMkII5iuRisqt1W463k8psNqA=; b=YZJdWUqAbYA2G7AsPnnSyO6Y2GASF
	bY9uZ0PZqAdeHIkQerR//0h/GGH8V3E0rNsx89T03R1i10C484b8CrNnyXXnvIfS
	OF/iOxkkNpOTyVZYS4jhXP8z3IRLxYGEFOZH+V1Zpkiiy/npGryEdUEyYwMzhVL7
	mHOl3Q+m9MXA94btHGFvOfOSVhW6VK/6aYrcM809uu2L5qXNj3EJj1MIeGsY1mam
	PmMjS5nKZzBkLqSuIffGBPhLWRtHpG9k4969+OhiTgGADeMlbGlMmewh1f6qZtEq
	tOEaZtHBT9HfzYV66vfjwV1HjYe+2HsaUUoPoHXeq8TQpz5K7FUQoUKCQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ffks30ypd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 09:49:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNFn/R/nx5dDnf8Uiy8naGcv3lgfnrm0o3DtfEZh+HUz2eMeUhHV0uCZoNA7FfhnYZyu4l9GoWPMZJ0DWFzulo24+TMFmwKH7yNp8toe78QMQ+yNiVICupHIpgz7/P5Wk8pjMvbPnNGuPU1ZRdypI2OvbcaI9OHfvC6KXXy/qn460MOaok2xGJ2kBtCb9RP9petO39YZfU1YWBCu8JLb+A2yk+VXy2Ab88AKl5gSYaxt9Izo0EyJwmIHZmeMd9Gqqu5wjIhFqxAE6s9HPoZtkawf+d7yxX7e/RFU9n8a1BXPpmDjVzQ4TKwn1e10rbAoQwd+4debnwE7VwraLZiDIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjnFPqUT83pZF8joNwlMkII5iuRisqt1W463k8psNqA=;
 b=vWR3uHPs9LBCCtiv4RuyUP0kQyTSGUwLxhHoXuRUYHVPdImtEpnxiQ3vShDl0hMeTu+nuP/tYU8assUQb4TmR9dlYAzKKV9Q+4NHm2xUgG2qTgz9c6uOi3jcmEgcHp+DU/QDBpTnoyNBLcPFmk5/0EuqVYOBg6X3RNHcBbNfgS+dwmBUarceYtBytSHwUnmoHWthzpgMEH1iJANOnslcVRkpJby+AhWIf+eOl+xPfeIZA7PeZ5e2r6H16K93+HZP9il3GrMf5zX+bxmtWejPqgYq8K+diuNwbWp0CVNKpe2bWlKzhBLAgUwKOOruvd1gk7E+7CE1nINKMK9u5WQ54w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjnFPqUT83pZF8joNwlMkII5iuRisqt1W463k8psNqA=;
 b=gGogvSIUDA0g+IrZKExQ9z2HLhXn6sinC6i1kKLQq0eu4rpxsPBbu+PfyRdipSzDWw5+UM5F7b1mZ0KkcuSZe77Nv69bLWknXD+g29phFTY2ER029tYqW+3QuvMaCEUqM8IkPQOV8Ksj0A4gbrgrfQKNx9J3FfGHF7qlWB+f4MrvzV28zT4HCHOWl6IOWt1WtexZtCoVgYMqxkOyHCZCogSutd8KERTLMRQCFjYuk2nbpjGOMFH72dVgwqbT9RLi5at/sTNHP1KX4K+eXGj0usaDyfDjCpaiNnUgLd6yqbPoFwWFxe36UdtQ7OnsMrvZsspUcyJfLPcX0MQ+WiZy+A==
Received: from MW4PR04CA0157.namprd04.prod.outlook.com (2603:10b6:303:85::12)
 by MW4PR10MB5881.namprd10.prod.outlook.com (2603:10b6:303:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 14:48:59 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:303:85:cafe::6) by MW4PR04CA0157.outlook.office365.com
 (2603:10b6:303:85::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 14:48:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 14:48:59 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 09:48:56 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 09:48:55 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 09:48:55 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66HEmtmY3641527;
	Fri, 17 Jul 2026 09:48:55 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id CFB262A69; Fri, 17 Jul 2026 09:48:55 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202607161505
Date: Fri, 17 Jul 2026 09:48:55 -0500
Message-ID: <20260717144855.3524322-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|MW4PR10MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe0d5da-b5f8-4fa2-773f-08dee4128936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|6133799003|56012099006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	ee8RguRQrwoV3Llj7pw72JExCj6F2odoguxIdBOPV3uwkdWUdSfFxWICuEwIf0pIvu0H5jGmokWaPl3sX853yN+nmtIgzFMThhGgpJMGM+MCu+SpVKxpsisHL1qd664fTZbAajP5P1FsNmejgesPBPnCdp+QQNwq0zlttCbcLUsA8NBE3Iiar4zzBojYrVt0Yi0SsRPVkPrrRUZGmMHqc6EqCsjg8Elbi8n8o+I2eFB6e26tfleUtfwSlmoBGU0JP6uBujCiCuZQi7gx+Ft+JK6g0d8+cE37xyMys8+3xfHAW8L8c9ag39Ei4LjLtregQ/mukym+Ecc1FquOzsdB5k/rvsPT7vHvYRT9u8GD45HCKQlkCKOl0Zw4UZqVGApwwwIVwnt9/nctv9CYtJR0VKpgN2eAdkVXbMbxYAsGa3woKMojVWRkq+0ejveEZOWluQEml4VBVSYTAfIJo/iWCv2Rsnr3pCYSRIKtuJnILRFslmmsj5FT7Ft0cGJMKfqRUrydevfK2zIvssydmZcXUQfPY5Zi39M5T7kogOhO4R0k7PYygIQYWGDNgxtCrBLAGLY792eeSwtnlHeMaM67qL9eS7uKQtUFD243t3E6opLaoSNY+iLvfFLiMt9LdiQOqDXaXCx5WMoc6S+7EWaSlQQbrSKp1Myq7sPsXhOPjfRow66S4dedFj+GKRQ+n/22YrQ6AwJd1xn/wiZ3iTkgvQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(6133799003)(56012099006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xjCLzcsMYEVNMARAQ/sXUC2SAU/8Iu8Jusaz9NIcXGD8nW3X14SSaA6DUhLmPyfYfGGD2ZNb1220bZa9E225aVIaIZfkJFus+6PdS3hN+uuYY4qiLom9fTgSXu8UHpgFZQAawdyOlKjQ7nQAN4Uk9E26eKA6+rjrrDvdfv8umkz8V6IAMeY/AEsHxHY9LM7evW3FNcKnaBXppXRJZAtfGwI6Bo6o1uSE3wWY0VpHMTrRKxobipzt+OCQv6z43ssP8P9YCNVFJjol6heoSf9Q8gLGMsVp2nMHfiHRsuB7lrlHllgeRyJCuyrI84F3nznA+a64c4ZgUaUXfPk0FRuiq/LmbWEhA/ARvZXiIgRhr51OO6jXZyBF/3yEkL0Qre/1mIhynD3UhBQPbvErtiW1JqG7fIbrn7RxfkwdcrxZ3b+w0KHewaRWkPXxb3KZiSoC
X-Exchange-RoutingPolicyChecked: 
	YAfueU8FcFBmzQ+i960mb4Rs29O4hauknMKi/7ppftUSxLH6V7MnhpPglIMRN1qLtCinRr8O+0J+coEEn9EEAV1Fxu5rR6NK7+hmJCZuJLwcRS5kikFRd3fljnbUVWJHFFZLWq2+VsADsZOhSxb4DYRNBEI1ADP+cxQ/AEBp5tGvULRB2EQGSYAP4fubfjqTtqbFKlhxnMLbi2svVyZxVLW0YbQuKXlaF3Gv4kLLFXyX2+LYfvLuR6xYSTgEUT9Y6/WLEpg3tJ3kQ7EpurRnbG8XK/8W19AqFvOpsR9ZyEEnRy26RFbZAWw+YB6tp7oefIAPSe2Whdkqmh/jj+ObFw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 14:48:59.4432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe0d5da-b5f8-4fa2-773f-08dee4128936
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5881
X-Authority-Analysis: v=2.4 cv=e9Y2j6p/ c=1 sm=1 tr=0 ts=6a5a40e1 cx=c_pps
 a=E1AkXC+xFF28g4y6WI75Xg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=NEAV23lmAAAA:8 a=uYAEfn-jO2dM--hhc4AA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX9ea9N5ppQ7Mm
 fWRoQtieEEqCeYX8HDzwU+N60ZL6oZ0Xrv5y/eD+0Q63f2LvH87uUcmhTaOadDig8ypJNTLkvcQ
 yjae/TLs4ffr21kUtyubnP/rc1exmmFxIjJzzOyZmJQqSAYz0r1vZtMW6qWZhbeEfsyhwwQoKWN
 KkYIQz1Y4zc2dYQ/lRw0hb52miN1Io6lRZanHQ3ohKkGrOs49mut6fLZAtsOb3gP2HY9nF8Cj5Z
 peA8m+rGMkVWH0D44mYNGZgdZW8x5yDAk1I5N6Re8jLiZHls/lUj4Y7waYUv4nSOLT5VRfRp9hm
 Xm0CcLEbwWii1z/fsVtnTw59lle9CcBr2hd7ZuOED9JCMteGnVhrOy/3UUCwVPqswFN1yTNpyat
 26zRIQa8lnaTiYVFi5HNThd6j4zqSj+9m74L56vGM2sWol5LPdwA3cFhsv+diAjCGJiSbFa29ia
 ni68y9F/dz+hti6CrcQ==
X-Proofpoint-GUID: kk0D0LDwWrPcse3U0_vg1vXNkljF1OpO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX1vuJxLuhsE0Y
 UwyUXW+BMZWTMVHIYN/KzW+R5KRPNC2BRVtn8C2/yqE/O8M6PKoogth+GVvpkuqtfoVZ73XJOQX
 l3dN+MXr4XKWn2eLQ+CsJg5ZMJ0MWlY=
X-Proofpoint-ORIG-GUID: kk0D0LDwWrPcse3U0_vg1vXNkljF1OpO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170150
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Jul 2026 14:49:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20163

Updated the value(s) for:
  linux-ti-staging_6.12: SRCREV
  linux-ti-staging_6.18: SRCREV
  ltp-ddt: SRCREV

Changelogs:
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=98bbe0d37952d0ce1b6508f108c357ceb6d58bf3..5ae038766eda6647bee6dc52c88308a0a280878d
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=8933766be737ed2cabb9466fce497b8bc8c1ce21..1510cd916429bb025e2d0fdbad7ceae652820d82
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=dc5516f772ff621c2d7d517e094f1a4db3a972f3..26fc7b1db82d7852bdb804a21cda9e1c997702e5

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb | 2 +-
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 61cef2a6..5e7e8cd2 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "98bbe0d37952d0ce1b6508f108c357ceb6d58bf3"
+SRCREV ?= "5ae038766eda6647bee6dc52c88308a0a280878d"
 PV = "6.12.57+git"
 
 SRC_URI += "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 01c8485a..0001f465 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "8933766be737ed2cabb9466fce497b8bc8c1ce21"
+SRCREV ?= "1510cd916429bb025e2d0fdbad7ceae652820d82"
 PV = "6.18.38+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 5dd8b52f..e455267b 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "dc5516f772ff621c2d7d517e094f1a4db3a972f3"
+SRCREV = "26fc7b1db82d7852bdb804a21cda9e1c997702e5"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


