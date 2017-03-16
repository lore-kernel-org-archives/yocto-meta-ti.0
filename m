Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EFBCEE003C1; Thu, 16 Mar 2017 10:32:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58136E0030B
	for <meta-ti@yoctoproject.org>; Thu, 16 Mar 2017 10:32:10 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2GHWAY4031903
	for <meta-ti@yoctoproject.org>; Thu, 16 Mar 2017 12:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489685530;
	bh=Bs0tRsgJ+xGiJydqLYJ4Ya13JJ+7xE1c9NEQKMnUNEk=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=dNCfh4MesmEeNQo29mS/4fvNLKnATXh4RrGRjc+I0CYEfqk0eb1cdQXu0Y5g9gSa9
	2AZdap+IRr1rh/VaEvJ4DAJcYjVtslybBqSBSS9lGJ3ukAq1r23J8SummUkM31rSTK
	3HW9MG13t4HZBE4ePOfWkdcWT8wKFyuoxW4SBchM=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GHWAl0014691
	for <meta-ti@yoctoproject.org>; Thu, 16 Mar 2017 12:32:10 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Thu, 16 Mar 2017 12:32:10 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [krogoth][PATCH 3/3] gstreamer1.0-plugins-bad:
	waylandsink: add input format I420 support
Thread-Index: AQHSnnqJ49CTcVAp+0CyuYXye0GSvaGXuPyg
Date: Thu, 16 Mar 2017 17:32:09 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A25354D78@DFLE09.ent.ti.com>
References: <1489685194-53625-1-git-send-email-e-ruei1@ti.com>
	<1489685194-53625-3-git-send-email-e-ruei1@ti.com>
In-Reply-To: <1489685194-53625-3-git-send-email-e-ruei1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [krogoth][PATCH 3/3] gstreamer1.0-plugins-bad:	waylandsink: add input format I420 support
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Mar 2017 17:32:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Nak
Denys: can you ignore this series? I meant to send to meta-arago.

Eric


-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Ruei, Eric
Sent: Thursday, March 16, 2017 1:27 PM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] [krogoth][PATCH 3/3] gstreamer1.0-plugins-bad: waylandsi=
nk: add input format I420 support

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...waylandsink-add-input-format-I420-support.patch | 89 ++++++++++++++++++=
++++
 .../gstreamer1.0-plugins-bad_1.6.3.bbappend        |  2 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-bad/0001-gstwaylandsink-add-input-format-I420-support.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-bad/0001-gstwaylandsink-add-input-format-I420-support.patch b/meta-ar=
ago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstwa=
ylandsink-add-input-format-I420-support.patch
new file mode 100644
index 0000000..c4bf4b1
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin
+++ s-bad/0001-gstwaylandsink-add-input-format-I420-support.patch
@@ -0,0 +1,89 @@
+From 4d04ea92f196b9e0880917cf029a95c9ebef0ea9 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Wed, 22 Feb 2017 10:49:01 -0500
+Subject: [PATCH] gstwaylandsink: add input format I420 support
+
+The software-based video decoder produces the output in I420 format. To=20
+display the output without additional ARM MHz consumed in video format=20
+conversion, the function gst_wl_memory_construct_wl_buffer is enhanced to =
support I420 format.
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ ext/wayland/wldrm.c | 41 ++++++++++++++++++++++++++++++++++-------
+ 1 file changed, 34 insertions(+), 7 deletions(-)
+
+diff --git a/ext/wayland/wldrm.c b/ext/wayland/wldrm.c index=20
+8f2c393..cb2b0f2 100644
+--- a/ext/wayland/wldrm.c
++++ b/ext/wayland/wldrm.c
+@@ -5,33 +5,60 @@
+ #include <omap_drmif.h>
+ #include <wayland-client.h>
+=20
++GST_DEBUG_CATEGORY_EXTERN (gstwayland_debug); #define GST_CAT_DEFAULT=20
++gstwayland_debug
++
++
+ struct wl_buffer *
+ gst_wl_drm_memory_construct_wl_buffer (GstMemory * mem, GstWlDisplay * di=
splay,
+     const GstVideoInfo * info)
+ {
+   gint video_width =3D GST_VIDEO_INFO_WIDTH (info);
+   gint video_height =3D GST_VIDEO_INFO_HEIGHT (info);
++  GstVideoFormat format =3D GST_VIDEO_INFO_FORMAT (info);
+   int fd =3D -1;
+   struct omap_bo *bo;
+   struct wl_buffer *buffer;
+-
+-  /* TODO get format, etc from caps.. and query device for
+-   * supported formats, and make this all more flexible to
+-   * cope with various formats:
+-   */
+-  uint32_t fourcc =3D GST_MAKE_FOURCC ('N', 'V', '1', '2');
++  uint32_t fourcc;
+   uint32_t name;
+   /* note: wayland and mesa use the terminology:
+    *    stride - rowstride in bytes
+    *    pitch  - rowstride in pixels
+    */
+   uint32_t strides[3] =3D {
+-    GST_ROUND_UP_4 (video_width), GST_ROUND_UP_4 (video_width), 0,
++    GST_ROUND_UP_4 (video_width), 0, 0,
+   };
+   uint32_t offsets[3] =3D {
+     0, strides[0] * video_height, 0
+   };
+=20
++  if (format =3D=3D GST_VIDEO_FORMAT_NV12)  {
++    /* NV12 */
++    fourcc =3D GST_MAKE_FOURCC ('N', 'V', '1', '2');
++    strides[1] =3D GST_ROUND_UP_4 (video_width);  }  else if(format =3D=
=3D=20
++ GST_VIDEO_FORMAT_I420)  {
++    /* YUV420 */
++    fourcc =3D GST_MAKE_FOURCC ('Y', 'U', '1', '2');
++    strides[1] =3D strides[2] =3D GST_ROUND_UP_4 (video_width/2);
++    offsets[2] =3D offsets[1] + strides[1] * video_height/2;  }  else  {
++
++    GST_DEBUG ("Unsupported video format: %d", format);
++    /*
++     * There are two xRGB frames with width and height =3D 1 required in =
the begining of a video stream.
++     * If we consider them as errot, then it will case libwayland-clent.s=
o crashes
++     * due to invalid error handling.
++     * Consider them as NV12 until we can figure out a better solution
++     */
++    fourcc =3D GST_MAKE_FOURCC ('N', 'V', '1', '2');
++    strides[1] =3D GST_ROUND_UP_4 (video_width);  }
++
+   fd =3D gst_fd_memory_get_fd (mem);
+=20
+   if (fd < 0 ) {
+--
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/g=
streamer1.0-plugins-bad_1.6.3.bbappend
index 317b19e..bbd1d99 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-b=
ad_1.6.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin
+++ s-bad_1.6.3.bbappend
@@ -22,11 +22,13 @@ DEPENDS_append_ti33x =3D " \
 SRC_URI_append_omap-a15 =3D " \
     file://0001-kmssink-remove-DCE-dependencies.patch \
     file://0002-kmssink-add-YUYV-support.patch \
+    file://0001-gstwaylandsink-add-input-format-I420-support.patch \
 "
=20
 SRC_URI_append_ti43x =3D " \
     file://0001-kmssink-remove-DCE-dependencies.patch \
     file://0002-kmssink-add-YUYV-support.patch \
+    file://0001-gstwaylandsink-add-input-format-I420-support.patch \
 "
=20
 SRC_URI_append_ti33x =3D " \
--
1.9.1

--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

