Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE43E9A03B
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 22:32:59 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24498.1771367573417730142
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 14:32:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=mgOo1l5U;
 spf=pass (domain: list.ti.com, ip: 52.101.53.24, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMzjoqggLdwE7YcBhbvDpnvJ7kZsqRFtssstHIZPDIXnBYQ1YzVx5Ha+AeEOZ8E7kdISAuFNEtJc53YfNdl6gn3mDrADXFXECuferJEQh0rZASLKMBWnMgnxn184UYjfKey9NH6XA+0osPOhnlB0Sk399BmOepPjSmW/lOn1zx4f5x0OBCdpOGCnuxfwxaoVCKnPUg/EnVp0AM9NB6uJWQpNKFd/OtovABrZZk+os1oBb6qjPj9OwUIj5XSIFfHFhfDRkdQiR4IAQ/48eAICtfVmLqj8rRGx05zoWrF8xl3FtT3xK3qmE/O7T6VWlv3b04Fh38PRkPUDoXkJVsqohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6PVcc6sgwXRKMZJU3giEfH8MBAtZ4XzYYTQyZ/wy3k=;
 b=YD5H8dvQBV9/HMoLp68cZccwRE32P8A9umLGi8QThp1MHo18atVHGeOj6XkEvHocdlMIGNk5IVU4ZbMzEisjznZf8GLGZaI7ViYPVaCLFRg5gBZdbPEZ+dX3X0Hs5464ygeG9ki4Sgi58kwIUi/fm4PBIKXGw4jm7KMXUgnzfT+Dspk0dmRi46l+Z+Is0+2bgUCvqi8I2ATiiAC1/i04ehu9cIBwbDiUjHzGqKJe3HLM5DZwJy0B8kkQ5Y6i29XcbbZBYerdpAxojd2btTr+zjQr3Ai5aXimkRQJN9pITnfKUr7S6dY/tl4lyAelxgnzSpzfE7+tlO4dhxRxIPY4Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6PVcc6sgwXRKMZJU3giEfH8MBAtZ4XzYYTQyZ/wy3k=;
 b=mgOo1l5Up/bLjLIErGsbiEWyQeAgemtlIOvh2ljN5G4mXlQpwz+xdUYPg6+Vz59Dmraa1n4A2pyd9EvO4TfgroJNvydfP+ieQmocjPWpYPplJKqgL48lMDlAXUTn/Fe8l4ppA/sULfg+PJnXXVOjtq4T2VFN1Bo7YPkG2lOmEVyZeqYfymDvs+2qAmfHEd3yN+GRfZpxPcvnR+z2fSBmlaDPKsvNmCMaknn0yA/UFrN+CJf5Jor9Z+r9Ee/Rhi3uvDBBY80aRhQYnfSeea3Z69ZQshYKODgjHYVYB3f6XFdcwbnGmBmnthkM6tK/mO25/LwPU2D00VuSWGUZDFUQlQ==
Received: from BY5PR03CA0006.namprd03.prod.outlook.com (2603:10b6:a03:1e0::16)
 by DM6PR10MB4330.namprd10.prod.outlook.com (2603:10b6:5:21f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 22:32:36 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::f7) by BY5PR03CA0006.outlook.office365.com
 (2603:10b6:a03:1e0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 22:32:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 22:32:35 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 16:32:14 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 16:32:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 16:32:13 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HMWDUR3583112;
	Tue, 17 Feb 2026 16:32:13 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DC8B8138B5D; Tue, 17 Feb 2026 16:32:13 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [master][PATCH] conf: Change weak assignment of IMAGE_BOOT_FILES
Date: Tue, 17 Feb 2026 16:32:13 -0600
Message-ID: <20260217223213.4138650-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260217222121.2724706-1-reatmon@ti.com>
References: <20260217222121.2724706-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|DM6PR10MB4330:EE_
X-MS-Office365-Filtering-Correlation-Id: 27f803c8-798c-4f6c-bdf8-08de6e747307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gFweOLclpyaYgigkMbR1MUX+kq47AjNTCvbMStejPx1d7ZuEgSX4Q8doDad6?=
 =?us-ascii?Q?x9l4X9RcLofsX9TnBwdi19Pb26SZvkBwYf1ybvJLEF/2SVIrYvofjCsJX+KV?=
 =?us-ascii?Q?0sMk1u43l7WtiBKd8Nlc5pT4FCZM3y66x87IhJn7dkDoyknNzslugNfzMUmx?=
 =?us-ascii?Q?k5KRLVSCdxd2c+KfXxLqHyo+GyKKdkiRsipnR8P7AVAgQBtJUSA6MQ9seM+2?=
 =?us-ascii?Q?juMBqn+snDgNaRXAwj4DM79VW2iMFtwFvaMOAQdfe3Q8b7kC4AWdluIoSxeq?=
 =?us-ascii?Q?nqcYJyb0hYYVgrRo1hpyJGIcZVsPXwlYscF0SGZWMfkPjFSlxWJXlnSJq0nC?=
 =?us-ascii?Q?WcpEKpFHMbA59sQG4LYqyO0CqXMk++Aj43g8bsX/kyWxe2AF6dke5AhCalMq?=
 =?us-ascii?Q?CMVUfnPpdilqhlrgHcYkGGJy/QJRc4YKB7Rw4dbJGHHyOwWKjFUxu0i2N4l5?=
 =?us-ascii?Q?/79tSVRTfxZ0XyCllXetyYYu+B7ojQ1e0KvHK6dQJCYL05RmnkzYHh3argHB?=
 =?us-ascii?Q?UHEAUTej5U4+44bDheLVA520W99160JJ2yLHhUP2LBS3Kjc66QDq6kQm6TDj?=
 =?us-ascii?Q?3pX/Q96meEOXF66SfIyuQ92j58XMc5+JsOP6/jYzXt3Jozds+4p30iz/W07Y?=
 =?us-ascii?Q?1xKcAbWLj3QE2R1agtDWNlUzrVcG1q5BNkQI6b9ip4nmlVlVTImhmGtJjzNf?=
 =?us-ascii?Q?8hNhid7UeiW0V8HdiKkksGDyMHBwhn1AM9KpRtboGkIkzHtyrCedsd/VKmE+?=
 =?us-ascii?Q?kg2tS0mnJBvn1no+0HvHO63dop3vdJiiTZNgZNwWK96utRdS9wexI6JLFGck?=
 =?us-ascii?Q?Bk0h5+tjxQ+QnvUzfQ529De3IKfJ8lS6QDTfXeqlxSz5CAo+G3WOG6/uQxlE?=
 =?us-ascii?Q?cHFfjznKSIYLJkVfB+lfh46EKh97BBWhm47w1tQ2kahVPQg6xLWGhdlnYEVr?=
 =?us-ascii?Q?+rf06TXfliiMD7tx+49tNsIJwmododnOBrml2aO2xGwYy9pF5BuZcKZNpKZw?=
 =?us-ascii?Q?acByQ2lzT/VEJJX6DB0lglefXHUaUNCsUpwrBctKfRV5C4CPwQ8kh1i1Ux1I?=
 =?us-ascii?Q?s0K3pl9RHRddy0kRPX6utiudy/7zDc3ra9iPC8FX92eBFU+VOo152mIZBRnA?=
 =?us-ascii?Q?gIQc9yLniydk9EJRQqaJAEsYlfAu5vcGpb3EANshIlKfgHtilTXB4dc7svnr?=
 =?us-ascii?Q?Zh4DTk0UWc5O4PwkE08d8ei03d7vcJEFbsxfSZSHN9ll9Ut+azjozgdH/cYN?=
 =?us-ascii?Q?a/3vw+Bu9DM67YV/op+B9kVLy91yClsIaCq0Cqj1028sBh95eZG/mhe/njpL?=
 =?us-ascii?Q?4MC4QYNlC5eVeH3ySw5X1Z9v/SbQW9n6T6EvKMCiz9IKWH3E5nA+bXHib43e?=
 =?us-ascii?Q?gu+3iZ3A+yXG/VfjAJbPO7FkJkKt23JpAISFNVLWMS2/wBeduc6dM/jo3/zM?=
 =?us-ascii?Q?aGfT9/7SCTFnYfeKEpI/Ma8SL8ScvNCd+4epV9MpxYxDvRmw1y5D9vEAEH9Q?=
 =?us-ascii?Q?bGSluoYua/+fCmCWDUJHu7+TIRkEv7zERSWSnmS4P8XGMT6W5sJvnSg5vvtU?=
 =?us-ascii?Q?kkA4A3THJK5mfwvT6Qc7VEb0NKjwuXkxut7cYmmKpJF9zeLvv2f2d8kec+II?=
 =?us-ascii?Q?aw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tzNf+lFBaJf0Twtx3n5vfJDg3vXlGeh3uYBTxCFJWiai7TdsiOF37dPY+pbUjtR5ujyH96qtAgUNspjIWajH8AgAPWfG6+YUMOd6yd9Fo3z+4ecx+GjnA+jtPn+rKvyJt48zWFby5c/3Ciagqim86OiRqp4dtheE9Qakf/wsmWWag+//u5xlGGpQogZ3m79g+PW1h6teme3XTuc2rOpB6GamX8djgJEWx7P/YL97u2b6y+Y5FoHOfKMhDG8gdX8LF2TupEscRex+XljV75MksVmMq1cljRmeFJtjJfk8U0EjY8dqCggf7Hgrvmxec+47Qi7CA6ZWV62dDpICG0NwSPZRnloSbfQZQHUkUfZrQV8NERL72yfLjV1jsizoeOZqgObJp79rc/ZMfjbkHOSTvzJV8XRiSL3kAjx2PzYv0qETuP9gMXnuF3YkCoPcfUfv
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 22:32:35.7060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f803c8-798c-4f6c-bdf8-08de6e747307
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4330
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 22:32:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19537

meta-ti / na / 20260217222121.2724706-1-reatmon

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [master][PATCH] conf: Change weak assignment of IMAGE_BOOT_FILES
    WARN: Commit message does not include file/recipe name: conf: Change we=
ak assignment of IMAGE_BOOT_FILES. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: conf:=
 Change weak assignment of IMAGE_BOOT_FILES.
              conf (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [master][PATCH] conf: Change weak assignment of IMAGE_BOOT_=
FILES
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 17 Feb 2026 16:21:21 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0f486e5d0956f40cdc4c40fd20b70eac3=
9e550be

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602130934
- Commit SHA: 1c2398c320609f8f473a30f15de592549c461fbb

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




