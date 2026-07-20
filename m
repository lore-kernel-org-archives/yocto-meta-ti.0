Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E95C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 07:15:01 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3541.1784531695034304836
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 00:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=lmNHcOTL;
 spf=pass (domain: prevas.dk, ip: 52.101.72.21, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S71o7w05arEwORORHcsWZYxAGmaVEYD4tjjxgTg5t0/NsMnJq+WhTHuMHqxpJsAQRbRVZ+mj0baXSeYjJVlfctCRr4VgHKEviGdfA9YKOHIcpjFARHv4rzCnUslC5jLElm5o3NZ20eZ+NN+vW6b0bokz6bJDkrPIXumSK7n1lEu4Vo5j1C5bdO9mw7e3wVcVUGPO56Hi4dCqKP8/az+GmRBI2vEpiwWnKkQlDIbB0yQLsZQU1MxquadZDqU2XpEaI/3ROTocIySw29A6n79NhrTel9fKzhZEk/1VmFFkZEEDX0rkSYKgSgEwh6AdCxC4S1teQ9X3fAAQawrVbSs5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zE7/Jbr8Cze4xKVvZ4uMUkLbGjag1DKrLg9jwNf0Rcs=;
 b=nGrBvTooxCeYTx5Dstm42jMNNyLkz0gb7ll8x3khO3W7ID8K11oQcvBS1Hf7+wWZV26lb8vbENqiyEsunhnbWroxES6Y+rfqPFc+YNW6+ab/Nxg80m5HpvobCw98XpBEcrjfMSJTMAjymr8XRW8fRDPoIduNurWmBcb5xgeZ3sjmp+MfX4H56Ks8+rg11mw9uHk3c22nnM2ostqKMn9RIBM79S+8spqS311oSLckC1RtOCfVmZtlGpQk/RwA4+sif2CfHnvtQdCTX7elWKBP+1MmyQf9yzDA8M2uXNkDBOisRF59ShT8OFjLYGHe+NADCYkYlWtRbrGwF/39NxJ0cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zE7/Jbr8Cze4xKVvZ4uMUkLbGjag1DKrLg9jwNf0Rcs=;
 b=lmNHcOTLPOJl0/hJilnl7/loUaanom1s+ndnCyYbCQaTSrsfzOZqFkBoxUD9Qsl00DG+6uVlx52/I/uMYzOkgPuSmlbTCXflu3mFaVZSkUxFNPi1ce2JSM4XTAMGk+rx6+696saPQWve8UtcIetIir3tXOwyL3tVRrrG8tDFIF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by AS8PR10MB6602.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:567::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 07:14:44 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 07:14:44 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Ryan Eatmon <reatmon@ti.com>
Cc: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH] mesa-pvr: correct INSANE_SKIP for
 mesa-megadriver
In-Reply-To: <742aca9a-705f-4b52-89c4-c028eca51825@ti.com> (Ryan Eatmon's
	message of "Fri, 17 Jul 2026 09:09:55 -0500")
Organization: Prevas
References: <20260717124847.2123825-1-ravi@prevas.dk>
	<742aca9a-705f-4b52-89c4-c028eca51825@ti.com>
Date: Mon, 20 Jul 2026 09:14:42 +0200
Message-ID: <8733xerv31.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: CPCP307CA0008.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::10)
 To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|AS8PR10MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: b6137d28-e648-4505-7fd7-08dee62e92a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	sWQDLXYG9Ka+bvVw/ndF7C7+j0FKvVyUZefLF44x9Dt3E+yNSWuGEDp861H1VQXKjVpB3G+LVuf4uFnk+Y3I5uuzmUXx73WEJiulioqzhH+BaoyurLX0uGirdId4801SteLHUyBbBfqMzgtAX0rHEE43zyUBXuflg/e1x/xSz/5ttidvXopJmZfTUH3M/4NkOyt89QJtDusuRIAcc9NQi6S7eMk4ykNkHO1OXKfRfvG5YzynfLElNvZUGFgr+bjdZK1OVD1+gFm0ekDIUHIJDIECHiokJn7j2vuEeTpgZvlMVVC3jP608fgpbA74FJZCHR7IBWb5h+z9KkI8aMXLK4f79uEkD6A6ImPdYP0V0hBM4UzqFyZcQtAQs71td6P2C+7WeXJCHc5m8FGFHzGO5bFvMUzuTbAvokRFgHpiOCC92K1VUMvys2x4nz5yxsmcUsnH3C/1x1zLVjg7PLz7P1OA9ASroPSd9x06YGAASvafmHsV4YtP4DgZHUpQZyGn9jpQyFOicBDpNR4PWg4pBg15ik4AogdVU0JTYPz+hqrodWtlAtSf+aYggdBUy2ADweTe0bRKvl3qDB4Vgz6f01CZK5cGJMdy4S+Rqnak9Z3KXzyEAHDQ1rcF2iHV8ks1iI4wzaqGQeDk73W0cGgMFFadFFcWRf1hmrrNHvISAqc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nBE2/jDVznodhBS7R3VvMfz5/w9Ldxvi29K0E/MrEhNbw7t8m5sChwB03/r6?=
 =?us-ascii?Q?OZ6Oc9wB5iPRDw/A3ABtsr9Kkm4i3AbBKF301MgZNtJ9JGLntsRF6rWzUGlT?=
 =?us-ascii?Q?4wa3SJexwj0UJyqOfSxGaHteN08+h3lQeADKnGyBUbHaKH2snWWWHoL0cqKl?=
 =?us-ascii?Q?SpIgoNA5ptyPa8evQQ3Jn//ocMQMLIwc/DSaPP9/oUU2XBmfTuaBQWTC5XTh?=
 =?us-ascii?Q?3mQoIJqqWox4BXuFpiMGWcnBxNDRlaJ5yWOxDbMeKpGgnzt//13iHlvrvkSi?=
 =?us-ascii?Q?qHs3gqGcjNjFpgeq8fmW+vwinffDpmBq90ma9IM2lMoaiMYiX5jb5Dxn/oao?=
 =?us-ascii?Q?u5vB88qZs3m4W6Fm9+dzWT/Z42+YKxG7ZoHuWolv7rHxD5qyTzSRRgBqp62a?=
 =?us-ascii?Q?38ix38RrKndTTDUMzVFQsYQ57FN0mLO5WkNXunvQDGF1Z15R24vRgQ0e6WiA?=
 =?us-ascii?Q?W8xGwfcGq6wgQL2Q9BeobMNpvkHJz7yr7BmRfwYNY2QBNe8MMyR26+LXQHHj?=
 =?us-ascii?Q?Jf0rED2ohKl4gzQ8J4MbhtOZqZDpNKnmk6SFAalSeoF7W1dPDEUNxinol+YO?=
 =?us-ascii?Q?9WENbKQv3hMJGZmrfXf05IabmMezbLI7YQ/bafSSaLun4WnJc/8IN+g9Q2Fg?=
 =?us-ascii?Q?/CvQFLrGN/0zHKZwFwpTBxcn38egY1mIPYPyuMSRWcajFur2XVEadXllHvVX?=
 =?us-ascii?Q?xp7zzv/M0d0vJq+hPsUaQIyaYOd+qvn1llLR3v5pU9NeIYG63IIrO0Xjn9O/?=
 =?us-ascii?Q?+YXkOPfLGWr3FEW8CoyqkWZ8KiQWUMeDvAXlpNjErFaIcJI5XHIUkQgXVmXI?=
 =?us-ascii?Q?PhVTqrW9jIKqsfM2Cz+lwntP5CdxvmAJ1NqRjYNR4BE+P2MhlpFbkoVQLtyo?=
 =?us-ascii?Q?ES8vTvwPMfH2gXLbsnVVQCmEvLJQs26PvhDNv0XH2qMtTK4IiQxOddjIGEIh?=
 =?us-ascii?Q?CJg8DlMc//XsfTzeuurXmHH/lKL3c0Lr2pkPxxphe4vWutqc13pXbzpxreoV?=
 =?us-ascii?Q?XcVNO25eCzbE6R4EDonIldrqWuF/g3tB3TBInxg21WVJGChki1nBMgIt3b7v?=
 =?us-ascii?Q?ZnVMMjdYkqYwmZrLw+jSvNHisW2Brmu+r7H4cv9XihEX0DAC5nPzqmqxoU3Y?=
 =?us-ascii?Q?SLcfT5qaTg+MRNisP930PTGcG5lCPreIljOSgU5MMKD7gyykKMX3HajsRTzX?=
 =?us-ascii?Q?/ujnCjzsgmEpeQQmdRj06D/l9I0dp/IHg82AGNlofceDLkwHMJy6y7e8cP/+?=
 =?us-ascii?Q?iokQtueCo7wsYly3EgnmcP4qH94qlUq65rMkNJHH/Xpq9E/USh1aPjkAcrzU?=
 =?us-ascii?Q?lx6h2O4/bz365/MF89bdmcIt1J11PmB3HsYfENR+B3ec393ksGwLFux+Ka3Y?=
 =?us-ascii?Q?FJGRC4daYb5kX/dbq3tT909fR751fveSMbJZ3DVnLUX5RHcxFAGkuPewc2WL?=
 =?us-ascii?Q?hAShQsI1ylJQu8cAmiTTBXdC8M7+43w1xNbfh+bVkl5MmHjQn2GFu1RgztJc?=
 =?us-ascii?Q?E8Pc6nCf7feA4bIhMMTR2tcJyr9aLJOwMi91ZHk8bGITmyYHss4Qv9z+JOvM?=
 =?us-ascii?Q?hxNEzFdxhtuCb4sJe78x95x9gtE3Bi6jMoAZEVMkNYUPHMw41+VP5r3JrkZF?=
 =?us-ascii?Q?cnkhKZVbGQM0DRhmtyXn+8v/ksY/tTVwqwuHqA/1abHF0BJJpoaAv0+EFzEL?=
 =?us-ascii?Q?ZmtmhmEfT9zqVtf2PXaVOHrxo08K4Cg/y+gJGFR75A1p0eaaVfma5Wa5J/OF?=
 =?us-ascii?Q?U8OFtJ38c2ZYwIql78K6pP5icCxSEss=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: b6137d28-e648-4505-7fd7-08dee62e92a7
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 07:14:43.9395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOcXUc2AnjoUxg6ZQaKOzaxPQw/Qooud59wRV3Rfq82GHmY/T1OhI94XHeKvNV+o4BpsTljxTzSePROBT2mZQNwNfOEIXZx17MQWF/PBv3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6602
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Jul 2026 07:15:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20167

On Fri, Jul 17 2026, Ryan Eatmon <reatmon@ti.com> wrote:

> On 7/17/2026 7:48 AM, Rasmus Villemoes via lists.yoctoproject.org wrote:
>> In the original file this was copied from, $PN == mesa. But in this
>> context, $PN == mesa-pvr, while the PACKAGES and FILES logic still
>> explicitly refers to the mesa-megadriver package. Hence the build
>> fails
>> 
>
> Good catch.  I wonder why we are not seeing these QA errors in our
> builds.  Are you turning something special on?

No, not that I know of. I hit this immediately when trying to update
from whinlatter to wrynose, but I don't think we have any special flags
set anywhere that should increase bitbake warning/pedantic level or
something like that.

Rasmus

