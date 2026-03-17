Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582F0FF6E8D
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 22:24:22 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1465.1773786252052148734
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 15:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=oAQu1dCL;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.43, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZltyBQ1XcIp1Tux9NEuL6wVVJWqTODnJ6s70yCwOZnuIB/78RDynhCGX5C3m5QImZgCinwum8w0w11UWInSk16W66r7stPZ5P8kgnrUNCN+MH5MrZKuOS3zY7Yvi+Au5sQqjBGAoUtbgTPnSb+B5pT77TXGMm4Zqk0FC24zMbsVKPQuLVksyzb91whYADB6bLy2wLFLgRrJ2sNB6HvhbKpZ+YITLfnOQyBxmboiffU4n9sta8MWz5Bqf4EjYkML1F7ssuKmDq8eIthrPqDqtkrtBgqSsPNqou4v/FHJQaA0k0geRfeFFIF/gELYxotx+/shLl9/HafSZumbx6LskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXKuy5uDt3V5KEbIXnT1uoXRKsu0YYrroC82EPyPdrM=;
 b=APMqf/6JCdXlzoZWW1/8Z+un73flBmTJtfwy/wb6ePCDTOKKbfndKs9jcjtFmNUJm2nLp5q2Dw2AVeWMhkpHIIt6BSpXF1s9prPEg8Oxtm8rhNodGuZfWjRdUlbVnt5kjMbIr6gbWveJAKSXDBSLGP+sSxAQz37v+mJZpeN4OoxI38BHwzeBf8+W21yZm3e3TSn08KH+ahZy8cQZIoSch0wlkg3SkqOX6KeyjI4rkuG5Wm3uw0KNbTVw07rfdE2l+xNe1J951pViwOB+9gvZ3e2P2TEFSz0Ia52spwXwgs3EnpyjyB1faXNOniAMt7nRHrItS+GpjkCMffxt6xDdrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXKuy5uDt3V5KEbIXnT1uoXRKsu0YYrroC82EPyPdrM=;
 b=oAQu1dCL0OnBxToDQGNEEgHP7uk18unUrlO+W7WkvHhMt8Ng0zCfTJ3KBC71MHUWpBpRwETgKaI+MQZyMFPeyR4M7z7F+G25vpw/aE3jtSj2GFtY4dNXY+ZznV0y7QK286+FhVQeC2+UbLv72D7KyK6t0cjieBIBevdm90inY1U=
Received: from BL1PR13CA0379.namprd13.prod.outlook.com (2603:10b6:208:2c0::24)
 by DM4PR10MB7525.namprd10.prod.outlook.com (2603:10b6:8:188::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 22:24:07 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::4d) by BL1PR13CA0379.outlook.office365.com
 (2603:10b6:208:2c0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Tue,
 17 Mar 2026 22:24:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 22:24:07 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 17:24:06 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 17:24:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 17:24:06 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HMO6Wd3934789;
	Tue, 17 Mar 2026 17:24:06 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w2cpa-00000008HBv-2FnQ;
	Tue, 17 Mar 2026 17:24:06 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] linux-bb.org_6.12: Backport C23 compile fix from linux-stable
Date: Tue, 17 Mar 2026 17:24:06 -0500
Message-ID: <20260317222406.1972700-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|DM4PR10MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a31df6-c60a-41a3-4248-08de8473e794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	bjWS4pPRmb3rPqRbJUkA13xuCz8bh9Lv9WVERuSDkQijXIw/porY1eOBmQiYRInZpPgQs7h4MKX8MuUUxJTxRmeeerMrCVSNvjtALH7HjIg2KbQDzrdwGaUSW0NDU25ldELMtEjGIerSNE1GZTHaxR/MEpr7XC295CtPOexRjQFpVcKVWIuZdw109XjBzse7nsLdSvL2ezO+as4Z7s9LQX6VdV2NVOMCRAjB6pOy+KQUg/svUhXQ9PiZ6I/Q5DFjnbZhYNDsEHoxxDX+FO9lOXpu1jnuffSxvlzH/dVMQa5McegSIMVsN/+T3TBIpWESyIIuE9fgk1vCncuLGBlF99sviD82ITIQrbcJHu/Bgc/YWhXGJzmUTTR2xQGbr1rpdbxXzYNbNe4QssN/R02u9K7N79GwJ/jFV3fJ9Ccl00R8uzl0SHrGHfB5bIhDlKHPrkVlB1xdf5XkfMy9pJt9v86Iuo6gTjH9zYNnAnXsNSZuNu8y1oIvHJuTPLq8AKQA/zctpMzfKHq1lsTMD3I2UCaV0+TJV2PusxDQ+WpUxur8JV1vezRycIlsIiTbX4T1zLAVYKUpOedax2OesIZkgbyztNNRPAZ1MTRUQ4iEH/YFY9wF6H3wTHdF1KEy4sBc7ZuU62jNcyDTpSy/XwSLDqtjION9/4CKbgcuE972RAv/PQFxwPdFUcIAgGU7h0taVCtQ0VvNR6QTOPW0sx5qWIq1P81jdYOHT3gzTOyYrwo=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	535q5gzyIFATyc5dlZ4NZw4CtWDaXkJzexX4aPG4Cpgw5PpxzQVqwn8+hmL4idVs5ivWk8diV64ene34XkRS3pIkL7zgmYQTGBphr/R7//9GvWD6iu75gBQCp/rtg40nD0TKv2wgXPM4irrMBW5sWQ5Z11g/zheCjXUnR0a7QzrHpPK7aIJkeE6k1LZF/HaWL3DQ/O5mHb3a2mkU+hT0AsXRV+hXNdxpWKPkcKgSfyn/YFCrEuP3+7B+00WF4OCGfnF+Qg5ffOWQg/mNrjTu78UD27S/DVLqxhIpNYFsKETh9zxrKzpIUBIfyzFy4AFv/sYjsgsEaJUUKKM7ho89eegfjFNdzCFb0Yn6BfdSLMAfeJ31T4/eeCRVwPd1nTMjeb7EXbY1ThkEuDl3Oeg+O88tYdbsAlbkr3FTQtUCYXKnrJS8VtDVia6HBWvpw7CQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:24:07.3317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a31df6-c60a-41a3-4248-08de8473e794
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7525
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 22:24:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19747

A recent change in oe-core [1] to glibc 2.43 has introduced a build
error with 6.12 kernels.  Backport a patch [2] from linux-stable to
address this.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3Df791d6c5287=
0f3571e740ff7818d45bb0a717934
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit=
/?h=3Dlinux-6.12.y&id=3D3dedeeecd1ae42a751721d83dc21877122cc1795

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../files/0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch | 0
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb           | 2 ++
 2 files changed, 2 insertions(+)
 copy {meta-ti-bsp =3D> meta-beagle}/recipes-kernel/linux/files/0001-libbpf=
-Fix-Wdiscarded-qualifiers-under-C23.patch (100%)

diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-libbpf-Fix-Wdiscar=
ded-qualifiers-under-C23.patch b/meta-beagle/recipes-kernel/linux/files/000=
1-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/files/0001-libbpf-Fix-Wdiscarded=
-qualifiers-under-C23.patch
copy to meta-beagle/recipes-kernel/linux/files/0001-libbpf-Fix-Wdiscarded-q=
ualifiers-under-C23.patch
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta-b=
eagle/recipes-kernel/linux/linux-bb.org_6.12.bb
index 64b11045..77097d83 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
@@ -65,3 +65,5 @@ PV:aarch64 =3D "6.12.43+git"
 BRANCH:aarch64 =3D "v6.12.43-ti-arm64-r54"
=20
 KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.git"
+
+SRC_URI +=3D "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch=
"
--=20
2.43.0


