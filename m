Return-Path: <ggiordano@phytec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E910CE92727
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 18:36:41 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.53])
 by mx.groups.io with SMTP id smtpd.web10.23572.1696530997796597325
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 11:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@PHYTEC.onmicrosoft.com header.s=selector2-PHYTEC-onmicrosoft-com header.b=azcTHFp3;
 spf=pass (domain: phytec.com, ip: 40.107.92.53, mailfrom: ggiordano@phytec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVDWro/uZTIwtmmfGt73DHcwS0vDmNw5Uf+tdZQc6vzx3w3cU1cy+yFPzQ6PEf+jFZsNhtNw0CnqRDVbMRc4YppMipiJqANiKt/8mZT3HI60g6jx9IbptQvxybBSDbwz6FZX4kwUb5yYP49MDlCyKfMb+KS/1jmuZY/eBxSW774Psgrfifu1r3TLTeijv5thYE7WxBia61PZ0A7TI6FtrNZIzO9BjNyNHYbQJwaOoX7aQgzPXfQJO8eS9JL9vECk6cZl2+O1kuWVt3H+b2OGw2BM/yNDm6sjmV/4zAe2yagrAQH11KLQMnWZdaTODIzsgTThoPc92h9112QKud2Bng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WriZuAkTEeilklZSa5Vwtwho9dTdQD3RzDNvrYnnxI=;
 b=LxHsGm4e6VZcRn86uXXvzg8//dsib6+rgmcjs4Rb9T0G+PKIBn3WHNMR3iDU9tOScKRIhywqhRyxEBcaQGd3lUdykBg1nR+BJvrkGEpJ1QSsTHsSFgpL5YBSIGzPinOFMTIK5Uda1pdncq6dReesPQFt2f9Thhk0ow6svawM6yI0Rimh8VAA26eRwV18U3wBtaTBYGXLqbdaxTcyvKhduho19NVDGOcfyagnyjhBuaArXyz/WJRJUa72A+ayyAixwskrTdv4SAdkifDhPMZKg1AoJvMkBc2+5EwwxqFPrx36vzn22DXnWcU+aqCv6m3IMOBQOl8V7R1a5FdifuCDeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.com; dmarc=pass action=none header.from=phytec.com;
 dkim=pass header.d=phytec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=PHYTEC.onmicrosoft.com; s=selector2-PHYTEC-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WriZuAkTEeilklZSa5Vwtwho9dTdQD3RzDNvrYnnxI=;
 b=azcTHFp3hNuCKmqXyqY/QlDTXfhYCelL/Z8iarcZ4OGK93ZqRQ0npydL8PduqNQVchWub/eVdAV7lBBsfQwJrDW8S/yduliSE2a/ugDMIIXUJE1GPzr0krDWlOV8my5ua4y2gkj9llCxSPNGNiRxcnWRiovxYg64SEDAF8JXEEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.com;
Received: from SJ2PR22MB4354.namprd22.prod.outlook.com (2603:10b6:a03:537::8)
 by PH0PR22MB2828.namprd22.prod.outlook.com (2603:10b6:510:db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 18:36:33 +0000
Received: from SJ2PR22MB4354.namprd22.prod.outlook.com
 ([fe80::295f:d4aa:af24:fd8e]) by SJ2PR22MB4354.namprd22.prod.outlook.com
 ([fe80::295f:d4aa:af24:fd8e%2]) with mapi id 15.20.6838.028; Thu, 5 Oct 2023
 18:36:32 +0000
From: ggiordano@phytec.com
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH v2] uboot: Handle UBOOT_CONFIG for multiple R5 defconfigs
Date: Thu,  5 Oct 2023 11:36:29 -0700
Message-ID: <20231005183629.1820821-1-ggiordano@phytec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MW3PR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:303:2a::14) To SJ2PR22MB4354.namprd22.prod.outlook.com
 (2603:10b6:a03:537::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR22MB4354:EE_|PH0PR22MB2828:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa0dafe-17c3-471e-0dc1-08dbc5d1ff35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NkyvcwxMf1U552yz1IxQOvN20kddgQTnZILN5zswou5xDCVpsy76J0i0TN9HFKk0VIGNbrRR+2WU/SsUMDpBCDQ6ZZJ4NGmh9zgEsCb2oZ8I4zeLcIUXIrd5n/Pkh4vXfqbSRj2eOPNGnglNiXTJrKzo5i48kQDjTX1HuE4Z7jCtYSRmGSOBNFMdxxivW32iBS+M3HxkDNsws6loEs0S93SrsLehdx/CWIO0+sUI2+1RTD2VsvD1fPEnIZ9g4jRo21NBlQumidkWLX+r+pD7bb+ivhWC7doNo5HIw8zHeXqFTnNKjbtR7N0tSu8qoXCeLjrFOickPBQhcL7FCFb/eywHIx7Oga1XUSVrRWiItPWc2dkzDj5DdVtOqebx3w9eZe7IwbDhv8gh+4vNCrVbC/ygNti9ky2I8+p1AUrgByjCoePj98RImlXwlKRvMFD9mPhqjlO+jUpCREqwOSctzDUoqBq7YqYfE6W1GITG2xOyp9/dY3WuDrFEWnrUmwqh0MX6cyDK6p1BHuuWRQYQaMCTlu9eg9VLC+Qs/EwnDgmDVUywKG0Ed4kfAVK0AttNaP0NZvmlmXMdsP4Zv3laHMFokj51vHWwCgw8sB9om5TQF1dhcL6S7N5QWQulELM4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR22MB4354.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(366004)(39830400003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2616005)(5660300002)(6666004)(26005)(8676002)(8936002)(86362001)(478600001)(38350700002)(6486002)(66556008)(66946007)(66476007)(316002)(38100700002)(6916009)(1076003)(36756003)(9686003)(6512007)(52116002)(6506007)(2906002)(83380400001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7nFkVhGNMBlMFo8G0I6SZuYkHfMbwC/jpil2BhejRt7acG4LkMCwLQFgYf7I?=
 =?us-ascii?Q?8ATlOg96TFUbL6Ud5XEgm2+32qLQ/wANkqm+66EQgSnfCmNGk/bY4f8heEK3?=
 =?us-ascii?Q?d/mfxUA6FZH3Jij4Za4NXebT4tHjaBwb2g+0S0zpCDOW+fgAvNgS/VKwEZdT?=
 =?us-ascii?Q?S38DkVSS6jct6UocfZesDKYztfU/PXYJHw+NoVMNwc7WagrD3pRFIxdSXbAX?=
 =?us-ascii?Q?rjuZMKZTr75GjaZRC/wTm55IAJoL40jnoOQwqD8ge8og4oE9HtaQN6GA02VL?=
 =?us-ascii?Q?gnyJhXOax2xeilA6h+enoFuU04legfFgsYq2bzqcXHw7CWVy6gSs7bkXWQEm?=
 =?us-ascii?Q?w56+K/OaQCo1Cc3HQp1xQ3KUetfIet+/hxz7GCmCh6OQjLYRDknqbNTcMzDe?=
 =?us-ascii?Q?YUnPBU5ebhwTniAivE9E9jrlY7JRQSuNc3KLNn9B/RBIQ2xRCo9LV0K6dmvJ?=
 =?us-ascii?Q?JVL0dimaB6z6RuM+0VV5V82n3W31lSzuLdMSxYAOGEYCpnTMYWQqvPCw7Tuu?=
 =?us-ascii?Q?7cZ7zMXc/BgKc5T5SM0I1nSqYYOGJasoYNrw1xbRhwMOofDz2+mAqm9HANx5?=
 =?us-ascii?Q?btlzw6U0izvM2S80oqRBKLlhjwHqzL4R+1nw15zjruciKUrIHE/7269GP1uR?=
 =?us-ascii?Q?6tsI7oc/qrUtpanK++eQdSygVQ9ncmKxh6gToOE1lakmNg+4y2AsRyOF3AIi?=
 =?us-ascii?Q?cF3ZPUYQRs2KlxpRLWQdcprQvjBkElPvDBy3eGIr3x3BypukxCCp8k4ArmTM?=
 =?us-ascii?Q?FcTARFGAyYU+PfHE7x+tQZoQye5GbNGz3YB+mMrxfn11s3bEaNcsSB09Irpf?=
 =?us-ascii?Q?wb2HD8hQ08EKiDsB2D4W4C+L2v7xq6/i7+LKPc49B9A5CH/EyVKBRcHF0uf9?=
 =?us-ascii?Q?RZyUYwctpvhG6CiBsBMKNjiYIleKPiRaG1OO4QV7cDoxuAuPEbJIUtrAL1Vh?=
 =?us-ascii?Q?0s52DpU3tg6BPDotgli8UJmufMflcfaE78Wq175vFLwH6OQciYkXA+1nXJHY?=
 =?us-ascii?Q?40i9ooe3RRy9wb/RTeqyvG8/Hul4KE/Kh/KLbK6t0Ujs2NUjVdqxpcudEe0t?=
 =?us-ascii?Q?ff7h67uvsPFbisoPjQSTp4CUEkpSk0kWQeJJR5g4zyAnkfHWgzjn1v7Dzjlb?=
 =?us-ascii?Q?urANFDqGWSdtrMR0UeSskDdEeplgQrC5LdYyICgbBbLD2mykLpAfMAYEVYJW?=
 =?us-ascii?Q?h/OHXFnua55RcDEsZK0/ASNXJP8WLPnEOrS91mvjoxAo5HCfNSCyISaC3bEY?=
 =?us-ascii?Q?bKIY1a8GJwjY2+0/h92savPvd+bS1KTpgMmUGeUwMV+amPTgCumC7PgGII8h?=
 =?us-ascii?Q?0aoYMraeqnsvO/gcIf8TBguJZi6tS8iAoESDpF0xKlOOtwPU6SdQJw9TjR29?=
 =?us-ascii?Q?OTI4rjsaGQZM+LG2nfsiOz0dTGixBEUIY0+rde4XlvLs+SDApVtpamZTdY0e?=
 =?us-ascii?Q?EP0w1aks/frMYjiqb09LJ+KRI73C+IPSu3b/hNGO5/k64G2MrjDZNj60KNOF?=
 =?us-ascii?Q?voFi45pHeE3w+mq8pcBM2rRS34LuZf3wzNL9GQzkmQMlJl6W2MS21rokOc+9?=
 =?us-ascii?Q?1pzHk9LTOK2zlKDVfcCtIV3xhvbg54JHXXA0UCMg?=
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa0dafe-17c3-471e-0dc1-08dbc5d1ff35
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR22MB4354.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 18:36:32.4603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 67bcab1a-5db0-4ee8-86f4-1533d0b4b5c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myCOke76rxB2EHWnuzwugjpd1mYJeeAKZS2iciNQ8DUt0MIcu1Z4SuOvwTJtUy7SzM5YaafydN8TOJnRJquP1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR22MB2828
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Oct 2023 18:36:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17063

From: Garrett Giordano <ggiordano@phytec.com>

Currently the do_compile step fails if we try to implement UBOOT_CONFIG
in an attempt to build U-Boot with multiple R5 defconfigs.

This commit adds a condition to handle linking the UBOOT_BINARY if
UBOOT_CONFIG is used in place of UBOOT_MACHINE.

Signed-off-by: Garrett Giordano <ggiordano@phytec.com>
---
 v2
  - updated commit subject. Changed from machine:k3r5 to uboot.
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


