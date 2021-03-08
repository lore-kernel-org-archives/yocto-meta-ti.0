Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.38647.1615220955858814655
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Mar 2021 08:29:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qqXoYQ6g;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: praneeth@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 0B75C38C0831
	for <meta-ti@yoctoproject.org>; Mon,  8 Mar 2021 16:29:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 128GTERP017660
	for <meta-ti@yoctoproject.org>; Mon, 8 Mar 2021 10:29:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615220954;
	bh=8IF+Am0j/G8uu2Su2xLZeFbYcrpBdUslqXoqwawHyaM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=qqXoYQ6gqkWD7qbdxzymVEzsbKCJW8NUsoaM1HBtCKlLH9f2I7VfHZqePDpc4P31b
	 GXB7lD7no5hIf6oIweA6xFTx5bKNyA+gD9rzWUN4lbNBJAjVodQH6RCFe1Lj2Bi1Ig
	 twM8MnjhUvbLWk5oMrHwSxkb5YE6/6Wc9OhHKvoo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 128GTEH1121607
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 8 Mar 2021 10:29:14 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Mar
 2021 10:29:13 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Mar 2021 10:29:13 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 128GTDeJ075069;
	Mon, 8 Mar 2021 10:29:13 -0600
Subject: Re: [dunfell/master] PATCH] Recipe changes for TI img Codec driver for ti-5.4.y kernel
To: <sidraya.bj@ti.com>, <meta-ti@yoctoproject.org>
CC: <l-weaver@ti.com>
References: <20210308145859.10628-1-sidraya.bj@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <acb366b8-691c-a17d-7674-6a9f5ee1e8be@ti.com>
Date: Mon, 8 Mar 2021 10:29:13 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308145859.10628-1-sidraya.bj@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/8/2021 8:58 AM, sidraya.bj@ti.com wrote:
> From: Sidraya Jayagond <sidraya.bj@ti.com>
> 
> ti-5.4.y kernel modifications done to support TI
> img codec drivers.
> 
> Added recipe files for ti-img-encode-decode driver.

NACK for any proper review from SDK or upstream point of view.

* Assuming this is RFC.(Add a cover letter)
* Please split the patch logically.
** I want to see kernel, Gstreamer , codec and viddec test recipe seperately

> 
> From: Sidraya Jayagond <sidraya.bj@ti.com>
> Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
> ---
>   ...dec-driver-porting-to-ti-linux-5.4.y.patch | 255 ++++++++++++++++++
>   ...anging-on-Gstreamer-and-standalone-t.patch |  32 +++
>   .../ti-img-encode-decode_1.0.0.bb             |  33 +++
>   .../viddec-test-app_1.0.0.bb                  |  18 ++
>   .../videnc-test-app_1.0.0.bb                  |  18 ++
>   .../ti-img-encode-decode/vxd-dec-fw_git.bb    |  34 +++
>   ..._config_fragments-Add-multimedia.cfg.patch |  29 ++
>   ...d-10bit-definitions-for-NV12-and-NV1.patch |  46 ++++
>   ...atform-Kconfig-Add-Video-decoder-kco.patch |  47 ++++
>   ...ti-k3-j721e-main.dtsi-Add-D5520-node.patch |  37 +++
>   ...-binding-for-img-d5520-vxd-for-J721E.patch |  47 ++++
>   ...atorm-Kconfig-Add-Video-encoder-kcon.patch |  43 +++
>   ...i-k3-j721e-main.dtsi-Add-VXE384-node.patch |  35 +++
>   ...Add-binding-for-img-vxe384-for-J721E.patch |  44 +++
>   ...nts-multimedia.cfg-Add-video-encode-.patch |  29 ++
>   recipes-kernel/linux/linux-ti-staging_5.4.bb  |  11 +-
>   16 files changed, 757 insertions(+), 1 deletion(-)
>   create mode 100644 recipes-bsp/ti-img-encode-decode/files/0001-TI-IMG-video-codec-driver-porting-to-ti-linux-5.4.y.patch
>   create mode 100644 recipes-bsp/ti-img-encode-decode/files/0002-Decoder-driver-hanging-on-Gstreamer-and-standalone-t.patch
>   create mode 100644 recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
>   create mode 100644 recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
>   create mode 100644 recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
>   create mode 100644 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>   create mode 100644 recipes-kernel/linux/files/0001-ti_config_fragments-Add-multimedia.cfg.patch
>   create mode 100644 recipes-kernel/linux/files/0002-v4l-videodev2-Add-10bit-definitions-for-NV12-and-NV1.patch
>   create mode 100644 recipes-kernel/linux/files/0003-drivers-media-platform-Kconfig-Add-Video-decoder-kco.patch
>   create mode 100644 recipes-kernel/linux/files/0004-arm64-dts-ti-k3-j721e-main.dtsi-Add-D5520-node.patch
>   create mode 100644 recipes-kernel/linux/files/0005-dt-bindings-Add-binding-for-img-d5520-vxd-for-J721E.patch
>   create mode 100644 recipes-kernel/linux/files/0006-drivers-media-platorm-Kconfig-Add-Video-encoder-kcon.patch
>   create mode 100644 recipes-kernel/linux/files/0007-arm64-dts-ti-k3-j721e-main.dtsi-Add-VXE384-node.patch
>   create mode 100644 recipes-kernel/linux/files/0008-dt-bindings-Add-binding-for-img-vxe384-for-J721E.patch
>   create mode 100644 recipes-kernel/linux/files/0009-ti_config_fragments-multimedia.cfg-Add-video-encode-.patch
> 
> diff --git a/recipes-bsp/ti-img-encode-decode/files/0001-TI-IMG-video-codec-driver-porting-to-ti-linux-5.4.y.patch b/recipes-bsp/ti-img-encode-decode/files/0001-TI-IMG-video-codec-driver-porting-to-ti-linux-5.4.y.patch
> new file mode 100644
> index 00000000..2c33a505
> --- /dev/null
> +++ b/recipes-bsp/ti-img-encode-decode/files/0001-TI-IMG-video-codec-driver-porting-to-ti-linux-5.4.y.patch
> @@ -0,0 +1,255 @@
> +From b46cc6adb06b367da81276a3992c3aea20414629 Mon Sep 17 00:00:00 2001
> +From: Sidraya Jayagond <sidraya.bj@ti.com>
> +Date: Mon, 8 Mar 2021 19:32:58 +0530
> +Subject: [PATCH 1/2] TI IMG video codec driver porting to ti-linux-5.4.y
> +
> +Porting V4L2 codec driver APIs to latest Kernel 5.4 and
> +Porting OSAL module for making required compatible changes
> +to ti-linux-5.4.y.
> +
> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
> +---
> + driver/common/addr_alloc.h |  2 --
> + driver/common/hash.c       |  2 --
> + driver/common/resource.c   |  2 +-
> + driver/common/resource.h   |  2 +-
> + driver/decoder/core.c      |  6 +++---
> + driver/decoder/decoder.c   | 10 +++++-----
> + linux/decoder/vxd_v4l2.c   |  5 +++--
> + linux/encoder/Makefile     |  2 +-
> + linux/encoder/vxe_v4l2.c   |  5 +++--
> + osal/inc/osa_time.h        |  2 +-
> + osal/src/linux/osa_time.c  |  4 ++--
> + 11 files changed, 20 insertions(+), 22 deletions(-)
> +
> +diff --git a/driver/common/addr_alloc.h b/driver/common/addr_alloc.h
> +index ae19706..67cf33d 100644
> +--- a/driver/common/addr_alloc.h
> ++++ b/driver/common/addr_alloc.h
> +@@ -20,8 +20,6 @@
> + #include "osal/inc/osa_mutex.h"
> + #include "ra.h"
> +
> +-#define FALSE 0
> +-#define TRUE 1
> +
> + /* Defines whether sequential or random allocation is used */
> + enum {
> +diff --git a/driver/common/hash.c b/driver/common/hash.c
> +index e3c2048..24116d7 100644
> +--- a/driver/common/hash.c
> ++++ b/driver/common/hash.c
> +@@ -22,8 +22,6 @@
> + #include "img_errors.h"
> + #include "pool.h"
> +
> +-#define FALSE 0
> +-#define TRUE 1
> +
> + /* pool of struct hash objects */
> + static struct pool *global_hashpool = NULL;
> +diff --git a/driver/common/resource.c b/driver/common/resource.c
> +index 26bd373..3d2a5f3 100644
> +--- a/driver/common/resource.c
> ++++ b/driver/common/resource.c
> +@@ -77,7 +77,7 @@ int32 resource_item_isavailable(uint32 *refcnt)
> + /*
> +  * adds an item (and associated id) to a resource list
> +  */
> +-int32 resource_list_add(struct lst_t *list, void *item, uint32 id, uint32 *refcnt)
> ++int32 resource_list_add_img(struct lst_t *list, void *item, uint32 id, uint32 *refcnt)
> + {
> + 	struct resource_list_elem *listelem = NULL;
> + 	int32 bfound = 0;
> +diff --git a/driver/common/resource.h b/driver/common/resource.h
> +index 540aeb4..278e5c2 100644
> +--- a/driver/common/resource.h
> ++++ b/driver/common/resource.h
> +@@ -28,7 +28,7 @@ int32 resource_item_release(uint32 *refcnt);
> +
> + int32 resource_item_isavailable(uint32 *refcnt);
> +
> +-int32 resource_list_add(struct lst_t *list, void *item, uint32 id, uint32 *refcnt);
> ++int32 resource_list_add_img(struct lst_t *list, void *item, uint32 id, uint32 *refcnt);
> +
> + void *resource_list_pickhead(struct lst_t *list);
> +
> +diff --git a/driver/decoder/core.c b/driver/decoder/core.c
> +index 29d1383..d7fc0a3 100644
> +--- a/driver/decoder/core.c
> ++++ b/driver/decoder/core.c
> +@@ -2201,7 +2201,7 @@ static int32 core_stream_resource_create(struct core_stream_context *core_str_ct
> + 		pictres_int->seq_resint = seqres_int;
> + #endif
> + 		/* Add the internal picture resources to the list. */
> +-		ret = resource_list_add(&core_str_ctx->aux_pict_res_list,
> ++		ret = resource_list_add_img(&core_str_ctx->aux_pict_res_list,
> + 					pictres_int, 0, &pictres_int->ref_cnt);
> +
> + 		pictres_int = lst_next(pictres_int);
> +@@ -2630,7 +2630,7 @@ int32 core_stream_submit_unit(uint32 res_str_id, struct vdecdd_str_unit *str_uni
> + 	dd_str_context = core_str_ctx->dd_str_ctx;
> + 	VDEC_ASSERT(dd_str_context);
> +
> +-	ret = resource_list_add(&core_str_ctx->str_unit_list, str_unit, 0,
> ++	ret = resource_list_add_img(&core_str_ctx->str_unit_list, str_unit, 0,
> + 				NULL);
> + 	VDEC_ASSERT(ret == IMG_SUCCESS);
> +
> +@@ -2771,7 +2771,7 @@ int32 core_stream_fill_pictbuf(uint32 buf_map_id)
> + 	VDEC_ASSERT(ddbuf_map_info->buf_type == VDEC_BUFTYPE_PICTURE);
> +
> + 	/* Add the image buffer to the list */
> +-	ret = resource_list_add(&core_str_ctx->pict_buf_list, ddbuf_map_info,
> ++	ret = resource_list_add_img(&core_str_ctx->pict_buf_list, ddbuf_map_info,
> + 				0, &ddbuf_map_info->ddbuf_info.ref_count);
> +
> + 	return ret;
> +diff --git a/driver/decoder/decoder.c b/driver/decoder/decoder.c
> +index 7a391a4..f22f66b 100644
> +--- a/driver/decoder/decoder.c
> ++++ b/driver/decoder/decoder.c
> +@@ -1125,7 +1125,7 @@ decoder_stream_decode_resource_create(struct dec_str_ctx *dec_str_context)
> +
> + 	pict_dec_res->ref_cnt = 1;
> +
> +-	ret = resource_list_add(&dec_str_context->dec_res_lst, pict_dec_res, 0,
> ++	ret = resource_list_add_img(&dec_str_context->dec_res_lst, pict_dec_res, 0,
> + 				&pict_dec_res->ref_cnt);
> +
> + 	if (ret != IMG_SUCCESS) {
> +@@ -2377,7 +2377,7 @@ decoder_picture_decode(struct dec_str_ctx *dec_str_ctx,
> +
> + 		if (resource_item_isavailable(&dec_str_ctx->prev_fe_pict_dec_res->ref_cnt)) {
> + 			resource_list_remove(&dec_str_ctx->dec_res_lst, dec_str_ctx->prev_fe_pict_dec_res);
> +-			resource_list_add(&dec_str_ctx->dec_res_lst,
> ++			resource_list_add_img(&dec_str_ctx->dec_res_lst,
> + 					  dec_str_ctx->prev_fe_pict_dec_res, 0,
> + 					  &dec_str_ctx->prev_fe_pict_dec_res->ref_cnt);
> + 		}
> +@@ -2553,7 +2553,7 @@ decoder_stream_reference_resource_create(struct dec_str_ctx *dec_str_ctx)
> +
> + 	pict_ref_res->ref_cnt = 1;
> +
> +-	ret = resource_list_add(&dec_str_ctx->ref_res_lst, pict_ref_res, 0,
> ++	ret = resource_list_add_img(&dec_str_ctx->ref_res_lst, pict_ref_res, 0,
> + 				&pict_ref_res->ref_cnt);
> + 	if (ret != IMG_SUCCESS) {
> + 		OSA_PR_ERR("[USERSID=0x%08X] Failed to add resource",
> +@@ -4491,7 +4491,7 @@ int32 decoder_service_firmware_response(void *dec_str_ctx_arg, uint32 *msg,
> + 			if (resource_item_isavailable(&dec_str_ctx->last_be_pict_dec_res->ref_cnt)) {
> + 				resource_list_remove(&dec_str_ctx->dec_res_lst,
> + 						     dec_str_ctx->last_be_pict_dec_res);
> +-				resource_list_add(&dec_str_ctx->dec_res_lst,
> ++				resource_list_add_img(&dec_str_ctx->dec_res_lst,
> + 						  dec_str_ctx->last_be_pict_dec_res,
> + 						  0,
> + 						  &dec_str_ctx->last_be_pict_dec_res->ref_cnt);
> +@@ -4512,7 +4512,7 @@ int32 decoder_service_firmware_response(void *dec_str_ctx_arg, uint32 *msg,
> + 		if (resource_item_isavailable(&dec_pict->cur_pict_dec_res->ref_cnt)) {
> + 			resource_list_remove(&dec_str_ctx->dec_res_lst,
> + 					     dec_pict->cur_pict_dec_res);
> +-			resource_list_add(&dec_str_ctx->dec_res_lst,
> ++			resource_list_add_img(&dec_str_ctx->dec_res_lst,
> + 					  dec_pict->cur_pict_dec_res,
> + 					  0,
> + 					  &dec_pict->cur_pict_dec_res->ref_cnt);
> +diff --git a/linux/decoder/vxd_v4l2.c b/linux/decoder/vxd_v4l2.c
> +index 5f0075a..c2ff49b 100644
> +--- a/linux/decoder/vxd_v4l2.c
> ++++ b/linux/decoder/vxd_v4l2.c
> +@@ -1632,12 +1632,12 @@ static int32 vxd_g_selection(struct file *file, void *fh,
> + static const struct v4l2_ioctl_ops vxd_dec_ioctl_ops = {
> + 	.vidioc_querycap = vxd_dec_querycap,
> +
> +-	.vidioc_enum_fmt_vid_cap_mplane = vxd_dec_enum_fmt,
> ++	.vidioc_enum_fmt_vid_cap = vxd_dec_enum_fmt,
> + 	.vidioc_g_fmt_vid_cap_mplane = vxd_dec_g_fmt,
> + 	.vidioc_try_fmt_vid_cap_mplane = vxd_dec_try_fmt,
> + 	.vidioc_s_fmt_vid_cap_mplane = vxd_dec_s_fmt,
> +
> +-	.vidioc_enum_fmt_vid_out_mplane = vxd_dec_enum_fmt,
> ++	.vidioc_enum_fmt_vid_out = vxd_dec_enum_fmt,
> + 	.vidioc_g_fmt_vid_out_mplane = vxd_dec_g_fmt,
> + 	.vidioc_try_fmt_vid_out_mplane = vxd_dec_try_fmt,
> + 	.vidioc_s_fmt_vid_out_mplane = vxd_dec_s_fmt,
> +@@ -2034,6 +2034,7 @@ static int32 vxd_dec_probe(struct platform_device *pdev)
> + 	vxd->vfd_dec = vfd;
> + 	*vfd = vxd_dec_videodev;
> + 	vfd->v4l2_dev = &vxd->v4l2_dev;
> ++	vfd->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> + 	vfd->lock = vxd->mutex;
> +
> + 	video_set_drvdata(vfd, vxd);
> +diff --git a/linux/encoder/Makefile b/linux/encoder/Makefile
> +index ddb030d..2a33aca 100644
> +--- a/linux/encoder/Makefile
> ++++ b/linux/encoder/Makefile
> +@@ -75,7 +75,7 @@ vxe-enc-objs += $(OSAL_PATH)/src/linux/osa_reg_io.o
> + vxe-enc-objs += $(OSAL_PATH)/src/linux/osa_string.o
> + vxe-enc-objs += $(OSAL_PATH)/src/linux/osa_event.o
> +
> +-obj-m += vxe-enc.o
> ++obj-$(CONFIG_VIDEO_IMG_VXE_ENC) += vxe-enc.o
> +
> + ccflags-y   += -DOSAL_LINUX
> +
> +diff --git a/linux/encoder/vxe_v4l2.c b/linux/encoder/vxe_v4l2.c
> +index c79587c..e3d452a 100644
> +--- a/linux/encoder/vxe_v4l2.c
> ++++ b/linux/encoder/vxe_v4l2.c
> +@@ -1602,12 +1602,12 @@ static int32 vxe_s_parm(struct file *file, void *priv,
> + static const struct v4l2_ioctl_ops vxe_enc_ioctl_ops = {
> + 	.vidioc_querycap = vxe_querycap,
> +
> +-	.vidioc_enum_fmt_vid_cap_mplane = vxe_enum_fmt,
> ++	.vidioc_enum_fmt_vid_cap = vxe_enum_fmt,
> + 	.vidioc_g_fmt_vid_cap_mplane = vxe_g_fmt,
> + 	.vidioc_try_fmt_vid_cap_mplane = vxe_try_fmt,
> + 	.vidioc_s_fmt_vid_cap_mplane = vxe_s_fmt,
> +
> +-	.vidioc_enum_fmt_vid_out_mplane = vxe_enum_fmt,
> ++	.vidioc_enum_fmt_vid_out = vxe_enum_fmt,
> + 	.vidioc_g_fmt_vid_out_mplane = vxe_g_fmt,
> + 	.vidioc_try_fmt_vid_out_mplane = vxe_try_fmt,
> + 	.vidioc_s_fmt_vid_out_mplane = vxe_s_fmt,
> +@@ -1840,6 +1840,7 @@ static int32 vxe_enc_probe(struct platform_device *pdev)
> + 	vxe->vfd = vfd;
> + 	*vfd = vxe_enc_videodev;
> + 	vfd->v4l2_dev = &vxe->ti_vxe_dev;
> ++	vfd->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> + 	vfd->lock = vxe->mutex;
> +
> + 	video_set_drvdata(vfd, vxe);
> +diff --git a/osal/inc/osa_time.h b/osal/inc/osa_time.h
> +index d74fddf..2aee7f6 100644
> +--- a/osal/inc/osa_time.h
> ++++ b/osal/inc/osa_time.h
> +@@ -28,7 +28,7 @@
> + #include <linux/time.h>
> +
> + struct osa_timespec {
> +-	struct timespec ts;
> ++	struct timespec64 ts;
> + };
> + #elif defined(OSAL_SYSBIOS)
> + struct osa_timespec {
> +diff --git a/osal/src/linux/osa_time.c b/osal/src/linux/osa_time.c
> +index 14958da..82e05b2 100644
> +--- a/osal/src/linux/osa_time.c
> ++++ b/osal/src/linux/osa_time.c
> +@@ -58,9 +58,9 @@ void osa_getnstimeofday(struct osa_timespec *ts_args)
> +
> + void osa_timespec_sub(struct osa_timespec *end_time, struct osa_timespec *start_time, struct osa_timespec *dif_time)
> + {
> +-    struct timespec *ts = (struct timespec *)(&dif_time->ts);
> ++	struct timespec64 *ts = (struct timespec64 *)(&dif_time->ts);
> +
> +-    *ts = timespec_sub(*((struct timespec *)(&end_time->ts)), *((struct timespec *)(&start_time->ts)));
> ++	*ts = timespec64_sub(*((struct timespec64 *)(&end_time->ts)), *((struct timespec64 *)(&start_time->ts)));
> + }
> +
> + /**
> +--
> +2.17.1
> +
> diff --git a/recipes-bsp/ti-img-encode-decode/files/0002-Decoder-driver-hanging-on-Gstreamer-and-standalone-t.patch b/recipes-bsp/ti-img-encode-decode/files/0002-Decoder-driver-hanging-on-Gstreamer-and-standalone-t.patch
> new file mode 100644
> index 00000000..3fda6817
> --- /dev/null
> +++ b/recipes-bsp/ti-img-encode-decode/files/0002-Decoder-driver-hanging-on-Gstreamer-and-standalone-t.patch
> @@ -0,0 +1,32 @@
> +From 363695b326ce804836d89cf877289da95fb2281f Mon Sep 17 00:00:00 2001
> +From: Sidraya Jayagond <sidraya.bj@ti.com>
> +Date: Mon, 8 Mar 2021 19:35:48 +0530
> +Subject: [PATCH 2/2] Decoder driver hanging on Gstreamer and standalone test
> + app
> +
> +Commit hash "70f0e5762296848cde817752a648df3579ffbfb6" changes revoked to
> +avoid gstreamer launch command and standalone test app
> +hanging for indefinite time
> +
> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
> +---
> + driver/decoder/vxd_core.c | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/driver/decoder/vxd_core.c b/driver/decoder/vxd_core.c
> +index 791d470..1f984de 100644
> +--- a/driver/decoder/vxd_core.c
> ++++ b/driver/decoder/vxd_core.c
> +@@ -1477,9 +1477,7 @@ int32 vxd_send_msg(struct vxd_dec_ctx *ctx, struct vxd_fw_msg *msg)
> + 		"%s: added item %p to pend, ptd: 0x%x, str: %u flags: 0x%x\n",
> + 		__func__, item, stream->ptd, stream->id, item->msg.out_flags);
> +
> +-	osa_mutex_lock(vxd->mutex);
> + 	vxd_schedule_locked(vxd);
> +-	osa_mutex_unlock(vxd->mutex);
> +
> + out_unlock:
> + 	osa_mutex_unlock(ctx->mutex);
> +--
> +2.17.1
> +
> diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> new file mode 100644
> index 00000000..d0aefe66
> --- /dev/null
> +++ b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> @@ -0,0 +1,33 @@
> +SUMMARY = "Kernel drivers for the IMG VXE384 MP2 and D5520 encoder/decoder found in TI SoCs"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://driver/common/dq.c;beginline=1;endline=16;md5=e015e28ff5e88576dab9fdf641e3dbfe"
> +
> +inherit module
> +
> +MACHINE_KERNEL_PR_append = "g"
> +PR = "${MACHINE_KERNEL_PR}"
> +
> +COMPATIBLE_MACHINE = "j7-evm"
> +
> +SRCREV = "510439deecb584d2277ca9619ea546c81c778752"
> +
> +EXTRA_OEMAKE = "KPATH=${STAGING_KERNEL_DIR} KCONF=${STAGING_KERNEL_BUILDDIR}"
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/jacinto7_multimedia/ti-img-encode-decode.git;protocol=git;branch=${BRANCH} \
> +	   file://0001-TI-IMG-video-codec-driver-porting-to-ti-linux-5.4.y.patch \
> +	   file://0002-Decoder-driver-hanging-on-Gstreamer-and-standalone-t.patch"
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile() {
> +	oe_runmake all -C ${S}/linux/decoder
> +	oe_runmake all -C ${S}/linux/encoder
> +}
> +
> +do_install() {
> +	install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> +	install -m 644 ${S}/linux/decoder/vxd-dec.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> +	install -m 644 ${S}/linux/encoder/vxe-enc.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> +}
> diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> new file mode 100644
> index 00000000..48a17537
> --- /dev/null
> +++ b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Test applications for TI DEC (v4l2 decoder for IMG D5520)"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://main.c;beginline=1;endline=14;md5=f17e17d664f72942124e4fcf06c178ee"
> +
> +DEPENDS = "libdrm ffmpeg"
> +
> +inherit autotools pkgconfig
> +
> +PR = "r1"
> +SRCREV = "94a80c8c090dbfdc7fafd4e5bb78c2091e715af2"
> +
> +EXTRA_OEMAKE = "CC="${CC}""
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/jacinto7_multimedia/viddec-test-app.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
> new file mode 100644
> index 00000000..3bb5d745
> --- /dev/null
> +++ b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Test applications for TI ENC (v4l2 encoder for IMG VXE384)"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://main.c;beginline=1;endline=14;md5=3545dd5bdf513840937d38c10b866605"
> +
> +DEPENDS = "libdrm"
> +
> +inherit autotools pkgconfig
> +
> +PR = "r0"
> +SRCREV = "a5e7d820bea1be24f25a8369d4d4521c784f869a"
> +
> +EXTRA_OEMAKE = "CC="${CC}""
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/jacinto7_multimedia/videnc-test-app.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> new file mode 100644
> index 00000000..2812fa2c
> --- /dev/null
> +++ b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "Video Decoding Firmware Packaging recipe"
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=84ca7278930db001870686ad997d6bb1"
> +
> +BRANCH = "master"
> +SRCREV = "0acbf1d0a7c7eaca0ef14c1a30ce313ea82147e5"
> +
> +SRC_URI = "git://git.ti.com/jacinto7_multimedia/ti-img-encode-decode.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +PV = "1.0-git${SRCPV}"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +VXD_FW_DIR = "${S}/decoder/firmware/"
> +
> +# make sure that lib/firmware, and all its contents are part of the package
> +FILES_${PN} += "${base_libdir}/firmware"
> +
> +do_install() {
> +  install -d ${D}${base_libdir}/firmware
> +  install -m 0755 ${VXD_FW_DIR}/pvdec_full_bin.fw ${D}${base_libdir}/firmware
> +}
> +
> +# This is used to prevent the build system to strip the executables
> +INHIBIT_PACKAGE_STRIP = "1"
> +# This is used to prevent the build system to split the debug info in a separate file
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
> +INSANE_SKIP_${PN} += "arch"
> +
> +# we don't want to configure and build the source code
> +do_compile[noexec] = "1"
> +do_configure[noexec] = "1"
> diff --git a/recipes-kernel/linux/files/0001-ti_config_fragments-Add-multimedia.cfg.patch b/recipes-kernel/linux/files/0001-ti_config_fragments-Add-multimedia.cfg.patch
> new file mode 100644
> index 00000000..41edaf9b
> --- /dev/null
> +++ b/recipes-kernel/linux/files/0001-ti_config_fragments-Add-multimedia.cfg.patch
> @@ -0,0 +1,29 @@
> +From 038f143c45be8e1a51eede595a253e502ff5aa5e Mon Sep 17 00:00:00 2001
> +From: Sunita Nadampalli <sunitan@ti.com>
> +Date: Mon, 8 Mar 2021 18:21:40 +0530
> +Subject: [PATCH 1/9] ti_config_fragments: Add multimedia.cfg
> +
> +Add d5520 vxd_dec configurations to multimedia.cfg
> +
> +Signed-off-by: Sunita Nadampalli <sunitan@ti.com>
> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
> +---
> + ti_config_fragments/multimedia.cfg | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/ti_config_fragments/multimedia.cfg b/ti_config_fragments/multimedia.cfg
> +index f93841327787..f7e7ecf2a061 100644
> +--- a/ti_config_fragments/multimedia.cfg
> ++++ b/ti_config_fragments/multimedia.cfg
> +@@ -1,3 +1,7 @@
> + ##################################################
> + # TI Multimedia (Video Decode, Encode) Configs
> + ##################################################
> ++# IMG D5500 v4l2 Driver Config Options
> ++
> ++CONFIG_MEDIA_SUPPORT=y
> ++CONFIG_VIDEO_IMG_VXD_DEC=m
> +--
> +2.17.1
> +
> diff --git a/recipes-kernel/linux/files/0002-v4l-videodev2-Add-10bit-definitions-for-NV12-and-NV1.patch b/recipes-kernel/linux/files/0002-v4l-videodev2-Add-10bit-definitions-for-NV12-and-NV1.patch
> new file mode 100644
> index 00000000..9861b60a
> --- /dev/null
> +++ b/recipes-kernel/linux/files/0002-v4l-videodev2-Add-10bit-definitions-for-NV12-and-NV1.patch
> @@ -0,0 +1,46 @@
> +From dd1ac27cffaecd5cf7882c7f138da1f8f7775737 Mon Sep 17 00:00:00 2001
> +From: Sunita Nadampalli <sunitan@ti.com>
> +Date: Mon, 8 Mar 2021 18:45:47 +0530
> +Subject: [PATCH 2/9] v4l: videodev2: Add 10bit definitions for NV12 and NV16
> + color formats
> +
> +The default color formats support only 8bit color depth. This patch
> +adds 10bit definitions for NV12 and NV16.
> +
> +Signed-off-by: Sunita Nadampalli <sunitan@ti.com>
> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
> +---
> + drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
> + include/uapi/linux/videodev2.h       | 2 ++
> + 2 files changed, 4 insertions(+)
> +
> +diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> +index 58868d7129eb..5d4d1e3fb97f 100644
> +--- a/drivers/media/v4l2-core/v4l2-ioctl.c
> ++++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> +@@ -1330,6 +1330,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> + 	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
> + 	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
> + 	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
> ++	case V4L2_PIX_FMT_TI1210:       descr = "10-bit YUV 4:2:0 (NV12)"; break;
> ++	case V4L2_PIX_FMT_TI1610:       descr = "10-bit YUV 4:2:2 (NV16)"; break;
> +
> + 	default:
> + 		/* Compressed formats */
> +diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> +index 3392a118c3a7..2093405b5c86 100644
> +--- a/include/uapi/linux/videodev2.h
> ++++ b/include/uapi/linux/videodev2.h
> +@@ -726,6 +726,8 @@ struct v4l2_pix_format {
> + #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
> + #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
> + #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
> ++#define V4L2_PIX_FMT_TI1210   v4l2_fourcc('T', 'I', '1', '2') /* TI NV12 10-bit, two bytes per channel */
> ++#define V4L2_PIX_FMT_TI1610   v4l2_fourcc('T', 'I', '1', '6') /* TI NV16 10-bit, two bytes per channel */
> +
> + /* 10bit raw bayer packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
> + #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
> +--
> +2.17.1
> +
> diff --git a/recipes-kernel/linux/files/0003-drivers-media-platform-Kconfig-Add-Video-decoder-kco.patch b/recipes-kernel/linux/files/0003-drivers-media-platform-Kconfig-Add-Video-decoder-kco.patch
> new file mode 100644
> index 00000000..8dda888e
> --- /dev/null
> +++ b/recipes-kernel/linux/files/0003-drivers-media-platform-Kconfig-Add-Video-decoder-kco.patch
> @@ -0,0 +1,47 @@
> +From d4ec201d6606f5dddd862cb5cf14b109968090da Mon Sep 17 00:00:00 2001
> +From: Sunita Nadampalli <sunitan@ti.com>
> +Date: Mon, 8 Mar 2021 18:48:45 +0530
> +Subject: [PATCH 3/9] drivers: media: platform: Kconfig: Add Video decoder
> + kconfig entries
> +
> +Add video decoder basic config to Kconfig and
> +select the required V4l2 modules.
> +
> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> +Signed-off-by: Sunita Nadampalli <sunitan@ti.com>
> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
> +
> +Modified help syntax from --help-- to help
> +
> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
> +---
> + drivers/media/platform/Kconfig | 13 +++++++++++++
> + 1 file changed, 13 insertions(+)
> +
> +diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> +index ebaa217b5785..49c9f0a889a3 100644
> +--- a/drivers/media/platform/Kconfig
> ++++ b/drivers/media/platform/Kconfig
> +@@ -502,6 +502,19 @@ config VIDEO_TI_VPE_DEBUG
> + 	help
> + 	  Enable debug messages on VPE driver.
> +
> ++config VIDEO_IMG_VXD_DEC
> ++	  tristate "IMG VXD DEC (Video Decoder) driver"
> ++	  depends on VIDEO_DEV && VIDEO_V4L2
> ++	  depends on ARCH_K3_J721E_SOC || COMPILE_TEST
> ++	  select VIDEOBUF2_CORE
> ++	  select VIDEOBUF2_DMA_CONTIG
> ++	  select VIDEOBUF2_DMA_SG
> ++	  select V4L2_MEM2MEM_DEV
> ++	  help
> ++	    This is an IMG VXD DEC V4L2 driver that adds support for the
> ++	    Imagination D5520 (Video Decoder) hardware.
> ++	    The module name when built is vxd-dec.
> ++
> + config VIDEO_QCOM_VENUS
> + 	tristate "Qualcomm Venus V4L2 encoder/decoder driver"
> + 	depends on VIDEO_DEV && VIDEO_V4L2
> +--
> +2.17.1
> +
> diff --git a/recipes-kernel/linux/files/0004-arm64-dts-ti-k3-j721e-main.dtsi-Add-D5520-node.patch b/recipes-kernel/linux/files/0004-arm64-dts-ti-k3-j721e-main.dtsi-Add-D5520-node.patch
> new file mode 100644
> index 00000000..3b6bb43e
> --- /dev/null
> +++ b/recipes-kernel/linux/files/0004-arm64-dts-ti-k3-j721e-main.dtsi-Add-D5520-node.patch
> @@ -0,0 +1,37 @@
> +From ddcd597c48ef2bb1bcea13af5946ae662794f0e3 Mon Sep 17 00:00:00 2001
> +From: Sunita Nadampalli <sunitan@ti.com>
> +Date: Mon, 8 Mar 2021 18:51:22 +0530
> +Subject: [PATCH 4/9] arm64: dts: ti: k3-j721e-main.dtsi: Add D5520 node
> +
> +Add D5520 video decoder node to k3 devices.
> +
> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> +Signed-off-by: Sunita Nadampalli <sunitan@ti.com>
> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
> +---
> + arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +index 8d0c16252ffa..b8c456735e27 100644
> +--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> ++++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +@@ -1340,6 +1340,14 @@
> + 		power-domains = <&k3_pds 193 TI_SCI_PD_EXCLUSIVE>;
> + 	};
> +
> ++	d5520: video-decoder@4300000 {
> ++	       /* IMG D5520 driver configuration */
> ++	       compatible = "img,d5500-vxd";
> ++	       reg = <0x00 0x04300000 0x00 0x100000>;
> ++	       power-domains = <&k3_pds 144 TI_SCI_PD_EXCLUSIVE>;
> ++	       interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
> ++	};
> ++
> + 	ufs_wrapper: ufs-wrapper@4e80000 {
> + 		compatible = "ti,j721e-ufs";
> + 		reg = <0x0 0x4e80000 0x0 0x100>;
> +--
> +2.17.1
> +
> diff --git a/recipes-kernel/linux/files/0005-dt-bindings-Add-binding-for-img-d5520-vxd-for-J721E.patch b/recipes-kernel/linux/files/0005-dt-bindings-Add-binding-for-img-d5520-vxd-for-J721E.patch
> new file mode 100644
> index 00000000..e0256b3a
> --- /dev/null
> +++ b/recipes-kernel/linux/files/0005-dt-bindings-Add-binding-for-img-d5520-vxd-for-J721E.patch
> @@ -0,0 +1,47 @@
> +From c45b294833fd46b7af4f390ddb8d35979ce11ab1 Mon Sep 17 00:00:00 2001
> +From: Sunita Nadampalli <sunitan@ti.com>
> +Date: Mon, 8 Mar 2021 18:56:44 +0530
> +Subject: [PATCH 5/9] dt-bindings: Add binding for img,d5520-vxd for J721E
> +
> +Add the dt-binding for the img,d5520-vxd node for J721E.
> +
> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> +Signed-off-by: Sunita Nadampalli <sunitan@ti.com>
> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
> +---
> + .../bindings/media/img,d5520-vxd.txt          | 22 +++++++++++++++++++
> + 1 file changed, 22 insertions(+)
> + create mode 100644 Documentation/devicetree/bindings/media/img,d5520-vxd.txt
> +
> +diff --git a/Documentation/devicetree/bindings/media/img,d5520-vxd.txt b/Documentation/devicetree/bindings/media/img,d5520-vxd.txt
> +new file mode 100644
> +index 000000000000..6025c0841974
> +--- /dev/null
> ++++ b/Documentation/devicetree/bindings/media/img,d5520-vxd.txt
> +@@ -0,0 +1,22 @@
> ++Imagination D5520-VXD Driver
> ++----------------------------
> ++
> ++The IMG VXD video decode driver for the D5500-VXD is a video decoder for
> ++multiple video formats including H.264 and HEVC on the TI J721E family
> ++of SoCs.
> ++
> ++Required properties:
> ++- compatible: must be "img,d5500-vxd"
> ++- reg: physical base address and length of the registers for the D5520
> ++- interrupts: should contain interrupt number for the D5520
> ++
> ++Example for J721E:
> ++==================
> ++
> ++       d5520: video-decoder@4300000 {
> ++               /* IMG D5520 driver configuration */
> ++               compatible = "img,d5500-vxd";
> ++               reg = <0x00 0x04300000 0x00 0x100000>;
> ++               power-domains = <&k3_pds 144>;
> ++               interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
> ++       };
> +--
> +2.17.1
> +
> diff --git a/recipes-kernel/linux/files/0006-drivers-media-platorm-Kconfig-Add-Video-encoder-kcon.patch b/recipes-kernel/linux/files/0006-drivers-media-platorm-Kconfig-Add-Video-encoder-kcon.patch
> new file mode 100644
> index 00000000..697f054b
> --- /dev/null
> +++ b/recipes-kernel/linux/files/0006-drivers-media-platorm-Kconfig-Add-Video-encoder-kcon.patch
> @@ -0,0 +1,43 @@
> +From 59392e29ca0d864d26c814e28034085be3bc2c9d Mon Sep 17 00:00:00 2001
> +From: Angela Stegmaier <angelabaker@ti.com>
> +Date: Mon, 8 Mar 2021 19:03:59 +0530
> +Subject: [PATCH 6/9] drivers: media: platorm: Kconfig: Add Video encoder
> + kconfig entries
> +
> +Add video encoder basic config to Kconfig
> +and select the required V4L2 modules.
> +
> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
> +---
> + drivers/media/platform/Kconfig | 13 +++++++++++++
> + 1 file changed, 13 insertions(+)
> +
> +diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> +index 49c9f0a889a3..7e4563a540f3 100644
> +--- a/drivers/media/platform/Kconfig
> ++++ b/drivers/media/platform/Kconfig
> +@@ -515,6 +515,19 @@ config VIDEO_IMG_VXD_DEC
> + 	    Imagination D5520 (Video Decoder) hardware.
> + 	    The module name when built is vxd-dec.
> +
> ++config VIDEO_IMG_VXE_ENC
> ++        tristate "IMG VXE ENC (Video Encoder) driver"
> ++        depends on VIDEO_DEV && VIDEO_V4L2
> ++        depends on ARCH_K3_J721E_SOC || COMPILE_TEST
> ++        select VIDEOBUF2_CORE
> ++        select VIDEOBUF2_DMA_CONTIG
> ++        select VIDEOBUF2_DMA_SG
> ++        select V4L2_MEM2MEM_DEV
> ++        help
> ++          This is an IMG VXE ENC V4L2 driver that adds support for the
> ++          Imagination VXE384 (Video Encoder) hardware.
> ++          The module name when built is vxe-enc.
> ++
> + config VIDEO_QCOM_VENUS
> + 	tristate "Qualcomm Venus V4L2 encoder/decoder driver"
> + 	depends on VIDEO_DEV && VIDEO_V4L2
> +--
> +2.17.1
> +
> diff --git a/recipes-kernel/linux/files/0007-arm64-dts-ti-k3-j721e-main.dtsi-Add-VXE384-node.patch b/recipes-kernel/linux/files/0007-arm64-dts-ti-k3-j721e-main.dtsi-Add-VXE384-node.patch
> new file mode 100644
> index 00000000..7f63a44d
> --- /dev/null
> +++ b/recipes-kernel/linux/files/0007-arm64-dts-ti-k3-j721e-main.dtsi-Add-VXE384-node.patch
> @@ -0,0 +1,35 @@
> +From 49fa5eb15209f77ac7540300f0b7dcf74f91232d Mon Sep 17 00:00:00 2001
> +From: Angela Stegmaier <angelabaker@ti.com>
> +Date: Mon, 8 Mar 2021 19:08:59 +0530
> +Subject: [PATCH 7/9] arm64: dts: ti: k3-j721e-main.dtsi: Add VXE384 node
> +
> +Add VXE384 video encoder node for J721E.
> +
> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
> +---
> + arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +index b8c456735e27..bdddac758f16 100644
> +--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> ++++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +@@ -1348,6 +1348,13 @@
> + 	       interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
> + 	};
> +
> ++	vxe384: video-encoder@4200000 {
> ++		compatible = "img,vxe384";
> ++		reg = <0x00 0x04200000 0x00 0x100000>;
> ++		power-domains = <&k3_pds 153 TI_SCI_PD_EXCLUSIVE>;
> ++		interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
> ++	};
> ++
> + 	ufs_wrapper: ufs-wrapper@4e80000 {
> + 		compatible = "ti,j721e-ufs";
> + 		reg = <0x0 0x4e80000 0x0 0x100>;
> +--
> +2.17.1
> +
> diff --git a/recipes-kernel/linux/files/0008-dt-bindings-Add-binding-for-img-vxe384-for-J721E.patch b/recipes-kernel/linux/files/0008-dt-bindings-Add-binding-for-img-vxe384-for-J721E.patch
> new file mode 100644
> index 00000000..d097c605
> --- /dev/null
> +++ b/recipes-kernel/linux/files/0008-dt-bindings-Add-binding-for-img-vxe384-for-J721E.patch
> @@ -0,0 +1,44 @@
> +From 8a013785d4c6022c85bd8947bd5e594eeca0c85a Mon Sep 17 00:00:00 2001
> +From: Angela Stegmaier <angelabaker@ti.com>
> +Date: Mon, 8 Mar 2021 19:11:37 +0530
> +Subject: [PATCH 8/9] dt-bindings: Add binding for img,vxe384 for J721E
> +
> +Add the dt-binding for the img,vxe384 node for J721E.
> +
> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
> +---
> + .../devicetree/bindings/media/img,vxe384.txt  | 20 +++++++++++++++++++
> + 1 file changed, 20 insertions(+)
> + create mode 100644 Documentation/devicetree/bindings/media/img,vxe384.txt
> +
> +diff --git a/Documentation/devicetree/bindings/media/img,vxe384.txt b/Documentation/devicetree/bindings/media/img,vxe384.txt
> +new file mode 100644
> +index 000000000000..0c8734f54113
> +--- /dev/null
> ++++ b/Documentation/devicetree/bindings/media/img,vxe384.txt
> +@@ -0,0 +1,20 @@
> ++Imagination VXE384 Driver
> ++-------------------------
> ++
> ++The IMG VXE384 video encode driver for the VXE384 is a video encoder for
> ++multiple video formats including H.264 on the TI J721E family of SoCs.
> ++
> ++Required properties:
> ++- compatible: must be "img,vxe384"
> ++- reg: physical base address and length of the registers for the VXE384
> ++- interrupts: should contain interrupt number for the VXE384
> ++
> ++Example for J721E:
> ++==================
> ++
> ++       vxe384: video-encoder@4200000 {
> ++               compatible = "img,vxe384";
> ++               reg = <0x00 0x04200000 0x00 0x100000>;
> ++               power-domains = <&k3_pds 153 TI_SCI_PD_EXCLUSIVE>;
> ++               interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
> ++       };
> +--
> +2.17.1
> +
> diff --git a/recipes-kernel/linux/files/0009-ti_config_fragments-multimedia.cfg-Add-video-encode-.patch b/recipes-kernel/linux/files/0009-ti_config_fragments-multimedia.cfg-Add-video-encode-.patch
> new file mode 100644
> index 00000000..3ee62a06
> --- /dev/null
> +++ b/recipes-kernel/linux/files/0009-ti_config_fragments-multimedia.cfg-Add-video-encode-.patch
> @@ -0,0 +1,29 @@
> +From 4fef99f138e74641a617a300c900e3222d39e61b Mon Sep 17 00:00:00 2001
> +From: Angela Stegmaier <angelabaker@ti.com>
> +Date: Mon, 8 Mar 2021 19:18:35 +0530
> +Subject: [PATCH 9/9] ti_config_fragments: multimedia.cfg: Add video encode
> + configuration
> +
> +Add vxe384 vxe_enc configurations to multimedia.cfg
> +
> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
> +---
> + ti_config_fragments/multimedia.cfg | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/ti_config_fragments/multimedia.cfg b/ti_config_fragments/multimedia.cfg
> +index f7e7ecf2a061..3b022bb43e3c 100644
> +--- a/ti_config_fragments/multimedia.cfg
> ++++ b/ti_config_fragments/multimedia.cfg
> +@@ -5,3 +5,6 @@
> +
> + CONFIG_MEDIA_SUPPORT=y
> + CONFIG_VIDEO_IMG_VXD_DEC=m
> ++
> ++#IMG VXE384 v4l2 Driver Config Options
> ++CONFIG_VIDEO_IMG_VXE_ENC=m
> +--
> +2.17.1
> +
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> index 37f387c3..c26341f6 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> @@ -31,7 +31,16 @@ PR = "${MACHINE_KERNEL_PR}"
>   KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
>   KERNEL_GIT_PROTOCOL = "git"
>   SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
> -            file://defconfig"
> +            file://defconfig \
> +            file://0001-ti_config_fragments-Add-multimedia.cfg.patch \
> +            file://0002-v4l-videodev2-Add-10bit-definitions-for-NV12-and-NV1.patch \
> +            file://0003-drivers-media-platform-Kconfig-Add-Video-decoder-kco.patch \
> +            file://0004-arm64-dts-ti-k3-j721e-main.dtsi-Add-D5520-node.patch \
> +            file://0005-dt-bindings-Add-binding-for-img-d5520-vxd-for-J721E.patch \
> +            file://0006-drivers-media-platorm-Kconfig-Add-Video-encoder-kcon.patch \
> +            file://0007-arm64-dts-ti-k3-j721e-main.dtsi-Add-VXE384-node.patch \
> +            file://0008-dt-bindings-Add-binding-for-img-vxe384-for-J721E.patch \
> +            file://0009-ti_config_fragments-multimedia.cfg-Add-video-encode-.patch"
>   
>   FILES_${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
>   
> 
