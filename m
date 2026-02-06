Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72E3EB28C4
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 05:06:29 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4840.1770354380103869569
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 21:06:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=c4a6ljmb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.18, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVC+Ewe6/RPB7HDi/f1Yct+VCMhiDvHL68pz7VoacsX6JWE0x4JzqdVR94DgTi63abOaXEFqVEn4Ss6BTVd6XP27BId6TV4oppFMhGWs307uOY3vVblqaijwomJZEtRKqArcr3J5T4fKPLxE2KxJ5LhOFnDam6qm3NdH2FHnjijMRUbpknegCM5/py5qThuxMWoeWSe0dT7AtSn1CyE3x1jirYpe8AGk5Uzl6n7r4HVP4nBRKzGp7fz9ZdBhLv4QIwxK9jo0dM+ZRZsvFHirKu1NHXJMeowvxZqlPRSi3dqyvEpbu5llCMGyqN5A2tYYyZ9GFmK3pMBOrY0lAlMPBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=za9yylmTGJmoMrrmx0M7zXDx04h2I7m88WSJLILlhqs=;
 b=CDSl+3V67yJN5D7EH1gke4hE3yKNJYACkUJ3bpScx1xgJ7/ZBbDQ5Y0LOsmG6Fi2r7gLtRhZ9hdHkVayxXfAxJpLSxMDUhi0dn1f41qsjVAz4nABb9HNsLij75KFTpmSQ/AMYhWukomw30LvfHOLhe0esUo8N4Qem4iDM4wUeJbbOzlLCLUkflpG/pFv708lGrhFUr4tukprCAYCPp0q7as9siUCQF0DF5bvC1yF/3fCGP86DzuWsFIrlXbicL5QVfes2tf8yWfRPodtpi6O/fnaYLdmWZRD/iHmFEv/zVEUFZtiDDF3bVCZX9vyqsGzDcQaPjcNhCjnelus5LKr0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za9yylmTGJmoMrrmx0M7zXDx04h2I7m88WSJLILlhqs=;
 b=c4a6ljmbODmxIXh30EFgVaEabip5Ae4XcMkFLLnpsJlLJY+a8zSnKUwrRkP8IIbPahPRTfQ44PwAIaNkXt0qRXmD7VMOob5M8XUcSV9qI030q1Ye/H8bXo5WZzx0eJzvBTagyhV5jS0N7hTh5IDkmY1ym4QcMZ5rXcfJNLJZ3ec=
Received: from CY5P221CA0059.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:4::44) by
 SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 05:06:17 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:930:4:cafe::a2) by CY5P221CA0059.outlook.office365.com
 (2603:10b6:930:4::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 05:06:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 05:06:15 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 23:06:15 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 23:06:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 23:06:15 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61656Enm556986;
	Thu, 5 Feb 2026 23:06:14 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
Subject: [master][PATCH 0/2] Update audio firmware recipes for AM62DX
Date: Fri, 6 Feb 2026 10:36:06 +0530
Message-ID: <20260206050608.1929093-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|SJ0PR10MB4542:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b654dd-d499-4bcb-4bac-08de653d74be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B52rg6p9BGEbDjGsExPmhBZTC5oKhQsrrjyrRI/yQOjmEX5vYqB6wJhSS5Al?=
 =?us-ascii?Q?H4ataBhauHtjUNNgDIQS71YLPkUJDtWKA4T2sjuAAn2foKhbSlDqUHVDHuPh?=
 =?us-ascii?Q?qFN6KUao+fz4BBdFnINtPDmMpL+oKuNlNe9zM7KTfrxzl1VeQ5gUdoXCFnov?=
 =?us-ascii?Q?sxfg72DqpBh87dSm6xUk2gsdeGkF0VenjgSbzLtpjwN7cr2eh/mtfsXNy+Uj?=
 =?us-ascii?Q?mIssVDWuOlIVTctCxalXRJqbEmTCVJi+XqwOi40Z5UrBdOTsWEnhgKSnPdkZ?=
 =?us-ascii?Q?8EIolA89MDEwCro1rxj6GYnXZ3Dl3Ec2nqYODOobhkUu3bN/UQrQskeGt/NF?=
 =?us-ascii?Q?0ibcaj6FDfOx91B5fEvIXPrGYgkfoFl2iScOOZ5CjfB1aDK5PABAjHC6eORU?=
 =?us-ascii?Q?KZ+chulmSlPx0QiDIo5XQDwCVh7WDe+zvy86EgHDS+Ykh7AC3PXQ6JWAw3+8?=
 =?us-ascii?Q?Y7J5oo+3jpwZPCnB0H8yEemGbwjk7OJ+rX2gTxhiKK35ONOyvOhFS7VK9FtM?=
 =?us-ascii?Q?16u8hJ7ZmE6Sarve+e6f0j3MkVs/TyPdkfFRlfTICeOZNWqfmnp5K21o1+s5?=
 =?us-ascii?Q?40fr3lN0Hrwys0dla083t2bdg3NoaPgT1mDrniWZDvL5u+8MShzziXWw0ENv?=
 =?us-ascii?Q?4fNvAJu712inFus2WRyQrCAu9DoRzsE1/C8KwXf0A0LUxiy8HlUSVsTgllla?=
 =?us-ascii?Q?9+W1IxJWECN74qd9hOpQZ2TifHB8eSXwA/sSPa2np13mok/x6osL6p8JwNu2?=
 =?us-ascii?Q?4d0QBN2ZGAKSfVCw2JNmDe5Rw+DoGhOeCeZ3V166AnkyfApLvO9mIxG7pHJi?=
 =?us-ascii?Q?7XuOCaygtAV3hyD9zfvIjx/vXveoXO9TVxxkCg/J0ofBPxQ+fx9F3lnhbgwv?=
 =?us-ascii?Q?+GwwdfoOEhP56umgJU4sDxIs3ycRcilBgD2gtvleL6eeI2VyPpiYudwEIfyC?=
 =?us-ascii?Q?EbedBbmyTK5Rr7XO29OyRdvk5q2RerbvzSOgjNUjCfNup/XeNflmGaw5i05i?=
 =?us-ascii?Q?BEzj+K28htXSJb28bAjNFeT1bf0autxzsys3ngl2epKJHrFQSrbd1QAOj/xB?=
 =?us-ascii?Q?Nn6iEdLxzle9Q7LSTpbVVo30SMQ8BWTUrmTjViBHirfNGOYFaWj31f6AyI+y?=
 =?us-ascii?Q?UjTaOnRSQ+hk9V/W7tXPhskJ9TW3fOCH7hzEJ7ydN5bvIRGB53jZE2WLPVWb?=
 =?us-ascii?Q?xjsWE+XepGRH2FwUQhCJZEN+c77zogMBLlZZsmo9jO/IW2oG8GlXD0MBQuOY?=
 =?us-ascii?Q?zvGQgf1KYB+APiVmly2FzglBWuMnJSMWDqOAG53um8mFuqcnU54axMKze+Jt?=
 =?us-ascii?Q?QvYV1TY/MnY8+Gnjb3SKU44dFc5W871R2rF7fuZDgebVMxE0/b/jdAWXu3jT?=
 =?us-ascii?Q?9QavAFrwYMVO0iaxdNTjs8U0pqbfleBJXcOrRfjIhY0eCgtaRIZHuP36TvRJ?=
 =?us-ascii?Q?QBGvVJOQ+3OPcmygWrngVgTc8A4crP9khXqOSkDrOBq+kBLtvdHAnPPJJCn6?=
 =?us-ascii?Q?bt98VoTvJxI/3njadDZKUeavdCmG0rwOxT66YTCsmvhT80kNOPsmH1AVNufi?=
 =?us-ascii?Q?rpUgqU6+CSGclE17MO8xM7cOOPHuahvyRNenHP1XfMb3I2ZU3aWcLPVpjWl/?=
 =?us-ascii?Q?s0RFUuhnQSdU7T7zFtZsIrY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jH7EpqrWw/Y0zbRZcdIqKHuJN/i87R5UkQ5faQFJSQdToF5LY2TC1WXncT6pX+GLs/9u/mtNMde6UnwIrrRiocYZCVIkeqU028ggxMiEecdZTbZtaHWOAIqQ9CXiQSOptGk2mYin7AdVk4rCAeH98THbHlwuNO76NxXdvBwOiKo4B1Kg7zyCQyAaGIqEYKSvF9nUvcBpV3RihSxnrydRzDGkOs5oCaGGU1RZF2fGjcD8/BdkPx8zFRdUQQ9o2NWkw96YW46u9WZpGKGfdFiR1PVQ+Lh+bcBZ6bXnbCV+pr7WfkqzIz8VxXBA72aG5fx/5d0KTMNRh125zqNM61BfnVvlQ+J/qWJ8sEBWtsL81kTu67kSU9SvRKzVAMnZHexUPDyRgL4Mg9znFwDk1utPIek5wwPtM9LcPHo74QWAf4b6ohJ2AXfr7WyMpfZkFZCO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 05:06:15.8387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b654dd-d499-4bcb-4bac-08de653d74be
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4542
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Feb 2026 05:06:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19464

This patch series updates the audio firmware recipes for AM62DX platform:

1. Adds a new PCM6240 ADC firmware recipe to support 2 PCM6240 ADCs,
   each supporting 4-channel recording (picked from scarthgap branch).
2. Removes the TAD5212 DAC firmware recipe as TAD5212 now uses a dedicated
   driver instead of relying on the PCM6240 driver.

Testing:
Boot log demonstrating the changes:
https://gist.github.com/paresh-bhagat12/7cf20989320bf06a3e72dfe69fba071f

Paresh Bhagat (1):
  recipes-bsp: Remove TI TAD5212 DAC firmware recipe

Vishnu Singh (1):
  recipes-bsp: Add TI PCM6240 ADC firmware recipe

 meta-ti-bsp/conf/machine/am62dxx-evm.conf       |  2 +-
 meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb  | 15 +++++++++++++++
 meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb  | 17 -----------------
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc     |  2 +-
 4 files changed, 17 insertions(+), 19 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb
 delete mode 100644 meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb

--=20
2.34.1


