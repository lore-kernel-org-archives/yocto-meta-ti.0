Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE658D43344
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 20:22:52 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127.1765484562009983331
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 12:22:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=F8kkoIaS;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.61, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVSHYC1m70yNe7Z3uBslZQe7mOaqN9dJkgcBygJvCKmgZ8KrEZ/WTGABHDQ2z7uNQg9nGG5Im7KkF9y21QLHfU5VoLyx8/2CLWb0eR0QM3jYLEGbdbGstklYZiSSL+C+WwkPKnVt+O0QQAuoKkLZejCrTUisjg+KAOXXHpR2sr+C+lb44CZogyfmUQnK1F+xM4tOnJyF2nSwCWm6od3glsAnUmy2RkNATlyuUyDw0Cdp7keC4rfICkg3YeaKyFXS5lFBYyPRPxAoRjB8JzhAHRw/1hqrGcUNY6TshdASo4u+NtRsuRVIBC6sg4KaUSRvH1pnELJRg4ptseX/Bw7e8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9NNF89GqTpZ2FZtBlTuCaw6gvJC+5Pk5zKfmNv0IUk=;
 b=NXzMLBtoIprEbOEa7yZjqwsTcy1ZCPnYADb2qvSWq0kybsriSJk7aHEsg1wI6hGRjI6vKfpebLG4VIHy9kOxFJkZBqZKTr0Hi1/2VgqnkNcXIHEl7Vx1gdpRh7xx6X2GnB+LkIjj8qRx7WXXEahJ9x6iVXdtg7QoRzio7O33Di3KqEEDbCniForIBO6nztW43ar3nBOHsF0VBZEAmaV9ePBsfShnT8DKWnbXLOCqr6H6NaIvjtg1nSEFNVIWX91bCvbiQEhRZPmBfV2vl9LcWupKoQQEiHMtK6EwPN/HiDjsU8rfxrNHV83tj7EMh8rtmsl8fYFCFKy5guV2pYtKcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9NNF89GqTpZ2FZtBlTuCaw6gvJC+5Pk5zKfmNv0IUk=;
 b=F8kkoIaS4wXdUb7deeGCpGJYF3L4eeBTawytC3DZDwrQClKEYnnrQDKjF+s2k53XDUOZDydy1tXnotNdTWKna/GIP1HMxLB37VCjGEeFAnQm8/57eEe1tWXwr+nZE9JJo9lfaJHCIYZj5Rp+MaNTYm2c1EZ9XFwbomd4gvpjedM=
Received: from DS7PR03CA0068.namprd03.prod.outlook.com (2603:10b6:5:3bb::13)
 by SA1PR10MB6613.namprd10.prod.outlook.com (2603:10b6:806:2be::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 20:22:40 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:5:3bb:cafe::8a) by DS7PR03CA0068.outlook.office365.com
 (2603:10b6:5:3bb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Thu,
 11 Dec 2025 20:22:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 20:22:39 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:22:34 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:22:34 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 14:22:34 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BBKMYQr1060502;
	Thu, 11 Dec 2025 14:22:34 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vTnBK-0000000H3Kl-0t92;
	Thu, 11 Dec 2025 14:22:34 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 5/5] gdbserverproxy-module-drv: Add support for kernel 6.15+
Date: Thu, 11 Dec 2025 14:22:34 -0600
Message-ID: <20251211202234.4064350-5-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211202234.4064350-1-reatmon@ti.com>
References: <20251211202234.4064350-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|SA1PR10MB6613:EE_
X-MS-Office365-Filtering-Correlation-Id: de732639-34d1-49b5-8300-08de38f30815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yQ/5usciBLsoKNSYcqTKi+I+u2l+/abClXYfSSQeLF+OAYVKYpnAfVbz5O9g?=
 =?us-ascii?Q?mSlipA5mMsC7rZT1mkvuELCIiLPpjNXEtKvzYViHaKfwtrdEfpu9xVWPq93E?=
 =?us-ascii?Q?TvzN7znE8VIBYe030VlFi2tgzG+0oP3KFNkPZ8n86Kxtjsl7emC/7ZvXBFR2?=
 =?us-ascii?Q?tQRb2jxQRilHG2NDVk3q1QAZS9sJa04JwzVGbJw97wCClMAQWdj4JiKs7jc/?=
 =?us-ascii?Q?ipiubkxvHlOzgRLTVLTAvuKDpNzWg7XwXroAYGdRyTUjnErTLjwFmMffIHUG?=
 =?us-ascii?Q?sPRor5+5CjbiVl+v7sKwfKvwT4+L5zHPWohdvYpqczbcV9AerVZ/IahMDgcT?=
 =?us-ascii?Q?wBR7TDFXY794K68j/6cdO2wSG7Dx5amSwed1uk3jEOilDVi0VcK9VKdEWEGQ?=
 =?us-ascii?Q?76C7m4o8IjPYej5xoLIYHmdBSPfLWb2KU0koVdwYjO+cboMv7Rnty+hsXYMX?=
 =?us-ascii?Q?3s+IjE4eotoCTTbkzuZjR+8bQiH8QhVsdYJpX6QwpPo/FEK/wTBtWb3g7OXE?=
 =?us-ascii?Q?gQTiVuOFDLXiALM6Jb0/QdDinoKAg4K0H0Me9Qer7ghiTBBjEg8/GFt1eLWQ?=
 =?us-ascii?Q?CmTvA8drpKN2JO/o7uD4BiEjak3re7yyJ8hM4ECdYwTP0e+AYC3HzINsEaiJ?=
 =?us-ascii?Q?7hxhXkan3g9gWCyA2oXIKS9tbI38DbjGOlcbFIFzhF7GdZDZMUrT0wIU1S0v?=
 =?us-ascii?Q?eRHxpqh+NMsLJOeZyVHdQrcQYrLM/KuDzh6Zlm9JaxB/qmqIOoSiHTJAZ6A1?=
 =?us-ascii?Q?8UlH8mBPvMhCMP0u/t4VB0SMQRwp36GuzCqjDxMQViIb7CNpYkmG1tOWjps3?=
 =?us-ascii?Q?NPGyXbcOmj5CXv9vHtYP7PXsMUcBWZelakqdxrfc+PBOwJoaDyG9Ia5muHzL?=
 =?us-ascii?Q?I9q+6Q1Kl/gTBjiVNourg7yHkgQplZvg2LQnq/imdUsUPWFhgEtt2mfDpVdT?=
 =?us-ascii?Q?/xW9zfRIyibEOQUq0CHN04pF7wPxf4K+TsLdshpsIMINqNNOB9eEwVlQVCgu?=
 =?us-ascii?Q?VRGMiQxgk1IizxW72Nadhy9QJjkFCrAFREu8MwURHWW9TcLYUfccl6ZBflWk?=
 =?us-ascii?Q?zsS8jsptuFLQ87bsHr8z8eBSTWwkTp5eE9vQlLRuHnZGmOfSQlbqAKfGC8U7?=
 =?us-ascii?Q?M3CIqMrmW7iNucPBph3IuDNn1wMNM7aCXUQjCaB8Hbsnww0iLQTOA0ilGwGK?=
 =?us-ascii?Q?hS3QPwNm7sfki6SW/3BLOivNuA+JUTIXMXILi/9hS93v8SMBv0h9YMU9uyyY?=
 =?us-ascii?Q?lcsi6WxZzzCLCRbl8LkeKwcTZksoqlpWQoOFfVtpTtLayRHiM5X039x3e1iQ?=
 =?us-ascii?Q?9UYUPcTXPpn2QVzEadJonpSWu3JzHFYzwB20Lh82+vq9trw5Yo3Ga3GGkekf?=
 =?us-ascii?Q?dwX51OtaQCVqYTbFOKbfRhclppqGxK0O9QWgjQSJRqNOgiG7qVJLC3PVYb0f?=
 =?us-ascii?Q?EPAzCRWcQsKeUeNn9a4X+MIHDXus19baHcb7So8iUY+pWMT3xITXG2qGUYOt?=
 =?us-ascii?Q?38ite/cJG4Op4cw4hnSZkF3pnXD0csuoLboVUDF8nsQll2AlvXjXiKFBExqb?=
 =?us-ascii?Q?ltnnC7k9j40VA901nKU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 20:22:39.5957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de732639-34d1-49b5-8300-08de38f30815
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6613
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Dec 2025 20:22:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19346

Add a patch to support a kernel change in 6.15:

- removed del_timer() in favor of timer_delete().

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: New commit.

 .../0003-Support-Linux-kernels-v6.15.patch    | 34 +++++++++++++++++++
 .../gdbc6x/gdbserverproxy-module-drv_git.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-m=
odule-drv/0003-Support-Linux-kernels-v6.15.patch

diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-d=
rv/0003-Support-Linux-kernels-v6.15.patch b/meta-ti-extras/recipes-devtools=
/gdbc6x/gdbserverproxy-module-drv/0003-Support-Linux-kernels-v6.15.patch
new file mode 100644
index 00000000..8a8a739b
--- /dev/null
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0003=
-Support-Linux-kernels-v6.15.patch
@@ -0,0 +1,34 @@
+From cc151e69fe77b7e590bac9e5cf1eb00af9b92d83 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Thu, 11 Dec 2025 11:14:50 -0600
+Subject: [PATCH] Support Linux kernels v6.15+
+
+del_timer was removed, switch to timer_delete.
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ kernel_module/gdbproxy-mod/gdbserverproxy.c | 15 ++++++++++++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/kernel_module/gdbproxy-mod/gdbserverproxy.c b/kernel_module/g=
dbproxy-mod/gdbserverproxy.c
+index 418b6db..8c5110b 100644
+--- a/kernel_module/gdbproxy-mod/gdbserverproxy.c
++++ b/kernel_module/gdbproxy-mod/gdbserverproxy.c
+@@ -462,7 +462,11 @@ static void gdb_close(struct tty_struct *tty, struct =
file *filp)
+                // this signifies the last device closing
+                if (gdb_port.openDevices =3D=3D 0) {
+                     // release the timer
++#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(6,15,0))
++                    timer_delete(&timer);
++#else
+                     del_timer(&timer);
++#endif
+=20
+                     // unmap the interrupt and set the address to NULL
+                     if(gdb_port.handleInt !=3D NULL) {
+
+--=20
+2.43.0
+
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-d=
rv_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-dr=
v_git.bb
index 799ba019..71f0c294 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.=
bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.=
bb
@@ -7,6 +7,7 @@ PV:append =3D "+git"
 SRC_URI:append =3D "\
     file://0001-Support-Linux-kernels-v5.15.patch;patchdir=3D../.. \
     file://0002-Support-Linux-kernels-v6.6.patch;patchdir=3D../.. \
+    file://0003-Support-Linux-kernels-v6.15.patch;patchdir=3D../.. \
 "
=20
 S:append =3D "/kernel_module/gdbproxy-mod"
--=20
2.43.0


