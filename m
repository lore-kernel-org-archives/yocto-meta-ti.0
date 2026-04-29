Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72266CCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:44:57 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.799.1777481093407726790
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 09:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=OuR+eeCb;
 spf=pass (domain: ti.com, ip: 52.101.193.71, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YuweYbUud/CoTQyo0SXlcCPkGZUdJnIfpvXOekvZLUTsbacG1u9wzO0Osjhx93sENZCn27awqyvaEe0EvztNHGWN3ElqyWaAMBnY7Ic72WDnNkXkJ+p+ajRliUwui3osl7zdrX1OOxO0GpNXWpmLmgwjPmJi1xVEeg4w2OeqMXZ2I2G9GJJMeHD7jYt+k7Y0Hcgw0oePwayvoaT5Fwp9n20y6VI+0lllxJSYXqq21i7+OSB7fMJ5h/8SyjvNv3tldvQ4K1/9xuVfLoiJO5vEIN8i+skaTnFN61Cg/lojdTxLvj7ZoizYLBv/Ai6S2X4agZaEheyZ4j+4W8r9wUprRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcs6exayB3ImsY54BoH3un0ByLN6F4jR6dhJ0mgxEP4=;
 b=qRTbDJnJefz3An4PtESCFebpnSQAD+7n9uSsL8aIiMEAW8sQa7V5mKA0ScU8ynuqspOFhouXkDOu4pH6V75BY03poZ+qt0yRd94IdjbUylgviihG4S1WUczn3JS5LFsDlz4CSBVOs3SvlrkfJKEwpAu9tTNXijEExoMqVfKr9DzO63N2W+uftysf8BEKLdiJHwV6cmdDVVot1Qay0MQaFe3kSOey9V1khUmxydXJ9x8btGl0MLkcOgT7lWjTJEcG+o2Jom9TFkvpd91M23Ea3XkhLiGy50XCk+iMbt4+B/6UHtIxQ2my+cEi3zJKuuOBKFaGsgeWR/CjWN9FZKk72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcs6exayB3ImsY54BoH3un0ByLN6F4jR6dhJ0mgxEP4=;
 b=OuR+eeCb1ecF3JHSUo5HMFgGSv2dXb7M2lL1u7ytgOoIIN3xWTmA37rnopyl/Qej7Q5zOoTAbUYh3+a1WOQr/PjDFoOClsvmJ52p7sDoPZJrsU0OBM5oNopHbMyMYypEY/vvTNfklNwGExMBQ/HSJJJQg4OUIme6C7JPlnJPOF8=
Received: from BY5PR17CA0063.namprd17.prod.outlook.com (2603:10b6:a03:167::40)
 by DM4PR10MB6814.namprd10.prod.outlook.com (2603:10b6:8:10a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 16:44:47 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:a03:167:cafe::e4) by BY5PR17CA0063.outlook.office365.com
 (2603:10b6:a03:167::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 16:44:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 16:44:45 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:33 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 11:44:32 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TGiWtd3719616;
	Wed, 29 Apr 2026 11:44:32 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI81Y-00000006oNj-2olL;
	Wed, 29 Apr 2026 11:44:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3 04/12] meta-ti-test: Import the recipes-connectivity recipes
Date: Wed, 29 Apr 2026 11:44:24 -0500
Message-ID: <20260429164432.1623594-4-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164432.1623594-1-reatmon@ti.com>
References: <20260429164432.1623594-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|DM4PR10MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: b1ed6d78-e960-4825-dcb7-08dea60e9ee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|12006099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	jn+RQW1xSzWbij/XT/hqQx/tty74HNXVwkyDGX/TjjcS3jhzxzje/vrVaahee/fQknBOnzE4IIif4rUkkTM6t03NZVoFhY5TylOxVXmnbzaM0hjg9dTIVQyXEJoMTBcZQivt25f+YZlbEz0GGIBVz9jI4sDKNjixt/H89zEv+i9ztpfuvGITml5jofI7foqSArxPWBmvIRADERklFxfKNvi5DsvceeLoiqmlKdWhJpRhuDZ7LfB4R3hU337hSefwY1YhEVphiHqAyGKqQIBoj4Xmm5Q6BfE7cul9ylQSQfhkR/MbYCa64iVLnFrPCrw/aXiHttTivuukGUaszJ2ETgQd1aHlS721CfHaU6wzX7Kl1jtH8pYsuhXqI1RtMqMqdvldVyqbygsqgFYgBjrLMuwhAUSceu+X9+KclQLJ6NxD7WDIWWpATZ/10kxh6vnozmG5UTE/r00APWl4WdPrW4lK5E2QSMMuq99hWHx3BtezLLIpDSUyw+XYrXYwneonwAsC2vxvaqFKrn3RFv44DHHei1iYnsFLk78wgHmvQR/rU/PZgprntREXAfnNbbrIwao4D/h5DSShgZfncTYGJtWn0tmTZUDYO0q+t6vNW2PfKSWV0vbmhWNj50d0uvv7vg87+k6j8xDaj9ukh1kWu/MLGOGkHGYfpMWUxoHZUp3na/lQOQfbBvdj7L6zp1Ix1ZzlPAgcr1kwXCJCJgbeBQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(12006099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TSlDdIQxSV0VXZ+3196ydDN/G8UxLzvkBu9XVSj5tq1e0K3PrtBnehdPGVp2yfDvCuz4iJ/PvoNjFKUDTretApImvajZMcUdHLSHL7mnu2F9UdLOrjmiuthExi41zDHhtYcQvDAGzg6/WjZEEqOoPD6EzoICDucBRGEgrwgToxJprfvXXWmAL0D2XqD7UaJ/DH+reXFqT04MlOg1F46d8bjDVYNgpIbMJ9WZ5Bc82l390CybWE21lP1X/bunsYje3qeFPTLwa63wfkefDU18CAMYQfC0ceerAA/j9pxYTHG5LT+1riaLrfMu1JSvDZh1KGfxgRrYdn1eCDu1REWLs8/xvQruCRUBWeHD+XfDg+H8VOJRHcaRokZv5s4Kgr6CnkNvObzIRXqHImbYKYLxLExLwR5hXIauEuWvABQlRV1zkZdzfbbr6NC80BPoDeof
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:44:45.7659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ed6d78-e960-4825-dcb7-08dea60e9ee7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6814
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 16:44:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19914

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-connectivity.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: No changes.
v2: No changes.

 .../openntpd/openntpd_6.8p1.bb                | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8=
p1.bb

diff --git a/meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb b=
/meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
new file mode 100644
index 00000000..6a3c64d1
--- /dev/null
+++ b/meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "OpenNTPD is an implementation of the Network Time Protocol."
+DESCRIPTION =3D "OpenNTPD is a FREE, easy to use implementation of the Net=
work Time Protocol."
+HOMEPAGE =3D "http://www.openntpd.org/"
+SECTION =3D "console/network"
+LICENSE =3D "BSD-3-Clause & ISC"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfe922aad2b6ad1c359cf2adfdaaab1b=
6"
+
+PR =3D "r0"
+
+SRC_URI =3D "https://cdn.openbsd.org/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
+SRC_URI[md5sum] =3D "7c68ce2627b2ea13f2b95db1ef4fcfc5"
+SRC_URI[sha256sum] =3D "8582db838a399153d4a17f2a76518b638cc3020f58028575bf=
54127518f55a46"
+
+inherit autotools
+
+LDFLAGS +=3D "-lrt"
+EXTRA_OECONF +=3D "LDFLAGS=3D"${LDFLAGS}" CFLAGS=3D"${CFLAGS}"\
+                 --with-privsep-user=3Droot"
+
+do_install:append() {
+    # don't install empty /var/run and /run to avoid conflict with base-fi=
les
+    rm -rf ${D}${localstatedir}/run
+    rm -rf ${D}/run
+}
--=20
2.43.0


