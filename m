Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF62C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 08:59:53 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7402.1785229183719688640
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 01:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=dbzxuVNg;
 spf=pass (domain: prevas.dk, ip: 52.101.69.48, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMxikaIldyfQwXqh3H26h1jNMwJDiZ+4OFaWGLjle3mkq9z34X7NDOVdKC17VF+aC5QDMxz5iNQzCWed2lWTKwZczxWxO1iF5kvZg3L6PYhSrmxSvoL+w44iI95nV02E0RBl/iCiH8FD+esmHen727LQRDP1cXBfvujObqLRzPihRKgOndAjZ4YfS1Dahxe+7kzuceMpMnhu9KMcttdw4H2dVf52L4Cpt59v1GXitOaBXqarMS6bi/54wSU95hPZ6AgoMRqPXQoZ9Yi1jPLvDoQlu6S8o+dfDGmooi8VGjTes6gCKn7IPcOsY2dZ3aAIClawfhpn8Yv9MlSzJe60fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+OvnjtxNS+OIGsKrAdbwWC2FjNUbaHLtPz/40IVSwY=;
 b=UIhFFLCghlZh82O5BDZcKmYFzhXft0ur04Eb4ZjkAlanetY8jsr6wBjB1Cod+K6njKDwhIdSYflbBICAZy+rx18LJhe+WBErQwBxSlqig+3IyfKbw5jyhVre33nhYu+d+8LzfMdGVa3jDM5cAuwagR1NskbnZXo65vQ4B1m/Zd8T91+03UIXVOgqfBecwyCdvRjD91Oi0X3w8wn+hnEFtdZW8vIxpba6yrK2MOwFNWT0lC9FAWKaTEb7r6Swd24ZZ5+qr01frNhU7XKDAZe+Q+grTzOP6976DXB7OQc198SeL4+cFxe9dzt/nKUq+J2/00MoXmuyfjt1FjFeBlZ96A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+OvnjtxNS+OIGsKrAdbwWC2FjNUbaHLtPz/40IVSwY=;
 b=dbzxuVNg9OT/A+1g8w4HPlviWsJGEhUZiwbWAhUsEYGLmYcl2WMEJGbsS9/59+6qvlp3FHofe9m11NVc9NdkdnCQB59tDKfki+NlfVqQyWOubngDHmActgWLqCSrlPMBTT4YJAskK2Z4jRWtB7qo9jeJ6xs3v3KNBeJs329/ggc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by PAVPR10MB7444.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 08:59:36 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%6]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 08:59:34 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Ryan Eatmon <reatmon@ti.com>,  <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH] mesa-pvr: correct INSANE_SKIP for
 mesa-megadriver
In-Reply-To: <20260720155303.GO10186@denix.org> (Denys Dmytriyenko's message
	of "Mon, 20 Jul 2026 11:53:03 -0400")
Organization: Prevas
References: <20260717124847.2123825-1-ravi@prevas.dk>
	<742aca9a-705f-4b52-89c4-c028eca51825@ti.com>
	<8733xerv31.fsf@prevas.dk> <20260720155303.GO10186@denix.org>
Date: Tue, 28 Jul 2026 10:59:32 +0200
Message-ID: <87h5lja3rf.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: CPCP307CA0008.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::10)
 To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|PAVPR10MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: d7e7fade-b3e4-466e-6fd7-08deec868b12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	RUXqJGxM3vSgn3URjSlAMMk3qOXYW/ooFID39txhadHWejxONxFZ7OfI7IUXApd95S4tk4oKDwvgcJ6lEYAEVewSriKIZLj0c4K84+gfB3TWa1LdhEtERrLBxzlai/jQCg9hIdi0qCpISlfarK2v1RsMHz0MJXzzq+ELCO/r2+/OWoWAMVH5WD84yskOXEt4Q93bW630vv/bY8rLUna3mqQTvg86YhzGGmJx4Tq08N6RI2KgzqPAp0se5iBxVa00hZH/hBgpOZ7BT1Jp8OgkWzpaCXvpUkIQ1zQmWPPajq0MfiLZ2IkuvcyjH32ZEIjPTq6QG6SCGcqlpgcrAqwoSvIRnmCeDgcGDwvB6r+IbMYpn8UBI+NSL/Gbh2EzWoG6VVQGGg9nYarhd1e6/KY222ZWZkbhyIx7Dwck46JhCBucmEVrtGUiY8qogC/5C/9elhIyKsy0G6LQM3XFNQj+1ViS88VwJ9/uhX8t9PzRbccX2sRsF3gK5rjZ0hSWdb6H15h+aKoAtfnOz/711u3uzOV3OuoJnvVkM7GrLOUq6M6JwLPnpSIxpLmXTWtWf3sBrQGSVjHEtKFEfVK9rMd4vJ38i0cFQja6X/Qybfuv+2jkSZn2qbijxcckuV1w1YV+0pSMqFnhtFAH872v8IsLXom522x8ZRI6aiqZmcts3Hw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+suk7ZxbVdYWQT1EDdZPEbjY9ac2p1CJZ7d5TitkpWVhCADkA8kUuZqMsMlp?=
 =?us-ascii?Q?uIfKNxRGmAc8shhcDxDD0x95pOUVar8WBbXT6dH6Nudh/GwdDeTVe+N+ibRa?=
 =?us-ascii?Q?kaBdAKh+gKxxkWUPzZ0owf+4H+CnX8Yl+ESNVA/6WGJoYjUp6QJG5qGw0iEI?=
 =?us-ascii?Q?fMKTsLlB+t7kNZ/kieNe/8jKhaJQudwZW2s3AQms0g1SgjepYD004CJWiNrr?=
 =?us-ascii?Q?xSrqJ1VMkts6lJJLpP9gS705OLnsJvVKj8eC3PEss0bXBWrML5q2RnLUzqZy?=
 =?us-ascii?Q?gueu7/6dfRtsvaFMIF/KeAZwfKTCD2/yhExdL9/e5c2GzR3uPLmNLNtwuzF/?=
 =?us-ascii?Q?GkXxaX2xA0FxkuPaVwMH07TG9XF9VEDIegwE2qcGLqaJ5zV5w1Rn/Go1E5ap?=
 =?us-ascii?Q?rOqP1rvsuaeeX85kCQBr/iLple9er0VZLSZWrjtqs5LMCd0/fyIhjVrswi4Y?=
 =?us-ascii?Q?nqpt1AkgUaJptTfwbe5RBTPoK1cYyrUw+EMLs6gQY8FdYn76hKt55/L1fFMK?=
 =?us-ascii?Q?jWBYVAJXJNpc7TqyJAuFXMdHGkQVEibFzKgGgm1mIIvzs5kvaD4/Ewrhh53c?=
 =?us-ascii?Q?usu67JitrLWjVtj7zWlBOU0r4jRoVynLzQBeS6jDWTrfjcXFXETINlGObQT6?=
 =?us-ascii?Q?RIg/OtZl6XhTWHn6dF5u+vJy5J7dtvf4X8YyKY+g6zTSQJ6FvzBJfhPtRKkj?=
 =?us-ascii?Q?IxgbjIVCNEhC7XRv+0pgJXHbA0UQkf8XsfauiFw2pD6IqN7qwTt8lpoKUAEY?=
 =?us-ascii?Q?JAjgXadWJlG8yL4PCvnmSTOv3PC6vZRbZh8U02i3Thwpv7ip4KsY2W7bNpFO?=
 =?us-ascii?Q?tX6hYLSDdUi/2Yd6KhpvCBokzSKL+CEgsFN+mk85FaSNlkIvLtEZD1/VMR1y?=
 =?us-ascii?Q?PeaNHIjlGo8kDX+SQZ/FPUAwLuOtessE8WwvMalnPm32ihschJ+La09L8LX5?=
 =?us-ascii?Q?aCPTWG0QfjE8vFFcc79a1SBRgAglMzQnsin10UD/1VTLRhfJQW8OMdEA7gJ1?=
 =?us-ascii?Q?FLS4cStC33eCmpvldQ/cj1VpJ/yhSyqwHPwqH/vRCc9o1y9UijgGHd+78EeF?=
 =?us-ascii?Q?AAKMSPBotAMtZ7RI+WOvK1oR/lSVTUiSTl82Xebnffb7jdRJnmSxwPMoxCsL?=
 =?us-ascii?Q?/QJiLdV/hbwoqE2I/AXmK2Au6vjfboZr4lN06BMcTlnEUfmCVMU1Y9phycrR?=
 =?us-ascii?Q?JtEnI8AljX+Kbd9Spr8z57EVdI+q/PNnEZ2kxAa0tcU2l8l2vqukaKNFZ+UW?=
 =?us-ascii?Q?cfacN4Tor3xlknTw674xNDPcNLPFa2+NhYJYS6myp4UwlrCVwvOPVwYS+Jmk?=
 =?us-ascii?Q?w1IlPViG7VR0+zUYQP8rHXgjJCYLxaFqHG7MvInZohoZIyOHBQld8rdTORja?=
 =?us-ascii?Q?JxUV2prdfNqKp3PIG+EPKyG8WN1KIKt+QiokZoIbcbFRixoBOqqhU1UlvyzC?=
 =?us-ascii?Q?TxzbkJ54kM/YQ0QgVjXSUhq0wavOJpcbuUhvkFuMJ9U40N3FNlZp68/u7bv0?=
 =?us-ascii?Q?EeuIeYtNvLnuL+bvtzvjTcAyod9tVLGyZz2e6VjX+nc+PPPTIE6rYhvDlPsi?=
 =?us-ascii?Q?R51HnpurvjrPDhVEFmq7tkKRU/oLMLC+CdXzK0ieySjGmoNERNVb81earM2Z?=
 =?us-ascii?Q?eVJT6MRN8bpD85QnxbBGJWGNthTE1ASH2mJcBPwcKFFpF81DJ18pfzwGodrL?=
 =?us-ascii?Q?BNIHAg6AbjzWWsYGQHkmHezF3Qs6U9fYDUl5Rvnnj7qeNi5g294Lew2RgAex?=
 =?us-ascii?Q?p3mmgH05qO3LvFV6//a1gLrT9QHJLwE=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e7fade-b3e4-466e-6fd7-08deec868b12
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 08:59:33.9327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qiRj9YwiWkgjT94niw1/mLNcmvEbNANt2sKU73PYxQvv3UZWRFz9H2vBg5URNBilBak/mfWBm526ZkhXVAjSN97PC14Ik1cY31Iw8HVeSz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7444
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jul 2026 08:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20194

On Mon, Jul 20 2026, Denys Dmytriyenko <denis@denix.org> wrote:

> On Mon, Jul 20, 2026 at 09:14:42AM +0200, Rasmus Villemoes via lists.yoctoproject.org wrote:
>> On Fri, Jul 17 2026, Ryan Eatmon <reatmon@ti.com> wrote:
>> 
>> > On 7/17/2026 7:48 AM, Rasmus Villemoes via lists.yoctoproject.org wrote:
>> >> In the original file this was copied from, $PN == mesa. But in this
>> >> context, $PN == mesa-pvr, while the PACKAGES and FILES logic still
>> >> explicitly refers to the mesa-megadriver package. Hence the build
>> >> fails
>> >> 
>> >
>> > Good catch.  I wonder why we are not seeing these QA errors in our
>> > builds.  Are you turning something special on?
>> 
>> No, not that I know of. I hit this immediately when trying to update
>> from whinlatter to wrynose, but I don't think we have any special flags
>> set anywhere that should increase bitbake warning/pedantic level or
>> something like that.
>
> It's not about warning or pedantic level. It's rather about how you have 
> mesa and the entire distro configured. Because we don't have any of those 
> 4 libraries in /usr/lib/dri/ being built, as we only build for Wayland, but 
> not X11.
>
> PACKAGECONFIG="gallium video-codecs vulkan wayland opengl egl gles gbm virgl opencl libclc gallium-llvm zink xmlconfig gallium-llvm"
> DISTRO_FEATURES="pam opencl systemd usrmerge 3g acl alsa bluetooth debuginfod ext2 gobject-introspection-data ipv4 ipv6 ldconfig multiarch nfc nfs opengl pci pulseaudio seccomp vfat vulkan wayland wifi xattr zeroconf"
> DISTRO_FEATURES_OPTED_OUT="ptest x11"
>
> Might want to compare these to your settings.
>
> Anyway, your fix is correct - this is just an explanation for why we are not 
> seeing the error in our builds.

Thanks.

Any chance this could be applied/backported to wrynose?

Rasmus

