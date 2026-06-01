Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D68FCD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 17:19:47 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4475.1780334377423162520
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 10:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=trP40v5B;
 spf=pass (domain: ti.com, ip: 52.101.48.63, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUmWN5unLx7pUYSLbWwFm1hfwar6SxqcXCxfLjw2QvJY8dOjbc34umG/PNkuu6JeZq2AOhvJYWLFhFWvbRXGkgwDTVUvuE37HlQK1r6lW6JBxlMZOD7rr11XZvlQmejTd1PELhXjqRgTWXwiCfvqj2f+2WlSgRXKdAsz6aAfxBfw0S8SQyvj68M9WoRx1q135LFi0hAJd+zGKZ+pweJkfaUXa5wDBhUARYeHGURi1rIz6gDtew0hZoTDho6geh6IhDVtDLXDlQ7EMs6UVVdJJJW9RkqaXRZaL0Y/6mkR4ycVKa+5aSj62kBtlccEaIH2i6iQO1htGitlGcQWvrETcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SH38/1smQKhZPSiww2sojW0zUiHsVnwLe87X2MnpoQk=;
 b=I5uf2+6hSS17jo26ofD9YV6jTLNUnko2NGOIkFBDxQKZ4TYtEhnpRuvkUETLyWAY9/yRShmNpY6HsDhvcXQ9XYSA7KBHmTBZnxpBrTH6Nha6SEapmR2uIoAHl3c+czhvFQeKhvzTZJ5NVyvZN9WPkUjz9JLOpMzRGDZieB70LslKr/tCZSSI0vKUTBiqKu+igDJoynJJSdNVm+fmypxyWxkeGwy+efZe6rFl/mRBw0kfbcIk9od4qtCGBHr41kV8wzNBax6pZ5P91zxFYZI0yyHotvL2DX4+4xClVaCL1F4+TnDeKiTB0s96oDvmm2eH4PQsIIMJiKHD/7YSX722nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SH38/1smQKhZPSiww2sojW0zUiHsVnwLe87X2MnpoQk=;
 b=trP40v5BjVCM/Y8VjxcyEJGIyPjFmVePqdI1TinW2qLaI7zySo8jPTzf/aMk9FWU3/8aUbh3c3aoD2dy4WQyJi6UWTFigWRUkdECf8GIUOfNXWf7Bl1Uzcf1VmR7/VsqzLUhgXuZ3KfPnnwXbulpKgl1UlcOuW5ICjmpcWsRvhw=
Received: from DS1PR06CA0012.namprd06.prod.outlook.com (2603:10b6:8:458::14)
 by CH3PR10MB7211.namprd10.prod.outlook.com (2603:10b6:610:125::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 17:19:33 +0000
Received: from DS2PEPF000061C3.namprd02.prod.outlook.com
 (2603:10b6:8:458:cafe::61) by DS1PR06CA0012.outlook.office365.com
 (2603:10b6:8:458::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 17:19:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF000061C3.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 17:19:31 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 12:19:29 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 12:19:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 1 Jun 2026 12:19:29 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.30])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 651HJSNN2049864;
	Mon, 1 Jun 2026 12:19:28 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-ti][master/wrynose][PATCH] weston: fix assert firing when subsurfaces have no views
Date: Mon, 1 Jun 2026 12:19:23 -0500
Message-ID: <20260601171923.1728139-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C3:EE_|CH3PR10MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: fc1cc83c-cd11-4e72-b7fb-08dec001f1c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	BFNpPJdrnCJyzSRoQuqdIWa6fqU8SbOINU5dvU1UNgdMhUNVyLa44N6CAM5lNrJr0/NQiCpPpytxPYROuvshjEoikwPlnYEnd9x91CdhrCoQmr9z9tifonTbhXXFfEmHLwgCREIF8zNOimIPNzge7/KTwoWxJA0/Vr+Z5+84ttHKT8VGdU92vXagZI0kFWp6HtIvSgnsM7DZ4Bp+xmtO2ZyCGmpfKgFgrmttEhFOUC4+chAIa73do558QT1a5egJ7Ju5d2PRxgBOTpcT7gKE9dLA7X9hnd13JqVvw0Dh9Ja1lnivZygN9+FldYeHlvDj6LlSH8bpnoSItOBWTxI1oYoiorFAZ2MaIDMobTs88Jf0CKhgc6HurWEGPU3p8wlEHQn8RzZFYo1e0EH9F/HvQ93vxA5VPOzxVYngxpN6dGQFwLWpAOB+uBc9h2bXJPbb5PUnNIjF845aIu3CZcqqpSr3W6upDM7mYNfwvgE1ein8sKx4IMWuyWJsvt8tZKGun540i9ubgv+l+hSN97AJbkbUUHAL+Hxnm8FhaV7QZipIHZJ6cpMJimfMZpFRQqqhcYa/e6jaWzLuthsEXuqQjAXWf8PCm1qWfsraAj2G1H7qgmy/t2qJmLDs1sbq1WoE0/9O7qPoQIk5gtC/iPtq38J8KTfxkKBs08be5cT0crT8LsAuhQcWKpSQ0kMdiek8
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hxbWKrD2l23XfdSSeXK4lWLExMQi/CSMHNTIXc2Zq2Jxvb0JKEy+NlpAqzVQdY5qnT1OjXEHPofv8wQywXH7SHnToGW8K4kKsb1Mxi8qz4wx72drHNCsJ+wpvObgigaIWtmN3uFt4MsU3DHHKjIPPy3RwJWhZ9w7c2b8CWBg+FVH3QdyCs7pGxN2quv5xmG0SfUzLnNeGrLqbhiIlKqV0qhh9aAyQRZMIcvR6S046hLKd3Mom/AcZ7JVG3Vkpnwpk4WjmFvHgHH+TjC6bCTHCXrUcDW4Vl1OrSlcj0qJ9hRjH7PTMthJEJTSbf+yv8LTMPwXNtW/0Rl7AKe1rgL1fwqW52/0G2dMawuFy5B71aCp157cbjDyCzpeoLmkeTyhVLqjVFjPLcpp+wS7x+iqW415sV/LjQus5s7cwnjH2fgrwQaXWC6MYHEuL1ljEBNG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:19:31.5447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1cc83c-cd11-4e72-b7fb-08dec001f1c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7211
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 01 Jun 2026 17:19:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19943

Apply upstream candidate fix for an assert in
weston_surface_apply_subsurface_order that fires when subsurfaces have
no views. Without this patch, the assert fires when running Chromium
and causes the display to crash.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 .../wayland/weston-ti-version.inc             |  1 +
 ...x-assert-firing-when-subsurfaces-hav.patch | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-graphics/wayland/weston/0002-surfac=
e-state-Fix-assert-firing-when-subsurfaces-hav.patch

diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc b/m=
eta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
index 42e6b6ac..c8624f0e 100644
--- a/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
+++ b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
@@ -4,4 +4,5 @@ PR:append =3D ".tisoc1"
=20
 SRC_URI +=3D " \
         file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
+        file://0002-surface-state-Fix-assert-firing-when-subsurfaces-hav.p=
atch \
 "
diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston/0002-surface-state=
-Fix-assert-firing-when-subsurfaces-hav.patch b/meta-ti-bsp/recipes-graphic=
s/wayland/weston/0002-surface-state-Fix-assert-firing-when-subsurfaces-hav.=
patch
new file mode 100644
index 00000000..d370577c
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/wayland/weston/0002-surface-state-Fix-as=
sert-firing-when-subsurfaces-hav.patch
@@ -0,0 +1,47 @@
+From 12ecd8d4b5095c120efef76493546ead3f41ab5b Mon Sep 17 00:00:00 2001
+From: Derek Foreman <derek.foreman@collabora.com>
+Date: Wed, 27 May 2026 14:12:36 -0500
+Subject: [PATCH] surface-state: Fix assert firing when subsurfaces have no
+ views
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/=
-/merge_requests/2085]
+
+I've not been able to reproduce this, but have a report that this fires
+when running Chromium on aarch64.
+
+It seems plausible that we can get here when none of the subsurfaces have
+views, and thus the flag won't be set.
+
+Let's just remove the assert.
+
+Fixes 6a280a8f
+Fixes #1117
+
+Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
+Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
+---
+ libweston/surface-state.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/libweston/surface-state.c b/libweston/surface-state.c
+index 3c31a0aa..65dc70bb 100644
+--- a/libweston/surface-state.c
++++ b/libweston/surface-state.c
+@@ -268,7 +268,6 @@ weston_surface_attach(struct weston_surface *surface,
+ static void
+ weston_surface_apply_subsurface_order(struct weston_surface *surface)
+ {
+-	struct weston_compositor *comp =3D surface->compositor;
+	struct weston_subsurface *sub;
+	struct weston_view *view;
+
+@@ -279,7 +278,6 @@ weston_surface_apply_subsurface_order(struct weston_su=
rface *surface)
+		wl_list_for_each(view, &sub->surface->views, surface_link)
+			weston_view_geometry_dirty(view);
+	}
+-	weston_assert_true(comp, comp->view_list_needs_rebuild);
+ }
+
+ /* Translate pending damage in buffer co-ordinates to surface
+--
+2.34.1
--=20
2.34.1

