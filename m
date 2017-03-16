Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EDA5FE009CF; Thu, 16 Mar 2017 10:27:00 -0700 (PDT)
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
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23708E0052B
	for <meta-ti@yoctoproject.org>; Thu, 16 Mar 2017 10:26:54 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2GHQifY028564
	for <meta-ti@yoctoproject.org>; Thu, 16 Mar 2017 12:26:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489685204;
	bh=8JBgMXb9R+lY5809O6cilTeXzb1PmpCpIQ10eKCfUSc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=JLo7bUj8JqWeVC+X4UbVxwB8aDvtM5dPgkv5Li9rttz0M9O9ijhWDqRpF998gPPBm
	YKiEsLkIETVf1l/ACbzBOVKuM+9enyMA2KXSeFNAhWOx7SesJisp2p2SkMmVA4Htx+
	6lA+OXW8HpG4dhq221M4qtFqfxhLo6dBwiQGwaHs=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GHQd6H031645
	for <meta-ti@yoctoproject.org>; Thu, 16 Mar 2017 12:26:39 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 12:26:39 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2GHQcLb017963	for <meta-ti@yoctoproject.org>; Thu, 16 Mar 2017 12:26:39
	-0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 16 Mar 2017 13:26:33 -0400
Message-ID: <1489685194-53625-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1489685194-53625-1-git-send-email-e-ruei1@ti.com>
References: <1489685194-53625-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [krogoth][PATCH 2/3] gstreamer1.0-plugins-bad: kmssink: add YUYV support
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
X-List-Received-Date: Thu, 16 Mar 2017 17:27:01 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../0002-kmssink-add-YUYV-support.patch            | 81 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.6.3.bbappend        |  2 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch
new file mode 100644
index 0000000..a5791cc
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch
@@ -0,0 +1,81 @@
+From af348c890c04ce9626d411055aae0974f410219f Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Tue, 14 Mar 2017 17:24:07 -0400
+Subject: [PATCH 2/2] kmssink: add YUYV support
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ sys/kms/gstkmsbufferpriv.c | 32 +++++++++++++++++++++++++++-----
+ sys/kms/gstkmssink.c       |  2 +-
+ 2 files changed, 28 insertions(+), 6 deletions(-)
+
+diff --git a/sys/kms/gstkmsbufferpriv.c b/sys/kms/gstkmsbufferpriv.c
+index 172a4c3..57c01f8 100644
+--- a/sys/kms/gstkmsbufferpriv.c
++++ b/sys/kms/gstkmsbufferpriv.c
+@@ -41,22 +41,44 @@
+ static int
+ create_fb (GstKMSBufferPriv * priv, GstKMSSink * sink)
+ {
++
+   /* TODO get format, etc from caps.. and query device for
+    * supported formats, and make this all more flexible to
+    * cope with various formats:
+    */
+-  uint32_t fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
+-
++  GstVideoFormat format = sink->format;
++  uint32_t fourcc;
+   uint32_t handles[4] = {
+-    omap_bo_handle (priv->bo), omap_bo_handle (priv->bo),
++    omap_bo_handle (priv->bo),
+   };
+   uint32_t pitches[4] = {
+-    GST_ROUND_UP_4 (sink->input_width), GST_ROUND_UP_4 (sink->input_width),
++    GST_ROUND_UP_4 (sink->input_width),
+   };
+   uint32_t offsets[4] = {
+-    0, pitches[0] * sink->input_height
++    0,
+   };
+ 
++  /**
++   * Only two formats are supported:
++   * AM3/4: YUYV
++   * AM5: NV12, YUYV
++   */
++  if(format == GST_VIDEO_FORMAT_YUY2)
++  {
++    /* YUYV */
++    fourcc = GST_MAKE_FOURCC ('Y', 'U', 'Y', 'V');
++    pitches[0] = GST_ROUND_UP_4 (sink->input_width*2);
++  }
++  else
++  {
++    /* NV12 */
++    fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
++    handles[1] = omap_bo_handle (priv->bo);
++    pitches[1] = GST_ROUND_UP_4 (sink->input_width);
++    offsets[1] = pitches[0] * sink->input_height;
++  }
++
++
+   return drmModeAddFB2 (priv->fd, sink->input_width, sink->input_height,
+       fourcc, handles, pitches, offsets, &priv->fb_id, 0);
+ }
+diff --git a/sys/kms/gstkmssink.c b/sys/kms/gstkmssink.c
+index 9795bdf..b36d88f 100644
+--- a/sys/kms/gstkmssink.c
++++ b/sys/kms/gstkmssink.c
+@@ -50,7 +50,7 @@ static GstStaticPadTemplate gst_kms_sink_template_factory =
+ GST_STATIC_PAD_TEMPLATE ("sink",
+     GST_PAD_SINK,
+     GST_PAD_ALWAYS,
+-    GST_STATIC_CAPS (GST_VIDEO_CAPS_MAKE("NV12"))
++    GST_STATIC_CAPS (GST_VIDEO_CAPS_MAKE("{NV12,YUY2}"))
+     );
+ 
+ enum
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
index 2c903d4..317b19e 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
@@ -21,10 +21,12 @@ DEPENDS_append_ti33x = " \
 
 SRC_URI_append_omap-a15 = " \
     file://0001-kmssink-remove-DCE-dependencies.patch \
+    file://0002-kmssink-add-YUYV-support.patch \
 "
 
 SRC_URI_append_ti43x = " \
     file://0001-kmssink-remove-DCE-dependencies.patch \
+    file://0002-kmssink-add-YUYV-support.patch \
 "
 
 SRC_URI_append_ti33x = " \
-- 
1.9.1


