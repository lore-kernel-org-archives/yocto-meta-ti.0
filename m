Return-Path: <s-joshi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77037CEBF92
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 08:24:58 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7972.1763454278819953353
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 00:24:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=gTxCEzp5;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 40.107.209.47, mailfrom: s-joshi@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cj6lCg2U4zfswWQ4qUZKR2u+DSNygnMsUq7dfe6lvVPqRTCBFSUVFPBrP7P14Qvt5BA6B3MpWKnZ9SuWoaZmKKwc7OwIiwG7OuNQ4UpIdQ0yx3EyZHR7XcV5K62NwJBpnWx/QmAGnDP7mJS3r8UGomQyn2ci0QBxu9xx9cUaX0bLX/suvxrv/rp8XnszTXiDjyobSn3fT8CeWxQhzP72Dxt+Lmiqd1wGtVMuyZ+PUkuWraJkrBXhY5R2k65CqzCjkA9EJom97Wb+xFh/jsBwRdwqlTK2oGig0QSaMpraJXJqJKMRslbNhvybu8vPTRiHCNhJLb1dhTLvKT1e2IPIOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9/T87r/a1QkdJvlGAfMhC92KqILN+JOclKEG3ehOd0=;
 b=Xk2OWPQsLgfDePSDz9v5PM/LJ9orAjutxwaAmx/Z2SdFdl0yWHbSdVPuASFFL32HUHnixVUybsrJpvrsFwQI9lIEsPEzsvsk2wHwaSyq8w4fpOkp8djHFg5iM01X7QjBUVhrJ7hwhdFvWbK4jElyfy6KGrutceUKjLnb4qy4hW4rZWMCPq9kvNhfMeHBQu7hx+BuKqfOwtvgUtG/dWvkLM1FBY+Il23Ub0rDv+MJo62gg2C1DTscmaYHZWjVX0h/llYkNkIZVA9dODCmEk4TtJvzx/8QDpYgAxK3X7t8KGORC+jFTU2ExSJH7D2IVxKRsdNePFIYQ4ZKVMH1uW6dsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9/T87r/a1QkdJvlGAfMhC92KqILN+JOclKEG3ehOd0=;
 b=gTxCEzp58uahpDFr3gAKUI0fsdEKC93CsPozw6ReKfpBp5cIZMny0XKYGam6GPDs8HobdcaWl91rHzkCfvcDj9kTSaEfNuHuU/6AKt8v9u5mvUWjsJyafuiWpkIDIngTij/dHC4vft29tgqNDnFfAZLZEQTptkGMw54zRVZ2AcU=
Received: from BN9PR03CA0208.namprd03.prod.outlook.com (2603:10b6:408:f9::33)
 by DS0PR10MB6749.namprd10.prod.outlook.com (2603:10b6:8:11c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 08:24:34 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:f9:cafe::8e) by BN9PR03CA0208.outlook.office365.com
 (2603:10b6:408:f9::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 08:24:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Tue, 18 Nov 2025 08:24:33 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 02:14:25 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 02:14:24 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 02:14:24 -0600
Received: from localhost (ula0507357.dhcp.ti.com [172.24.233.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AI8ENB33966318;
	Tue, 18 Nov 2025 02:14:24 -0600
Date: Tue, 18 Nov 2025 13:44:23 +0530
From: Suhaas Joshi <s-joshi@ti.com>
To: Andrew Davis <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <kamlesh@ti.com>, <k-malarvizhi@ti.com>,
	<s-tripathi1@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v4] meta-ti-bsp: optee: Ensure
 libckteec.so symlink is installed
Message-ID: <20251118081423.rcmoe5ouduhfq4od@ula0507357>
References: <20251117083407.3719468-1-s-joshi@ti.com>
 <9af153b1-6ce7-4677-bff9-6a06cfa5592e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9af153b1-6ce7-4677-bff9-6a06cfa5592e@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|DS0PR10MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d33b4c-54df-446c-8608-08de267be751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1NQiB70QLVyP2KJIEnHZvl0eZdgzBiuv7avI/ihGhoPEgVjD8bz+y1UZzfwP?=
 =?us-ascii?Q?M+9SFHrJ0rLYWByS2XSMG1jA4cy0yJfDiVYN7IYHYrZ/x9wjfYZvJvogNrIu?=
 =?us-ascii?Q?3ZE4keu1sENwzQNFDupzVK8vg85FdpbSfuklo5FVnkyGTEOV3RZiOSr/LJh4?=
 =?us-ascii?Q?ELcxKGdQZh2hRFXcmik1gqFaOLwKGN3jvks9dIx/oHDJEyQbYnLi3CVaVeQl?=
 =?us-ascii?Q?ze8NQV/TJ0C4YAnuBjr5k9AweTqgTYpwZySsO+lUpnRQ9QkAk72kLff3wFlO?=
 =?us-ascii?Q?gF+sI1ZYIT4S6eirCNWyNpGvwsCepfgXIaZBpnTy7qgxXffrQnjc2mP3nofX?=
 =?us-ascii?Q?3OelICCt0brYW9nRuCbzus1k6NXLcLU/UCea/TFhBwfwMJ+Ojq+Mny/myLpP?=
 =?us-ascii?Q?i7j6FaExjJCdWkwToR5afiCpH0v+d/rgsGu9N2FZNueDOSTr82zlT9zT5yfU?=
 =?us-ascii?Q?hPBmJ9ZY8nA+ints2oVYtIxJRT1mB+8ZTt1N2ZJ/4x3MowNk1WNjV2x//GWj?=
 =?us-ascii?Q?pEcHZGFdjRA506myZYnrX3Y07OzJ60Tw41xJ6nB37kfCZVSNgsnc75o2tvRQ?=
 =?us-ascii?Q?Nm6Q5CuV1bfYjuuyQT/pdeZBFRI31KchBNo5tjVnCVVA8505yIlsXT2LwB1X?=
 =?us-ascii?Q?M3mw+3hWLlDn/+ghs145Ic8J8hXvBTYxYEHG+XKVpeGVx/OsHLhxMCTinQSV?=
 =?us-ascii?Q?S2WKOlZVNsAsUQu36S4U8iEkOHOi/zEykCdUfRPUx1A2lj3rYfnElg+QeToI?=
 =?us-ascii?Q?LmXlFZhecyk0pNLzFiWAxoMJk6LaeHqLTx96nABNBW4CXEcWyoU8ZcSnq9OR?=
 =?us-ascii?Q?P4ZHIr1J6nCHo2WFsMPJjKRsELhW073dseuJ5xnfk8vPJLhWE9zFdUqpWHSI?=
 =?us-ascii?Q?mfjpSwk+/m/EWBoRWgRGGV7OXQw+cMBu8ylwwmQTqroSa94MA90ygw670fqB?=
 =?us-ascii?Q?92PbIQ4LyebLFB6gE6KTT0Xa1RgfxT1Avagyoj+9+Nez8+ju1dyVjRaiHX8O?=
 =?us-ascii?Q?rwfZHSNhavEF6q4Ub4QOue+jhpsC83sn1tI4lrc0rZZP6SVWBax/GK3Q9OMJ?=
 =?us-ascii?Q?heq9BW5taAhthY8VDuqFOEPLFzdtlXUesq9+kYWTWUd7t/7hbUAviNTXaDOX?=
 =?us-ascii?Q?/d9NKWX/M9nSpb99M6gKJ38Sk6ad2Vr/MwPDw3DaQI3m6h3DYU9HSqEK3Pe9?=
 =?us-ascii?Q?ALCPD+tTevhT33kOzG+YmZghZ8aNsP11cgb3Icz8MO0AfJi9s7f+fVyk4Dt1?=
 =?us-ascii?Q?9PYYig/1kIcQGIyo8gflgiQg3mU0V2fw9WbO7vmif132qH2+n+Rn4TOODQ2k?=
 =?us-ascii?Q?jaFoimb/+BYVZVdzG2sOZdzLgBE6tKnAzI3JDqCAtIVNBugs4Vm6A0fJzFUf?=
 =?us-ascii?Q?MzGZ1XG+ItFRN+8UA4CrBCmxCpXLSwlzsWUgg+2IkmmbXAEEC2XwMX8Vhxcj?=
 =?us-ascii?Q?DSa8JOIL4+6Vgr+CAz75qFigzY5avB+0tTh5eqx8Oj7hDi0GBdRVHyR++7ch?=
 =?us-ascii?Q?zVP36Eei0h0AOB9CSb04k6WYwhMzsnCvhr5DjVPggjuGo8gcm51BgaQlHTpd?=
 =?us-ascii?Q?hhAa6QNCoqQpBSzh6jE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 08:24:33.5676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d33b4c-54df-446c-8608-08de267be751
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6749
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Nov 2025 08:24:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19285

On 13:06-20251117, Andrew Davis wrote:
> On 11/17/25 2:34 AM, Suhaas Joshi via lists.yoctoproject.org wrote:
> > Presently, /usr/lib/libckteec.so is not installed. Instead, the only
> > symlink present is /usr/lib/libckteec.so.0 which points to
> > libckteec.so.0.1.0. This makes OpenSSL commands fail since it looks for
> > /usr/bin/libckteec.so.
> > 
> 
> Seems like this would be an issue for others, have you sent this fix
> upstream to meta-arm?

No, I have not. Will send it soon, once this patch is accepted.

Thanks
Suhaas
>
> Andrew
> 
> > So ensure that this symlink is installed by explicitly adding a
> > FILES:${PN} assignment.
> > 
> > Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
> > ---
> > v3 -> v4:
> > * I realized that libckteec.so.0* and the PKCS#11 TA file were both already installed in the SDK.
> >    Therefore, in v4, I have removed the logic for that since its redundant now. CFG_PKCS11_TA and
> >    CFG_REE_FS are enabled by-default.
> > * v4 only fixes one issue: the absence of libckteec.so. /usr/bin/libckteec.so should link to
> >    /usr/bin/libckteec.so.0 which then links to /usr/bin/libckteec.so.0.1.0.
> > * Link to v3:
> > https://lore.kernel.org/yocto-meta-ti/20251113104522.2443817-1-prc@list.ti.com/T/#t
> > ---
> >   .../recipes-security/optee/optee-client-ti-overrides.inc     | 1 +
> >   meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend   | 5 +++++
> >   2 files changed, 6 insertions(+)
> >   create mode 100644 meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
> > 
> > diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
> > new file mode 100644
> > index 00000000..dd6a9d01
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
> > @@ -0,0 +1 @@
> > +FILES:${PN} += "${libdir}/libckteec.so*"
> > diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> > index f193e78b..0cee127f 100644
> > --- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> > +++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> > @@ -2,3 +2,8 @@ OPTEE_TI_VERSION = ""
> >   OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
> >   require ${OPTEE_TI_VERSION}
> > +
> > +OPTEE_TI_OVERRIDES = ""
> > +OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
> > +
> > +require ${OPTEE_TI_OVERRIDES}
> > 
> > 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#19278): https://lists.yoctoproject.org/g/meta-ti/message/19278
> > Mute This Topic: https://lists.yoctoproject.org/mt/116334516/3619733
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 

