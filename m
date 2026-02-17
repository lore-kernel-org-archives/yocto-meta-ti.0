Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139BEE909D2
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 16:10:48 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15615.1771344646116022893
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 08:10:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=xiFe6lZw;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.35, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTE/l8YBnkIKyMwAPi6ZvxDaGJJ9iK2+uy/911kmWnAvt2Pznh0Kqxkz+T5WTG0FeXnoh6FhCFGyjM9jQRRscUs56LTdhCFXPPjFW+wR1GHNKH1ZqCXQ6NDLjgb9rmhSJ+yElrEyfG6Fx6ViuUxgUrSZ7i0rk5s4nJEG3CVew/zgj69+obM04EdKk8TBens4ErQrsZY9IWmKKlNzKSoZJQOJ39Lv0L8FlkNs8BPk+jPl+b0/UKCE3bgUdX9JcgDbT6ccjgbG9R/sbqfWGqxT8FdUi+hd1RzZQxeyHWEpDvUKC8L5d6SUMXmyF0UsN/Els49kJv1/Mxn9BNB85LuX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJoNJBlKfvVrtMoD2qUBvs3ONm3g/1iKpSN2yp/pg1Y=;
 b=AnvmUQsibBmvLmp0GDHxjTlvq1wMCnF48ykBJE+sZx/yGSmXt4fffQVxbIZoOq6LW3N7avRj03ADMvhJgM5pU17HYICsh8fysp0YnLKVi79Ha9EANvdtVwWzdHzFkKtsV30Rltc3uusPmlEqxUQcNbau3CWAgPHY8TYkBqb7gr6ec025o4P70BtnRXRBs9bvcLEpN4Tqji3uX+UpQNYZ47M+W/e0Zdnonb97+a2Oyh+6YozZFm/7Cv0V07d6KF9lZf6XVh+AuAaimySNYFyls8hgQgL2tqXKyn7ODiRNwJHYgZSssVsbj3UUVKrdFdy/FlrTAY6DrgnLK5RbKBGNww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJoNJBlKfvVrtMoD2qUBvs3ONm3g/1iKpSN2yp/pg1Y=;
 b=xiFe6lZwY7MIULuUGI5KCXKH/0eQtOdaDEB/y/FewSvwK05w4/ASAoD+n/T9TqBg4+LanNAvyN5bjC5USepMmIQLjaw2GYNfQ36o0umM09g8j5Zs5Dcq0FLfdmfUo9Dn8C8073lmxjHRDvH/yRVvElpck7AcXHilybD9R8uGoWc=
Received: from PH7PR17CA0070.namprd17.prod.outlook.com (2603:10b6:510:325::10)
 by DS4PR10MB997671.namprd10.prod.outlook.com (2603:10b6:8:317::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 16:10:43 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:325:cafe::47) by PH7PR17CA0070.outlook.office365.com
 (2603:10b6:510:325::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 16:10:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 16:10:42 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 10:10:41 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 10:10:41 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 10:10:41 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HGAft63129397;
	Tue, 17 Feb 2026 10:10:41 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vsNer-00000003IaZ-1pBd;
	Tue, 17 Feb 2026 10:10:41 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] ti-core-initramfs: Change assignment of IMAGE_BOOT_FILES
Date: Tue, 17 Feb 2026 10:10:41 -0600
Message-ID: <20260217161041.786432-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|DS4PR10MB997671:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de6b36e-93bb-4c79-c69f-08de6e3f19a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BE6jrl2r4ywEGHkjh+B33mlPhIaCIQH413ZmLTW0WIzsLEBB2wPLB/hRE/5U?=
 =?us-ascii?Q?NUN7sPsOuylmoZ1pFcBntClW7+15wBzYeV9aLyeaVOspX2dqNioAqOV8yECP?=
 =?us-ascii?Q?JMJWF2wgji+k6+XmUZ/QdEqJwmvxwGgOcMW6LalreJJxDHQ6HQIPWeydWIUP?=
 =?us-ascii?Q?FLUVtCGakoyT/BcsZo8BpOHIVcPjkp2MygIzbK2so6A3CHqYQdgppBXEPtqP?=
 =?us-ascii?Q?8Ee3b+6mcgGDN3fZ4znxoS1Cx7PDulhOBp4v4lvQo9ZU1YYx37lnPiVD6VwP?=
 =?us-ascii?Q?RDHxp4Er6txp7XAt+Z4dXNw/+vAcBGQo+Rw+wU8VcssSQLHku+AW7zVZHWLH?=
 =?us-ascii?Q?cONUF8D612/wBbrQM02uz3XVeNRt4m/WjWN66v4S/lO18SYvrNIB7Npe9U2z?=
 =?us-ascii?Q?c3xs23shGXHU+Jve/nLSCxOM7ESdoDm/otDAwI/jjLPbRNTuJjkR6jgdzly6?=
 =?us-ascii?Q?upgUgwjjsAKjUC+a4PMBQuG/GkYq36jVuWLR2tis3vj6sg9XUlJDQYVDVKig?=
 =?us-ascii?Q?XeW/4IxxTiIfDCIMyTPPLRlaCzcD+J8MhO95sfLxrK9v2XD7sI/Ix/hHwe5M?=
 =?us-ascii?Q?gUgI/febEgxkdAyTl9zz/3mfUnGNgkKX5pCyw3kqmxOfTt2SnrGwuVuSa2wJ?=
 =?us-ascii?Q?RmOyWtKdsgszgrHuJQztKdH5s/IqrrwqnnviIPHAtEkcFGyNo9vgiVBOdC0U?=
 =?us-ascii?Q?YNI9i0ya817uZRn9Lqeo2Gjptj5NG9a/FQlP8vFMRD04qgRxbB1pWBzU58dx?=
 =?us-ascii?Q?epYczKILS7IDh6oUH0wuB3HFVXDCLVHoR616ITNClCyk13FlDkP3/PG4Tt0j?=
 =?us-ascii?Q?1a+N0HewzbtcWw/xRVolovTjBZyqPN7TzhZUZxYf+nx/4gIvaYBkHLMZxnjG?=
 =?us-ascii?Q?GDn6RjqUHegMXejLU7D1j8WsnTfx2NcDi6WwvY19HbtPmVo80RLW00FZzC+5?=
 =?us-ascii?Q?xT+VuYYrFkB9MPZMWE2ByQHWbzV8cWxhzUkgKLaU4g8blG28gxNAC3j+TPXF?=
 =?us-ascii?Q?zELgYCM0usx1p2AkwBGqHgHYOX6EnY94GAYgddD3U6gE2kwMX/w3aCDEd1I/?=
 =?us-ascii?Q?/GKD/yREDITOcHysa0G/V9pojSO/I+E9hjEnPo5VG1Yt4R9xilfH76lTroBL?=
 =?us-ascii?Q?miJJaIYCugo4bsj7ZYMZObDyd1aClkO65E04hVjKi7EFctr+S40qpSDuWMI2?=
 =?us-ascii?Q?xS/JjktMWTusWxnviUX3467nr9e4NJv7EWXu2pJ09NNg5fW2uUGfVeFiTZY+?=
 =?us-ascii?Q?JowWbTcTSjTlgMEWiKJm+nox8eVevaYqhaT2978b+dm2IT5A6G4rWGWQfZ5E?=
 =?us-ascii?Q?zZpBEM9VCDm8tPcxur08DCJvHmuokbMwhcF1/wMn/oHVaKFn8t3N6HuBDjtZ?=
 =?us-ascii?Q?zr0nOEEdbcIPmMMLbo7Ps4BZ7zh7cQafTth6vf5e0th7d4W/3tlVdEigmPwT?=
 =?us-ascii?Q?9Q9t+uxx4KuDjvwVAFAdwaKUqT2hBqoDcvDRZ5hRjKWh49dlJqVqvKTLYcPg?=
 =?us-ascii?Q?w8NvZy3VjZg+kJHYQ6A57GqfCXmmlbcsEq0wr2sno34R20+Abhm4lGmshdH6?=
 =?us-ascii?Q?R5ZYKLRqKLb8I77QlUXhZ2S8D+3kphYk9vqaQ3v6PxPcS1w2zchLsrhhxGW4?=
 =?us-ascii?Q?7p/SbHZlt/qcxGuqxcox7LJFhg3BJ9s0B3J0apNRtQ/kq2d8Ypr5vqAMbhxd?=
 =?us-ascii?Q?FWIHtA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NhM7/Py8jgZgPwS+vg/W8W4GzIBmecg7i3AGPzZlKVopCMl2LdHlmcP0UeYzU9Lrg0wN7Yoe+io2P/6m+ll4cO1CdQ0fvzFsKZRvrs3ZDhaS9zaJ4VGjN4dBLj8mu9zQGCVNoh24B9thaQiR4vrbU2eLso+aJ523+J9poUeKfmERs7e8Q3w4swMMpeb0hykO+xg6KvmaPbqbVhGVohFh7V+LcCIjJRK/5o+xnPmY4LbnCQljG6i6RklgnYFUfP8z4GCoFwx1d1mn1vYGlZ67xf/hxTWhLsGi+3gX8oqNHbd8ieJVNbRRzKh17uxft1YPppQREU82mzADiLcAZBMObKAaBKZJJZ9gW774bF3XCpAdP6UWvmy+0/LOfHwPEqJ9op24LUrRMjTxZzbob+VR/4X695rP0ixQIwsNzvzvmWjtqFP76oW3ufwEDbsKgmq+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:10:42.4628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de6b36e-93bb-4c79-c69f-08de6e3f19a4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997671
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 16:10:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19524

The +=3D setting was overriding the weak ?=3D assignment of IMAGE_BOOT_FILE=
S
in k3.inc.  This resulted in nothing going into the boot partition of the
wic image.  Change to :append to force this to occur after all other
settings of IMAGE_BOOT_FILES in the conf files have processed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix spelling error in commit message.

 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-=
ti-bsp/conf/machine/include/ti-core-initramfs.inc
index 9d3cc612..475234a1 100644
--- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
@@ -20,4 +20,4 @@ do_image_wic[depends] +=3D "${@ '${TI_CORE_INITRAMFS_IMAG=
E}:do_image_complete' if
=20
 TI_WKS_INITRAMFS ?=3D "${@ ',initrd=3D${TI_CORE_INITRAMFS_IMAGE_FILE}' if =
d.getVar('TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
=20
-IMAGE_BOOT_FILES +=3D "${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('=
TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
+IMAGE_BOOT_FILES:append =3D " ${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.g=
etVar('TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
--=20
2.43.0


