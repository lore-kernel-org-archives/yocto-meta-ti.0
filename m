Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB321F53D7E
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 17:13:29 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56049.1773681204341172193
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 10:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=w5G/mx4H;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.53, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OT7tc6DvzKriFvpVOwUMaL7rdArRw8EfGEjK8fbGl5p9scdVAAu850ncqUXDcJATQo8y1YWMNts6Wosc89uHmYzJkDYcLLTmfnHkPskEcwROe5oe7MUBN/KD2zLo1gZWSy/gaHa5lqpGrQqKlWMRQewyPlkkY148mgOYsUZ/pjeKb1dJhDC5XydHH+vqVqEqmWU1awDigIMMNGaIKitUheNdEO+Gpmq8jRDjaUGcUaXnH+b6rN9cvP8mDsvUbKbTBSzqwelx/mOYdcow5lP1o0Y3LXpGbyIilt+9BvI6qcSC5GSfMccjiFjTvnuGEsE9o8m+u4QY2+iq762pNtpWHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCIUEV8DHmt9WXNESi0cXoHmhywZS5uhduvPg6VVhx8=;
 b=ZzSNKkcBolaaRqinSPoP5DeXwHoymEkfpY8vso5Z6j4FD1Q60rjNnsyf/oQBzFyngnO0JyKAPtDCDd9tKstpyqVUs2IW/eV/UwFMYmlTsJAOo2NnJgE9d/YKArVdyrPwUb1pz0JvpZ9ep6YPxKmsfUR/7yemTItzNTu3qTRqPWzkBUIkGRlcHC6Q+7WIoqgGhqcCeg3NQW4cblYygmYg9pvP5iKuBjjsalSgco0QAdA8Dh1JzcUf3Fi5a7e3m2HP9asdx0cf6XY35Ocs8iuL2aXiOmzjNgJtqvQi2camuCviDHNBylth5bg7MKBYHGDGDa5ft8plppsX3Wde7CFhdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCIUEV8DHmt9WXNESi0cXoHmhywZS5uhduvPg6VVhx8=;
 b=w5G/mx4HtUpVJRw5Ul2qugM3yDSB7Cqno02/Va/iesHR2HKlR7jWzX6oiJvMyL6RAFNfEELMIHPB/xg7d6G9jFvMhsB6eBo6mvuV1U9nP5bZ7WrajDVdpJKiyYdzlbUu7VBqbD1s926gDHAHVTIyrknZbVd5zn7WqBpq+A8HRco=
Received: from PH2PEPF00003849.namprd17.prod.outlook.com (2603:10b6:518:1::66)
 by SJ5PPF8DB18B996.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Mon, 16 Mar
 2026 17:13:09 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2a01:111:f403:f910::1) by PH2PEPF00003849.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.22 via Frontend Transport; Mon,
 16 Mar 2026 17:13:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 17:13:07 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 12:13:05 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 12:13:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 12:13:05 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GHD5Ho1662053;
	Mon, 16 Mar 2026 12:13:05 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w2BV3-0000000EArI-0FbG;
	Mon, 16 Mar 2026 12:13:05 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 1/2] linux-ti-staging_6.12: Backport C23 compile fix from linux-stable
Date: Mon, 16 Mar 2026 12:13:01 -0500
Message-ID: <20260316171305.3378319-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|SJ5PPF8DB18B996:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b051ab9-d219-4d0b-6998-08de837f4b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	S+keOb796pNppA/HPDYFkvQcm7HThdCTMU/ql2osV85C4kXWT05CQRVFfK7lCAKjp6RCn7JsTSbbCanvblG6nFWWGMcfUKjPuQqUTte/lERD6EWvhhu8WwXqxKHIHb1wR/H/UJ1e67Pv6uJfRF4pbA8IAFVwvD0xzSuLztPKHS9jqwcUWhZhxWPL+taXfhBLzlzKnHYufl86u5pMeq5gpv7DJTv4t3V0jaHmTQMz45xJGLeuvYHOwuT2TE/usfCOIFYmGCwYgcPpaVYAdpt0LlI8jD21kP99rBd03AZwAxrw5mop+fRUicir8rVWGuYO20se5n/MeYvLbw72JTOk/+2Rgww/YbsMKD4iW9p6qINQUDw54kyAFwsE3X/kA1siGMoJrBt4QJTiDoAc0mrGYaM4dPuwszZNqAgHvgipTpRKQNOXdBHaTthRIZmCE9GmEYL4NrcrHbFb/Pdg98PIgPTHeN+07w1lSr6WtEEN2/EQtLrFzzBsKlDXK91kMXJqnjZ9Rcaa4DIAKvgFemBFMeuyaEL/57Yyg/EuuAxAChdvhPB0wRMPzTRHrPVQz75lmL4QjPF0QLwQsAMB1yh9BtanxaImARjVyBZiijoMg+ePeOEVQ/uI8/L2+Ye/9iSy1uUuTI1gYih07AqrcE3tT25NRgcBugM615csGjjCDns3mhcRk9uWDMig+rZqUKNRyKJU3Faj6UyW7JM8bNzxmyaknV7I2bk2ipCB/NtEDsbFS+83Q8MW6YUAPRodfUh+/vJEbWVHwpkGc+VW/1w1iHc/YoSVcRB9GY6OO0lrKxw=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+Yfryo5jS5gqmuOKCquVs9D9y+rBBcMPNLYsQ7vfW9JcAKSmZpjdFL2A4MB/5UJndoCNW5zmIOufh2o08+zqgDI5Z0imEez7vUJoQaJ8vgUvl+037IzotBfBJY/no+r2qY7v7JJld6TiSUwkQls67q7kVrbTBmunUwtLNoE1BE/1uMuYyLkXbhJAy+aqiBzY9rtzkKYixBWUgdyHafx9av4KPTAStnZlVxy0POdfzGO60tlE/MLC6SIZVatC8Yary34WSv8VpX2ZY+BQSDbuW8v2osx36VzPwwF9cezshKHCWGcJEouyQEymR6DU+S5zzD31TAyrWdpEYVcjmBcqvZFq/lksLLoqfYkwNjAw+fMn1RVTaJNIxgLVkx1rA1ltqbIMJuKoGVdYHey8/N2uh+OpooAhoXZHNlnapYmD+ouzld74t4nyyK2vV8ggG4on
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 17:13:07.7521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b051ab9-d219-4d0b-6998-08de837f4b2a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8DB18B996
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Mar 2026 17:13:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19719

A recent change in oe-core [1] to glibc 2.43 has introduced a build
error with 6.12 kernels.  Backport a patch [2] from linux-stable to
address this.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3Df791d6c5287=
0f3571e740ff7818d45bb0a717934
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit=
/?h=3Dlinux-6.12.y&id=3D3dedeeecd1ae42a751721d83dc21877122cc1795

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...-Fix-Wdiscarded-qualifiers-under-C23.patch | 60 +++++++++++++++++++
 .../linux/linux-ti-staging_6.12.bb            |  2 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0001-libbpf-Fix-=
Wdiscarded-qualifiers-under-C23.patch

diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-libbpf-Fix-Wdiscar=
ded-qualifiers-under-C23.patch b/meta-ti-bsp/recipes-kernel/linux/files/000=
1-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch
new file mode 100644
index 00000000..b7a81006
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/files/0001-libbpf-Fix-Wdiscarded-qua=
lifiers-under-C23.patch
@@ -0,0 +1,60 @@
+From 3dedeeecd1ae42a751721d83dc21877122cc1795 Mon Sep 17 00:00:00 2001
+From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
+Date: Sat, 6 Dec 2025 14:28:25 +0500
+Subject: libbpf: Fix -Wdiscarded-qualifiers under C23
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+commit d70f79fef65810faf64dbae1f3a1b5623cdb2345 upstream.
+
+glibc =E2=89=A5 2.42 (GCC 15) defaults to -std=3Dgnu23, which promotes
+-Wdiscarded-qualifiers to an error.
+
+In C23, strstr() and strchr() return "const char *".
+
+Change variable types to const char * where the pointers are never
+modified (res, sym_sfx, next_path).
+
+Suggested-by: Florian Weimer <fweimer@redhat.com>
+Suggested-by: Andrii Nakryiko <andrii@kernel.org>
+Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
+Link: https://lore.kernel.org/r/20251206092825.1471385-1-mikhail.v.gavrilo=
v@gmail.com
+Signed-off-by: Alexei Starovoitov <ast@kernel.org>
+[ shung-hsi.yu: needed to fix kernel build failure due to libbpf since gli=
bc
+  2.43+ (which adds 'const' qualifier to strstr). 'sym_sfx' hunk dropped b=
ecause
+  commit f8a05692de06 ("libbpf: Work around kernel inconsistently strippin=
g
+  '.llvm.' suffix") is not present. ]
+Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+Upstream-Status: Backport
+---
+ tools/lib/bpf/libbpf.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
+index 060aecf60b76b1..7d496f0a9a30d1 100644
+--- a/tools/lib/bpf/libbpf.c
++++ b/tools/lib/bpf/libbpf.c
+@@ -8174,7 +8174,7 @@ static int kallsyms_cb(unsigned long long sym_addr, =
char sym_type,
+ 	struct bpf_object *obj =3D ctx;
+ 	const struct btf_type *t;
+ 	struct extern_desc *ext;
+-	char *res;
++	const char *res;
+=20
+ 	res =3D strstr(sym_name, ".llvm.");
+ 	if (sym_type =3D=3D 'd' && res)
+@@ -11959,7 +11959,7 @@ static int resolve_full_path(const char *file, cha=
r *result, size_t result_sz)
+ 		if (!search_paths[i])
+ 			continue;
+ 		for (s =3D search_paths[i]; s !=3D NULL; s =3D strchr(s, ':')) {
+-			char *next_path;
++			const char *next_path;
+ 			int seg_len;
+=20
+ 			if (s[0] =3D=3D ':')
+--=20
+cgit 1.2.3-korg
+
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index a02b90e7..c63d7532 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -24,6 +24,8 @@ BRANCH ?=3D "ti-linux-6.12.y"
 SRCREV ?=3D "da3c0f0a33ac00f7138c695a16d90301cf7ec02b"
 PV =3D "6.12.57+git"
=20
+SRC_URI +=3D "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch=
"
+
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
     file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch=
 \
 "
--=20
2.43.0


