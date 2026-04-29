Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A600ECD13D3
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:23:33 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13930.1777476206330108951
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=MgivBSkM;
 spf=pass (domain: ti.com, ip: 40.93.198.66, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+pHzgPW6QCBg8Y1JyXRKtP3SDpUvy254RLnw/1rMCHVBmvLFXy+vnkYG5OkFJAUucrAUdv2Hh7yeGK9g2FX/CoHY1HR0pbCNe2yBvui2DBPz1wZxjcokGXHEGwvJtWx5dIvnMUSdF1AIRMChgKCZlWhdjnfpG65y/MecCruztJmN6bgGyfHkLgR8RDeE2ALrC+5/9AN2m35eyBdF8uo3YxkofUefzRogEpSspGK0xdCYyAFdnoUVqUtJp9FjNWGaIvdnjHmi4/DVpSf62gYDaSEMilavzEUFLfkYxK7kzc1n1ZlzVPCauBHu1mhkPjq0fTYXH7+vQhWG4W055PUqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXgDyUrwjV9hTprYFmOghwlmGScQETuGGwdBt1rxspo=;
 b=BlHPzAizo2nU1LeEb93YLVHGMshnxkpyreoT3n8Ov2ABR+YYZzmFmaLMXVPK/M4kY8wrsiULvnO+BY647lWZuV/3hu4cDrmVzT8xwaj2gSchwsfpKbYjQmGbnufdBRi2nPfCesot5h3izxMRfJgrWQRtckUK7ZAXwCtEUujjO4qxw7a7bhT3wY5nkEU7UUEM0I7WIHueVe1zl6QCLedNcFinxKmoD3SL1D1iGisbUkiuK1/RBvVaUczzpEERdRnS2RxQJxLZRZOWdHOeV37im6FaO5g6kvPTTpaG2Z+n2pNg2mG4W01MB0+sP2fh/TSz/JVRmhhG4oIoicWJx1Jwmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXgDyUrwjV9hTprYFmOghwlmGScQETuGGwdBt1rxspo=;
 b=MgivBSkMCMgjsd6PlgA8sHKx3t1SN0ZknAKR3suHlxvTZmW4KPf3ETV1VPUMI+Qxyi7l9lytDRoVInIeyj7cTU+4/URc2U3MOvemzMIcWgZRoaMCmwYBIfznB4Krjvaq0rmIpexxfyGI5uoGygq2GJ5RSg1QfV5NZogPT6tz3u8=
Received: from SJ0PR03CA0385.namprd03.prod.outlook.com (2603:10b6:a03:3a1::30)
 by PH3PPF7B51A0F8B.namprd10.prod.outlook.com (2603:10b6:518:1::7ad) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 15:23:22 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::49) by SJ0PR03CA0385.outlook.office365.com
 (2603:10b6:a03:3a1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 15:23:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Wed, 29 Apr 2026 15:23:21 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:23:00 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TFN0Mk3353810;
	Wed, 29 Apr 2026 10:23:00 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6ke-000000046ru-26Ku;
	Wed, 29 Apr 2026 10:23:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 01/12] meta-ti-test: Create layout for new layer
Date: Wed, 29 Apr 2026 10:22:49 -0500
Message-ID: <20260429152300.979685-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|PH3PPF7B51A0F8B:EE_
X-MS-Office365-Filtering-Correlation-Id: d21616cd-bd41-4d6d-83a8-08dea6033f8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	M6BuqQ2KmJbhgclr+Y/213gXkRjHDOF3M2A4GnIGkbb7RX2o13Wl/h32sHRxUWUWRbaybDbII3rvoQxHaUmfeTrBAytKOTKbcgIA3zq+qyddERcjTaPEv1LHE2L5Ef49pjJ64Rl8f6inX2gOEttTACg9/fi36h68f7T1w/DfPq5SQmSsiY7DGpLjP7/kEdEMHF8un5NHWEuE0YAFiWbyOqNF0ymMxMN0X7NMrsc4Etlcl6GDPHt0lqUDXOxoQODWKPG1rZjkmGybMxbTW2AzbyiUcoAYclOjqektkrAo9TcbfjtrHpsr7y98zlTUkNBngWZx8C/lwwG0U8cut/cAzQo2e/smIo670HCf0qsOh/HshQ4GLEhxU0ydeDQlln9HzT8HWqex2dAJh48lvF9cxbjzrqUv7lO4Axe+SJpr7ddW/oLfNFyGUUTiGT+2g8TC1q1BcrZU1K3Mck89FNPVFyYeISWbcQ4F7/EYY+4GJqBGaQaT+4s8dB8Pkq4g7+TTGLF1uQawEW5P5oDrWNkYuyqofEK3y0TcIePRP3jcqJv6+UXQdmldOg9bXkTBFojQNV4qkNSNVZtLMHGGdlSG3J4NNL3s3kWeLf9wqLc2gVuMDl6/WUtl4CtkqsCH85B3oMQjWJHDGjBIyTgPkp73KfQBEZp0pqHhNuvS4YkgRESJB3RMqHVDK8JYF21SqJ1t7zMxZJcYrPcszbVPFHy8eA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Wk1xgX0Z3OKrvhKJYKDE49APqDc8VhXtMm0Y0LNxdmhIS1ESDkGvTD48/G5L4R+HmxGa4yB6RJyOhzY9zdKV6FnNN6aD5yYGITcFQgw3lkZ7UMlQg+ym2h3xgj9yyAFWrPhxuOWnsJGChpgYo8BFSKIO8ToqxtwJVjS53S3DIsnytx424uT/yRHpiKapf93vfs9KxssRgah4ADlVMf5ID4ISRPhpYYHWjSn8e1nrW7TfztN6isnc+dMkIifyBVYMBM4RHuCjvDb7NxgXCpsw1uhmVZ3TQdUQ0jJvIXWerWZapuZQbfd5Oaj73R+5Pq4uARj8MV27WHtQb8ouf6xM+oFXshm2JQJg8a8sms6ymjm2iT4IxU/4yelAnJ/V5ZRYdv3kz0OalF3C4mwhd+Lm/Vyj0WDmuPEW4wWfUdrDP2HMkrQxIWI4Rm6m3kSlqJzf
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:23:21.3245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d21616cd-bd41-4d6d-83a8-08dea6033f8e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF7B51A0F8B
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:23:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19899

We are moving the meta-arago-test layer to meta-ti-test.  This is the
first commit that creates the layer directory structure.  Follow on
patches will import all of the various recipes.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: No changes.

 {meta-beagle =3D> meta-ti-test}/COPYING.MIT |  0
 meta-ti-test/README                       | 34 +++++++++++++++++++++++
 {meta-beagle =3D> meta-ti-test}/SECURITY    |  0
 meta-ti-test/conf/layer.conf              | 32 +++++++++++++++++++++
 4 files changed, 66 insertions(+)
 copy {meta-beagle =3D> meta-ti-test}/COPYING.MIT (100%)
 create mode 100644 meta-ti-test/README
 copy {meta-beagle =3D> meta-ti-test}/SECURITY (100%)
 create mode 100644 meta-ti-test/conf/layer.conf

diff --git a/meta-beagle/COPYING.MIT b/meta-ti-test/COPYING.MIT
similarity index 100%
copy from meta-beagle/COPYING.MIT
copy to meta-ti-test/COPYING.MIT
diff --git a/meta-ti-test/README b/meta-ti-test/README
new file mode 100644
index 00000000..e3a41e79
--- /dev/null
+++ b/meta-ti-test/README
@@ -0,0 +1,34 @@
+meta-ti-test provides an additional packagegroup ti-test and some of the r=
ecipes that go into that group
+
+This layer works with the latest Yocto Project release (currently 2.2+) an=
d tracks
+the stable/maintenance branches (currently "master") of the corresponding =
layers:
+
+URI: git://git.openembedded.org/openembedded-core
+branch: master
+revision: HEAD
+layers: meta
+
+URI: git://git.yoctoproject.org/meta-ti
+branch: master
+revision: HEAD
+layers: meta-ti-bsp, meta-ti-extras
+
+URI: git://git.yoctoproject.org/meta-arm
+branch: master
+revision: HEAD
+layers: meta-arm, meta-arm-toolchain
+
+URI: git://git.openembedded.org/meta-openembedded
+branch: master
+revision: HEAD
+layers: meta-oe, meta-networking, meta-python
+
+Send pull requests, patches, comments or questions to:
+meta-ti@lists.yoctoproject.org
+
+Please note - meta-ti mailing list requires subscription for posting:
+https://lists.yoctoproject.org/g/meta-ti
+
+Layer maintainers:
+Ryan Eatmon <reatmon@ti.com>
+Denys Dmytriyenko <denys@konsulko.com>
diff --git a/meta-beagle/SECURITY b/meta-ti-test/SECURITY
similarity index 100%
copy from meta-beagle/SECURITY
copy to meta-ti-test/SECURITY
diff --git a/meta-ti-test/conf/layer.conf b/meta-ti-test/conf/layer.conf
new file mode 100644
index 00000000..1997f0b4
--- /dev/null
+++ b/meta-ti-test/conf/layer.conf
@@ -0,0 +1,32 @@
+# We have a conf and classes directory, append to BBPATH
+BBPATH .=3D ":${LAYERDIR}"
+
+# We have a recipes directory, add to BBFILES
+BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappen=
d"
+
+BBFILE_COLLECTIONS +=3D "meta-ti-test"
+BBFILE_PATTERN_meta-ti-test :=3D "^${LAYERDIR}/"
+BBFILE_PRIORITY_meta-ti-test =3D "10"
+
+LAYERSERIES_COMPAT_meta-ti-test =3D "whinlatter wrynose"
+
+# Set a variable to get to the top of the metadata location
+TITESTBASE :=3D '${@os.path.normpath("${LAYERDIR}/")}'
+
+LICENSE_PATH +=3D "${LAYERDIR}/licenses"
+
+LAYERDEPENDS_meta-ti-test =3D " \
+    core \
+    openembedded-layer \
+    networking-layer \
+    filesystems-layer \
+    meta-python \
+"
+
+BBFILES_DYNAMIC +=3D " \
+"
+
+# Codecs in ffmpeg with questionable patent status are not included by
+# default.  As this entire layer is purely optional for testing purposes o=
nly
+# and not meant to be shipped, add support for the ffmpeg commercial licen=
se.
+LICENSE_FLAGS_ACCEPTED:append:ti-soc =3D " commercial_ffmpeg"
--=20
2.43.0


