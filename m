Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B879C5DF70
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 10:50:11 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6105.1787050203711494375
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2026 03:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=h+fA7hnA;
 spf=pass (domain: prevas.dk, ip: 52.101.70.34, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMa0igELfkhF6gd1khSSUG9nYW8v5eupolHQf0Ir4uHYJs+t7THoWJHtjAAr77j+Sm+BQghK1w2PPmgiOnPPqfPKogqIb3tpjQQCYAB4ooOWD4psQTpZsJMpqHLaqCXS+1I+ahscHjAOWxeaa+DTu2/RWFo8og/H8uyA1PD1KI68NQsSHX0xMJrvLMd3tGlQxMwamlHrjNiEB0IT7AdcI3y9RSD+iztF1pGgsRnsXuUoJ+ycs8LpW/+3h5hyWx7IaZWBSKzGggNeaTXswWw5MEk8sCZbBPAOGVrnRuq2Z+/WDxBDhjxawFn4H4gSwvMgZp5jaDNTuB1cTs56UpxV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9dksgSTUkyg+DQqIEl5xZQw3+7BEL9vHRBrigxBjR8=;
 b=T625/x2JYRRWGLpx5RYpoFfxzWZ6udWXXvRQSW0dtxHOj2PYjM/PzrSuFrM4iTM/sMS6KUl3a8gvChi6P/FfpaBqj5P5KWh51ImBRg5sQnCxGuvea6PM4JQsNf2uPcThTCRMEM8/lKKspAdl3qYSuzmQ+x6CsrM/HICtuy/ijNbo9j44FLZeLCCMvoUdd9y/ceAX0zNR0se0W/iSxZ6/Cc5cEK0LVJ6b8leGlk9SAu47++qTpYXlnqMzXxIlUULrSc/UkHHlL9K/PpwneOtUYbjXhvGk+bH/QsQve1je/SJc3d+qioMoigt13Xbkvo9gcwPj7+mpXf/sIyGpyyz6sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9dksgSTUkyg+DQqIEl5xZQw3+7BEL9vHRBrigxBjR8=;
 b=h+fA7hnAsrk7eesWzkPJ6+C8jCC7pUJQpf5DxjdBopxWAoJ3csmwRG86uxTmOm0GJ1Sr2ElRierjamJTOwJdrqchHrrquE88MX9GHoPy9mj84cwpGcQtSL9WClCf2PHD/yzR/LudCJSWl7epgCWKbogeHsTSgEfLOw0N8fUca3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by GVUPR10MB9895.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:347::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 10:49:56 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%3]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 10:49:56 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: <meta-ti@lists.yoctoproject.org>
Cc: Denys Dmytriyenko <denis@denix.org>,  Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti] [PATCH] mesa-pvr: correct INSANE_SKIP for
 mesa-megadriver
In-Reply-To: <18C6687C7FE0F61C.3010641@lists.yoctoproject.org> (Rasmus
	Villemoes via lists yoctoproject org's message of "Tue, 28 Jul 2026
	10:59:32 +0200")
Organization: Prevas
References: <20260717124847.2123825-1-ravi@prevas.dk>
	<742aca9a-705f-4b52-89c4-c028eca51825@ti.com>
	<8733xerv31.fsf@prevas.dk> <20260720155303.GO10186@denix.org>
	<18C6687C7FE0F61C.3010641@lists.yoctoproject.org>
Date: Tue, 18 Aug 2026 12:49:54 +0200
Message-ID: <87h5krwvn1.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: CPBP307CA0013.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:2::17) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|GVUPR10MB9895:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2434c2-2b13-499f-de74-08defd1670d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	3B1eFrUF5FNTr86bjof/rQGFcN3Yv/izYuSqaiIXKUH7oveVyXqZfdVqLYjoI516LNxtH8hslMvfx6ijGM16gngsWkQ/+S5ykAXFENg0vHQt5ZCpSkf5HA01vf90JX+ECKyncbE5DPWXsjw79DlMyUXh8RqaBSSd14xytyyTH6pDmUaZvdZN9riRaOwdDxcDMBDZCRFoM2M2lisGWotZAg6qzcrlfPR95iH8TXHu2zsvaOhhbnkTvHS5zkbDyWYMK/3YGM1aKsDEJdoOVOETD5y9/hzwZ6PoBVfItv4YZKlG7Ka6pgVIogzjy9VoMzg1vF5kT1je6vAj/6UiY0sQCtsngtoDA9tNQ1HJZOt3xfFbOrPXilNtlPEfnxbXv9dDlojO0m0nTPpiPboxF1hQ300QZSRsGfKAD4AV3oWTHMEj0mJ6Vkw+PN/mVGF9VGHcq6VdaxeZu9YgGJYxW8Um7LgM3cKKAeXIaA5qUWlelABpH0JjS68HF0TwFXhrceXMDgYTr+IpIzy5cec9a0xEGtr7dZ5O3bXkAUI8XEFSdAEiERL7GGIU/l/NAY6+gs/NNdXuQ3cxOJIPTdGWoGud0/E14iKsUVJwfSa2nZ1exMMrQofCh5k2/pjnCKbSXp7RMenQ2aUuh8apQwFuIxAyGzY8+tsj+J4wwbYumcKuqBg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+q1jWBRbKupZ5XDQJwAEcIl2VknvY8QZV/5yZeYDKYKF2T4aOq7lqZxt5e1g?=
 =?us-ascii?Q?ldjTU95rI3YmhSagduU6W9kVXpnfOfK3NtzOPMBjR0CM5u0/XQcbCf/+R9tl?=
 =?us-ascii?Q?MC+8g2rsowQdqkCB8WSQCOIAJUEtllRTRZQS91XVn4PnXaSVu45xRPTLCbxF?=
 =?us-ascii?Q?WhmlXuFTVlairW2kIFD674Apve0aXZqrbRdVfI8vDTGf5lhd7E2qEznbPFio?=
 =?us-ascii?Q?WwtS8c5R3+N9poMT9Me1u6+UhapCfBcfZ/+sRYnNfIwFsdK+QFXDV0DY/BiS?=
 =?us-ascii?Q?uwMI5Vrv5vnm1HCXev3GxQ0FZJnU3M3QeYhzAWMYtIE360bkMXLd+uut25DA?=
 =?us-ascii?Q?NBiqvucWd+C/JO2uvaehIfzyNX8EhNaOq6yrc+yB9anqaeSppHd3p2iIB83a?=
 =?us-ascii?Q?XmnCGEM/o8FzRuIjyyLgT9sKW42cY4Ohl7nWeZJwOz6UZRbFrZNNL4ldp5o+?=
 =?us-ascii?Q?TzR1BUTLq8+uC8vJ36uUQFZaDwOm2UK6y16gQDHXlwRW3tkJzq7eQ5nWNZAe?=
 =?us-ascii?Q?iKnZEhViVB0B2FRGLAuewCc8yNhYE17R9BTrhxuGKvjsreKYRYyeCoBwTfDI?=
 =?us-ascii?Q?CGlej/4Rz1Lc1eR0BTnBYtswhQqLC54H3q507OuROZ5A9hmYEuEx5NB6H1Hg?=
 =?us-ascii?Q?Yw+VpLi1es/nEdHvxT0lCrRPmFhB0SBcaZQdBlhZLqPqNkc73YI/ypi8BXSE?=
 =?us-ascii?Q?GRouZzVi34K1zE/RPK0Q+noio/1xo8m3BfftkN9aYk+5CH6vgZc/8y2HcfOm?=
 =?us-ascii?Q?71wYR2nwD1XiDf9c+I0jqcB85Dt9ayG20GfaK6yHFvfreJFQPbfVWslvgQT/?=
 =?us-ascii?Q?5gqn4nL1H2HWSNO2kU8eTTi1FhK1fKswrrQnr2wyAV6OTxRb2UU9hKd7D/g6?=
 =?us-ascii?Q?06A68E+9UfOH33YVJC9jAklXKiCwV9xIBShnCPz2sMJOv7e8ctA9JhOP4awi?=
 =?us-ascii?Q?UbK+vuiO/ulJPXxsetj5cxQhT1vOXTCeYo/YdTlg6avixQL5n5qCX6DmrAk8?=
 =?us-ascii?Q?u/S2b9pI1to9HtKzUxaVonLQYKKMcCyTb0xty2kZJ4ZJ9/fWGz3OcHVKHYqN?=
 =?us-ascii?Q?pekzEMg7P9jIr5Jg/VUln+Yg2vx3ECBQVfElblYGawzO8AEIZicISPXta30e?=
 =?us-ascii?Q?m2nV/yMvGydJWl/peED7x37Xo6ts3v21ky1JaTC6ixNLZxgJgfArKsyyrF3g?=
 =?us-ascii?Q?guz/6vSrJlfzOTwE/KUmOs/S2MB8qeFmBS/u7A28sxgOV0ak04BeI1/lS4IX?=
 =?us-ascii?Q?MmPjyUtaJF6xCddbOIapzWO20DxJr36BisRz8wcOc5A9PpeW2eduBDk/TEw0?=
 =?us-ascii?Q?4ioo4le4gGSU0bwfbF1VAkkMByU7HOdzcSB266BVNDdNv0sbe2pbCUX3ipHW?=
 =?us-ascii?Q?JPgPKEDu4M0dsH7/EnFGbTosGHfwcreuG8s6h4xeQE16FGoyAyW8UoEH9XG7?=
 =?us-ascii?Q?qOrJ1Bn0FrYJQot3uFYTllC6ljfrfsPPJ/mFPu5FfgKNF6Ga7y97qh+gfJ81?=
 =?us-ascii?Q?k1ar/HYLztc2ldtROMZ+d9rmuaELHcJgF5RnMK7HU/HRS5fyf6YFQAWEsweI?=
 =?us-ascii?Q?aoXR6HXwwApdvpG7xnmUBSbVIR4OvRqoi3F+OLVSQqIrwRrm3lWpX/qT8U4r?=
 =?us-ascii?Q?8UDBQRf9Vca3VPaVL0k2P1ogJSTzk1pd4KMv3V4PNm8vo3rlS0UF0kKH6AAn?=
 =?us-ascii?Q?WDafwZ/hRqoUs7oalE2wyviT/FLZCSTBFnamNesk3Lf4tlZLandgSxSVmNbb?=
 =?us-ascii?Q?gk3rHq6eULMvlK87JktzTM/2fTF6oTw=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2434c2-2b13-499f-de74-08defd1670d0
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 10:49:56.2232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9lK19u5eXXG3P3tsmz3uZ/qByit3xcG/9A0TwFhoegkH2NlnR6ELasXqgviC54V1WQTL7s7bOCsT1BdrQaN+fU0Gs1nkSRvXGElHRoBsnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR10MB9895
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Aug 2026 10:50:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20271

On Tue, Jul 28 2026, "Rasmus Villemoes via lists.yoctoproject.org" <rasmus.villemoes=prevas.dk@lists.yoctoproject.org> wrote:

> On Mon, Jul 20 2026, Denys Dmytriyenko <denis@denix.org> wrote:
>
>> On Mon, Jul 20, 2026 at 09:14:42AM +0200, Rasmus Villemoes via lists.yoctoproject.org wrote:
>>> On Fri, Jul 17 2026, Ryan Eatmon <reatmon@ti.com> wrote:
>>> 
>>> > On 7/17/2026 7:48 AM, Rasmus Villemoes via lists.yoctoproject.org wrote:
>>> >> In the original file this was copied from, $PN == mesa. But in this
>>> >> context, $PN == mesa-pvr, while the PACKAGES and FILES logic still
>>> >> explicitly refers to the mesa-megadriver package. Hence the build
>>> >> fails
>>> >> 
>>> >
>>> > Good catch.  I wonder why we are not seeing these QA errors in our
>>> > builds.  Are you turning something special on?
>>> 
>>> No, not that I know of. I hit this immediately when trying to update
>>> from whinlatter to wrynose, but I don't think we have any special flags
>>> set anywhere that should increase bitbake warning/pedantic level or
>>> something like that.
>>
>> It's not about warning or pedantic level. It's rather about how you have 
>> mesa and the entire distro configured. Because we don't have any of those 
>> 4 libraries in /usr/lib/dri/ being built, as we only build for Wayland, but 
>> not X11.
>>
>> PACKAGECONFIG="gallium video-codecs vulkan wayland opengl egl gles gbm virgl opencl libclc gallium-llvm zink xmlconfig gallium-llvm"
>> DISTRO_FEATURES="pam opencl systemd usrmerge 3g acl alsa bluetooth debuginfod ext2 gobject-introspection-data ipv4 ipv6 ldconfig multiarch nfc nfs opengl pci pulseaudio seccomp vfat vulkan wayland wifi xattr zeroconf"
>> DISTRO_FEATURES_OPTED_OUT="ptest x11"
>>
>> Might want to compare these to your settings.
>>
>> Anyway, your fix is correct - this is just an explanation for why we are not 
>> seeing the error in our builds.
>
> Thanks.
>
> Any chance this could be applied/backported to wrynose?

Ping. I see it in wrynose-next / wrynose-wip, but not in wrynose
proper. This is blocking our upgrade to wrynose.

Rasmus

