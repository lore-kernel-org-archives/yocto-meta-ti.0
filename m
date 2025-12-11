Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3FAD4334A
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 20:22:52 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.129.1765484563122186044
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 12:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=qOAn1+YD;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.50, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfzxiEIPAnIlvTjknQsnHimezvxATDrPkPjUR6agIDx6dOiX2T2xcW1fsY0XMo9mjV9Zttipca6y4i22tYTPWHCWX/bRAGXVFKoT8dAMTWxo4TeDSDHz3DjGG43wPuxkwtqO3AsUS7uDMW3SFrecB/pkKLONExlOixTgDj1AVxMP5ii1pJVEFj/lM8Le7Fh2Hh54CPXMLRmoFgably30wUASLxWhohUSMwjFj5Fl1eu1/PxixrMozLnL0JX4O3L1EFd9m2WfQ+VRtGAqOqJDgRPltzEnoBLEwP0g1nnWqsJJfdgp4mj7COkvrFDYYzN8Ix/N/qozsRsO/oZf+zJQ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q45lpug0/ybSHRgLnMcK3yl2xaa4/MpAPs4qSUiNEOY=;
 b=FmaPXIxU3lHqoeMExhqNDPlH6JgdCQuB7Hmb8VNWiDwbuqbqc5FBs3dMvs2u4Jo357hOK2WcPuugTljPhREKQBcBrUCgnvIYpeOdbAQlHfGe6dL2gUlNRUV/K3MQ1veY52O9ZL5+2vzaDS7ooTDSALAfn7S/Wi2mb/342GluWgqrOpJu0NYlh85wkk985Yw3n9LYWc6leS7gA1y9Knjsd6+Q3l9dXX2/5Iom7bjunFzRFM/wVEH2fXHDltrahLW/Wze3wQl4AayQUk/RbPE1DKA4KuOa20MKFgFz8dAOAcfea6+6fc/6cu9ueEHh0xQhHL8+cQWUi5JS+UJpNBwvIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q45lpug0/ybSHRgLnMcK3yl2xaa4/MpAPs4qSUiNEOY=;
 b=qOAn1+YDGQL2BEOpx91qSj2T4pMeLicqNFFrIe51oW6d/oV603UgYciSyitesGHtOKxRZZaexv66WTOVZzRm2yIgIKINW2Mfdw/2UcJN6eD9nxKlout5vLuKEmZRwrsSaIBbA0JOF+MLziGToeqkhwPUubkXssBh9uhiuRORTbg=
Received: from BN1PR13CA0022.namprd13.prod.outlook.com (2603:10b6:408:e2::27)
 by CO6PR10MB5553.namprd10.prod.outlook.com (2603:10b6:303:140::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 20:22:40 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:e2:cafe::61) by BN1PR13CA0022.outlook.office365.com
 (2603:10b6:408:e2::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.5 via Frontend Transport; Thu,
 11 Dec 2025 20:22:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 20:22:38 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:22:34 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:22:34 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 14:22:34 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BBKMYON1025139;
	Thu, 11 Dec 2025 14:22:34 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vTnBK-0000000H3KU-0Xnt;
	Thu, 11 Dec 2025 14:22:34 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 1/5] linux-ti-staging: Add initial 6.18 recipes for LTS development
Date: Thu, 11 Dec 2025 14:22:30 -0600
Message-ID: <20251211202234.4064350-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|CO6PR10MB5553:EE_
X-MS-Office365-Filtering-Correlation-Id: 021917eb-6a48-4fec-1c55-08de38f3078e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|4022899009|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pVF6FHFKDz6pGltwQMCKdZJhlCGKapgOL7w0vp+Ol5b45vo3K5eTYDRZfp45?=
 =?us-ascii?Q?ujFWjVjSQ7MX1lcaRt8zBLq/Da1ZLxtyJDi+kVyVXbPDxc9aPI5a1DbavzLR?=
 =?us-ascii?Q?SQ+eCvc34/lGAWbTbm28a1FnIjccn6mR+PHwUSqEVZYDHkBUCgbEoL/Jnaol?=
 =?us-ascii?Q?S1dCHAeOHQ15+WE1oCsTuHz8j4NTF6qLqa1mryJciaWlk4hHkk3RIF2HKk2q?=
 =?us-ascii?Q?0JTte+Tgpoa/jH4RyJFycUpvd3R4a7Z0iEoyKMav/jgfg4ZIUqK7yR2AERJz?=
 =?us-ascii?Q?0pwV0pKQkk5a5z3nLNwMHiM6WqenRh3F3m1PJFdTJSqdgyHTpquIpF/a59N5?=
 =?us-ascii?Q?BOCJgkWcDNy1yr3wlCwxja+J+aT3byUljb9/ktFgOR0EMao/IM47m3mnVAYk?=
 =?us-ascii?Q?+gpxdaGEB531Umo8LFIc2m1nzbMhWtsV7PrQ0hLs6VXHjos2QHiZX25M1IIH?=
 =?us-ascii?Q?7LPfYqeF8gI+ACMetJnNmXBhMARVx2UcLyEGYvASEduJ7JiClstHWm0gPy2E?=
 =?us-ascii?Q?Bo0eDnMZ47otnw+d48zd+6raGMD/48VRSCGba0rjV0HckDs04QCdhcZXj5k9?=
 =?us-ascii?Q?pksnzRLT5FhU3ts6fSTFdpC957NDJ4GF7WCMRxNMfkqlQANAfZqiY2P3hih1?=
 =?us-ascii?Q?E94EGNC3LQzeZnfy4Tc2H54TcsW8FdMsOaJ66YA5xl+e9YJzQtK6ScmohiaY?=
 =?us-ascii?Q?kTckPx27UriLVEX8/M6nRutPsr8PiQF1BA3AZLpszOQsCwkd3b3iPo9fUYD5?=
 =?us-ascii?Q?ZGvxnYb0PCXeOxWOTjj68N1X7NLp8Ante7Py07JY2PCoNJPpSt0wU5ZpSWzA?=
 =?us-ascii?Q?lRCgQ1OKM7+TNnYosWIZ6JKSSiqg662TDflTsXWgHeI3k21m0M5lGFiLp8Dl?=
 =?us-ascii?Q?yTH4B37Z7clOCZsD2pt/bjG6m31jYTaWLLtUKoLc/ZjYLuPwmPqkqCm15U9X?=
 =?us-ascii?Q?JVeBwFTsdkEAbuaxSODabarX9tj6PcRSvhXedHM94jGF8qryodxM1uKesheT?=
 =?us-ascii?Q?F/z2bnNGjPQKfP26jmn9jgIry1D7sXWHSMJrvUNlNMOAF/Cs9kywP9mxJoVm?=
 =?us-ascii?Q?hEPF5aLp0jDoApDvQwOFx7qHGngD3FVsLJwifca9vcUsWmj4rUjp6kOz5z+I?=
 =?us-ascii?Q?nhkcZ5Csa5421y+6MisQgHYeM4OkxdVq/3IXKGzEdWGE0B5BKVmrZDWr7tHP?=
 =?us-ascii?Q?zBV7Wg0q8i2zpGcB+sAEpn0UUuQ4Uzsou9Y7kUXtmpi7udBna1/kxxJwkO+r?=
 =?us-ascii?Q?qxopicyb8iChvAUqs037FwZvTe2TcGC7mWyMN11VpgBdTHiRhETGqNcbGcHx?=
 =?us-ascii?Q?D+3pChcrq4ACi0h8b6jvRFbT2i8XJfBZfLReTfPIcJjF5pCTVFREtRyLxzSp?=
 =?us-ascii?Q?HsEzgX/wj+Q+s6FJ/+s5UqOguT+Yuf0qsHQZpFCuao0M44jSRweaQto52nc+?=
 =?us-ascii?Q?G4dXuwTiTJ1EmERR3FohRp5mxJZ+qyhRoAcVbdkcFK2BUD1Gbd+WhTTxf/Rz?=
 =?us-ascii?Q?jhz1P6ZiQELvYM20Qf4rPE8CUW+3GoaY/Dty+qInOtgpMGdbwqk0EITxFG/C?=
 =?us-ascii?Q?l0RqeBVR2r+lYvNYcW8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 20:22:38.7025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 021917eb-6a48-4fec-1c55-08de38f3078e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5553
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Dec 2025 20:22:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19348

Add all of the initial recipes/files needed for 6.18 development.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Add missing reproducibility patches.

 ...ild-path-from-generated-mach-types.h.patch | 90 +++++++++++++++++++
 .../defconfig                                 |  0
 .../k3/defconfig                              |  0
 .../omapl138/defconfig                        |  0
 .../ti33x}/defconfig                          |  0
 .../ti43x}/defconfig                          |  0
 .../defconfig                                 |  0
 .../k3/defconfig                              |  0
 .../omapl138/defconfig                        |  0
 .../ti33x}/defconfig                          |  0
 .../ti43x}/defconfig                          |  0
 ...-rt_6.6.bb =3D> linux-ti-staging-rt_6.18.bb} | 10 +--
 ...aging_6.12.bb =3D> linux-ti-staging_6.18.bb} | 16 ++--
 13 files changed, 102 insertions(+), 14 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0001-arm-Remove-=
build-path-from-generated-mach-types.h.patch
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-6.12 =3D> linux-ti=
-staging-6.18}/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-6.12 =3D> linux-ti=
-staging-6.18}/k3/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-6.12 =3D> linux-ti=
-staging-6.18}/omapl138/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-6.12 =3D> linux-ti=
-staging-6.18/ti33x}/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-6.12 =3D> linux-ti=
-staging-6.18/ti43x}/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-rt-6.12 =3D> linux=
-ti-staging-rt-6.18}/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-rt-6.12 =3D> linux=
-ti-staging-rt-6.18}/k3/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-rt-6.12 =3D> linux=
-ti-staging-rt-6.18}/omapl138/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-rt-6.12 =3D> linux=
-ti-staging-rt-6.18/ti33x}/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-rt-6.12 =3D> linux=
-ti-staging-rt-6.18/ti43x}/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-rt_6.6.bb =3D> lin=
ux-ti-staging-rt_6.18.bb} (55%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging_6.12.bb =3D> linux=
-ti-staging_6.18.bb} (70%)

diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-arm-Remove-build-p=
ath-from-generated-mach-types.h.patch b/meta-ti-bsp/recipes-kernel/linux/fi=
les/0001-arm-Remove-build-path-from-generated-mach-types.h.patch
new file mode 100644
index 00000000..9422692f
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/files/0001-arm-Remove-build-path-fro=
m-generated-mach-types.h.patch
@@ -0,0 +1,90 @@
+From mboxrd@z Thu Jan  1 00:00:00 1970
+Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
+	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
+	(No client certificate requested)
+	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C761CF7C0
+	for <linux-kernel@vger.kernel.org>; Wed,  2 Oct 2024 17:51:03 +0000 (UTC)
+Authentication-Results: smtp.subspace.kernel.org; arc=3Dnone smtp.client-i=
p=3D198.47.19.141
+ARC-Seal:i=3D1; a=3Drsa-sha256; d=3Dsubspace.kernel.org; s=3Darc-20240116;
+	t=3D1727891465; cv=3Dnone; b=3DCEYYtmSJFo/Sgv/xDxI47tFv5EQYgI48gCmjgNCwoC=
G+YAxaTGv6w5t0LvkrZFVDbtI7ZlXtzmSmrUjH/knuKDDfcyE9kRmVwFTkvZuTRbeuzgYAvzQqG=
Zx2MUP+19HrXiJhkzdaW2gqaUHm6jzKotnMAmuIf5MdymPExP2XEOA=3D
+ARC-Message-Signature:i=3D1; a=3Drsa-sha256; d=3Dsubspace.kernel.org;
+	s=3Darc-20240116; t=3D1727891465; c=3Drelaxed/simple;
+	bh=3Drz8JAFjsjsVowpA2nxzzCem6/hVUcRWem+15QWeBIZ8=3D;
+	h=3DFrom:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=3DU//l6p=
hLjcdtIQoiM3NTJtyWYEckbwlaAolhWAr5vBabPsLMC8r132cMmOCq2VeaXQYpJZi1PF9o9qa7r=
uMa2mDuPYYQEJxfQXLUcfvfuNBNSe3/YPt0ZnczRoKOVp/ZhK9eCbAyuqdKiV88VJX4HXf29Pk4=
U/pJUJiuIBz6z0c=3D
+ARC-Authentication-Results:i=3D1; smtp.subspace.kernel.org; dmarc=3Dpass (=
p=3Dquarantine dis=3Dnone) header.from=3Dti.com; spf=3Dpass smtp.mailfrom=
=3Dti.com; dkim=3Dpass (1024-bit key) header.d=3Dti.com header.i=3D@ti.com =
header.b=3Dx9oOIcId; arc=3Dnone smtp.client-ip=3D198.47.19.141
+Authentication-Results: smtp.subspace.kernel.org; dmarc=3Dpass (p=3Dquaran=
tine dis=3Dnone) header.from=3Dti.com
+Authentication-Results: smtp.subspace.kernel.org; spf=3Dpass smtp.mailfrom=
=3Dti.com
+Authentication-Results: smtp.subspace.kernel.org;
+	dkim=3Dpass (1024-bit key) header.d=3Dti.com header.i=3D@ti.com header.b=
=3D"x9oOIcId"
+Received: from fllv0034.itg.ti.com ([10.64.40.246])
+	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 492HonLf096412;
+	Wed, 2 Oct 2024 12:50:49 -0500
+DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3Dti.com;
+	s=3Dti-com-17Q1; t=3D1727891449;
+	bh=3DD9PCum0HyoqSpwC0i4ipngZTLS2ludQXOcLTt/aASvw=3D;
+	h=3DFrom:To:Subject:Date;
+	b=3Dx9oOIcIdQ4fKCK786eVp28izZrfEKKj+AFEJLw99X5XocNNHcf79PYgeIiaJSHqti
+	 vyuEZgxqpc2ofiOvg8GGStvsJHvu9KDY6b/0cD4X6xgrxSob2RwVUMwwLFpqoGE7Ap
+	 Rrv5bG+RIcs00EQ7NOloYHr81TExET3fQMA/NGQA=3D
+Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
+	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 492HonXu062400
+	(version=3DTLSv1.2 cipher=3DAES256-GCM-SHA384 bits=3D256 verify=3DFAIL);
+	Wed, 2 Oct 2024 12:50:49 -0500
+Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
+ (10.64.6.26) with Microsoft SMTP Server (version=3DTLS1_2,
+ cipher=3DTLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed=
, 2
+ Oct 2024 12:50:50 -0500
+Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
+ (10.64.6.31) with Microsoft SMTP Server (version=3DTLS1_2,
+ cipher=3DTLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
+ Frontend Transport; Wed, 2 Oct 2024 12:50:49 -0500
+Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
+	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 492Hon1W127998;
+	Wed, 2 Oct 2024 12:50:49 -0500
+Received: from reatmon by uda0214219 with local (Exim 4.90_1)
+	(envelope-from <reatmon@ti.com>)
+	id 1sw3Uv-0003yB-Am; Wed, 02 Oct 2024 12:50:49 -0500
+From: Ryan Eatmon <reatmon@ti.com>
+To: Russell King <linux@armlinux.org.uk>, <linux-kernel@vger.kernel.org>,
+        Ryan
+ Eatmon <reatmon@ti.com>
+Subject: [PATCH] arm: Remove build path from generated mach-types.h
+Date: Wed, 2 Oct 2024 12:50:49 -0500
+Message-ID: <20241002175049.15219-1-reatmon@ti.com>
+X-Mailer: git-send-email 2.17.1
+Precedence: bulk
+X-Mailing-List: linux-kernel@vger.kernel.org
+List-Id: <linux-kernel.vger.kernel.org>
+List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
+List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
+MIME-Version: 1.0
+Content-Type: text/plain
+X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
+
+For reproducible builds, having any of the build paths in a generated
+file is problematic.  Simple fix is to just remove the path.  This is
+similar to the same code in arch/sh/tools/gen-mach-types.
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-kernel/202410021=
75049.15219-1-reatmon@ti.com/]
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ arch/arm/tools/gen-mach-types | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/arch/arm/tools/gen-mach-types b/arch/arm/tools/gen-mach-types
+index cbe1c33bb871..9a2a5c0f1c45 100644
+--- a/arch/arm/tools/gen-mach-types
++++ b/arch/arm/tools/gen-mach-types
+@@ -24,8 +24,7 @@ NF =3D=3D 3 {
+=20
+ END	{
+ 	  printf("/*\n");
+-	  printf(" * This was automagically generated from %s!\n", FILENAME);
+-	  printf(" * Do NOT edit\n");
++	  printf(" * This was automagically generated, do NOT edit.\n");
+ 	  printf(" */\n\n");
+ 	  printf("#ifndef __ASM_ARM_MACH_TYPE_H\n");
+ 	  printf("#define __ASM_ARM_MACH_TYPE_H\n\n");
+--=20
+2.17.1
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconf=
ig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/defconfig
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defc=
onfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/k3/defconfig
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconf=
ig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/k3/defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/omapl13=
8/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/omapl1=
38/defconfig
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/omapl138/d=
efconfig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/omapl138/def=
config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconf=
ig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/ti33x/defconfig
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/ti33x/defcon=
fig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconf=
ig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/ti43x/defconfig
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/ti43x/defcon=
fig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defc=
onfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/defconfig
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconf=
ig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/d=
efconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/k3/def=
config
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defc=
onfig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/k3/defcon=
fig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/omap=
l138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/=
omapl138/defconfig
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/omapl13=
8/defconfig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/omapl138/=
defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defc=
onfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/ti33x/def=
config
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconf=
ig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/ti33x/def=
config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defc=
onfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/ti43x/def=
config
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconf=
ig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/ti43x/def=
config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
similarity index 55%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
index e817b530..a979668d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
@@ -1,15 +1,9 @@
-require linux-ti-staging_6.6.bb
+require linux-ti-staging_6.18.bb
=20
 KERNEL_LOCALVERSION:append =3D "-rt"
=20
 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.6:"
-
-BRANCH =3D "ti-rt-linux-6.6.y"
-
-SRCREV =3D "c79d7ef3a56ff61dd83d5527520b419a4f0e32e2"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.18:"
=20
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS=
') else ''}
-
-PV =3D "6.6.58+git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
similarity index 70%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index c5563d1e..c2e2a3b5 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -13,19 +13,21 @@ include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.g=
etVar('TI_EXTRAS') else '
 DEPENDS +=3D "gmp-native libmpc-native"
=20
 # Look in the generic major.minor directory for files
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.12:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.18:"
=20
-KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
+KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} \
+		      ${EXTRA_DTC_ARGS}"
=20
 S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
-BRANCH ?=3D "ti-linux-6.12.y"
+BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "2d5f05489a39201c2fcf95d2dc04af57b6f7f356"
-PV =3D "6.12.57+git"
+SRCREV ?=3D "75433f843c99d1ab544808749a46a6e2f0151a56"
+PV =3D "6.18.0+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
-    file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch=
 \
+    file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
+    file://0001-arm-Remove-build-path-from-generated-mach-types.h.patch \
 "
=20
 # Special configuration for remoteproc/rpmsg IPC modules
@@ -33,3 +35,5 @@ module_conf_rpmsg_client_sample =3D "blacklist rpmsg_clie=
nt_sample"
 module_conf_ti_k3_r5_remoteproc =3D "softdep ti_k3_r5_remoteproc pre: virt=
io_rpmsg_bus"
 module_conf_ti_k3_dsp_remoteproc =3D "softdep ti_k3_dsp_remoteproc pre: vi=
rtio_rpmsg_bus"
 KERNEL_MODULE_PROBECONF +=3D "rpmsg_client_sample ti_k3_r5_remoteproc ti_k=
3_dsp_remoteproc"
+
+DEFAULT_PREFERENCE =3D "-1"
--=20
2.43.0


