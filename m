Return-Path: <ggiordano@phytec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53DBE776C5
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 21:16:28 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.69])
 by mx.groups.io with SMTP id smtpd.web11.94325.1696281384287566166
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Oct 2023 14:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@PHYTEC.onmicrosoft.com header.s=selector2-PHYTEC-onmicrosoft-com header.b=hZuUe7wm;
 spf=pass (domain: phytec.com, ip: 40.107.237.69, mailfrom: ggiordano@phytec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chXbaq8faPgygz0U5mxAVoWYVsR/OGYs0AWr79B1MiIBCL2aqhuaGzHxeWYbY7sG2Gf/26UiB4KNdFOvoDlyS7DbaW2LTCwYRQIRfgVdc6o0SL6xa+z4ifFEo5oi3474uZbBGX+etUxQbNuhe7taeecuwD+LU6h8ANvrWFx7nuXjWPTAsQCtfys04lDbcwudddoIyNY02U9RWd8PlSBas9QkuAfHfjJ2zZn0r8qvHdPCsoUbxsQ6AP+YHRyggh9mhOq8y79OvDqFnrrzw7NfFhfK2sqIFgtN/HP3KpcDXoz1YTeI2XNQGj8yQKnhgrwaJOo/7Qqh0xqIbGeB63JX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCjLcqRDoI+FAmnGs/asq7hzWgQs+qo32Ctf1C5aKpE=;
 b=X01yLwdsB1UgiMytGkVRG9PgTHIAk8d2jK5X8dLlZWm6Ts/6Ba0AhTxwHYY8I5ZYHLiuWProIbx+/18ZUYYZovXrF6u5eTUWhiKwarRM/29SI8ZPXPXAIpMTmGaD8GCTmlruyS1NWPtCfFDxFf6jL8usM0xa+rGq0u6G9sN53gWOdjq5IG0OEUSfUfZE5Z86wDEWre+aGPp8exFIsi4Z4pIe6xl455fcW4OET2yW+x+Zw9998pFSlm9K9qlx8duXj6m7s1mldtUzCr5aCE/DdOKMRKhC6rsAe4YTNVDiBw7zOOPie4VQ10mN0vBGjrObRsqGbHxMtmd7RQkgoS/eEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.com; dmarc=pass action=none header.from=phytec.com;
 dkim=pass header.d=phytec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=PHYTEC.onmicrosoft.com; s=selector2-PHYTEC-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCjLcqRDoI+FAmnGs/asq7hzWgQs+qo32Ctf1C5aKpE=;
 b=hZuUe7wmbfLd/ncbYLcZKAb6kxIyJ5MM5okP5snm0RVI/Ci+iSHh+61wBxvGI9ccHLqPMIRzxUW4pTE/NNF5xSOx8OXRQBwz2u/Y3r2nnc+XCOGkwxW8czI+DSFEhb+E7KfrdD/8k+IaG/r5kp9/ihT2qGWcxF+PGKDEP9+GjEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.com;
Received: from SJ2PR22MB4354.namprd22.prod.outlook.com (2603:10b6:a03:537::8)
 by SN4PR22MB3353.namprd22.prod.outlook.com (2603:10b6:806:219::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Mon, 2 Oct
 2023 21:16:20 +0000
Received: from SJ2PR22MB4354.namprd22.prod.outlook.com
 ([fe80::295f:d4aa:af24:fd8e]) by SJ2PR22MB4354.namprd22.prod.outlook.com
 ([fe80::295f:d4aa:af24:fd8e%2]) with mapi id 15.20.6838.028; Mon, 2 Oct 2023
 21:16:19 +0000
From: ggiordano@phytec.com
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH] machine:k3r5:Handle UBOOT_CONFIG for multiple R5 defconfigs
Date: Mon,  2 Oct 2023 14:16:16 -0700
Message-ID: <20231002211616.4103160-1-ggiordano@phytec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0219.namprd04.prod.outlook.com
 (2603:10b6:303:87::14) To SJ2PR22MB4354.namprd22.prod.outlook.com
 (2603:10b6:a03:537::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR22MB4354:EE_|SN4PR22MB3353:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df2beee-f160-4346-6317-08dbc38cd25f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Tg+p/nJmTAmXx4G2L3svw3z1FXLHz/HQ+HpwwXEVqbzmDwJNaqELdXZeuoWaB9/oqUgTk152S3EipUBR/gGEZkQ/soLiQgT+kMuVGiJ8NGhqOaFr5vcbP+Wooph2wTjR//LzB1npY2t5BXQxaxr0/YYvGbbeoG0BCCQajtw1563aArXPsYb5Wt1zg+zsR4zw97bZuhsLj75C0nyMJhV7NSJqFl1FQbDORsdBYm8IAu9PZQRYSSznGcmKXMeP4fEMxaTpa3suWvOPCfQpQkHc78sbrJ/sSuIH2C6rmHanp9IZ5y3qIeVJnnifpQaRMrbN1aSxdCpKX6/aF0xSV9iP70DwiPzMqz2WxJvi9Wt+K44kRNjw9JndRRy16rLQ3z1SKPnHwkrIlvYVWlXFZ4C6s/yN4SeKCerKuN9NPZKnupuxDwKfMeJcOeGpgi8XDBRG+t/Q7gQlh2rAz2xZbyewmqCEebjyhtLV2JBTPaENra1Kvkfpc7q7iVoHkRDZZsgvpE4Vavu/e6cgDyHM9Lx/Hvpc9NZzZ6ZGJxvJA+mGghkpSIKDQXP+BxBj+s40UZvmLPTtbgkgEOlgadhCpYgwxpzHmhUI4XXxMJeAuCffX1GR30ZJGtfbZaW8Exc31lR0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR22MB4354.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39830400003)(376002)(366004)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(9686003)(6506007)(6512007)(52116002)(6486002)(6666004)(478600001)(26005)(1076003)(83380400001)(36756003)(2906002)(6916009)(66946007)(8676002)(316002)(66556008)(8936002)(41300700001)(5660300002)(38100700002)(66476007)(38350700002)(86362001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mUb51eBNWkSS2f2yJRcrsnENJolbEolAyeDkbaNNnSvk4ldtPlGjXmXihGbJ?=
 =?us-ascii?Q?7ujGolpzqY7Ly+/+hlleUICIdeKESHJLJUMbjP2+CJWUeZqfLtUbhLjVcQQ2?=
 =?us-ascii?Q?kttbqGyprATcOpjuaL9tF3o++kpLs/l5CEYy66eJE5csVp/E7VKrxSjtk9mR?=
 =?us-ascii?Q?UdXtWyS2ENsU7ACnM4Ds8pmyyS+ivbD69hU1DcABWwVUPGwgOeEW2WMzQ4W0?=
 =?us-ascii?Q?JWxKGKuJNGHOn2KazrqWv7IioHm31ljX4zV1qZNRpVI2178Nc2MBb2PCUtws?=
 =?us-ascii?Q?uqp/h1slsLPjC/q1Eh6RCz+Kdt9D2ZICdq7PZicSR/JPf8oHDGHcTudibLa2?=
 =?us-ascii?Q?bEnzcKzhykD75GNuabPu9dQkQ9Gvcj4w3O48cTRcNWV70PxDQXIE6Tkz1HYB?=
 =?us-ascii?Q?OYW0XBl07KAiiEg7XXM6bLwBFOE3EcdYfi99LJmk3JNhFLeV8l/sakfr2M15?=
 =?us-ascii?Q?TeahBzjupTwJn1EFBI7VG/oA9bL6J2EeTVaDDlaU1fbBr1UGZnOKfbpUtwqS?=
 =?us-ascii?Q?2aRL7agk4mvYfviXbpdy0Qy6C/ICUn2Tj8HdL9cRyZ15V4avrqyrpBjcjftI?=
 =?us-ascii?Q?f8iaxhDe+3F1a8iDRDnXBVbnbYEhl+Bmf/WLXX2hv7Ykv/yfUUFmJqz6EntW?=
 =?us-ascii?Q?n7U5DDsE/jtBwrYGzyhUBbgfTizCFMeNK1myrkRXhvh2fEej+kABNzQOjRQJ?=
 =?us-ascii?Q?NH1TTlOdbDc7mljsFy49L//bVTKfGB6diE+Y+t48PN5JmGuLhbOHd5hTunCo?=
 =?us-ascii?Q?8YBQ0m9LGPaxqBKNaGPoowTgLwdEaj8GVVDgQRAEwO/Mkj4/Jgrg3MBHbX8B?=
 =?us-ascii?Q?47ez/DbWiGK8Lg48qTT/nNdI5MsxnpJMiXv7vwkfofVQXVTI/vZC3zrTKT1j?=
 =?us-ascii?Q?/dgIE5JIB0Z9F3lI1925BBHXiJtev0hyNTtpamoVat33oPZmNruupZwjh8XI?=
 =?us-ascii?Q?aYTjf8hfcs9bw/dY7+6uHMRFyhzP5yMz3GZo8HT1wOHztgdA5AvVxY+e8hku?=
 =?us-ascii?Q?ogBXzjksEuqTP8ZDO8ShWugrCCAsAot+Yk2LS6VG+ylWmHbG3Iw0oGbRrFon?=
 =?us-ascii?Q?bqCDTU9VXVgImhGJPdUv8X6Vy0I/X542QtxRXI9O5jYFtgCOa0eKyZzvnnHc?=
 =?us-ascii?Q?11VXl1NUbyBUXUy9hUkdM8NEV0BW1OHB7tBAaAvyDAzpdAb9182MwkXOqaiG?=
 =?us-ascii?Q?1+eXoSf32NvDcnokhJPqTYqSwRM7ZDVITX6szWO/0p/o7b2M0vlMBpalNE94?=
 =?us-ascii?Q?08iWApcV0D10JwEAiiFL/5US0SNhJAuQUcI8NStxD2A+p8r1T5NJPcHYzTrL?=
 =?us-ascii?Q?QLSquxzDq4T5KPBaUt5mJufri+mOMv3vG3yRuzaITP/hRxe07LpNkCW7kaAp?=
 =?us-ascii?Q?QEfEPGiqafDx4PwLRlSmIAbhUR1viebqNMRt0W4eGqUwq/HnzO4q34x1ctsU?=
 =?us-ascii?Q?AB3IUA9ZMVGUaiGlhEzQszv8NfK6yNXI4LW8kLznhKF8uMLJcvNJlEKa6iOJ?=
 =?us-ascii?Q?yM7Xkms/u6iwkoPGrg757ip18lfwNXI+rLlpvgAE18joBjs9KZ74/i3Vw4Fr?=
 =?us-ascii?Q?h8s9w45qO+B0h+0jOeVRXCi5/XgC49GnvFuO8rXu?=
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df2beee-f160-4346-6317-08dbc38cd25f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR22MB4354.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 21:16:19.6863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 67bcab1a-5db0-4ee8-86f4-1533d0b4b5c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJqIZWOr+cTC4tphQODOwxxqC2KVCeiynP3rTTvghXDO2HsBgPR7MROv+uFicXoily/Sx3njqszS3OqR6SDElA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR22MB3353
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Oct 2023 21:16:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17043

From: Garrett Giordano <ggiordano@phytec.com>

Currently the do_compile step fails if we try to implement UBOOT_CONFIG
in an attempt to build U-Boot with multiple R5 defconfigs.

This commit adds a condition to handle linking the UBOOT_BINARY if
UBOOT_CONFIG is used in place of UBOOT_MACHINE.

Signed-off-by: Garrett Giordano <ggiordano@phytec.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 22 ++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/rec=
ipes-bsp/u-boot/u-boot-ti.inc
index 2c4ddcc2..327a31d8 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -103,8 +103,26 @@ UBOOT_HS_2ND_IMAGE =3D "u-boot-spl_HS_2ND-${MACHINE}-$=
{PV}-${PR}"
 UBOOT_HS_2ND_SYMLINK =3D "u-boot-spl_HS_2ND-${MACHINE}"
=20
 do_compile:append:k3r5 () {
-	if ! [ -f ${B}/${UBOOT_BINARY} ]; then
-		ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}
+	if [ -n "${UBOOT_CONFIG}" ];
+	then
+		for config in ${UBOOT_MACHINE}; do
+			i=3D$(expr $i + 1);
+			for type in ${UBOOT_CONFIG}; do
+				j=3D$(expr $j + 1);
+				if [ $j -eq $i ];
+				then
+					if ! [ -L ${B}/${config}/${UBOOT_BINARY} ] && ! [ -f ${B}/${config}/$=
{UBOOT_BINARY} ]; then
+						ln -s ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${config}/$=
{UBOOT_BINARY}
+					fi
+				fi
+			done
+			unset  j
+		done
+		unset  i
+	else
+		if ! [ -f ${B}/${UBOOT_BINARY} ]; then
+			ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}
+		fi
 	fi
 }
=20
--=20
2.25.1


