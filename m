Return-Path: <whittenburg@gmail.com>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9C7FE0059A
	for <meta-ti@yoctoproject.org>; Thu,  1 Mar 2012 08:57:10 -0800 (PST)
Received: by wgbdq13 with SMTP id dq13so666150wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 01 Mar 2012 08:57:09 -0800 (PST)
Received-SPF: pass (google.com: domain of whittenburg@gmail.com designates
	10.180.80.8 as permitted sender) client-ip=10.180.80.8; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of whittenburg@gmail.com
	designates 10.180.80.8 as permitted sender)
	smtp.mail=whittenburg@gmail.com;
	dkim=pass header.i=whittenburg@gmail.com
Received: from mr.google.com ([10.180.80.8])
	by 10.180.80.8 with SMTP id n8mr12711005wix.14.1330621029916 (num_hops
	= 1); Thu, 01 Mar 2012 08:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:reply-to:date:message-id:subject:from:to:content-type;
	bh=DvId0eNrvKRbzsPAlvLEoSoSrdByLN20ESkAJuWW+Eg=;
	b=he29Ro4146257zl9PnZdCTPXeTttxqueHn9bfEOiJvgqPLtWw3H/PUBUHa4hxkCPkP
	G76ZQNuPeKv08jDfAd0QeC9t4XtZQI9523OSqvcCLCcXopJVYRg5k7OWQRbSbmVvaV0/
	QSgVhOZlF9KNtT/Rz1UkxZtDNkic1YLnZgYxU=
MIME-Version: 1.0
Received: by 10.180.80.8 with SMTP id n8mr10184702wix.14.1330621029873; Thu,
	01 Mar 2012 08:57:09 -0800 (PST)
Received: by 10.223.158.197 with HTTP; Thu, 1 Mar 2012 08:57:09 -0800 (PST)
Date: Thu, 1 Mar 2012 10:57:09 -0600
Message-ID: <CABcw_On04+-qN7e50u_7LDYzAhyXX_ACYaoXnQbp3m80p7rbuQ@mail.gmail.com>
From: Chris Whittenburg <whittenburg@gmail.com>
To: meta-ti@yoctoproject.org
X-Mailman-Approved-At: Thu, 01 Mar 2012 08:58:46 -0800
Subject: [PATCH] add missing quotes around PLATFORM_XDC
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: whittenburg@gmail.com
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2012 16:57:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Had trouble building gstreamer-ti today, and it turned out to be these
missing quotes, I believe.

Thanks,
Chris


Signed-off-by: Chris Whittenburg <whittenburg@gmail.com>
---
 recipes-ti/gstreamer-ti/gstreamer-ti.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/gstreamer-ti/gstreamer-ti.inc
b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
index 401ee26..05b4d28 100644
--- a/recipes-ti/gstreamer-ti/gstreamer-ti.inc
+++ b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
@@ -60,7 +60,7 @@ export PLATFORM
 export GST_TI_PLATFORM
 export XDC_PLATFORM
 export XDC_TARGET      = "gnu.targets.arm.GCArmv5T"
-export PLATFORM_XDC    = ${XDC_PLATFORM}
+export PLATFORM_XDC    = "${XDC_PLATFORM}"
 export CSTOOL_DIR      = "${TOOLCHAIN_PATH}"
 export MVTOOL_DIR      = "${TOOLCHAIN_PATH}"
 export MVTOOL_PREFIX   = "${TARGET_PREFIX}"
-- 
1.7.1

