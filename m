Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95459D26D6B
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 15:49:20 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12945.1767973759366542596
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 07:49:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=kj/5shn0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.41, mailfrom: nm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8ZePGteHzhIph+l4Qmb68hZLbpzBZ0QwFweVR35Ys/xjvcK6hQ01hIzf6xo19JC8WJc6DDnL3aiXEC6VbbSHRM0cxcTDWb8ULDVCpnYZVvTKV/2NcPPuG1lslqRLarJArM+BHERV1OUtC9xS2YlrCXgZQPb0ugeE/vEHTfhmgwwesVKngcSk8CAW29I88EQYFsTtirwU9C1CLatAL+jv+iE9yvUjJ/9utvVtGrSviZB9avcRCiBBoygPmUtDoWO/kYSyvHDRyTjWsoniRL31CXZbI5vBj72ASOmwa3FQq9EA9Sgo3ndovVPckUlTP0keSDV0qNd7+oeRSidAJ4+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RE9lG3or6gPXoITJlKd6TOlYLSRW+soz7+p2UOc6Kwo=;
 b=qq51WFm95mkwGp+g1KGQ2G2EnBXN48zNkmSYZL4valoTLSWQE+ZPiIqPCclEZPDNfWy+K9V/dxa4N6aVaZ70NmbkVQUEVK/x6KG9EGRi9scl+0t7LGTmuuRKxwDhQbFMHy+EfLJ5lsNgx102bRAJqwsatZBzISqgW+d5XrTnSlX+9adRODUWlR6kQgozbFwSf4LzzXptBzJVsIu2QJnCNLsivN+KXWjloH7AfnXUtSZ2sAJsI6lT0+4ddWHjNW64whyJiUZFmXTfd9LjvVliE+UYPR+fhVbtvweFQMJYJQUu0GXoomGq4QfHjR2st73UJCzpkFKi2ka6IugmUOFCpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RE9lG3or6gPXoITJlKd6TOlYLSRW+soz7+p2UOc6Kwo=;
 b=kj/5shn0Gi7nv5gROJ7oG0LLdecdHfKOuvFKpVhQuHwda6poiubma6m29xrcad7grqf2hyhQ2meLZuYXdIzfb11WcaUNPYAYlm3vVfZTORGWw3aq6RcwpX9fORUAkOjrRR4Mmp/UN0isfTnNZPB49MuKENHArd24DFQriRgOUAI=
Received: from SJ0PR05CA0118.namprd05.prod.outlook.com (2603:10b6:a03:334::33)
 by PH7PR10MB7009.namprd10.prod.outlook.com (2603:10b6:510:270::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 15:49:17 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::12) by SJ0PR05CA0118.outlook.office365.com
 (2603:10b6:a03:334::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.0 via Frontend Transport; Fri, 9
 Jan 2026 15:49:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 15:49:16 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 09:49:15 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 09:49:15 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 09:49:15 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609FnEdG175139;
	Fri, 9 Jan 2026 09:49:14 -0600
Date: Fri, 9 Jan 2026 09:49:14 -0600
From: Nishanth Menon <nm@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
CC: meta-ti mailing list <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] These days, what is the most straightforward for
 building core-image-minimal for Beagleplay?
Message-ID: <20260109154914.ev6g7exah2suj44v@scalding>
References: <5ac19ff5-d52a-851c-e4a9-4f99c2efbc24@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5ac19ff5-d52a-851c-e4a9-4f99c2efbc24@crashcourse.ca>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|PH7PR10MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8c3d77-cc44-423f-8dca-08de4f96a519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?w4Y0SE0aYSt0Rdmf7oTOTejLPYlfC+I5IVP6kpo5MtBkm+Fpah4GJ1bYKch0?=
 =?us-ascii?Q?UE+SB07yMjTFu5PfcQP6SEhmhN0Z/rD/iY4SQ7CsJhHcibN7v19b13j4mKxl?=
 =?us-ascii?Q?AWbHHBO8Phk9la62BK5ryZ5Arq8pGn53shFuQTnC9U+uUBBul9UnO+JAZoFY?=
 =?us-ascii?Q?EbASyeFstxeg/fWDokT92x4UxDCqRkTorDXl+ldqfRCSv4FbtSkLkbISb2sJ?=
 =?us-ascii?Q?pGNm+mvkObNMACpTuAr76+QlWozsAhgILsjTMiUUc8MwTjUEnQJYL5LWKq+Z?=
 =?us-ascii?Q?uxGTH4F7legiUlvwU+gkrnGAHfhe7ihGGcPr4CQwKFgJcSaWvpuTeF0Q07eV?=
 =?us-ascii?Q?hhU1NQ9it/hYQn9dbunSvCh7yhTks44ipVK444bzstKXPZjky9ItGXVpkZ9X?=
 =?us-ascii?Q?gxsY4TwlIBP0uXcBARyaO59RIW9J71LHFnIuspS5Z+zzm3cYhh4iuWOU7Fx2?=
 =?us-ascii?Q?8ePhh+tOo7TEXTmOd0nJwpW+Gz26DPxmULo1XUmceRNjOrqHd0dWG2gruurf?=
 =?us-ascii?Q?NIQsFz6Rw2QNKUVikj2q86/QGMq2/hy9QTXI3pLrE8mI4jG9dXXFlh8yTNX9?=
 =?us-ascii?Q?LV+UH5TwoOvLKTQ8XPymqyJxtRSGd5QF2D+vi4A0dpGhXo9rNDF9CCwn8Coo?=
 =?us-ascii?Q?cC6Rlg7rLSbM8Wn2yzrcsNZIcf8hLCsFYebiIHs/flIG8aAAHSSC44564Kbx?=
 =?us-ascii?Q?IUhCIYl3sONxvZBcEs6v5AsFIFXl5MUmZrWXc0uv150Mk1KlQUvTLJk4rBy4?=
 =?us-ascii?Q?dgkWOKYY3tMhAa8Er1a6cdANEj1DHKjemda8aFG5aPAPISgH5czy9qNIrr0w?=
 =?us-ascii?Q?ZlsgV7xK5h3lYop+e8haFiIzOTFyV5GUEKGGBUGbo5kCrs0UaZS/wyCgYHxY?=
 =?us-ascii?Q?wjLt8EUNg3qTKeRsHbDVsCS/u/PXBGgAQXt7rgQfMAdbiqj59/6og8OOXU8O?=
 =?us-ascii?Q?P8dh/2nqjCuoz/jJkfaJsYeH7YPHeHqFGeXoH2Jax/ZWADwo0hUj5bO3yFER?=
 =?us-ascii?Q?C7w0cfQSQDOhU6EdPXHPE9hHU8w3+PuNSZWx1SQ02+cPc2IAKvjah8Uqk2EK?=
 =?us-ascii?Q?O4aQEbslSiZ66ip4/oh+6XrFgkyGc1vY78OrhVtl5aKMKkXqiyVMV1UGx9i1?=
 =?us-ascii?Q?6WcLRCIYUmQ5TLKdmqu3i0njL5mcAFKNVIEWlzWpwuvTkp42f87IDN8jpJ+V?=
 =?us-ascii?Q?1GHVAPAmCz9nbEaUDft9Qis3k6tuGMIT8ogY1wY/gU8+UDV5w0zAaWUl/N45?=
 =?us-ascii?Q?A9JNphxD7l+E5DiIjdr1B1U1TTxhJQ2aq1PZLM9hlL3jJd4Movs6CKMqsF+J?=
 =?us-ascii?Q?Y8FZ6vrxX0keKkR6lMPmulOD01Xc1wX3T84bUJrrVoEnLIamobj7KuLk5KGq?=
 =?us-ascii?Q?tSieRBcb23Gq+bOeLrpo/dLyppM0NzxUf2a0I5njmSB457XpGfDDfcZ2um5R?=
 =?us-ascii?Q?PUNKYk4SAsyAZ559uwCvmgwtXm93m4/U8R6CwCYDXrmnXgEkR1vUYCUxXHmn?=
 =?us-ascii?Q?wWzINEZ7fbEfNg9mWI0oz1f4vDL2SQfNaqQmEJYXLaWT4cXlp2d5FeLWMbS/?=
 =?us-ascii?Q?1DJWE+EPLi7SsdDcnvY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 15:49:16.5483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8c3d77-cc44-423f-8dca-08de4f96a519
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7009
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Jan 2026 15:49:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19397

On 04:44-20260106, Robert P. J. Day wrote:
> 
>   From what I see in the meta-ti layer:
> 
> https://git.yoctoproject.org/meta-ti/tree/
> 
> the meta-beagle layer has a MACHINE definition for beagleplay.conf, so
> is that the "obvious" basic build to get started?

if you care about pure upstream build..

genericarm64 has beagleplay

If you need some kas yml as reference: https://github.com/nmenon/poky-imagination/

you dont need meta-ti or meta-beagle as a basic build if you care only
about pure upstream build


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

