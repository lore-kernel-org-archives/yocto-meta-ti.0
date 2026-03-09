Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41A6F41817
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:02:16 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19694.1773075729340004691
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 10:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=CvPcmAyy;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.33, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3CEwmiASmhnymNxHkr9/gixu2FUl0jbbzoRMK7IifwIy+N1YMmV6T12S8TirF1SiugRnVMxfH3HUT+WYGeuKpID2UIZVhU/rMEf0ZnyC6a3LRrBLTwp7BpPERo6kTzL2VK4troccSIlKQetQemr/9+I61SrFdSGJNyIT5do3Bf4yaiGxF7VRsyQ+Y9nGfgTDpKkLTB2lTdastsCSfzLhGNQwxxszoFNMHuIcs3uSwNdoDHlY+VLDocqDvDHHRsvBZeL1+hpwot8L7kgEI6SNvpOyp82DwxWewuwY6ALIfcAQzAx+SZRPNIBWbQUgtJL/j7lUlgQAiDEZqW3Qj9Ruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7uC91hOxaSgFfXuzV/XIzYXAlc53Xb0uLABIpKPW/E=;
 b=hhDVtkd/1W51Dl0FULqwbMhmwPn7nzEOZJljhopu4ovi/bntlu+PI6gfiIOh3gvlm1npSqQDrhSi48xCJflUfsoXqhKpD5WZZARSPL0WgdusEsG4IKaC1itjD68ohszTmIrTCiDBic2vu+rtNlQ7Ey+Mbnwa+x+j0qPAl8LNvNCHnF3DwCodvDhyZSLYY54WeNgzAvPjP3ySSeS2ca7CgkYWq9dw7yJwrxWQKd77zr/gV/bMP4VWi5UTa+1VdqMFoEnGjXPuIVM9FYfZ/GVUxi313PxahBjHBls52T5HeRyirBIGYA4vtmeF9zShHHocrRp9NHD8A+ExmSZMSHQ5tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7uC91hOxaSgFfXuzV/XIzYXAlc53Xb0uLABIpKPW/E=;
 b=CvPcmAyy2Uaa1beMaRoGZ02KYD/DoG2OAy1HtJUhNGvC6f9nxyBsT85FBvR8W8RksIaPk240a9TL8kalS48IkehvSHULGDYfT2zT/EcUWHEycMxBUWAsu/79AeNnMX3cAHYOPpUBjFJy5FtmUdNVz+HTc9DzCRRn2rKPD4rKrRU=
Received: from SN7PR04CA0086.namprd04.prod.outlook.com (2603:10b6:806:121::31)
 by BL3PR10MB6090.namprd10.prod.outlook.com (2603:10b6:208:3b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 17:01:53 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:806:121:cafe::98) by SN7PR04CA0086.outlook.office365.com
 (2603:10b6:806:121::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 17:01:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 17:01:52 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 12:01:51 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 12:01:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 12:01:51 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629H1egD977422;
	Mon, 9 Mar 2026 12:01:50 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramachaneni <prudhvi@ti.com>,
	Mahammed Sadik Shaik <s-sadik@ti.com>
Subject: [master][PATCH v2 3/3] ti-jailhouse: Fix buildpaths QA warning
Date: Mon, 9 Mar 2026 22:31:34 +0530
Message-ID: <20260309170134.2779295-4-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309170134.2779295-1-s-sadik@ti.com>
References: <20260309170134.2779295-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|BL3PR10MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6d14ff-0519-47b6-ec47-08de7dfd8f99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	MsxzjYLt06Mv7NR/kpjjdF6WNpEB+CrBjtNvZdjQRDhnFjNdYHONyOXMcDNXArPqykv31AfNcsjI44yOqxZYG5DDombiSsRYWvrJu6hxgxah7bdMdiLcOhHEWz7fhjtJmS1se55GVWF3a94waADVyCPxph14tvdO7NeSYyAQVmlWFqVUQiWr3ZBYbMSqr+0vtHsjT0qM9ZbCfmJeVUp/lSw2bdFKMeN+Q9q3zcakUgwL1TXyq+CxOZwvkqj0qaubqqHdzm/WY2EX9dmeIrtTCZFbK7nJtWVIgnw317GgKt7OSG8HWebKgee5Ftuu47A/FTCvcyo/y0kou82tnSdgqaF24zB9Z7Jfd0bWNKZNMLdmhSQIzGuW6szsp8S8nJyFpD2Sd7vRPnT0bAPA/JQkuhFCFyOkuoekXB/rgxvUa9Le8gGUsntTpdG8YnX9wL3mt5WrwnMmC2HF6yANtPOLAKM/KyPwWpa8eRZHzoMRf2QMNf7hlVg1BZBa6bNQCV2w2+I2cIp62VfhbO5/fX6Qi4KYp+Ucekgl0yQsyLe5S90vevrhn1neevMOSwREXTF8y7wG82b5kZU3YcBfKYeGBLoFmUBn6YbS0MOztzbWN1J11KPtUqgB9wrTmabafSwmNXrhf5jHL6sn5q+pldilD02U0vNniVVmDeRqzFFmq8iHPalZu1/W2+ti8ovPGV9BlqwYthqVlLP7v7XdQQdHrpt1eJwuaTK0jyPZwHb6djrZtdcDANiq7bOKhtZSg++6I0wOIMM/UvZsdr+reEWyAA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mq+m9FYZeS/JXebdWKm2PBX9Sv7lea8ui+XnuqFdNz2E/DS56GQz6pZuulyz2m0rRdb2BPyTTtFTaTvjy4kxIKyCjfXv7bfA/g6qGzYymIe8kH7sxbVpNwBdWcqZwNvZRQwPb5aGtKGAM5ylYYygUb4mDLdNuXbYOYtqmLRt9zbDaJNucCl+qCUsQ+HVHTTwSIJ/GO5aO/OU5LNJ/Gh9FOJ9JHNq1p3SstReD6EVU+xBFKOJld2SHlBHPzRCxUYX8hmax35x66tJiEwzDz/IhFFVY3Hv23lvTQeq7NlhTjTGK/BedbLrNGMk+yN3PFgm01XIxewH1iXws84oobI4NkMULmXV99ViT3Km0R/W+NDrZ2lRQxzopn8SHGaBVBBDTQZ0mhHrXsZDYBLnek/5WCWkdD6GmiWp1UkDVTgq4Z2gxysFca5VhxKftvQqTs3Z
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:01:52.1789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6d14ff-0519-47b6-ec47-08de7dfd8f99
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6090
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Mar 2026 17:02:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19679

Add -ffile-prefix-map flags to KCFLAGS to remove build path
references from kernel module compilation, ensuring reproducible
builds and preventing absolute path leakage in binaries.

This resolves buildpaths QA warnings during packaging.

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
 meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti=
-extras/recipes-ti/jailhouse/ti-jailhouse.inc
index 91076c9e..8308f0e5 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
+++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
@@ -80,8 +80,8 @@ USER_SPACE_CFLAGS =3D '${CFLAGS} -DLIBEXECDIR=3D\\\"${lib=
execdir}\\\" \
=20
 TOOLS_SRC_DIR =3D "${S}/tools"
=20
-EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D=
"${CC}" KDIR=3D${STAGING_KERNEL_BUILDDIR}"
-
+EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D=
"${CC}" KDIR=3D${STAGING_KERNEL_BUILDDIR} \
+    KCFLAGS=3D'-ffile-prefix-map=3D${STAGING_KERNEL_BUILDDIR}/=3D -ffile-p=
refix-map=3D${STAGING_KERNEL_DIR}/=3D'"
 do_compile() {
         oe_runmake V=3D1
 }
--=20
2.34.1


