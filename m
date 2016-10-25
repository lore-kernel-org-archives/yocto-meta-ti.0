Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78FC9E00CD8; Tue, 25 Oct 2016 15:56:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00, RDNS_DYNAMIC, URI_HEX
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDB3FE00CC7
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 15:56:12 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 94C4952AD2; Tue, 25 Oct 2016 22:56:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161025225609.94C4952AD2@arago-project.org>
Date: Tue, 25 Oct 2016 22:56:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Anand Balagopalakrishnan : ti-sgx-ddk-um: add support for importing DMABUF as EGLImage
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
X-List-Received-Date: Tue, 25 Oct 2016 22:56:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 4d3e4a6f3796c79e86c0655cdf398c1bb147070c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4d3e4a6f3796c79e86c0655cdf398c1bb147070c

Author: Anand Balagopalakrishnan <anandb@ti.com>
Date:   Tue Oct 25 21:58:28 2016 +0000

ti-sgx-ddk-um: add support for importing DMABUF as EGLImage

This patch adds support for importing DMABUFs as EGLImages.
This work is based on the Spec defined in
https://www.khronos.org/registry/egl/extensions/EXT/EGL_EXT_image_dma_buf_import.txt

The feature currently supports YUYV and NV12 formats
In addition, the following are supported:
* YUV full range and narrow range
* YUV color space BT709 and BT601
* YUV color space BT2020 is not supported
* Chroma siting parameters are ignored

For YUYV buffers, user needs to pass the width, height, and a 3-tuple
consisting of the dmabuf fd, pitch, and offset=0.

For YUV buffers, user needs to pass the width, height and two 3-tuples
consisting of the dmabuf fds, pitches, and offsets=0.
Please note that multiple dmabuf fds are not supported, and therefore,
for NV12,
* fd[0] must be equal to fd[1] and
* pitch[0] must be equal to pitch[1]

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index 9d0c406..15c9232 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 BRANCH = "ti-img-sgx/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "f65d06843ef21964e266a7618c1529840653d563"
+SRCREV = "fccafce7d0a023e36c064ccbaa7d33e89252ea00"
 
 # There's only hardfp version available
 python __anonymous() {
@@ -31,7 +31,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r15"
+PR = "r16"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
 
 DEPENDS += "libdrm udev libgbm wayland libffi"


