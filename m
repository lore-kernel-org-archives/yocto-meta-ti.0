Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B661C44516
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 12:48:58 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12620.1784292536005733494
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jul 2026 05:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=lA7oT9DL;
 spf=pass (domain: prevas.dk, ip: 52.101.69.4, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTMbxlQhMcLaYydxoHKcm3dmHssLmTZPVULe2Esh+LHEamre+r8Ui583VT5vPeVJVOCb9R5MQpShuVa5nnEcM7nlBr8XMKaAh1JzMG6ZSlLcqsv3X3VKWayB/mq5vwVgRwRd4qFzIJqIwBkwI0TkVEVfQqZQWXV/p+q1MJSADyFmxHxAROM3u1FCotQLo/1WepV1i5lHJORje6BsX/7P44CUXONzgTlxxBj5oCsSUNNVEFmFIXpXokrJHIRjfeXrFA0jQZnSIJ3TjAuQfPJ8t9/xQ9oJ14XWe67khJk2IkkrMqAN7WkTEgQ62jnhNSpdJb5onJg9qPzTLqtbIlTMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mjP0RB2TET3EGYWSKnJWexL2xQF5ivqxwyHGNWNlgU=;
 b=bgQGbxk3nLSlGzXeByOPOpecSdyuq16JSRR/Reh2gLAYgUm8BEmHMxUZZhlnmITxZp2QuY40UD613ayhC6vGY6zMrfejBqG20G+4kR/7g5NcGMvDOtXi0cbQtXexPdsPHUpefAQyoeBpYfpDQDNJh96XCnHOoFhUbMpI9YHfjSReCG1C2dWkPvVQxvx7ufKXIH58XQJVWW2BO/+Ppiv1vC7A1/p2H2jhOdM1uHwRJqknsJDULdLt/tRwax0nzGu75t2X8OZ2iBD01BDctkwuozyJfqH9YpjxKdZlqbl393OmsR62cF1uI5mMGzExgJmKpgvPjlzQ+lQBm58wpBJS/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mjP0RB2TET3EGYWSKnJWexL2xQF5ivqxwyHGNWNlgU=;
 b=lA7oT9DLKkhneELv0QlqWpQbFo4at3MN2N+j1kVsxpC+vAIeMv2f/3XiA6Tu1bucQRA28fKFF7dzt4GZLZtcOObbwK/JY6v4j8/KIxdgFssVoemmEbwC2yKW3pb5s8oZPgLLIb1+STcWIi4LGQIKYKTpZS2i05E3QJKkD52ODY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by PAVPR10MB6963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:30b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 12:48:50 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:48:50 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: meta-ti@lists.yoctoproject.org
CC: Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH] mesa-pvr: correct INSANE_SKIP for mesa-megadriver
Date: Fri, 17 Jul 2026 14:48:47 +0200
Message-ID: <20260717124847.2123825-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF0005F6DE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::1ec) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|PAVPR10MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 8517e7d4-9052-4347-b0ec-08dee401c012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|11063799006|56012099006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	wSNuDP9+ru7M9ljs+N0XX8s4WsU6pM/vKBda5n4yJ4onYRpEwycaFmIYYkIMhEsyItGMWbUPLXpcZzexVJ4uY0+96YM7J0Q6wCv78A1FKT7yPyGI8sAu+v8duK6xVeoqC4QogrrbOA1o20cX63KmcexzxaSTF4dUX8k89snny7XY85G7+cAK/DsLBKqcwX12dZetgrMT2t/70MOP4qjvAp4GTOI0C+rz17jW6e0h7Gc5m4GYCXvNGhzwVw67vroC58t8Q0QXxFgU1b9f/ZlghJ2KrQU3SCav0UON6PwdO1rE07Y5ZfCxw3Wkl5G/AmmoeE493XUmStiBS04tTqatjg/TdKsIsRuRbTkTv/Jid9CMz5XgvGhDj+uVXzdVtNEtmwQTaH6ui/u+GK6mpqr2nVceGsQv/j3zgkVoD4suTqOeXHaxfYK6BzfgmF/LoMnqrIK7HvNGne9DET090Bvxjx6oUwzoITcrm6wtRfbzmTPKIQpMmnsHKoGyCHc1qKBXweoIB8ZXyXtgXMTkKBqYqveazNe0eshb32s1Kwds75IPxbRoPVeZrQqjETSfPBO6cDbdhv1BR5LJg9R15yUTn0cZefZ0CSMOzyplqo78bPSroOM7p4X5GjCXvAnpBqjNS4eE2E7Q3HYJO77jvDu7vhoJILc48EEbsQCCmaQH5Bg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HHc+cFsTJ2+ozonKn5jvpP8mvxmv+H7/g2Kso2DGqbTRKHHtvjcE7J2dYGBU?=
 =?us-ascii?Q?jG8tMDhQaFbE0XOVyJ8EqS/G+pdfcnF/9ILDbXUujijZsol2qZlc0CoZw6k7?=
 =?us-ascii?Q?PuMTvgcgGcTWnGclS7ecIfglePZbkhaKVOhK+yemGxToq4Rh821NpJ6DbTJQ?=
 =?us-ascii?Q?CpJYl+DMJZDXalGI/NlW0bLDhs5riAdsueMh101V/U+tlE41z6i0gjK4LV5f?=
 =?us-ascii?Q?I1WYyhaA99JfM2FshS4PeZo78JlrxB+tkgKx7OtVXx+gTXLv0FFE1W6WQW9E?=
 =?us-ascii?Q?7EiDikWE4ochY+HuyS0L08GnjgzdIFFuz1hHZMwTMFV8qDU3cfo42GhdHs8G?=
 =?us-ascii?Q?DeQ0kOrBllkh8rcCjoiIVqYKcgEqsHdgk2zdcm7FdCAxYXTmoY1nOOj1lLzL?=
 =?us-ascii?Q?SFD+hUMC3HB8egbMJcaicUzr9xgGWct0b2VTmaKaTziQ2WxtT2lPImw3mbhK?=
 =?us-ascii?Q?pHAHTk9v8WyEmuPRJoZQekRswIYrcwQ/HmuChwDlLPzjpe4VXiryCthZYRQS?=
 =?us-ascii?Q?x3Zlj3EO3m6K54H3QHgGZysXRUTkiy3fjmZI9a5IJ0qysbUUzEC4oagCAldJ?=
 =?us-ascii?Q?H8JouE+ArxIJSiTmar/8Me3FtGW9r27JTRJaaFk32GX/OadqulMJlH8zaX3D?=
 =?us-ascii?Q?p8+AtImrzIotXrEhsIORdiXnYMigu7hDQ8+Lbu3nB7P0dVOjQgpNGY/pU9+O?=
 =?us-ascii?Q?qHySOU5nNAcF2jfaH9MAH1G+eYYfiaXl//c2IVVyuEe/YRjeMwVqiyFQE9uU?=
 =?us-ascii?Q?fwfxEOL9D5essLj/hbwEmUZE87bRKFuBZiKYhkBgg1rYjKi9I+mZ+phsfGpm?=
 =?us-ascii?Q?AAafWhouhsdwwWeLinwQ6GyUSdN2WwFbltkIP8eQ1pGFD3CcxIkvksGhc2i8?=
 =?us-ascii?Q?GUcILvrgk0MLKUUe5FHMwgleUB1DjioA2HtKIFA4BKRN0yFSE3ahjs7hbmSY?=
 =?us-ascii?Q?ywgVML1c4RRAn8vPIQAy9O2/lI9+WKMtQBa9qVg2vcPEWIGCcOqTiHfoYxA8?=
 =?us-ascii?Q?e+fmK82VTZ+RCViM//7tub4lmrGCPWkJSIQYeZgJ0mZXqm089GnM1UWEPi1x?=
 =?us-ascii?Q?XOpBLm27aOZXdt5oKlEbpHShKa85WGzAFQmcIVWStYeEpQw7Ree86+lnYLiw?=
 =?us-ascii?Q?oIog0jY5SAMDCZOTDEpIxGqnBdb4P1MLAa9uGO5VLv1XiAtg2+2KDxu1dEOP?=
 =?us-ascii?Q?2zcrVaFVUlK/Bo0YhMQaYDRC4ewaaRqUI1DXiqP49sFZhmQkC9/kxl8e9oY9?=
 =?us-ascii?Q?wdBAKU9iwG62q2dl6a7t2ze2Sjz51rr/mTW70JapgWrSHX3UG7rcK+372Gb8?=
 =?us-ascii?Q?dsVTcDqbYNtOyQUcFq/NGlGRxM4HnUNXljCNSEBAUpxRapktOYSwcma8mbA2?=
 =?us-ascii?Q?pZt0zIvZkeZX9ObZnzdML6AzSANSdCn14uy2yPI2o5GpjIpi8Fqb91446E2k?=
 =?us-ascii?Q?HcwXgDipYTm7f7XxLp6dHUy1eMRe3Ua4GhFDMe9e0Be9eNhD0sqapc1R7dsr?=
 =?us-ascii?Q?Xbj/tPzV5ahzSr7V4C+Wj/L7ak27tl2rykutsYK8UjvnWralHOtAeLHU6K3D?=
 =?us-ascii?Q?WMt2FjTKZRXT3HKRXcoKUhTHXQqvE+ZcjwFHwrgfFQ5FwR8Hw7QmxH0FYZjw?=
 =?us-ascii?Q?DcUHOBqPb1a6A5S/tgWW1UUR4ulzKuEh6TRUs/SV3BV+JodYMKL7yUHixZnN?=
 =?us-ascii?Q?XAd4I7oyT/hWKBwk6tg/M6AUAjG/teraXldiB8TzcC7PnaigKpP5C386ZFwt?=
 =?us-ascii?Q?mzAJPg/KoH0WA7Amlh37PQOQ+a1AfBk=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 8517e7d4-9052-4347-b0ec-08dee401c012
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:48:50.2993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JAcovK9+9zf4QJCr2QBPN3VG1KzjWVTWkLvP4qH+1F23B91AMY15zbpgtW9NNOqcO+TVYRzG7tydm1Ok2AYPjt1H2yAsxSOpjrR7knVPKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6963
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Jul 2026 12:48:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20158

In the original file this was copied from, $PN =3D=3D mesa. But in this
context, $PN =3D=3D mesa-pvr, while the PACKAGES and FILES logic still
explicitly refers to the mesa-megadriver package. Hence the build
fails

ERROR: mesa-pvr-2_25.2.8-r1 do_package_qa: QA Issue: non -dev/-dbg/nativesd=
k- package mesa-megadriver contains symlink .so '/usr/lib/dri/swrast_dri.so=
' [dev-so]
ERROR: mesa-pvr-2_25.2.8-r1 do_package_qa: QA Issue: non -dev/-dbg/nativesd=
k- package mesa-megadriver contains symlink .so '/usr/lib/dri/virtio_gpu_dr=
i.so' [dev-so]
ERROR: mesa-pvr-2_25.2.8-r1 do_package_qa: QA Issue: non -dev/-dbg/nativesd=
k- package mesa-megadriver contains symlink .so '/usr/lib/dri/kms_swrast_dr=
i.so' [dev-so]
ERROR: mesa-pvr-2_25.2.8-r1 do_package_qa: QA Issue: non -dev/-dbg/nativesd=
k- package mesa-megadriver contains symlink .so '/usr/lib/dri/zink_dri.so' =
[dev-so]
ERROR: mesa-pvr-2_25.2.8-r1 do_package_qa: Fatal QA errors were found, fail=
ing task.
ERROR: Logfile of failure stored in: [...]/mesa-pvr/25.2.8/temp/log.do_pack=
age_qa.3911784
ERROR: Task ([...]/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.=
8.bb:do_package_qa) failed with exit code '1'

Spell the package override correctly for the INSANE_SKIP suppression
to have effect.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc b/meta-ti-bs=
p/recipes-graphics/mesa/mesa-pvr-25.inc
index 71e9895b..2ec48c48 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
@@ -331,7 +331,7 @@ FILES:${PN}-tools =3D "${bindir} ${datadir}"
 ALLOW_EMPTY:${PN}-tools =3D "1"
=20
 # All DRI drivers are symlinks to libdril_dri.so
-INSANE_SKIP:${PN}-megadriver +=3D "dev-so"
+INSANE_SKIP:mesa-megadriver +=3D "dev-so"
=20
 # OpenCL ICDs package also ship correspondig .so files, there is no -dev p=
ackage
 INSANE_SKIP:libopencl-mesa +=3D "dev-so"
--=20
2.55.0


