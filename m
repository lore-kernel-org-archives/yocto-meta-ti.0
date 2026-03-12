Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B972103E301
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:52:16 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18732.1773312729180226899
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 03:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=edCWUSJd;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.12, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkVX5UuoPI4Ka0Q6pXTa2VZnf5P48lOf7TNARMjIwkvxuROWNXmAVC7MMcJVP2j5dLT84YV8oiYj7N1zgLXEkGVo1hiUm5Y4lshzqaj+c2Ol1OTjXhaU4QJ69AFRfrWA4P79EgGhT/bTcU7AZceLVIwKtyGpcasWWD94Drzd8pjRguAkVO57zImOfuVL9GOiOTbv3WmfKoglRyO9N0Kveu/1AeUwy/lyWN+H+f08jtaRIPWayTrDiKW+PIBL4roO7LJ+2/ZIE2IbOLt3HVjcPqqXxeVDTwXDvoxAGh1r7MPH5iJW9zaPz7JudZuJZ4RbxlOWLzu6LiJyzZ9qK/X7iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ed5T0Bqkq1X4q3/wZxSP4CXcjdr5D/SCeNDvVfEp9rM=;
 b=bdeiFqdovP1bkRzeC0msfc5+FDf/HhR6Kd/ELXP388ucAlpPCKJ/4OshdYuXcJgNRZVOLObh9XWVR3QLOA0/gWxUERi/SQ/wxui1pz2z3HXk10tshK6XM/XDwqfZeEpIYFOtr4Y/BxcnLw5D6VGMTiS5bhNuBu3yW8MrtXXaZh+ndexiEnnVS+S4tbMguBiMkusFjnhZ1qCM5lyLWwkeonEFemL+JcKBrIURyaBtVmdaeb31njol0KTewTs9TRWxLmwsIqMlrsqF81wg2btT6j/LQ5HZTnEein2clAAPfzxIZo8KjzBXNRaT85HBQPGJ+xcnGu9T8TtXBc2ZGdzg0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ed5T0Bqkq1X4q3/wZxSP4CXcjdr5D/SCeNDvVfEp9rM=;
 b=edCWUSJdZRmux2F2JoNRFAz4+rzHWaEcRG5rkeeZg4CP7c6skptLDm9XOJrGZ5+x3z9MxwtAKjkV3gtf8FsDfk7OX8Mgw4B3LyELVYjiKrkm6dyO2O2hzSSGuynuz0hWNMvVhBtBhxj5S6wW+PNs8rfn4ZhXopvZrcRaetunxU8=
Received: from DS7PR03CA0259.namprd03.prod.outlook.com (2603:10b6:5:3b3::24)
 by BN0PR10MB5077.namprd10.prod.outlook.com (2603:10b6:408:12e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 10:52:07 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::ce) by DS7PR03CA0259.outlook.office365.com
 (2603:10b6:5:3b3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Thu,
 12 Mar 2026 10:52:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 10:52:06 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 05:52:05 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 05:52:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 05:52:05 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CAq4V32683085;
	Thu, 12 Mar 2026 05:52:04 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <j-sahu@ti.com>, <v-singh1@ti.com>,
	<c-shilwant@ti.com>
Subject: [master][PATCH] recipes-ti: ti-librpmsg-dma: Update branch and disable example build
Date: Thu, 12 Mar 2026 16:21:55 +0530
Message-ID: <20260312105155.270295-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|BN0PR10MB5077:EE_
X-MS-Office365-Filtering-Correlation-Id: 6582a55b-888f-4f9c-1e39-08de802566dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	m8bkLC14y2slIgqFIOecet7hKSYTkJ76M1TpAJPbApKzB3zWcHXtnTKoOrqn6dsUDlFwO8326xeJHHZnNGwx0j3gdlxHhHpTOB67BJx8IzWKzLODROtR8A7VAShEJ2kbTOzbFQ0ennVfF/3w1fe5v4MFGTvTnic7EzaYm1NnfsM5zK0Kozil91vhqVZvm1zTh/BbyWZxdYvdtTphMZSe8jM0KLv903OzZoCQIAJm2xRLl2R0E4AL/pckqCv77Ybbe9R609gUIVFTB8b+9gyScEnkeJ75SyfxbPVxp7PLIRJp9HNKbpEv1AnoUaZW84YF1l/QIJ+bCZx3RcWUmTmHNZ7abwSj+hOLG9HVE+gI2oZNtyE6UHRDKOUqQukLsfqtlCT3TdSMyxX2QTijSSXM2O+IKRm6wiJs4sUc1dhr64XLmKUtZaRMOQtninCKz46FEGa4kQXSxNIr713HHo/Pv+THlNZkZl0pzjr9K1LDFYraEyo76n215T5VXmU2kczhEIDJmjCCShe9Ag3K/xnoFBrx9c66F1VkNWVHSQABZ6jzo9ePz/7raoWaF2nOP4C9Pm6jW3n5ibgMlE5ZIasUEQAceHTFXlMMEYe81UX+W5wozKef3/x4z8YU+43pqGGZcjqD0jGgclC45cSbSp8IUTIc0ekiCfejdf09h7jKJ7z9/SEu2lWe2hp8FiuzP+re24T7+QYfo9gxrOSbgAKCqNJe+YQPkWx/tsZ+JThHWRV9Bz0CQ4r2DLLTUgxLVl9VyeU7KxT0gi0f/ZACchbL+A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vu4j/v5mDUvA0wf5x4ipSVGliSP9EotEZpRh5BvQVrryC4bhTzYiRSYXThSSeXFsm9vxfZz57F6CLh+VBASvIsll7wfmut635JwhtnHcMGdKldA3bodfUlQ1z1jdz4CYeWjC0mfqTI5s9+zyK5SZXUvPffWbkrPW7dim6+8j1uqoyoOSK4O0jR3QW96AfetkVc/40GH2o89ipkoDwaihdt5oPvm+UQGtZeY4ZImMgbKc83Xp7+nCklUyLRw4VhRv3VddQ51g93Ni3Seridphzyevn5/ha/CwRyTYAUJeBSZ2G/IFIL2LfLZ7pLxNpyXb1HGizod+JwHAtB+8DGJOersSKes25cNgRocNzHacF7lOUXoXx5VZ1gkXUUPE7uVt7055cHZtGNtVvJC1CRRdizLJPT60WSYSFu444bLpQi6BK58tOknNkHLxpNk11p00
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 10:52:06.0180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6582a55b-888f-4f9c-1e39-08de802566dd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5077
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Mar 2026 10:52:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19710

Switch from scarthgap to main branch for ti-librpmsg-dma library. Also
update SRCREV and add -DBUILD_SIGNAL_CHAIN_BIQUAD_EXAMPLE=3DOFF to cmake
options to exclude building the sigchain example.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bs=
p/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
index 2299435f..13599d99 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
@@ -2,13 +2,13 @@ SUMMARY =3D "RPMsg DMA shared library"
 LICENSE =3D "TI-TFL"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D91dc4ee6d125d0aaba4e5bd2fcc50ed=
3"
=20
-SRC_URI =3D "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dht=
tps;branch=3Dscarthgap"
-SRCREV =3D "153951932925a72346b76d98b2774952c48a82fc"
+SRC_URI =3D "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dht=
tps;branch=3Dmain"
+SRCREV =3D "d1cd23bcce13877c7f67d9b1fd399940b87b2ee3"
=20
 inherit cmake
=20
 DEPENDS =3D "ti-rpmsg-char"
=20
-EXTRA_OECMAKE +=3D "-DBUILD_LIB=3DON -DBUILD_AUDIO_OFFLOAD_EXAMPLE=3DOFF -=
DBUILD_2DFFT_OFFLOAD_EXAMPLE=3DOFF"
+EXTRA_OECMAKE +=3D "-DBUILD_LIB=3DON -DBUILD_AUDIO_OFFLOAD_EXAMPLE=3DOFF -=
DBUILD_2DFFT_OFFLOAD_EXAMPLE=3DOFF -DBUILD_SIGNAL_CHAIN_BIQUAD_EXAMPLE=3DOF=
F"
=20
 COMPATIBLE_MACHINE =3D "^(k3)$"
--=20
2.34.1


