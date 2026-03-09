Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B18EF417EE
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 14:44:20 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16206.1773067458923989074
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 07:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=afhsxFqh;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.53, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upfNDfaJgtsvTNxquZoi6bgHnc3ATf5M2r2Yfwu+nOqpzYkSkOu89F8Jh7XK2H4Uiya++673UaF9Tt6HthA320GqDn91Ob96QSnSPXGbJ8U51yqUBtKv31KLGdPVGwK22ykfZzikw+UTtQfJJcDuuKRHYuJisCS6y7b8kQKOKZg9StrZ6lSeJUnwS7HkKminWodkMcxN1i1s47ez3AaEFnE+ohiaAd2pTH6T0fWKwNE+gqolipcWSHb2krW6tU0t2RJryB4YD4mwTK+L83iY7Uufp6I10NiPZlxyFQ/UMWdHeMsaQaOzzQ0inh7L+ZMVVbAf/HNOnGW+jw22jovldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOkr56VJjeIhc16G2HwjypjDOB1Bd4FUW1dtJKyznCc=;
 b=Sy8iFABntr9UEmoc5z3REFciFn6mTQE1wrH07sFeXoICsGnxOleJ/8qnL4kuuC6H4hRBvjffb59/pphihoygiBJue5A1TtWe8aUdRFKAUcluvmzhXJoQboJXxzMxeQUF5eVd+AcBNJhnXTIerDaOe4YmBDevvkp+Roa4a3w2gGI/CiFNnNwY4pETPS1RZ8GAih6ap8ZXx9U3SpgxXM7jIjpF37LU4qJQMwO+GM0St8ufLG1zGBdHvRTtHiQoQZNb39scg6DKQQrq6AKnygQGzx3eG3lZpfA8yQI/vK02NK0Kxf2B1Y2lT9WeRcygkxqViLSaJX7mdcQyL3aBa55YGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOkr56VJjeIhc16G2HwjypjDOB1Bd4FUW1dtJKyznCc=;
 b=afhsxFqhb8xdiI+OPWWtJZKoXGWBfCkXQqoYPGp95Q584Si3ndaUmbUq6C9ctHRgpZUtyUw2pSOGt+lphaPgNCdog8UeAZOcfxZs8BuNJLB8T89AeqQDBrrLpz8Ia+HAlnjcHX3lCWPs1zPkae1kmY2qo1N7QeN23s2NHZPq0Ic=
Received: from SN7PR18CA0018.namprd18.prod.outlook.com (2603:10b6:806:f3::10)
 by IA4PR10MB8566.namprd10.prod.outlook.com (2603:10b6:208:568::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 14:44:16 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:806:f3:cafe::50) by SN7PR18CA0018.outlook.office365.com
 (2603:10b6:806:f3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 14:44:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 14:44:16 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 09:44:09 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 09:44:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 09:44:08 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629Ei3V5778250;
	Mon, 9 Mar 2026 09:44:07 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramachaneni <prudhvi@ti.com>,
	Mahammed Sadik Shaik <s-sadik@ti.com>
Subject: [master][PATCH 1/2] jailhouse: Fix JH_RAMFS image path and QA warnings
Date: Mon, 9 Mar 2026 20:13:55 +0530
Message-ID: <20260309144356.2709949-2-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309144356.2709949-1-s-sadik@ti.com>
References: <20260309144356.2709949-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|IA4PR10MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c914709-07b8-4179-0c0e-08de7dea56c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	A7vvM1a4YB3e6zp1pOhJZ1cDpM106E1ED/jU9QlM6NHbpFeq4qTH8LqOxQqWOHAVE41pyGCvd2XHGqgdT4Q5d8dDtdnX6XAH4Pcb2U++Aofr+/3owqz5lAsVNaCO8BGJO4pGLpQeJTgQmu+7T36aWxXH7sa4maW5cpEM40OJ59+uN7cBEPo159cU7KXtj1a+EPTSDQp11GmBNO0HUA7VdwXbuGlon6OGdkkTz+LBkPXj89nm7f9ewUv1/ER0h1sPbc/s5OS1I+q2Sqh+GfHWDNzeR3Bdqw77LJCX5z69H6TlensrBeCiNZZZb1BCMJL6cLqvb1AscIRX2TCtAR1KkcKkymmASJcainS/e8FT4iHLRAXm1UsItsZyjdNyzQh54fPxSYQomIiwLWLyiVmVveXADelR+7Ta0PllIHxSma3wpRbbU+SHt5B3cjOKl4ossdGF7jJLXHDx1jb2rnwa44T9RoKqoLz+PWUQgFCMpQDMRhMimArba01W5IuxH7wCVllMGXO5/bOb+djXXLmcsT40Ulc4eQz9Y3Vyq82BlZ6oT3qViL4KtHunb9mykOW7J1LTgvCLyB3OuDalGVsAr1kct7QOeeJqxzOXk9DhT4NbbEtdjmdhibbJluZMsy1bRbkvwPL2TDyZdBMZGgdbGTu2o787Q/UKEZ9DIctKRK/Hpzrk70j9FwDsf/av1m81EYSmmvVwWiXY0SpjCrKOj6TMx8LP6M/XFSa3NMSN2kWpvN3BW6n/9VQH6DYfmibhGV/yvJyQn1o7iFl2ceVOCA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6Tdp/RRsIsjDZHiKQ+WYK5Aivc53UheKpkrCpV6n3ZcqgOMF5larp6E8CC6akWZm0PU1Qx5cbUOcP2NMriuWCvN3z6vPnG9uXaptF8AeWlLyZfRJ0E+yWuQzZ9z+URTTzhVbli6B+/tQK+BxiHbkut87sbAQMHvpABffT/QVzacWjtd4uWtz6Mw8VMrVq1062cq6UANRgCmhF3ebsoTvh358h+TlnIAoU3JSkW9grDYkHZoLJVsDjDnsf9NL+fkv0566e3Gr0qVKz31Q7IvcXWl2ioZHuj2vuJlDiwvwXhYadhJtalpdeCb3a7pOAo68HYGm4dNWQM6A1niyVWwndMtftzbXW/Fg20p9doBpHpq//d4Wai8mvZ5cZJz6iaB/cK/oIdTtNHtAdiRmMQeHCFMo74VYYI/MVdVUJbsbOdAwn6aGyXRz4dKfBSpVyfam
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:44:16.3729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c914709-07b8-4179-0c0e-08de7dea56c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8566
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Mar 2026 14:44:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19675

Update JH_RAMFS_IMAGE references to use correct .cpio
extension instead of .rootfs.cpio to match current image
naming convention
Add 'buildpaths' to INSANE_SKIP for main package to resolve
QA errors during build process

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti=
-extras/recipes-ti/jailhouse/jailhouse_git.bb
index 0113a916..bfaa2e16 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
@@ -55,11 +55,11 @@ do_install() {
 	install -d ${D}/boot
 	if [ -n "${JH_RAMFS_IMAGE}" ]
 	then
-		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}*-${MACHINE}.rootfs.cpio ]
+		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}*-${MACHINE}.cpio ]
 		then
-			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}*-${MACHINE}.rootf=
s.cpio ${D}/boot
+			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}*-${MACHINE}.cpio =
${D}/boot
 		else
-			bberror "Could not find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}*-${MACHINE}.r=
ootfs.cpio)!"
+			bberror "Could not find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}*-${MACHINE}.c=
pio)!"
 			bberror "Please make sure that \"cpio\" is in IMAGE_FSTYPES."
 		fi
 	fi
@@ -72,7 +72,7 @@ do_install() {
 		./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
 			-a ${JH_ARCH} -c "${JH_CMDLINE}" \
 			-d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
-			-i ${D}/boot/${JH_RAMFS_IMAGE}*-${MACHINE}.rootfs.cpio \
+			-i ${D}/boot/${JH_RAMFS_IMAGE}*-${MACHINE}.cpio \
 			${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
 			${DEPLOY_DIR_IMAGE}/Image \
 			| tr -cd '\11\12\15\40-\176' \
@@ -100,7 +100,7 @@ RDEPENDS:pyjailhouse =3D "python3-core python3-ctypes p=
ython3-fcntl python3-shell"
=20
 RRECOMMENDS:${PN} =3D "${PN}-tools"
=20
-INSANE_SKIP:${PN} =3D "ldflags usrmerge"
+INSANE_SKIP:${PN} =3D "ldflags usrmerge buildpaths"
 INSANE_SKIP:${PN}-dbg =3D "usrmerge buildpaths"
=20
 KERNEL_MODULE_AUTOLOAD +=3D "jailhouse"
--=20
2.34.1


