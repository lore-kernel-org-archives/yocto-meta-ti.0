Return-Path: <ebutera@gmail.com>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB7C9E013A7
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:30 -0800 (PST)
Received: by eaai1 with SMTP id i1so236761eaa.35
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:29 -0800 (PST)
Received-SPF: pass (google.com: domain of ebutera@gmail.com designates
	10.213.20.8 as permitted sender) client-ip=10.213.20.8; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of ebutera@gmail.com
	designates 10.213.20.8 as permitted sender)
	smtp.mail=ebutera@gmail.com;
	dkim=pass header.i=ebutera@gmail.com
Received: from mr.google.com ([10.213.20.8])
	by 10.213.20.8 with SMTP id d8mr3127775ebb.79.1330285169551 (num_hops =
	1); Sun, 26 Feb 2012 11:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=tEf2xfclnAUBpAbxSBGHlAH+b+/7hedVnhF3HPkw42Y=;
	b=afll8wlD564UNjgnHPBwkH+CPHOMu9ev/yNiYXa2Z+ZTGRzG9De3JCUrrtq5FA/20r
	5o4nMKcA3EMm6FYxdQqnxxEP16t9uVh+GjhHTUNHNuglyG7SV9W319j0a0kY5f0ALgdn
	V8OPDvFi1nScnlbrKgucYMTbfOy36JOE+rPFQ=
Received: by 10.213.20.8 with SMTP id d8mr2356247ebb.79.1330285169475;
	Sun, 26 Feb 2012 11:39:29 -0800 (PST)
Received: from localhost.localdomain ([188.11.55.70])
	by mx.google.com with ESMTPS id v51sm48713599eef.2.2012.02.26.11.39.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 11:39:28 -0800 (PST)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Sun, 26 Feb 2012 20:39:08 +0100
Message-Id: <1330285154-14853-4-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
References: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
Subject: [RFC PATCH 3/9] syslink-omap4: add syslink for omap4 platform
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Feb 2012 19:39:31 -0000

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 recipes-ti/syslink/ti-syslink-omap4.inc    |   21 +++++++++++++++++++++
 recipes-ti/syslink/ti-syslink-omap4_git.bb |   14 ++++++++++++++
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 recipes-ti/syslink/ti-syslink-omap4.inc
 create mode 100644 recipes-ti/syslink/ti-syslink-omap4_git.bb

diff --git a/recipes-ti/syslink/ti-syslink-omap4.inc b/recipes-ti/syslink/ti-syslink-omap4.inc
new file mode 100644
index 0000000..1fa6b48
--- /dev/null
+++ b/recipes-ti/syslink/ti-syslink-omap4.inc
@@ -0,0 +1,21 @@
+DESCRIPTION = "OMAP4 syslink user space"
+HOMEPAGE = "http://git.omapzoom.org/?p=platform/hardware/ti/syslink.git"
+SECTION = "multimedia"
+LICENSE = "TI"
+
+COMPATIBLE_MACHINE = "(omap4430-panda|pandaboard)"
+
+DEFAULT_PREFERENCE_omap4 = "1"
+
+DEPENDS = "libtimemmgr"
+RDEPENDS = "libtimemmgr"
+
+PROVIDES = "ti-syslink"
+
+EXTRA_OECONF = "--with-kpath=${STAGING_KERNEL_DIR}"
+
+KRNLSRC = "${STAGING_KERNEL_DIR}"
+
+export KRNLSRC
+
+inherit autotools pkgconfig
diff --git a/recipes-ti/syslink/ti-syslink-omap4_git.bb b/recipes-ti/syslink/ti-syslink-omap4_git.bb
new file mode 100644
index 0000000..7f22c25
--- /dev/null
+++ b/recipes-ti/syslink/ti-syslink-omap4_git.bb
@@ -0,0 +1,14 @@
+require ti-syslink-omap4.inc
+
+PR = "r1"
+PV = "2.0+gitr${SRCPV}"
+
+# 2011/10/18: SysLink: Samples - Added missing Apache license
+SRCREV = "b1b8045b89402a0fe4f4ca133d400ee12a40d55a"
+
+SRC_URI = "git://git.omapzoom.org/platform/hardware/ti/syslink.git;protocol=git;branch=syslink-2.0"
+
+LIC_FILES_CHKSUM = "file://api/Makefile;beginline=19;endline=49;md5=e213ae7e4f9f24bef635efcfe23b4695"
+
+S = "${WORKDIR}/git/syslink"
+
-- 
1.7.5.4


