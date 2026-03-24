Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B94FEC0EF
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 18:18:45 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4176.1774376316155724418
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 11:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=lZs4l5+t;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.58, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ul22l/tgtpDtoIce6NG9H73Sp6kGzRHlnwAIWIlyfYTfKsY9TDlgEAwn2FgOIgiMt8JFjD/xy4eBx2cgKjfetzUXk1huab1BO3J8ZQd6dJQ7cUliJl3NrL5RjA15CBaC3KLlb8OQsQ4qPK5sQRoh5vRZpCmwtugrVagHZo+k2sU6VkcUH+fdbdYdB/wIQ6ypxWLaDN+ihOforc502akQEQoTZO82lW6DVzSy+v5k3RV7X9gMTZ1BnxMIvR6njPkJgMQe1+Hh+H2j2l+x1/eR2JsWvTnZOkjHtAivScCFaZhxAjMeg19zpeUHsjcAQSPjXqJbcBXsOj+lLUxGQX6jUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71eSVmH7wg6dEblv/8REUkQquUVbHrDvhlZvxh2sWw8=;
 b=qmfSz01VrVvg0JuiXFXfKwbLMmp3L4rBU3iDwLVqIWO/jCdsbCF+xHn0R2aQ/qQchZnaYX8iM2eG5W8iksVu8aLTzVLZOlAqVaQXe8cQpYZngM8ny3svSW3AanMMuPq3wLEtBki7w23vFRSN/B/70RXJw0m9fKKHovvP0PYUpClj/aDnEpj7PKLPoQRw46hfTOP2cke/b8iSXNuwMzJn3t1fYNVHreRzvzhtzxUda5caMhc0tsUYfFQSyghb/Y+gYN6DPbSQkK6/SVcJTMoqjnScOgo1gr53Nsl/X3xfzoMhykzunRdxDYtiwimUKrBj5ra6fv1lG5THpuu3W/EGNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71eSVmH7wg6dEblv/8REUkQquUVbHrDvhlZvxh2sWw8=;
 b=lZs4l5+t4VJCPm3SRdQRGrjGYjGz2m5bNMqLvBGGoNjJyo5eiBf92cNzMYtRRm8sHkUd1YBIqpR3/WDlvabxFYSwXT8d6h0sOKZBfpiQSQAgdyW15wDDpmNhsl3s6a1XQOCSiFAsUm+n4EnIwlkpvVkwXYRxSrYY76RPsCCaNTM=
Received: from BLAPR03CA0089.namprd03.prod.outlook.com (2603:10b6:208:329::34)
 by SA1PR10MB6614.namprd10.prod.outlook.com (2603:10b6:806:2b9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 18:18:33 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::7f) by BLAPR03CA0089.outlook.office365.com
 (2603:10b6:208:329::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 18:18:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 18:18:33 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 13:18:32 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 13:18:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 13:18:32 -0500
Received: from [10.249.32.33] ([10.249.32.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62OIIWDq3089922;
	Tue, 24 Mar 2026 13:18:32 -0500
Message-ID: <88c431e4-862d-48eb-b2ab-d2502596bf9f@ti.com>
Date: Tue, 24 Mar 2026 13:18:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] weston: Update to 15.0.0
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260324162004.3215160-1-reatmon@ti.com>
 <20260324164438.GU11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260324164438.GU11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|SA1PR10MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: 49bd7351-3b69-4b54-2bcd-08de89d1c226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	SdIgSnDIrzoM0DvZGpt4HWLupj5ShiCOcdd9VAiBJcCkKuR76IvsUALca2vWjdaULYVhsCh5aX1rYrp1C7WAEWLFBG0lWy0L8ESWd9oJEPEVl2a1u79r+oIwgh0oNggaofRgCwOnyJ4IT394jZ0dzsOlB/UdVjfc8t6Sv7ZIlaK8r6tR7MgSgqMcdJGk9otUGjwqYNqynuxEQKAs0j4+wusL/7rxl9mNWdmmdagavECfa0MQwsVIb5c8A+4BHOxrZyp/4bVOtquSRlUqo3t0pcXujwJz4nANWhgY5Slp5M5/kngBLk+1CyeDUUBQ+IWWJeGf/v9FVI1pI8cCLZxUgXIksnjVPHwea2ihq4Wu15TEpHSFiowqPKiJJWncMfh2FJpYZiUJBeQsiCzyFx1TZZzr4itOX2exNfTK5uFNa3jBuffuc7XDK0kgO2tVOW7og5pyw8LLvdkZ9XENF0zdyS09/hBgFRFUQTJeKMreC8EFIb3uS3k5LePaycmLlrxaNbtb6LQZeEGTiXNGvoqBozP3VnnRYZJs/k5JkoWWV4WfBOxjcp+DUgj0QmVA9r2aBWvwnt3Q1UYl2IWOM5T/X70t4GT4Dq34wpd7PAeRMokaP0WpbA5yNjCN8/WFvuSme07FvdiOrBVfNAYzhgyrjll2rcYYdQ6XHyKZwuxyZaYdn/024iPF1hQfUMlgt0Niu+QlyqFfaMOM0soxNPjoMt8YURZN/tFJjH0EJWXC0S2QbmZGdQoMeHJ/Ht4dD38niNeqdMMBoXCVBATdFle3Kg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8skT6RkxrNl6yFClQTnqZ+TtTAuOwTEcvoch5jV4WLlYbPvMO3Q0s5mEvuqCzuObPGksgN4TAzUct83eWYL2c2NLIqIZRjvJcBSz+Y8Ud7KpNldv9P1wtf4zOSIJKGscgHUx0FjNT0nwrbN5/BcxPeCkaGL1u7zcEtq3nMbD9mcHRa0c6YzKJ9iJWDOh/gBtE+tfnvtBaarUIsG3MpadXHQXNKcsOgppP9gLn3pleSV81gXcu00/IttxZqm4d/ON0AldQbFlT15DzdkDCHYwK1pj/McfTk15EfS+kq3V49Wtkxb48HVDLkfgRE7hEZScee7ILpMUmZ1qBNCsd7nUYHrZS/vcV44WQm8ludWx06CaOV/nO/bEV5T1MIYeSpv7i+WypsrGN/cLIXunJnx/Kz94Fe/UZ7cThwnnRoIjrev278tyPOX4crbt3MvDPRq2
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:18:33.0441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49bd7351-3b69-4b54-2bcd-08de89d1c226
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6614
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Mar 2026 18:18:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19807



On 3/24/2026 11:44 AM, Denys Dmytriyenko wrote:
> On Tue, Mar 24, 2026 at 11:20:04AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> oe-core has bumped the version to 15.0.0 [1].
> 
> 
>> We need to adjust the bbappend version to % to better match future version
>> changes.
> 
> You shouldn't be doing this rename.
> 
> 
>> Additionally, the patch needs to be updated to match the weston code
>> changes.
> 
> The bbappend is version-specific on purpose exactly due to the fact that the
> patch won't apply against different versions - it has to be massaged every
> time there's a major version bump, we've done it many times before.

But... if the patch won't apply then the build will fail.  But it fails 
in a manner that is more obvious then just an upfront error about the 
bbappend not applying to a recipe.

Either way, with the new bbappend logic they put in, the build will not 
go through.  So what does it really matter if the bbappend if version 
specific or not?


> 
>> [1] https://git.openembedded.org/openembedded-core/commit/?id=a1ed6fddd99171536e23d63a5d5b180019d672ad
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   ...equire-GL_EXT_unpack_subimage-commit.patch | 109 ++++++++----------
>>   ...ston_14.0.%.bbappend => weston_%.bbappend} |   0
>>   2 files changed, 51 insertions(+), 58 deletions(-)
>>   rename meta-ti-bsp/recipes-graphics/wayland/{weston_14.0.%.bbappend => weston_%.bbappend} (100%)
>>
>> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>> index fbe8f2bb..4b3b4a1f 100644
>> --- a/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>> @@ -1,6 +1,6 @@
>> -From 5a05e5b66dd3831a9c9c2b3f64bd42419d9ade2d Mon Sep 17 00:00:00 2001
>> -From: Denys Dmytriyenko <denys@konsulko.com>
>> -Date: Thu, 6 Jul 2023 01:48:41 +0000
>> +From 3cddacaa9ea3cfd75732ea9a84312fa68e0bfda7 Mon Sep 17 00:00:00 2001
>> +From: Ryan Eatmon <reatmon@ti.com>
>> +Date: Tue, 24 Mar 2026 10:52:59 -0500
>>   Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
>>   
>>   This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
>> @@ -13,83 +13,76 @@ Upstream-Status: Inappropriate [specific to TI SGX]
>>   
>>   Signed-off-by: Andrew Davis <afd@ti.com>
>>   Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> -
>> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>   ---
>>    libweston/renderer-gl/gl-renderer-internal.h |  2 ++
>> - libweston/renderer-gl/gl-renderer.c          | 29 ++++++++++++++++----
>> - 2 files changed, 26 insertions(+), 5 deletions(-)
>> + libweston/renderer-gl/gl-renderer.c          | 26 ++++++++++++++++----
>> + 2 files changed, 23 insertions(+), 5 deletions(-)
>>   
>>   diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/renderer-gl/gl-renderer-internal.h
>> -index 5032035..85616c9 100644
>> +index 1afffbda..dbf7b1c3 100644
>>   --- a/libweston/renderer-gl/gl-renderer-internal.h
>>   +++ b/libweston/renderer-gl/gl-renderer-internal.h
>> -@@ -229,6 +229,8 @@ struct gl_renderer {
>> -	PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_platform_window;
>> -	bool has_platform_base;
>> -
>> -+	bool has_unpack_subimage;
>> +@@ -526,6 +526,8 @@ struct gl_renderer {
>> + 	struct weston_log_scope *shader_scope;
>> +
>> + 	struct dmabuf_allocator *allocator;
>>   +
>> -	PFNEGLBINDWAYLANDDISPLAYWL bind_display;
>> -	PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
>> -	PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
>> ++    bool has_unpack_subimage;
>> + };
>> +
>> + static inline uint32_t
>>   diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/gl-renderer.c
>> -index e694418b..2be6d621 100644
>> +index 45a2a148..8b238208 100644
>>   --- a/libweston/renderer-gl/gl-renderer.c
>>   +++ b/libweston/renderer-gl/gl-renderer.c
>> -@@ -2523,6 +2523,7 @@ gl_renderer_flush_damage(struct weston_paint_node *pnode)
>> -	struct weston_surface *surface = pnode->surface;
>> -	const struct weston_testsuite_quirks *quirks =
>> -		&surface->compositor->test_data.test_quirks;
>> -+	struct gl_renderer *gr = get_renderer(surface->compositor);
>> -	struct weston_buffer *buffer = surface->buffer_ref.buffer;
>> -	struct gl_surface_state *gs = get_surface_state(surface);
>> -	struct gl_buffer_state *gb = gs->buffer;
>> -@@ -2550,6 +2551,24 @@ gl_renderer_flush_damage(struct weston_paint_node *pnode)
>> -
>> -	data = wl_shm_buffer_get_data(buffer->shm_buffer);
>> -
>> +@@ -3021,6 +3021,22 @@ gl_renderer_flush_damage(struct weston_paint_node *pnode)
>> +
>> + 	data = wl_shm_buffer_get_data(buffer->shm_buffer);
>> +
>>   +	if (!gr->has_unpack_subimage) {
>>   +		wl_shm_buffer_begin_access(buffer->shm_buffer);
>> -+		for (j = 0; j < gs->buffer->num_textures; j++) {
>> -+			glBindTexture(GL_TEXTURE_2D, gs->buffer->textures[j]);
>> -+			glTexImage2D(GL_TEXTURE_2D, 0,
>> -+				     gs->buffer->gl_format[j],
>> -+				     gs->buffer->pitch / pixel_format_hsub(buffer->pixel_format, j),
>> -+				     buffer->height / pixel_format_vsub(buffer->pixel_format, j),
>> -+				     0,
>> -+				     gl_format_from_internal(gs->buffer->gl_format[j]),
>> -+				     gs->buffer->gl_pixel_type,
>> -+				     data + gs->buffer->offset[j]);
>> ++		for (j = 0; j < gb->num_textures; j++) {
>> ++			glBindTexture(GL_TEXTURE_2D, gb->textures[j]);
>> ++			gl_texture_2d_store(gr, 0, 0, 0,
>> ++                        gb->pitch / pixel_format_hsub(buffer->pixel_format, j),
>> ++				        buffer->height / pixel_format_vsub(buffer->pixel_format, j),
>> ++					    gb->texture_format[j].external,
>> ++					    gb->texture_format[j].type,
>> ++					    data + gb->offset[j]);
>>   +		}
>>   +		wl_shm_buffer_end_access(buffer->shm_buffer);
>>   +
>>   +		goto done;
>>   +	}
>>   +
>> -	if (gb->needs_full_upload || quirks->gl_force_full_upload) {
>> -		wl_shm_buffer_begin_access(buffer->shm_buffer);
>> -
>> -@@ -4754,11 +4773,9 @@ gl_renderer_setup(struct weston_compositor *ec)
>> -	else
>> -		ec->read_format = pixel_format_get_info(DRM_FORMAT_ABGR8888);
>> -
>> --	if (gr->gl_version < gr_gl_version(3, 0) &&
>> --	    !weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage")) {
>> + 	if (gb->needs_full_upload || quirks->force_full_upload) {
>> + 		wl_shm_buffer_begin_access(buffer->shm_buffer);
>> +
>> +@@ -5171,11 +5187,9 @@ gl_renderer_setup(struct weston_compositor *ec)
>> + 	else
>> + 		ec->read_format = pixel_format_get_info(DRM_FORMAT_ABGR8888);
>> +
>> +-	if (gr->gl_version < gl_version(3, 0) &&
>> +-	    !gl_extensions_has(gr, EXTENSION_EXT_UNPACK_SUBIMAGE)) {
>>   -		weston_log("GL_EXT_unpack_subimage not available.\n");
>>   -		return -1;
>>   -	}
>> -+	if (gr->gl_version >= gr_gl_version(3, 0) ||
>> ++	if (gr->gl_version >= gl_version(3, 0) ||
>>   +	    weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage"))
>>   +		gr->has_unpack_subimage = true;
>> -
>> -	if (gr->gl_version >= gr_gl_version(3, 0) ||
>> -	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_10_10_REV"))
>> -@@ -4880,6 +4897,8 @@ gl_renderer_setup(struct weston_compositor *ec)
>> -		   gr_gl_version_minor(gr->gl_version));
>> -	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
>> -			    ec->read_format->drm_format_name);
>> +
>> + 	if (gl_extensions_has(gr, EXTENSION_OES_MAPBUFFER))
>> + 		GET_PROC_ADDRESS(gr->unmap_buffer, "glUnmapBufferOES");
>> +@@ -5303,6 +5317,8 @@ gl_renderer_setup(struct weston_compositor *ec)
>> + 		   gl_version_minor(gr->gl_version));
>> + 	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
>> + 			    ec->read_format->drm_format_name);
>>   +	weston_log_continue(STAMP_SPACE "wl_shm sub-image to texture: %s\n",
>>   +			    gr->has_unpack_subimage ? "yes" : "no");
>> -	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
>> -			    yesno(gr->has_pack_reverse));
>> -	weston_log_continue(STAMP_SPACE "glReadPixels supports PBO: %s\n",
>> + 	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
>> + 			    yesno(gl_extensions_has(gr, EXTENSION_ANGLE_PACK_REVERSE_ROW_ORDER)));
>> + 	weston_log_continue(STAMP_SPACE "glReadPixels supports PBO: %s\n",
>> +--
>> +2.43.0
>> +
>> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston_14.0.%.bbappend b/meta-ti-bsp/recipes-graphics/wayland/weston_%.bbappend
>> similarity index 100%
>> rename from meta-ti-bsp/recipes-graphics/wayland/weston_14.0.%.bbappend
>> rename to meta-ti-bsp/recipes-graphics/wayland/weston_%.bbappend
>> -- 
>> 2.43.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

