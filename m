Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DB2CCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:09:28 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13572.1777475367004421734
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=L15884x3;
 spf=pass (domain: ti.com, ip: 40.93.195.5, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkL11kmynnWwUweLpTY1jdcxHbOZeJUBScH3ULOAOy1onlH0s/hKAkXMqQ9npQdv8zlKcSlR/I3mMW0eh2wVJa14MFH5kTasE2kze1deOKLSZ1kJAjJEO9cjW5yGqUzdRW+D4vv7zY9tcqkklvC6U0nCHGOsOtlPxMH3O91WCeo12NFbnzO3krOPD0QAlsUqwR2XkCb5Eh8N+BuLgWrajorMsiJJQ1SNOZQxMBj8L5rMhXw4aoHgdNggdB2AaCFYLNY2+laxGxD95cxUgOHur+l8k4jWvn9/TEH7h/5GNDiIOZ4Tl8mO9Z6T6zHih43TODunR+9D/FHbEIR3OnBj9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQjADDtXx/F3PhTO7YJ2Cpu8V9jUW4q20ASKFA5PTn0=;
 b=wxnTIMVdSQA+cKM5WWq4h8nL6vLr3M6hXKC1kvxkurYPZWul871g1+fsZ4oIJh7Z+AJRYcRNihKkxSoH1ZCCJy6anvdqXgJaO6xklO2EcbGHV5JOAuVlegbvwx18yw0ZN++Qg1yKz41zRD77vuVoyj8EEFrN2k76zKUSocJdtZcguS/eClOd3zrFKX1vXVQSVShYBdijwa/oS7o+lbr/KZP5gVRWjkmZHqU0ZvYb6MCh+kEU1wNudVb1QU6Max9kHIYICIZZkBPp/cqY/0+vPjIQbYV4c3/JmgypP9OmESMGmSHv0TWb/WBHA8VYqQZ36tAFLZDAp+qUMlcqkVJXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQjADDtXx/F3PhTO7YJ2Cpu8V9jUW4q20ASKFA5PTn0=;
 b=L15884x3xbdHBL7sIO/rbtpl+QFnfB6MqS0RKUja4CkYfuvLP+gpH/Ebmt3bU3ldk4kXzAYIN5ELRkq12CIaZAMu9BsYUNr45DkpUdVeqiL2uChKoJmV68v71LgGNkxDlovwME2dxrYJCWRzYr3qwVenitOk0RRJ5CpX2GLZBCI=
Received: from BLAPR03CA0052.namprd03.prod.outlook.com (2603:10b6:208:32d::27)
 by EAYPR10MB997900.namprd10.prod.outlook.com (2603:10b6:303:2d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 15:09:24 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:208:32d:cafe::63) by BLAPR03CA0052.outlook.office365.com
 (2603:10b6:208:32d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Wed,
 29 Apr 2026 15:09:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Wed, 29 Apr 2026 15:09:23 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:09:20 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TF9Kjr3333893;
	Wed, 29 Apr 2026 10:09:20 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6XQ-000000046Uy-196i;
	Wed, 29 Apr 2026 10:09:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 01/12] meta-ti-test: Create layout for new layer
Date: Wed, 29 Apr 2026 10:09:09 -0500
Message-ID: <20260429150920.978263-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|EAYPR10MB997900:EE_
X-MS-Office365-Filtering-Correlation-Id: b087514d-d3ae-4a05-7bc7-08dea6014c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	CrxY5LK+sps16J79HARYTOiYbxiU4zZeSOarp9m1v07bfYrMf0kNsxVmlwT/dr6XHP3pCyk8x8viUpfLGroLRIZhj1DQn/uhWp5xZbLU+P+fyzU/zGBXTLamJO/P+8u6ALG6fJxiwq6P1NuQ7tof/evgzrKtLXs5LOsVvKpEe9gl0XNYzGW9X+G2OkK1hTlX6EkhEGv6ikxEmk/AKWbjWwMLl5TvdqWBdT8fcKWFuvRUx4k8orM4jGRSYABEtRHqlK6Cl7qZDfnlPJ9XCw8hHVBsoLrDhXtdLp8oYktlPYQ+n5Rwis1IYjeJBEJQoJcHsXFGrGv2B7xqt1jqZxKISn41SynflQDhGhMSNLGPDQ3FsvrgroKZaoIku6ivoHS9GRzMk30LocNIJ5P4fhK+XV4KT+bdpHvAC+BnKiYOSOd1dqNU2S30wRLszpJ4GFZ4pZAKSR9LZ3hjrJ4fjeysxGl41BKP/IrPZ9s70SwQPvc6WirVYNx936BPSLXlGUS8cS+5gCYEp0Ss8BAiS7vcSHzxMBwRH/knDON6sso5ocVtKDwq078kB5m1rFeacJlp8BntvJ1z3LQI79g6lMKJRcuLW8Efa/6Oqi8yFyUK1FvFcWXwAiC8VHsZvNbYbBmlHm2Y3nO7RcMd1NtDpZJI07cR1iIjyVigTfF2BT2nN8rlnmfGNfLTwr0vnOs+LYoi
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LTPWNTHeOUIb4XwjYKfze29K1Ab+nm3dLMPPdz/loi9GYxbeHbK64JzyExMh4BNngjTprUBq4L7ZbJsHfrg0RRRhYCpqdjSqdXxWPxAL4ht4FCTbbASL7QBzBCnwtbPVStYqxKHJdGCQZ+fRBhvB2NLPrL6/857fsumqqEvTYWVon3vIZWw8IWG3nMepIvnseXobTo1ZZG9cuZyuUPRq4OqCEO4gfZ1yR/y74yimEFVEao/i+3MdugL+0PlCo1x4Jn7cdF1+J/pE4bm/dQt5xO/N1YWKru4vD+QFawXOZBoOeAblGuc+GtsYByEmaerlxPbTp9Kk/YRedNFftgVyDOOnwNbIXhpo2Bf/hNBHmgR6EeWg4cgOwwnv81rkrlbhlxozMUfS0a0lDm4M8VXZ7PyorM1nhHP3vf6aZX7+n4u4ftptYW1CQ5YZrnnJRHvu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:09:23.5845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b087514d-d3ae-4a05-7bc7-08dea6014c38
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR10MB997900
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:09:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19882

We are moving the meta-arago-test layer to meta-ti-test.  This is the
first commit that creates the layer directory structure.  Follow on
patches will import all of the various recipes.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
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


