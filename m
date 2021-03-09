Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.11560.1615306813511787134
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 08:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=b0n2N894;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: praneeth@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 8608B38C052B
	for <meta-ti@yoctoproject.org>; Tue,  9 Mar 2021 16:20:12 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 129GKBkD035209
	for <meta-ti@yoctoproject.org>; Tue, 9 Mar 2021 10:20:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615306811;
	bh=1Ng3Mm9d0JZ+0+X0yXsPMLvz5D9g3h5xAV3iFNWjgS8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=b0n2N894JgKFQ6s+ga68ev5NLz8/1UN3r4uW6XuI6keETiU55ATcO35ABJAe4vXcl
	 gNEnB6NsQS5kak++H2og/qt1Amq1ze1Vdl9zrvU8IX1pQSWVEpcV+aCQbHSoC7B62w
	 QX8UCzGPCu0+n7tVU8xNWG0U+rcElGmQhdmGvtrE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 129GKBFJ095849
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 9 Mar 2021 10:20:11 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 9 Mar
 2021 10:20:11 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 9 Mar 2021 10:20:11 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 129GKB4H029162;
	Tue, 9 Mar 2021 10:20:11 -0600
Subject: Re: [meta-ti] [dunfell/master] PATCH] Recipe changes for TI img Codec driver for ti-5.4.y kernel
To: <sidraya.bj@ti.com>, <meta-ti@yoctoproject.org>
CC: <l-weaver@ti.com>, "Huang, David" <d-huang@ti.com>
References: <20210308145859.10628-1-sidraya.bj@ti.com>
 <166A6AE6ED4DAE41.23231@lists.yoctoproject.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <ef0a2cce-bf11-3cb6-1e16-2db4053b0e97@ti.com>
Date: Tue, 9 Mar 2021 10:20:10 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <166A6AE6ED4DAE41.23231@lists.yoctoproject.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 3/8/2021 10:29 AM, praneeth via lists.yoctoproject.org wrote:
>=20
>=20
> On 3/8/2021 8:58 AM, sidraya.bj@ti.com wrote:
>> From: Sidraya Jayagond <sidraya.bj@ti.com>
>>
>> ti-5.4.y kernel modifications done to support TI
>> img codec drivers.
>>
>> Added recipe files for ti-img-encode-decode driver.
>=20
> NACK for any proper review from SDK or upstream point of view.
>=20
> * Assuming this is RFC.(Add a cover letter)
> * Please split the patch logically.
> ** I want to see kernel, Gstreamer , codec and viddec test recipe=20
> seperately

Adding more info:

seperate patch for
* vxd-dec-fw fw recipe
* ti-img-encode-decode recipe
* viddec-test-app recipe

--
* ti-img-encode-decode driver patches changes has to
https://git.ti.com/cgit/jacinto7_multimedia/ti-img-encode-decode/log

and all you do in ti-img-encode-decode recipe is pointing to the right
SRCREV

* no out of tree kernel patches on top of the 5.4 core linux staging=20
branch. ( please remove this when you send the next version for review).


>=20
>>
>> From: Sidraya Jayagond <sidraya.bj@ti.com>
>> Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
>> ---
>> =C2=A0 ...dec-driver-porting-to-ti-linux-5.4.y.patch | 255 ++++++++++++=
++++++
>> =C2=A0 ...anging-on-Gstreamer-and-standalone-t.patch |=C2=A0 32 +++
>> =C2=A0 .../ti-img-encode-decode_1.0.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 33 +++
>> =C2=A0 .../viddec-test-app_1.0.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 18 ++
>> =C2=A0 .../videnc-test-app_1.0.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 18 ++
>> =C2=A0 .../ti-img-encode-decode/vxd-dec-fw_git.bb=C2=A0=C2=A0=C2=A0 |=
=C2=A0 34 +++
>> =C2=A0 ..._config_fragments-Add-multimedia.cfg.patch |=C2=A0 29 ++
>> =C2=A0 ...d-10bit-definitions-for-NV12-and-NV1.patch |=C2=A0 46 ++++
>> =C2=A0 ...atform-Kconfig-Add-Video-decoder-kco.patch |=C2=A0 47 ++++
>> =C2=A0 ...ti-k3-j721e-main.dtsi-Add-D5520-node.patch |=C2=A0 37 +++
>> =C2=A0 ...-binding-for-img-d5520-vxd-for-J721E.patch |=C2=A0 47 ++++
>> =C2=A0 ...atorm-Kconfig-Add-Video-encoder-kcon.patch |=C2=A0 43 +++
>> =C2=A0 ...i-k3-j721e-main.dtsi-Add-VXE384-node.patch |=C2=A0 35 +++
>> =C2=A0 ...Add-binding-for-img-vxe384-for-J721E.patch |=C2=A0 44 +++
>> =C2=A0 ...nts-multimedia.cfg-Add-video-encode-.patch |=C2=A0 29 ++
>> =C2=A0 recipes-kernel/linux/linux-ti-staging_5.4.bb=C2=A0 |=C2=A0 11 +-
>> =C2=A0 16 files changed, 757 insertions(+), 1 deletion(-)
>> =C2=A0 create mode 100644=20
>> recipes-bsp/ti-img-encode-decode/files/0001-TI-IMG-video-codec-driver-p=
orting-to-ti-linux-5.4.y.patch=20
>>
>> =C2=A0 create mode 100644=20
>> recipes-bsp/ti-img-encode-decode/files/0002-Decoder-driver-hanging-on-G=
streamer-and-standalone-t.patch=20
>>
>> =C2=A0 create mode 100644=20
>> recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
>> =C2=A0 create mode 100644=20
>> recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
>> =C2=A0 create mode 100644=20
>> recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
>> =C2=A0 create mode 100644 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_g=
it.bb
>> =C2=A0 create mode 100644=20
>> recipes-kernel/linux/files/0001-ti_config_fragments-Add-multimedia.cfg.=
patch=20
>>
>> =C2=A0 create mode 100644=20
>> recipes-kernel/linux/files/0002-v4l-videodev2-Add-10bit-definitions-for=
-NV12-and-NV1.patch=20
>>
>> =C2=A0 create mode 100644=20
>> recipes-kernel/linux/files/0003-drivers-media-platform-Kconfig-Add-Vide=
o-decoder-kco.patch=20
>>
>> =C2=A0 create mode 100644=20
>> recipes-kernel/linux/files/0004-arm64-dts-ti-k3-j721e-main.dtsi-Add-D55=
20-node.patch=20
>>
>> =C2=A0 create mode 100644=20
>> recipes-kernel/linux/files/0005-dt-bindings-Add-binding-for-img-d5520-v=
xd-for-J721E.patch=20
>>
>> =C2=A0 create mode 100644=20
>> recipes-kernel/linux/files/0006-drivers-media-platorm-Kconfig-Add-Video=
-encoder-kcon.patch=20
>>
>> =C2=A0 create mode 100644=20
>> recipes-kernel/linux/files/0007-arm64-dts-ti-k3-j721e-main.dtsi-Add-VXE=
384-node.patch=20
>>
>> =C2=A0 create mode 100644=20
>> recipes-kernel/linux/files/0008-dt-bindings-Add-binding-for-img-vxe384-=
for-J721E.patch=20
>>
>> =C2=A0 create mode 100644=20
>> recipes-kernel/linux/files/0009-ti_config_fragments-multimedia.cfg-Add-=
video-encode-.patch=20
>>
>>
>> diff --git=20
>> a/recipes-bsp/ti-img-encode-decode/files/0001-TI-IMG-video-codec-driver=
-porting-to-ti-linux-5.4.y.patch=20
>> b/recipes-bsp/ti-img-encode-decode/files/0001-TI-IMG-video-codec-driver=
-porting-to-ti-linux-5.4.y.patch=20
>>
>> new file mode 100644
>> index 00000000..2c33a505
>> --- /dev/null
>> +++=20
>> b/recipes-bsp/ti-img-encode-decode/files/0001-TI-IMG-video-codec-driver=
-porting-to-ti-linux-5.4.y.patch=20
>>
>> @@ -0,0 +1,255 @@
>> +From b46cc6adb06b367da81276a3992c3aea20414629 Mon Sep 17 00:00:00 2001
>> +From: Sidraya Jayagond <sidraya.bj@ti.com>
>> +Date: Mon, 8 Mar 2021 19:32:58 +0530
>> +Subject: [PATCH 1/2] TI IMG video codec driver porting to ti-linux-5.4=
.y
>> +
>> +Porting V4L2 codec driver APIs to latest Kernel 5.4 and
>> +Porting OSAL module for making required compatible changes
>> +to ti-linux-5.4.y.
>> +
>> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
>> +---
>> + driver/common/addr_alloc.h |=C2=A0 2 --
>> + driver/common/hash.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
>> + driver/common/resource.c=C2=A0=C2=A0 |=C2=A0 2 +-
>> + driver/common/resource.h=C2=A0=C2=A0 |=C2=A0 2 +-
>> + driver/decoder/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++---
>> + driver/decoder/decoder.c=C2=A0=C2=A0 | 10 +++++-----
>> + linux/decoder/vxd_v4l2.c=C2=A0=C2=A0 |=C2=A0 5 +++--
>> + linux/encoder/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>> + linux/encoder/vxe_v4l2.c=C2=A0=C2=A0 |=C2=A0 5 +++--
>> + osal/inc/osa_time.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 2 +-
>> + osal/src/linux/osa_time.c=C2=A0 |=C2=A0 4 ++--
>> + 11 files changed, 20 insertions(+), 22 deletions(-)
>> +
>> +diff --git a/driver/common/addr_alloc.h b/driver/common/addr_alloc.h
>> +index ae19706..67cf33d 100644
>> +--- a/driver/common/addr_alloc.h
>> ++++ b/driver/common/addr_alloc.h
>> +@@ -20,8 +20,6 @@
>> + #include "osal/inc/osa_mutex.h"
>> + #include "ra.h"
>> +
>> +-#define FALSE 0
>> +-#define TRUE 1
>> +
>> + /* Defines whether sequential or random allocation is used */
>> + enum {
>> +diff --git a/driver/common/hash.c b/driver/common/hash.c
>> +index e3c2048..24116d7 100644
>> +--- a/driver/common/hash.c
>> ++++ b/driver/common/hash.c
>> +@@ -22,8 +22,6 @@
>> + #include "img_errors.h"
>> + #include "pool.h"
>> +
>> +-#define FALSE 0
>> +-#define TRUE 1
>> +
>> + /* pool of struct hash objects */
>> + static struct pool *global_hashpool =3D NULL;
>> +diff --git a/driver/common/resource.c b/driver/common/resource.c
>> +index 26bd373..3d2a5f3 100644
>> +--- a/driver/common/resource.c
>> ++++ b/driver/common/resource.c
>> +@@ -77,7 +77,7 @@ int32 resource_item_isavailable(uint32 *refcnt)
>> + /*
>> +=C2=A0 * adds an item (and associated id) to a resource list
>> +=C2=A0 */
>> +-int32 resource_list_add(struct lst_t *list, void *item, uint32 id,=20
>> uint32 *refcnt)
>> ++int32 resource_list_add_img(struct lst_t *list, void *item, uint32=20
>> id, uint32 *refcnt)
>> + {
>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct resource_list_elem *listelem =3D NULL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 int32 bfound =3D 0;
>> +diff --git a/driver/common/resource.h b/driver/common/resource.h
>> +index 540aeb4..278e5c2 100644
>> +--- a/driver/common/resource.h
>> ++++ b/driver/common/resource.h
>> +@@ -28,7 +28,7 @@ int32 resource_item_release(uint32 *refcnt);
>> +
>> + int32 resource_item_isavailable(uint32 *refcnt);
>> +
>> +-int32 resource_list_add(struct lst_t *list, void *item, uint32 id,=20
>> uint32 *refcnt);
>> ++int32 resource_list_add_img(struct lst_t *list, void *item, uint32=20
>> id, uint32 *refcnt);
>> +
>> + void *resource_list_pickhead(struct lst_t *list);
>> +
>> +diff --git a/driver/decoder/core.c b/driver/decoder/core.c
>> +index 29d1383..d7fc0a3 100644
>> +--- a/driver/decoder/core.c
>> ++++ b/driver/decoder/core.c
>> +@@ -2201,7 +2201,7 @@ static int32 core_stream_resource_create(struct=
=20
>> core_stream_context *core_str_ct
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pictres_int->seq_resi=
nt =3D seqres_int;
>> + #endif
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Add the internal p=
icture resources to the list. */
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D resource_list_add(=
&core_str_ctx->aux_pict_res_list,
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D resource_list_add_=
img(&core_str_ctx->aux_pict_res_list,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pictres_int, 0, &pictr=
es_int->ref_cnt);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pictres_int =3D lst_n=
ext(pictres_int);
>> +@@ -2630,7 +2630,7 @@ int32 core_stream_submit_unit(uint32=20
>> res_str_id, struct vdecdd_str_unit *str_uni
>> +=C2=A0=C2=A0=C2=A0=C2=A0 dd_str_context =3D core_str_ctx->dd_str_ctx;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 VDEC_ASSERT(dd_str_context);
>> +
>> +-=C2=A0=C2=A0=C2=A0 ret =3D resource_list_add(&core_str_ctx->str_unit_=
list, str_unit, 0,
>> ++=C2=A0=C2=A0=C2=A0 ret =3D resource_list_add_img(&core_str_ctx->str_u=
nit_list,=20
>> str_unit, 0,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL);
>> +=C2=A0=C2=A0=C2=A0=C2=A0 VDEC_ASSERT(ret =3D=3D IMG_SUCCESS);
>> +
>> +@@ -2771,7 +2771,7 @@ int32 core_stream_fill_pictbuf(uint32 buf_map_id=
)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 VDEC_ASSERT(ddbuf_map_info->buf_type =3D=3D V=
DEC_BUFTYPE_PICTURE);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* Add the image buffer to the list */
>> +-=C2=A0=C2=A0=C2=A0 ret =3D resource_list_add(&core_str_ctx->pict_buf_=
list,=20
>> ddbuf_map_info,
>> ++=C2=A0=C2=A0=C2=A0 ret =3D resource_list_add_img(&core_str_ctx->pict_=
buf_list,=20
>> ddbuf_map_info,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, &ddbuf_map_info->ddbuf_info.ref_count);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +diff --git a/driver/decoder/decoder.c b/driver/decoder/decoder.c
>> +index 7a391a4..f22f66b 100644
>> +--- a/driver/decoder/decoder.c
>> ++++ b/driver/decoder/decoder.c
>> +@@ -1125,7 +1125,7 @@ decoder_stream_decode_resource_create(struct=20
>> dec_str_ctx *dec_str_context)
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 pict_dec_res->ref_cnt =3D 1;
>> +
>> +-=C2=A0=C2=A0=C2=A0 ret =3D resource_list_add(&dec_str_context->dec_re=
s_lst,=20
>> pict_dec_res, 0,
>> ++=C2=A0=C2=A0=C2=A0 ret =3D resource_list_add_img(&dec_str_context->de=
c_res_lst,=20
>> pict_dec_res, 0,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &pict_dec_res->ref_cnt);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (ret !=3D IMG_SUCCESS) {
>> +@@ -2377,7 +2377,7 @@ decoder_picture_decode(struct dec_str_ctx=20
>> *dec_str_ctx,
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=20
>> (resource_item_isavailable(&dec_str_ctx->prev_fe_pict_dec_res->ref_cnt)=
)=20
>> {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 resource_list_remove(&dec_str_ctx->dec_res_lst,=20
>> dec_str_ctx->prev_fe_pict_dec_res);
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
source_list_add(&dec_str_ctx->dec_res_lst,
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
source_list_add_img(&dec_str_ctx->dec_res_lst,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dec_str_ct=
x->prev_fe_pict_dec_res, 0,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dec_str_c=
tx->prev_fe_pict_dec_res->ref_cnt);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +@@ -2553,7 +2553,7 @@ decoder_stream_reference_resource_create(struct=
=20
>> dec_str_ctx *dec_str_ctx)
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 pict_ref_res->ref_cnt =3D 1;
>> +
>> +-=C2=A0=C2=A0=C2=A0 ret =3D resource_list_add(&dec_str_ctx->ref_res_ls=
t, pict_ref_res, 0,
>> ++=C2=A0=C2=A0=C2=A0 ret =3D resource_list_add_img(&dec_str_ctx->ref_re=
s_lst,=20
>> pict_ref_res, 0,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &pict_ref_res->ref_cnt);
>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (ret !=3D IMG_SUCCESS) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OSA_PR_ERR("[USERSID=
=3D0x%08X] Failed to add resource",
>> +@@ -4491,7 +4491,7 @@ int32 decoder_service_firmware_response(void=20
>> *dec_str_ctx_arg, uint32 *msg,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if=20
>> (resource_item_isavailable(&dec_str_ctx->last_be_pict_dec_res->ref_cnt)=
)=20
>> {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 resource_list_remove(&dec_str_ctx->dec_res_lst=
,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dec_str_ctx->last_be_pict_dec_res);
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0 resource_list_add(&dec_str_ctx->dec_res_lst,
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0 resource_list_add_img(&dec_str_ctx->dec_res_lst,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 dec_str_ctx->last_be_pict_dec_res,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &dec_str_ctx->last_be_pict_dec_res->ref_cnt);
>> +@@ -4512,7 +4512,7 @@ int32 decoder_service_firmware_response(void=20
>> *dec_str_ctx_arg, uint32 *msg,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=20
>> (resource_item_isavailable(&dec_pict->cur_pict_dec_res->ref_cnt)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 resource_list_remove(&dec_str_ctx->dec_res_lst,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 dec_pict->cur_pict_dec_res);
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
source_list_add(&dec_str_ctx->dec_res_lst,
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
source_list_add_img(&dec_str_ctx->dec_res_lst,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dec_pict->=
cur_pict_dec_res,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dec_pict-=
>cur_pict_dec_res->ref_cnt);
>> +diff --git a/linux/decoder/vxd_v4l2.c b/linux/decoder/vxd_v4l2.c
>> +index 5f0075a..c2ff49b 100644
>> +--- a/linux/decoder/vxd_v4l2.c
>> ++++ b/linux/decoder/vxd_v4l2.c
>> +@@ -1632,12 +1632,12 @@ static int32 vxd_g_selection(struct file=20
>> *file, void *fh,
>> + static const struct v4l2_ioctl_ops vxd_dec_ioctl_ops =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0 .vidioc_querycap =3D vxd_dec_querycap,
>> +
>> +-=C2=A0=C2=A0=C2=A0 .vidioc_enum_fmt_vid_cap_mplane =3D vxd_dec_enum_f=
mt,
>> ++=C2=A0=C2=A0=C2=A0 .vidioc_enum_fmt_vid_cap =3D vxd_dec_enum_fmt,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 .vidioc_g_fmt_vid_cap_mplane =3D vxd_dec_g_fm=
t,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 .vidioc_try_fmt_vid_cap_mplane =3D vxd_dec_tr=
y_fmt,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 .vidioc_s_fmt_vid_cap_mplane =3D vxd_dec_s_fm=
t,
>> +
>> +-=C2=A0=C2=A0=C2=A0 .vidioc_enum_fmt_vid_out_mplane =3D vxd_dec_enum_f=
mt,
>> ++=C2=A0=C2=A0=C2=A0 .vidioc_enum_fmt_vid_out =3D vxd_dec_enum_fmt,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 .vidioc_g_fmt_vid_out_mplane =3D vxd_dec_g_fm=
t,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 .vidioc_try_fmt_vid_out_mplane =3D vxd_dec_tr=
y_fmt,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 .vidioc_s_fmt_vid_out_mplane =3D vxd_dec_s_fm=
t,
>> +@@ -2034,6 +2034,7 @@ static int32 vxd_dec_probe(struct=20
>> platform_device *pdev)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 vxd->vfd_dec =3D vfd;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 *vfd =3D vxd_dec_videodev;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 vfd->v4l2_dev =3D &vxd->v4l2_dev;
>> ++=C2=A0=C2=A0=C2=A0 vfd->device_caps =3D V4L2_CAP_VIDEO_M2M_MPLANE | V=
4L2_CAP_STREAMING;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 vfd->lock =3D vxd->mutex;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 video_set_drvdata(vfd, vxd);
>> +diff --git a/linux/encoder/Makefile b/linux/encoder/Makefile
>> +index ddb030d..2a33aca 100644
>> +--- a/linux/encoder/Makefile
>> ++++ b/linux/encoder/Makefile
>> +@@ -75,7 +75,7 @@ vxe-enc-objs +=3D $(OSAL_PATH)/src/linux/osa_reg_io.=
o
>> + vxe-enc-objs +=3D $(OSAL_PATH)/src/linux/osa_string.o
>> + vxe-enc-objs +=3D $(OSAL_PATH)/src/linux/osa_event.o
>> +
>> +-obj-m +=3D vxe-enc.o
>> ++obj-$(CONFIG_VIDEO_IMG_VXE_ENC) +=3D vxe-enc.o
>> +
>> + ccflags-y=C2=A0=C2=A0 +=3D -DOSAL_LINUX
>> +
>> +diff --git a/linux/encoder/vxe_v4l2.c b/linux/encoder/vxe_v4l2.c
>> +index c79587c..e3d452a 100644
>> +--- a/linux/encoder/vxe_v4l2.c
>> ++++ b/linux/encoder/vxe_v4l2.c
>> +@@ -1602,12 +1602,12 @@ static int32 vxe_s_parm(struct file *file,=20
>> void *priv,
>> + static const struct v4l2_ioctl_ops vxe_enc_ioctl_ops =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0 .vidioc_querycap =3D vxe_querycap,
>> +
>> +-=C2=A0=C2=A0=C2=A0 .vidioc_enum_fmt_vid_cap_mplane =3D vxe_enum_fmt,
>> ++=C2=A0=C2=A0=C2=A0 .vidioc_enum_fmt_vid_cap =3D vxe_enum_fmt,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 .vidioc_g_fmt_vid_cap_mplane =3D vxe_g_fmt,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 .vidioc_try_fmt_vid_cap_mplane =3D vxe_try_fm=
t,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 .vidioc_s_fmt_vid_cap_mplane =3D vxe_s_fmt,
>> +
>> +-=C2=A0=C2=A0=C2=A0 .vidioc_enum_fmt_vid_out_mplane =3D vxe_enum_fmt,
>> ++=C2=A0=C2=A0=C2=A0 .vidioc_enum_fmt_vid_out =3D vxe_enum_fmt,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 .vidioc_g_fmt_vid_out_mplane =3D vxe_g_fmt,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 .vidioc_try_fmt_vid_out_mplane =3D vxe_try_fm=
t,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 .vidioc_s_fmt_vid_out_mplane =3D vxe_s_fmt,
>> +@@ -1840,6 +1840,7 @@ static int32 vxe_enc_probe(struct=20
>> platform_device *pdev)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 vxe->vfd =3D vfd;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 *vfd =3D vxe_enc_videodev;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 vfd->v4l2_dev =3D &vxe->ti_vxe_dev;
>> ++=C2=A0=C2=A0=C2=A0 vfd->device_caps =3D V4L2_CAP_VIDEO_M2M_MPLANE | V=
4L2_CAP_STREAMING;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 vfd->lock =3D vxe->mutex;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 video_set_drvdata(vfd, vxe);
>> +diff --git a/osal/inc/osa_time.h b/osal/inc/osa_time.h
>> +index d74fddf..2aee7f6 100644
>> +--- a/osal/inc/osa_time.h
>> ++++ b/osal/inc/osa_time.h
>> +@@ -28,7 +28,7 @@
>> + #include <linux/time.h>
>> +
>> + struct osa_timespec {
>> +-=C2=A0=C2=A0=C2=A0 struct timespec ts;
>> ++=C2=A0=C2=A0=C2=A0 struct timespec64 ts;
>> + };
>> + #elif defined(OSAL_SYSBIOS)
>> + struct osa_timespec {
>> +diff --git a/osal/src/linux/osa_time.c b/osal/src/linux/osa_time.c
>> +index 14958da..82e05b2 100644
>> +--- a/osal/src/linux/osa_time.c
>> ++++ b/osal/src/linux/osa_time.c
>> +@@ -58,9 +58,9 @@ void osa_getnstimeofday(struct osa_timespec *ts_args=
)
>> +
>> + void osa_timespec_sub(struct osa_timespec *end_time, struct=20
>> osa_timespec *start_time, struct osa_timespec *dif_time)
>> + {
>> +-=C2=A0=C2=A0=C2=A0 struct timespec *ts =3D (struct timespec *)(&dif_t=
ime->ts);
>> ++=C2=A0=C2=A0=C2=A0 struct timespec64 *ts =3D (struct timespec64 *)(&d=
if_time->ts);
>> +
>> +-=C2=A0=C2=A0=C2=A0 *ts =3D timespec_sub(*((struct timespec *)(&end_ti=
me->ts)),=20
>> *((struct timespec *)(&start_time->ts)));
>> ++=C2=A0=C2=A0=C2=A0 *ts =3D timespec64_sub(*((struct timespec64 *)(&en=
d_time->ts)),=20
>> *((struct timespec64 *)(&start_time->ts)));
>> + }
>> +
>> + /**
>> +--
>> +2.17.1
>> +
>> diff --git=20
>> a/recipes-bsp/ti-img-encode-decode/files/0002-Decoder-driver-hanging-on=
-Gstreamer-and-standalone-t.patch=20
>> b/recipes-bsp/ti-img-encode-decode/files/0002-Decoder-driver-hanging-on=
-Gstreamer-and-standalone-t.patch=20
>>
>> new file mode 100644
>> index 00000000..3fda6817
>> --- /dev/null
>> +++=20
>> b/recipes-bsp/ti-img-encode-decode/files/0002-Decoder-driver-hanging-on=
-Gstreamer-and-standalone-t.patch=20
>>
>> @@ -0,0 +1,32 @@
>> +From 363695b326ce804836d89cf877289da95fb2281f Mon Sep 17 00:00:00 2001
>> +From: Sidraya Jayagond <sidraya.bj@ti.com>
>> +Date: Mon, 8 Mar 2021 19:35:48 +0530
>> +Subject: [PATCH 2/2] Decoder driver hanging on Gstreamer and=20
>> standalone test
>> + app
>> +
>> +Commit hash "70f0e5762296848cde817752a648df3579ffbfb6" changes=20
>> revoked to
>> +avoid gstreamer launch command and standalone test app
>> +hanging for indefinite time
>> +
>> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
>> +---
>> + driver/decoder/vxd_core.c | 2 --
>> + 1 file changed, 2 deletions(-)
>> +
>> +diff --git a/driver/decoder/vxd_core.c b/driver/decoder/vxd_core.c
>> +index 791d470..1f984de 100644
>> +--- a/driver/decoder/vxd_core.c
>> ++++ b/driver/decoder/vxd_core.c
>> +@@ -1477,9 +1477,7 @@ int32 vxd_send_msg(struct vxd_dec_ctx *ctx,=20
>> struct vxd_fw_msg *msg)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%s: added item %p to=
 pend, ptd: 0x%x, str: %u flags: 0x%x\n",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __func__, item, strea=
m->ptd, stream->id, item->msg.out_flags);
>> +
>> +-=C2=A0=C2=A0=C2=A0 osa_mutex_lock(vxd->mutex);
>> +=C2=A0=C2=A0=C2=A0=C2=A0 vxd_schedule_locked(vxd);
>> +-=C2=A0=C2=A0=C2=A0 osa_mutex_unlock(vxd->mutex);
>> +
>> + out_unlock:
>> +=C2=A0=C2=A0=C2=A0=C2=A0 osa_mutex_unlock(ctx->mutex);
>> +--
>> +2.17.1
>> +
>> diff --git=20
>> a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb=20
>> b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
>> new file mode 100644
>> index 00000000..d0aefe66
>> --- /dev/null
>> +++ b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
>> @@ -0,0 +1,33 @@
>> +SUMMARY =3D "Kernel drivers for the IMG VXE384 MP2 and D5520=20
>> encoder/decoder found in TI SoCs"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://driver/common/dq.c;beginline=3D1;endline=3D16;md5=3De015e28ff5e=
88576dab9fdf641e3dbfe"=20
>>
>> +
>> +inherit module
>> +
>> +MACHINE_KERNEL_PR_append =3D "g"
>> +PR =3D "${MACHINE_KERNEL_PR}"
>> +
>> +COMPATIBLE_MACHINE =3D "j7-evm"
>> +
>> +SRCREV =3D "510439deecb584d2277ca9619ea546c81c778752"
>> +
>> +EXTRA_OEMAKE =3D "KPATH=3D${STAGING_KERNEL_DIR}=20
>> KCONF=3D${STAGING_KERNEL_BUILDDIR}"
>> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
>> +
>> +BRANCH =3D "master"
>> +SRC_URI =3D=20
>> "git://git.ti.com/jacinto7_multimedia/ti-img-encode-decode.git;protocol=
=
=3Dgit;branch=3D${BRANCH}=20
>> \
>> +      =20
>> file://0001-TI-IMG-video-codec-driver-porting-to-ti-linux-5.4.y.patch \
>> +      =20
>> file://0002-Decoder-driver-hanging-on-Gstreamer-and-standalone-t.patch"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +do_compile() {
>> +=C2=A0=C2=A0=C2=A0 oe_runmake all -C ${S}/linux/decoder
>> +=C2=A0=C2=A0=C2=A0 oe_runmake all -C ${S}/linux/encoder
>> +}
>> +
>> +do_install() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/${base_libdir}/modules/${KERNEL_VER=
SION}/extra
>> +=C2=A0=C2=A0=C2=A0 install -m 644 ${S}/linux/decoder/vxd-dec.ko=20
>> ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
>> +=C2=A0=C2=A0=C2=A0 install -m 644 ${S}/linux/encoder/vxe-enc.ko=20
>> ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
>> +}
>> diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb=
=20
>> b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
>> new file mode 100644
>> index 00000000..48a17537
>> --- /dev/null
>> +++ b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
>> @@ -0,0 +1,18 @@
>> +SUMMARY =3D "Test applications for TI DEC (v4l2 decoder for IMG D5520)=
"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://main.c;beginline=3D1;endline=3D14;md5=3Df17e17d664f72942124e4fc=
f06c178ee"=20
>>
>> +
>> +DEPENDS =3D "libdrm ffmpeg"
>> +
>> +inherit autotools pkgconfig
>> +
>> +PR =3D "r1"
>> +SRCREV =3D "94a80c8c090dbfdc7fafd4e5bb78c2091e715af2"
>> +
>> +EXTRA_OEMAKE =3D "CC=3D"${CC}""
>> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
>> +
>> +BRANCH =3D "master"
>> +SRC_URI =3D=20
>> "git://git.ti.com/jacinto7_multimedia/viddec-test-app.git;protocol=3Dgi=
t;branch=3D${BRANCH}"=20
>>
>> +
>> +S =3D "${WORKDIR}/git"
>> diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb=
=20
>> b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
>> new file mode 100644
>> index 00000000..3bb5d745
>> --- /dev/null
>> +++ b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
>> @@ -0,0 +1,18 @@
>> +SUMMARY =3D "Test applications for TI ENC (v4l2 encoder for IMG VXE384=
)"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://main.c;beginline=3D1;endline=3D14;md5=3D3545dd5bdf513840937d38c=
10b866605"=20
>>
>> +
>> +DEPENDS =3D "libdrm"
>> +
>> +inherit autotools pkgconfig
>> +
>> +PR =3D "r0"
>> +SRCREV =3D "a5e7d820bea1be24f25a8369d4d4521c784f869a"
>> +
>> +EXTRA_OEMAKE =3D "CC=3D"${CC}""
>> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
>> +
>> +BRANCH =3D "master"
>> +SRC_URI =3D=20
>> "git://git.ti.com/jacinto7_multimedia/videnc-test-app.git;protocol=3Dgi=
t;branch=3D${BRANCH}"=20
>>
>> +
>> +S =3D "${WORKDIR}/git"
>> diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb=20
>> b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>> new file mode 100644
>> index 00000000..2812fa2c
>> --- /dev/null
>> +++ b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
>> @@ -0,0 +1,34 @@
>> +SUMMARY =3D "Video Decoding Firmware Packaging recipe"
>> +LICENSE =3D "TI-TFL"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D84ca7278930db001870686ad997=
d6bb1"
>> +
>> +BRANCH =3D "master"
>> +SRCREV =3D "0acbf1d0a7c7eaca0ef14c1a30ce313ea82147e5"
>> +
>> +SRC_URI =3D=20
>> "git://git.ti.com/jacinto7_multimedia/ti-img-encode-decode.git;protocol=
=
=3Dgit;branch=3D${BRANCH}"=20
>>
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +PV =3D "1.0-git${SRCPV}"
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +
>> +VXD_FW_DIR =3D "${S}/decoder/firmware/"
>> +
>> +# make sure that lib/firmware, and all its contents are part of the=20
>> package
>> +FILES_${PN} +=3D "${base_libdir}/firmware"
>> +
>> +do_install() {
>> +=C2=A0 install -d ${D}${base_libdir}/firmware
>> +=C2=A0 install -m 0755 ${VXD_FW_DIR}/pvdec_full_bin.fw=20
>> ${D}${base_libdir}/firmware
>> +}
>> +
>> +# This is used to prevent the build system to strip the executables
>> +INHIBIT_PACKAGE_STRIP =3D "1"
>> +# This is used to prevent the build system to split the debug info in=
=20
>> a separate file
>> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
>> +# As it likely to be a different arch from the Yocto build, disable=20
>> checking by adding "arch" to INSANE_SKIP
>> +INSANE_SKIP_${PN} +=3D "arch"
>> +
>> +# we don't want to configure and build the source code
>> +do_compile[noexec] =3D "1"
>> +do_configure[noexec] =3D "1"
>> diff --git=20
>> a/recipes-kernel/linux/files/0001-ti_config_fragments-Add-multimedia.cf=
g.patch=20
>> b/recipes-kernel/linux/files/0001-ti_config_fragments-Add-multimedia.cf=
g.patch=20
>>
>> new file mode 100644
>> index 00000000..41edaf9b
>> --- /dev/null
>> +++=20
>> b/recipes-kernel/linux/files/0001-ti_config_fragments-Add-multimedia.cf=
g.patch=20
>>
>> @@ -0,0 +1,29 @@
>> +From 038f143c45be8e1a51eede595a253e502ff5aa5e Mon Sep 17 00:00:00 2001
>> +From: Sunita Nadampalli <sunitan@ti.com>
>> +Date: Mon, 8 Mar 2021 18:21:40 +0530
>> +Subject: [PATCH 1/9] ti_config_fragments: Add multimedia.cfg
>> +
>> +Add d5520 vxd_dec configurations to multimedia.cfg
>> +
>> +Signed-off-by: Sunita Nadampalli <sunitan@ti.com>
>> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
>> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
>> +---
>> + ti_config_fragments/multimedia.cfg | 4 ++++
>> + 1 file changed, 4 insertions(+)
>> +
>> +diff --git a/ti_config_fragments/multimedia.cfg=20
>> b/ti_config_fragments/multimedia.cfg
>> +index f93841327787..f7e7ecf2a061 100644
>> +--- a/ti_config_fragments/multimedia.cfg
>> ++++ b/ti_config_fragments/multimedia.cfg
>> +@@ -1,3 +1,7 @@
>> + ##################################################
>> + # TI Multimedia (Video Decode, Encode) Configs
>> + ##################################################
>> ++# IMG D5500 v4l2 Driver Config Options
>> ++
>> ++CONFIG_MEDIA_SUPPORT=3Dy
>> ++CONFIG_VIDEO_IMG_VXD_DEC=3Dm
>> +--
>> +2.17.1
>> +
>> diff --git=20
>> a/recipes-kernel/linux/files/0002-v4l-videodev2-Add-10bit-definitions-f=
or-NV12-and-NV1.patch=20
>> b/recipes-kernel/linux/files/0002-v4l-videodev2-Add-10bit-definitions-f=
or-NV12-and-NV1.patch=20
>>
>> new file mode 100644
>> index 00000000..9861b60a
>> --- /dev/null
>> +++=20
>> b/recipes-kernel/linux/files/0002-v4l-videodev2-Add-10bit-definitions-f=
or-NV12-and-NV1.patch=20
>>
>> @@ -0,0 +1,46 @@
>> +From dd1ac27cffaecd5cf7882c7f138da1f8f7775737 Mon Sep 17 00:00:00 2001
>> +From: Sunita Nadampalli <sunitan@ti.com>
>> +Date: Mon, 8 Mar 2021 18:45:47 +0530
>> +Subject: [PATCH 2/9] v4l: videodev2: Add 10bit definitions for NV12=20
>> and NV16
>> + color formats
>> +
>> +The default color formats support only 8bit color depth. This patch
>> +adds 10bit definitions for NV12 and NV16.
>> +
>> +Signed-off-by: Sunita Nadampalli <sunitan@ti.com>
>> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
>> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
>> +---
>> + drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>> + include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 ++
>> + 2 files changed, 4 insertions(+)
>> +
>> +diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c=20
>> b/drivers/media/v4l2-core/v4l2-ioctl.c
>> +index 58868d7129eb..5d4d1e3fb97f 100644
>> +--- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> ++++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> +@@ -1330,6 +1330,8 @@ static void v4l_fill_fmtdesc(struct=20
>> v4l2_fmtdesc *fmt)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_META_FMT_VSP1_HGT:=C2=A0=C2=A0=C2=
=A0 descr =3D "R-Car VSP1 2-D=20
>> Histogram"; break;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_META_FMT_UVC:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 descr =3D "UVC Payload Header=20
>> Metadata"; break;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_META_FMT_D4XX:=C2=A0=C2=A0=C2=A0 de=
scr =3D "Intel D4xx UVC Metadata";=20
>> break;
>> ++=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_TI1210:=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 descr =3D "10-bit YUV 4:2:0=20
>> (NV12)"; break;
>> ++=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_TI1610:=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 descr =3D "10-bit YUV 4:2:2=20
>> (NV16)"; break;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Compressed formats=
 */
>> +diff --git a/include/uapi/linux/videodev2.h=20
>> b/include/uapi/linux/videodev2.h
>> +index 3392a118c3a7..2093405b5c86 100644
>> +--- a/include/uapi/linux/videodev2.h
>> ++++ b/include/uapi/linux/videodev2.h
>> +@@ -726,6 +726,8 @@ struct v4l2_pix_format {
>> + #define V4L2_PIX_FMT_INZI=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc('I', 'N=
', 'Z', 'I') /*=20
>> Intel Planar Greyscale 10-bit and Depth 16-bit */
>> + #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1',=20
>> '2') /* Sunxi Tiled NV12 Format */
>> + #define V4L2_PIX_FMT_CNF4=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc('C', 'N=
', 'F', '4') /*=20
>> Intel 4-bit packed depth confidence information */
>> ++#define V4L2_PIX_FMT_TI1210=C2=A0=C2=A0 v4l2_fourcc('T', 'I', '1', '2=
') /* TI=20
>> NV12 10-bit, two bytes per channel */
>> ++#define V4L2_PIX_FMT_TI1610=C2=A0=C2=A0 v4l2_fourcc('T', 'I', '1', '6=
') /* TI=20
>> NV16 10-bit, two bytes per channel */
>> +
>> + /* 10bit raw bayer packed, 32 bytes for every 25 pixels, last LSB 6=
=20
>> bits unused */
>> + #define V4L2_PIX_FMT_IPU3_SBGGR10=C2=A0=C2=A0=C2=A0 v4l2_fourcc('i', =
'p', '3', 'b')=20
>> /* IPU3 packed 10-bit BGGR bayer */
>> +--
>> +2.17.1
>> +
>> diff --git=20
>> a/recipes-kernel/linux/files/0003-drivers-media-platform-Kconfig-Add-Vi=
deo-decoder-kco.patch=20
>> b/recipes-kernel/linux/files/0003-drivers-media-platform-Kconfig-Add-Vi=
deo-decoder-kco.patch=20
>>
>> new file mode 100644
>> index 00000000..8dda888e
>> --- /dev/null
>> +++=20
>> b/recipes-kernel/linux/files/0003-drivers-media-platform-Kconfig-Add-Vi=
deo-decoder-kco.patch=20
>>
>> @@ -0,0 +1,47 @@
>> +From d4ec201d6606f5dddd862cb5cf14b109968090da Mon Sep 17 00:00:00 2001
>> +From: Sunita Nadampalli <sunitan@ti.com>
>> +Date: Mon, 8 Mar 2021 18:48:45 +0530
>> +Subject: [PATCH 3/9] drivers: media: platform: Kconfig: Add Video=20
>> decoder
>> + kconfig entries
>> +
>> +Add video decoder basic config to Kconfig and
>> +select the required V4l2 modules.
>> +
>> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
>> +Signed-off-by: Sunita Nadampalli <sunitan@ti.com>
>> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
>> +
>> +Modified help syntax from --help-- to help
>> +
>> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
>> +---
>> + drivers/media/platform/Kconfig | 13 +++++++++++++
>> + 1 file changed, 13 insertions(+)
>> +
>> +diff --git a/drivers/media/platform/Kconfig=20
>> b/drivers/media/platform/Kconfig
>> +index ebaa217b5785..49c9f0a889a3 100644
>> +--- a/drivers/media/platform/Kconfig
>> ++++ b/drivers/media/platform/Kconfig
>> +@@ -502,6 +502,19 @@ config VIDEO_TI_VPE_DEBUG
>> +=C2=A0=C2=A0=C2=A0=C2=A0 help
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Enable debug messages on VPE driv=
er.
>> +
>> ++config VIDEO_IMG_VXD_DEC
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "IMG VXD DEC (Video Decoder) =
driver"
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on VIDEO_DEV && VIDEO_V4L2
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on ARCH_K3_J721E_SOC || COMPIL=
E_TEST
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select VIDEOBUF2_CORE
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select VIDEOBUF2_DMA_CONTIG
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select VIDEOBUF2_DMA_SG
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select V4L2_MEM2MEM_DEV
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This is an IMG VXD DEC V4L=
2 driver that adds support for the
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Imagination D5520 (Video D=
ecoder) hardware.
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The module name when built=
 is vxd-dec.
>> ++
>> + config VIDEO_QCOM_VENUS
>> +=C2=A0=C2=A0=C2=A0=C2=A0 tristate "Qualcomm Venus V4L2 encoder/decoder=
 driver"
>> +=C2=A0=C2=A0=C2=A0=C2=A0 depends on VIDEO_DEV && VIDEO_V4L2
>> +--
>> +2.17.1
>> +
>> diff --git=20
>> a/recipes-kernel/linux/files/0004-arm64-dts-ti-k3-j721e-main.dtsi-Add-D=
5520-node.patch=20
>> b/recipes-kernel/linux/files/0004-arm64-dts-ti-k3-j721e-main.dtsi-Add-D=
5520-node.patch=20
>>
>> new file mode 100644
>> index 00000000..3b6bb43e
>> --- /dev/null
>> +++=20
>> b/recipes-kernel/linux/files/0004-arm64-dts-ti-k3-j721e-main.dtsi-Add-D=
5520-node.patch=20
>>
>> @@ -0,0 +1,37 @@
>> +From ddcd597c48ef2bb1bcea13af5946ae662794f0e3 Mon Sep 17 00:00:00 2001
>> +From: Sunita Nadampalli <sunitan@ti.com>
>> +Date: Mon, 8 Mar 2021 18:51:22 +0530
>> +Subject: [PATCH 4/9] arm64: dts: ti: k3-j721e-main.dtsi: Add D5520 nod=
e
>> +
>> +Add D5520 video decoder node to k3 devices.
>> +
>> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
>> +Signed-off-by: Sunita Nadampalli <sunitan@ti.com>
>> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
>> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
>> +---
>> + arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 8 ++++++++
>> + 1 file changed, 8 insertions(+)
>> +
>> +diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi=20
>> b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> +index 8d0c16252ffa..b8c456735e27 100644
>> +--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> ++++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> +@@ -1340,6 +1340,14 @@
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power-domains =3D <&k=
3_pds 193 TI_SCI_PD_EXCLUSIVE>;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 };
>> +
>> ++=C2=A0=C2=A0=C2=A0 d5520: video-decoder@4300000 {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* IMG D=
5520 driver configuration */
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatib=
le =3D "img,d5500-vxd";
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D =
<0x00 0x04300000 0x00 0x100000>;
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power-do=
mains =3D <&k3_pds 144 TI_SCI_PD_EXCLUSIVE>;
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrup=
ts =3D <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
>> ++=C2=A0=C2=A0=C2=A0 };
>> ++
>> +=C2=A0=C2=A0=C2=A0=C2=A0 ufs_wrapper: ufs-wrapper@4e80000 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "ti,j7=
21e-ufs";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x0 0x4e8000=
0 0x0 0x100>;
>> +--
>> +2.17.1
>> +
>> diff --git=20
>> a/recipes-kernel/linux/files/0005-dt-bindings-Add-binding-for-img-d5520=
-vxd-for-J721E.patch=20
>> b/recipes-kernel/linux/files/0005-dt-bindings-Add-binding-for-img-d5520=
-vxd-for-J721E.patch=20
>>
>> new file mode 100644
>> index 00000000..e0256b3a
>> --- /dev/null
>> +++=20
>> b/recipes-kernel/linux/files/0005-dt-bindings-Add-binding-for-img-d5520=
-vxd-for-J721E.patch=20
>>
>> @@ -0,0 +1,47 @@
>> +From c45b294833fd46b7af4f390ddb8d35979ce11ab1 Mon Sep 17 00:00:00 2001
>> +From: Sunita Nadampalli <sunitan@ti.com>
>> +Date: Mon, 8 Mar 2021 18:56:44 +0530
>> +Subject: [PATCH 5/9] dt-bindings: Add binding for img,d5520-vxd for=20
>> J721E
>> +
>> +Add the dt-binding for the img,d5520-vxd node for J721E.
>> +
>> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
>> +Signed-off-by: Sunita Nadampalli <sunitan@ti.com>
>> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
>> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
>> +---
>> + .../bindings/media/img,d5520-vxd.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0 | 22 +++++++++++++++++++
>> + 1 file changed, 22 insertions(+)
>> + create mode 100644=20
>> Documentation/devicetree/bindings/media/img,d5520-vxd.txt
>> +
>> +diff --git=20
>> a/Documentation/devicetree/bindings/media/img,d5520-vxd.txt=20
>> b/Documentation/devicetree/bindings/media/img,d5520-vxd.txt
>> +new file mode 100644
>> +index 000000000000..6025c0841974
>> +--- /dev/null
>> ++++ b/Documentation/devicetree/bindings/media/img,d5520-vxd.txt
>> +@@ -0,0 +1,22 @@
>> ++Imagination D5520-VXD Driver
>> ++----------------------------
>> ++
>> ++The IMG VXD video decode driver for the D5500-VXD is a video decoder=
=20
>> for
>> ++multiple video formats including H.264 and HEVC on the TI J721E famil=
y
>> ++of SoCs.
>> ++
>> ++Required properties:
>> ++- compatible: must be "img,d5500-vxd"
>> ++- reg: physical base address and length of the registers for the D552=
0
>> ++- interrupts: should contain interrupt number for the D5520
>> ++
>> ++Example for J721E:
>> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ++
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d5520: video-decoder@4300000 {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0 /* IMG D5520 driver configuration */
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0 compatible =3D "img,d5500-vxd";
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0 reg =3D <0x00 0x04300000 0x00 0x100000>;
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0 power-domains =3D <&k3_pds 144>;
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0 interrupts =3D <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> +--
>> +2.17.1
>> +
>> diff --git=20
>> a/recipes-kernel/linux/files/0006-drivers-media-platorm-Kconfig-Add-Vid=
eo-encoder-kcon.patch=20
>> b/recipes-kernel/linux/files/0006-drivers-media-platorm-Kconfig-Add-Vid=
eo-encoder-kcon.patch=20
>>
>> new file mode 100644
>> index 00000000..697f054b
>> --- /dev/null
>> +++=20
>> b/recipes-kernel/linux/files/0006-drivers-media-platorm-Kconfig-Add-Vid=
eo-encoder-kcon.patch=20
>>
>> @@ -0,0 +1,43 @@
>> +From 59392e29ca0d864d26c814e28034085be3bc2c9d Mon Sep 17 00:00:00 2001
>> +From: Angela Stegmaier <angelabaker@ti.com>
>> +Date: Mon, 8 Mar 2021 19:03:59 +0530
>> +Subject: [PATCH 6/9] drivers: media: platorm: Kconfig: Add Video encod=
er
>> + kconfig entries
>> +
>> +Add video encoder basic config to Kconfig
>> +and select the required V4L2 modules.
>> +
>> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
>> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
>> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
>> +---
>> + drivers/media/platform/Kconfig | 13 +++++++++++++
>> + 1 file changed, 13 insertions(+)
>> +
>> +diff --git a/drivers/media/platform/Kconfig=20
>> b/drivers/media/platform/Kconfig
>> +index 49c9f0a889a3..7e4563a540f3 100644
>> +--- a/drivers/media/platform/Kconfig
>> ++++ b/drivers/media/platform/Kconfig
>> +@@ -515,6 +515,19 @@ config VIDEO_IMG_VXD_DEC
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Imagination D5520 (Vi=
deo Decoder) hardware.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The module name when =
built is vxd-dec.
>> +
>> ++config VIDEO_IMG_VXE_ENC
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "IMG VXE ENC (Vid=
eo Encoder) driver"
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on VIDEO_DEV && VI=
DEO_V4L2
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on ARCH_K3_J721E_S=
OC || COMPILE_TEST
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select VIDEOBUF2_CORE
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select VIDEOBUF2_DMA_CONTI=
G
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select VIDEOBUF2_DMA_SG
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select V4L2_MEM2MEM_DEV
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This is an IMG=
 VXE ENC V4L2 driver that adds support for the
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Imagination VX=
E384 (Video Encoder) hardware.
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The module nam=
e when built is vxe-enc.
>> ++
>> + config VIDEO_QCOM_VENUS
>> +=C2=A0=C2=A0=C2=A0=C2=A0 tristate "Qualcomm Venus V4L2 encoder/decoder=
 driver"
>> +=C2=A0=C2=A0=C2=A0=C2=A0 depends on VIDEO_DEV && VIDEO_V4L2
>> +--
>> +2.17.1
>> +
>> diff --git=20
>> a/recipes-kernel/linux/files/0007-arm64-dts-ti-k3-j721e-main.dtsi-Add-V=
XE384-node.patch=20
>> b/recipes-kernel/linux/files/0007-arm64-dts-ti-k3-j721e-main.dtsi-Add-V=
XE384-node.patch=20
>>
>> new file mode 100644
>> index 00000000..7f63a44d
>> --- /dev/null
>> +++=20
>> b/recipes-kernel/linux/files/0007-arm64-dts-ti-k3-j721e-main.dtsi-Add-V=
XE384-node.patch=20
>>
>> @@ -0,0 +1,35 @@
>> +From 49fa5eb15209f77ac7540300f0b7dcf74f91232d Mon Sep 17 00:00:00 2001
>> +From: Angela Stegmaier <angelabaker@ti.com>
>> +Date: Mon, 8 Mar 2021 19:08:59 +0530
>> +Subject: [PATCH 7/9] arm64: dts: ti: k3-j721e-main.dtsi: Add VXE384 no=
de
>> +
>> +Add VXE384 video encoder node for J721E.
>> +
>> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
>> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
>> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
>> +---
>> + arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 7 +++++++
>> + 1 file changed, 7 insertions(+)
>> +
>> +diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi=20
>> b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> +index b8c456735e27..bdddac758f16 100644
>> +--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> ++++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> +@@ -1348,6 +1348,13 @@
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int=
errupts =3D <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 };
>> +
>> ++=C2=A0=C2=A0=C2=A0 vxe384: video-encoder@4200000 {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "img,vxe384=
";
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x00 0x04200000 0=
x00 0x100000>;
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power-domains =3D <&k3_pds=
 153 TI_SCI_PD_EXCLUSIVE>;
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D <GIC_SPI 18=
1 IRQ_TYPE_LEVEL_HIGH>;
>> ++=C2=A0=C2=A0=C2=A0 };
>> ++
>> +=C2=A0=C2=A0=C2=A0=C2=A0 ufs_wrapper: ufs-wrapper@4e80000 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "ti,j7=
21e-ufs";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x0 0x4e8000=
0 0x0 0x100>;
>> +--
>> +2.17.1
>> +
>> diff --git=20
>> a/recipes-kernel/linux/files/0008-dt-bindings-Add-binding-for-img-vxe38=
4-for-J721E.patch=20
>> b/recipes-kernel/linux/files/0008-dt-bindings-Add-binding-for-img-vxe38=
4-for-J721E.patch=20
>>
>> new file mode 100644
>> index 00000000..d097c605
>> --- /dev/null
>> +++=20
>> b/recipes-kernel/linux/files/0008-dt-bindings-Add-binding-for-img-vxe38=
4-for-J721E.patch=20
>>
>> @@ -0,0 +1,44 @@
>> +From 8a013785d4c6022c85bd8947bd5e594eeca0c85a Mon Sep 17 00:00:00 2001
>> +From: Angela Stegmaier <angelabaker@ti.com>
>> +Date: Mon, 8 Mar 2021 19:11:37 +0530
>> +Subject: [PATCH 8/9] dt-bindings: Add binding for img,vxe384 for J721E
>> +
>> +Add the dt-binding for the img,vxe384 node for J721E.
>> +
>> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
>> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
>> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
>> +---
>> + .../devicetree/bindings/media/img,vxe384.txt=C2=A0 | 20 +++++++++++++=
++++++
>> + 1 file changed, 20 insertions(+)
>> + create mode 100644=20
>> Documentation/devicetree/bindings/media/img,vxe384.txt
>> +
>> +diff --git a/Documentation/devicetree/bindings/media/img,vxe384.txt=20
>> b/Documentation/devicetree/bindings/media/img,vxe384.txt
>> +new file mode 100644
>> +index 000000000000..0c8734f54113
>> +--- /dev/null
>> ++++ b/Documentation/devicetree/bindings/media/img,vxe384.txt
>> +@@ -0,0 +1,20 @@
>> ++Imagination VXE384 Driver
>> ++-------------------------
>> ++
>> ++The IMG VXE384 video encode driver for the VXE384 is a video encoder=
=20
>> for
>> ++multiple video formats including H.264 on the TI J721E family of SoCs=
.
>> ++
>> ++Required properties:
>> ++- compatible: must be "img,vxe384"
>> ++- reg: physical base address and length of the registers for the VXE3=
84
>> ++- interrupts: should contain interrupt number for the VXE384
>> ++
>> ++Example for J721E:
>> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ++
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vxe384: video-encoder@4200000 {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0 compatible =3D "img,vxe384";
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0 reg =3D <0x00 0x04200000 0x00 0x100000>;
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0 power-domains =3D <&k3_pds 153 TI_SCI_PD_EXCLUSIVE>;
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0 interrupts =3D <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> +--
>> +2.17.1
>> +
>> diff --git=20
>> a/recipes-kernel/linux/files/0009-ti_config_fragments-multimedia.cfg-Ad=
d-video-encode-.patch=20
>> b/recipes-kernel/linux/files/0009-ti_config_fragments-multimedia.cfg-Ad=
d-video-encode-.patch=20
>>
>> new file mode 100644
>> index 00000000..3ee62a06
>> --- /dev/null
>> +++=20
>> b/recipes-kernel/linux/files/0009-ti_config_fragments-multimedia.cfg-Ad=
d-video-encode-.patch=20
>>
>> @@ -0,0 +1,29 @@
>> +From 4fef99f138e74641a617a300c900e3222d39e61b Mon Sep 17 00:00:00 2001
>> +From: Angela Stegmaier <angelabaker@ti.com>
>> +Date: Mon, 8 Mar 2021 19:18:35 +0530
>> +Subject: [PATCH 9/9] ti_config_fragments: multimedia.cfg: Add video=20
>> encode
>> + configuration
>> +
>> +Add vxe384 vxe_enc configurations to multimedia.cfg
>> +
>> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
>> +Reviewed-by: Benoit Parrot <bparrot@ti.com>
>> +Signed-off-by: Sidraya Jayagond <sidraya.bj@ti.com>
>> +---
>> + ti_config_fragments/multimedia.cfg | 3 +++
>> + 1 file changed, 3 insertions(+)
>> +
>> +diff --git a/ti_config_fragments/multimedia.cfg=20
>> b/ti_config_fragments/multimedia.cfg
>> +index f7e7ecf2a061..3b022bb43e3c 100644
>> +--- a/ti_config_fragments/multimedia.cfg
>> ++++ b/ti_config_fragments/multimedia.cfg
>> +@@ -5,3 +5,6 @@
>> +
>> + CONFIG_MEDIA_SUPPORT=3Dy
>> + CONFIG_VIDEO_IMG_VXD_DEC=3Dm
>> ++
>> ++#IMG VXE384 v4l2 Driver Config Options
>> ++CONFIG_VIDEO_IMG_VXE_ENC=3Dm
>> +--
>> +2.17.1
>> +
>> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb=20
>> b/recipes-kernel/linux/linux-ti-staging_5.4.bb
>> index 37f387c3..c26341f6 100644
>> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
>> @@ -31,7 +31,16 @@ PR =3D "${MACHINE_KERNEL_PR}"
>> =C2=A0 KERNEL_GIT_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-ke=
rnel.git"
>> =C2=A0 KERNEL_GIT_PROTOCOL =3D "git"
>> =C2=A0 SRC_URI +=3D=20
>> "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=3D${BRANCH}=
 \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fil=
e://defconfig"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fil=
e://defconfig \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fil=
e://0001-ti_config_fragments-Add-multimedia.cfg.patch \
>> +            
>> file://0002-v4l-videodev2-Add-10bit-definitions-for-NV12-and-NV1.patch =
\
>> +            
>> file://0003-drivers-media-platform-Kconfig-Add-Video-decoder-kco.patch =
\
>> +            
>> file://0004-arm64-dts-ti-k3-j721e-main.dtsi-Add-D5520-node.patch \
>> +            
>> file://0005-dt-bindings-Add-binding-for-img-d5520-vxd-for-J721E.patch \
>> +            
>> file://0006-drivers-media-platorm-Kconfig-Add-Video-encoder-kcon.patch =
\
>> +            
>> file://0007-arm64-dts-ti-k3-j721e-main.dtsi-Add-VXE384-node.patch \
>> +            
>> file://0008-dt-bindings-Add-binding-for-img-vxe384-for-J721E.patch \
>> +            
>> file://0009-ti_config_fragments-multimedia.cfg-Add-video-encode-.patch"
>> =C2=A0 FILES_${KERNEL_PACKAGE_NAME}-devicetree +=3D "/${KERNEL_IMAGEDES=
T}/*.itb"
>>
>=20
>=20
>=20
>=20
