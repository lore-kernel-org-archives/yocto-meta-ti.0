Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7FCCD98CC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 15:22:11 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48678.1781191330507136598
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 08:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=DCtHF4jK;
 spf=pass (domain: ti.com, ip: 40.107.208.69, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIb/mwc353npIVR1QHel8aBJFL5TGc/eYUrzC2x4ICOmMCXw1OEV2yNu2apEXw9LBwqlAd9cHbQYePalHRadtFdMSwxEbl0LRegmLtiNLOabpwtqYM4/cQrN8BpVd7EBuy+qw1RX/e571fjG95VxeyFA4ojRwC2VY2XIruUWypLCV3/aeBvGhCQNACCQk9kqFV6idtFdOOWsOkdZYPGIDH3jIxvKPFETbdBAR6WgCx/fqY9KGB3DSQGaIJL6fzyrj5vKxUTFTw5QJYBWz+L7gLSf3majyx7CQXLSzGXSfEyYLg+b6Hr5///kzVnxcjBGHpqyP5QGAv2bqrjKsdqB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zD6NlWlaCteYQ9LOdfXrP0NBCspIFq2DAo7MNm+6Z6Y=;
 b=dsOsj61dXFhCFd9PnB5mOSMF3GLYTT3dYVemWbF+BMUtj4OG9O2tFOdgtlYwKXuxlgv4uaXh5gOXMC4BrGi9YOdxiyFYZqdr4z6FLy0KC8Kk2gB6P8+VUacbOensb4j6o7DunYU/CeK6FOBYOlFgDrC2/7t1f3+QnBDE8cCI4Z/cKJJ4xICIUnsnunIzKGCBz2coaXDXqxLof/ussme86DDVbS/p31j4X3CPPhJfffiUAWoQ44cLNPD5MTSZYQyZzv34z1mWMxpjFIG0AdayW5ZvzGW+iaiXC2WSmKLn0No8LYeQ2dHQiqHQHsxhsoswewscMUQTbSZXgFDkukJ7Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=dolcini.it smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zD6NlWlaCteYQ9LOdfXrP0NBCspIFq2DAo7MNm+6Z6Y=;
 b=DCtHF4jKSO6NyYQwj99aZb+8i6nvaE2HbcS/v3vyWCyb+t7mr+xgig+rx1sijGS1j6kJcDpnR3xxcSuyjFiBoV6KHC9Tt50p8Urg5khctXagh1M0sgEjav1+/yI2n2UK8SGjn1/QwERyd+sLpZokWzDT8YlET7zSxLSCqztV3EE=
Received: from SJ0PR13CA0170.namprd13.prod.outlook.com (2603:10b6:a03:2c7::25)
 by SJ0PR10MB4640.namprd10.prod.outlook.com (2603:10b6:a03:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 15:22:08 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::82) by SJ0PR13CA0170.outlook.office365.com
 (2603:10b6:a03:2c7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Thu,
 11 Jun 2026 15:22:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 15:22:06 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 10:21:53 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 10:21:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 11 Jun 2026 10:21:53 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65BFLofb2134043;
	Thu, 11 Jun 2026 10:21:50 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <praneeth@ti.com>, <vishalm@ti.com>,
	<k-malarvizhi@ti.com>, <francesco@dolcini.it>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH] optee-ftpm: Update commit to include TA panic fix
Date: Thu, 11 Jun 2026 20:51:23 +0530
Message-ID: <20260611152123.2494690-1-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|SJ0PR10MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c6839f-d7ec-4364-b19f-08dec7cd32e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	pF5bCzSiQY0tR8IJrcdml/PyHYxv4q4jzpj2vrtz/RfNyiZkphPc0VTxqm/xu2JHgDU+OEVR3McVICD7nYewkm3rOPkJ4A6k6P2dzTUWZOV/RnidJZ+OOU6Az6P4F7VRCoXjZ6pzDDckGhAMOBR70mw+9rX1ijS1ap7nQ5AnKpczSwq6nrjgkBvwoF8oD/uzLjTmOIQTtRGxlic2Woy01AjyWC18CSWqkcdFAzuT8+Fa0wj9oOleYBZsgI07qlMxhCoo1mJF1imxxaJVWn277F+iO7HI+EsR4eYRwwJCkQ92ZOdw1QqIfP1AGnHRGbjAfMjnWlMLiRbgrDKy3uyY57SY49+Fn/s0g+QLWD+G/GFMvTtwsPJhVmD5Yw3GpJk6phK5AeOG4DYU9rF6TSyy25pQMDnK7D8qFruIOwgMDqjFAnB7IGb9z7+mJDG/nM+OOgFyIzfinqVacIunFzXgtZi54jR0wOee1K51ei+UHPEjPw4A4JnrH1tF+9Bln0NYG2gDZEDHXd1LO2edX6bFKYE9D+6R5SSHDGWvEYbXDdGaaqq8LD/uWd+Uj7bpCZWyxOlL+scbK1nvKNvWtvqPU7caFzKIOeb5nybAitqqocG8rjRKmh5uI1xgjIm6yUQtI/kjSBiTyIv77J0z68tVW6Pdec19em5PBidLukKfsM1pWkieY2xx2Ntj6jaQAoMiTp49dCCcEYqdTPsFTkpdTFu5pYKkBGiQvCOn3okMXE0=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BPfyU6MWeRpLvJXrbrEC9csbGfE9zlgKQZ5OoqMzlrTInI6C7xtIcv0nbW0cwPvZ4minPbQmXXO8Egwi1VgVjTF9apyuWgVdezRTH6ULI0HJD5oKKzDeF4Q68cCChpyFtMqFuRj8wQqmDpUaqxeSDqhs9f+zd8Q+1NryPGaj3LmH7G4Tl1LXeKVl2J6wNBahuw+jXWx/m30dB2AgAYbA5CxnFVGJ6BzZwsJimWNDUtqflhDOTAePQDKBQ3oP0c1pKRI29eWbK3luaalsJqQgPiuzECdsRpon/k92TzCDJD7E/6TYWJBZ3zt+kvPORKj1LvrRyTfZXsFZspCi2TOwfk46BowJO5BMBKY3UihaTr4bv+qr2pnW6zsjxge6J8+E3KZSqt0xbfDUPSYf2sFqf0Qz0e2vCmeF9ceADKvXOFD8o0pTDbwCvwO6sSOSCEZe
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 15:22:06.8302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c6839f-d7ec-4364-b19f-08dec7cd32e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4640
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jun 2026 15:22:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20027

Bump to commit e3b1e426 which includes graceful degradation of fTPM TA
when RPMB storage is unavailable, preventing TA panic and memory dumps.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc b=
/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
index b961c70f..ea40ba27 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
@@ -1,3 +1,3 @@
 PV =3D "4.10.0+git"
 OPTEE_TA_GIT_TAG =3D "${@'branch=3Dmaster' if d.getVar('PV') =3D=3D 'git' =
or d.getVar('PV').endswith('+git') else 'tag=3D%s;nobranch=3D1' % d.getVar(=
'PV')}"
-SRCREV_optee-ta =3D "a09269b15de635e1816fe832e26adfbfb44c5455"
+SRCREV_optee-ta =3D "e3b1e426a605e0537a3c3c9c24228eb22e354b80"
--=20
2.34.1


