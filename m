Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADF7FD45F4
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 21:15:45 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56155.1772054139388139049
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 13:15:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=HwSOYIzU;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.58, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxKKydQUdktMJ9RZA4/ltewkBYn+F9iOQ+25VM434ZaVsUclrHtb5wERewbuCu2shPcXMzmsVTLZ9dcaMngOnmSEYa1p9tCZAJueUz8V8+9AujaChmBOJojYdlklTD9KXgf0IpGDJ1VJPgMQkNQL/2UObNrf0mv01tcGwKxBzK5K0tLNxxNFjWkc8pcpMqxjRh3Ohmd35zq54IRtuOFRVnCmtHIMTKZrQJyV1Y1JaEbfxBTTxo7bEpySfrqGJOsskzVPIzeSoodMXwzGsGygbuXwfz2Ut8M3bNPg64wjKDGHn2Esrgog7rggjs/Zs045e561P7Oa7HJkDOLz025kww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjckTnRVSEQ4K8gVgMKo/yStrVQCtmguU9h3UBVWlQg=;
 b=gNOsgbnehkjDKUUboVp63iPSTHO/w9xdK+Ii6+lXhl9kBCqf1KCnNNo7LqDiSEDDfjXMceOH70hMlnZ+iB03mp1NXX24CGpmIF/clGAGk8riT4xx1S1UgZL5WD9jw4RgNv1iD2RgpTD5pW+pXoFJaIQw0allquFHbZ4u35dNlu3cVOuVlzAS5PE8IpeC5mErGjfWbhOTxfSmzEi93Kf1lgbbAd8v4FBy5d0RRjXzFi1DG4zs6d4sLD43DHrN7o2CXeA0v0H/IEmohftkzCqOjqiE1eMxB5fYPJDL86vUdVJmZOnusuXD9ZA1bXzzznTPpyfCTyeIme3wgZmOXrmrmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjckTnRVSEQ4K8gVgMKo/yStrVQCtmguU9h3UBVWlQg=;
 b=HwSOYIzU8Zazp5mFXtynJ45MVxh1CZGqrTXnH7cwKezMkh8LU1aMvcvbqV01XYED3D07kFTEEC+b7GmIv1U3tcbUh+T4rPt7kBFlBpSvVosuiZOnj8GnR+94OnMGs7jYtkrL/ueE0LyI+5Te22RxZdBgmAkgPze9P+Nvue8cUuY=
Received: from SJ0PR03CA0282.namprd03.prod.outlook.com (2603:10b6:a03:39e::17)
 by MW4PR10MB6324.namprd10.prod.outlook.com (2603:10b6:303:1ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 21:15:36 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::21) by SJ0PR03CA0282.outlook.office365.com
 (2603:10b6:a03:39e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 21:15:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 21:15:35 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 15:15:03 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 15:15:03 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 15:15:03 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PLF3Qj643523;
	Wed, 25 Feb 2026 15:15:03 -0600
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-img-rogue-driver: Support for unified GPU bindings
Date: Wed, 25 Feb 2026 15:15:03 -0600
Message-ID: <20260225211503.3425398-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|MW4PR10MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: f7018721-2f59-47bd-dd4c-08de74b30481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|34070700014|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	RCGh6/6tIqM6AzIW0QGkvhNeycmdbxI9IihLcMD6e7RGH5Qmg2R32IDb5nmxdM/9sjNR+pot0Y5BNfV6IeT0ov0rs+W1e0d4jlOForN3M8zbfAOkFQYGJy2oC/WzDxlla7pQvKQPbVUndu+6Cq6MSX+Xo/vqNntEZC7JdgFbLmdrUXoCGVwgBhI9tBVnUZ+yijmq9vzBv4Sa4jpHQRPWAaJ5UP4hqROZgnMlPt5q0BaE8GSZyFdosc6pfGcTOy2wCY0WzV/TXWcYR16QGLQmq5XKpIBMBicvOo53of3DUA8wrorqDbWSPmLQyIUPIdJYBebQ0bVSMXdo9NV4G95Ngo8WsJo7skjpFFxdOYSzBM0utv4Devev4rBW0OisECGw3qh+vl31dBTBnZMOK55COjhrIqB3PCgRaAG078sT4s3ipK3yLre21GrdsV8wpgiLb1fxwWZrcQX3UvQ37HiNmym7cEZepshm6z/aVtCWbiSAptAlkX6Ugq0NyGnMtWEPzEp2w7p1nKM682ZDt+ojiStqrLBbac/dgARSo/2ubLR6qHGcU4ccpx8Q35y7YYnmXnd02JK/DUQOGtUV0+y3jDZNMl6SQB4R+eRgsNbbMbbXlKOnn7TWbGVg9cUWWnfbM2okWhujrOHwKrjUpHAAnhR10+IG5RAMmfskMEss777TTxkjqEat+nFg7EmpcwjSi6CunzN73eRw5W0dP+F/9MePcHQyJ6g8GjZ5gPkj/jucxaskOQlivu7U8k7oVEqkDtA28rdYJq51+cylpj+lrrU/B1So3RlXpRoxj/cMGD82LrvWaB+HfExnCpCpkMzUatcgu0TjyzwwPBrODtTneg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34070700014)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	S1HF4paqIxjlTCnOxQrGoQG5/2CRG3XWqNQMXuXecvWZgi2T8WveXENDal3oQG+mIULXWrMcKieTlw6ke0KciK+7qvVTDlJNVxrBgYBOBBha60imr06kHXpU2JlDrF+GONSXdqw0kzkHVzUVqbNhJRLLkDD2qglgvDHXQe6oVj7cFGDj62+zme3y4ttwu04+DMMCm+oJv1RGtOZjhp3PTWxt2X1XYi0s5mVoNUZRmPidoARMmifgUWF6sp7xAfXuFWI934C556VANuN7PrXS+oE7IdMTltc+oRJl/0kkxjtehpRNjLaZew0bPJ6sV3sFBzpyoE2AcJN8wLoeIuRVh28Y52sKgU7dymuGLfZ07LmbbBYu5Lj/HV9cPN3m6S9XtQgKXOa6cqwgFOVkjEi88sNoJnGOuGHOfgrLE3d7FDcjaLji5Ei4xN78zmd0RJ+p
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 21:15:35.5432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7018721-2f59-47bd-dd4c-08de74b30481
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6324
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 21:15:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19611

From: Antonios Christidis <a-christidis@ti.com>

New sha brings support for unified GPU bindings.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_25.3.6908880.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25=
.3.6908880.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver=
_25.3.6908880.bb
index ea081651..190417ca 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.3.6908=
880.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.3.6908=
880.bb
@@ -17,7 +17,7 @@ BRANCH =3D "linuxws/scarthgap/k6.18/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
=20
-SRCREV =3D "4fa6d8f63363e4926a0a7e7ef4a317c3d9c0f5b7"
+SRCREV =3D "d241b0d5df404c60b80233bb5116b596039062e6"
=20
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
--=20
2.34.1


