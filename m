Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 738A6E009D4; Sat, 14 Sep 2019 07:43:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.215.173 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D694CE0082A
	for <meta-ti@yoctoproject.org>; Sat, 14 Sep 2019 07:43:37 -0700 (PDT)
Received: by mail-pg1-f173.google.com with SMTP id x15so16840667pgg.8
	for <meta-ti@yoctoproject.org>; Sat, 14 Sep 2019 07:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=y3t0wCHLg11iyEQ7hbqhhCqGT1MygBeZ/259/4/Jb8Y=;
	b=fu27Lzn2gAq9CU4l/vVD6Hi1vn7pJfrL67chDFeP1nsFU+bf+7c5ZBSXPaWdlvgquU
	PL+9wahflDjGDVbjAujsQkxoykoKgzdsaQN1Df6PqRn2wLLZaVUKgaeuo+gLCuWeRNKG
	dakRTH/01iAZ32hMe7bCqz3u6sZQdrVQQhWtDrP7tVGVEbd/evr7XBK4bCmjVDUr6rWm
	Gi6huoV9EcnMMbnbmxApOZs+Lm+RU9PbtVmmvMD9t68qaQ2PJ5etFsRD6TEFG046Sw56
	jVLTZnbE9MrODx+ZKXdorp9ozKJKbGrBi1cCgXcdPM4iGlo5uYJk2n/jlg/LUp6xNeLX
	0uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=y3t0wCHLg11iyEQ7hbqhhCqGT1MygBeZ/259/4/Jb8Y=;
	b=C+7GbXYnR1eKVLjPn8f9ItoZLWVUhZzHoCXR0BJl5j4J5K5PWm/VKJLeZh06XcDvK/
	FnNSU/Jy8SQqvQNCQlTMVaXJE1dqIAd2g9LGggP8nzoff4RdjyEVYVlKkWE0aoOjYtbc
	7ckN+twNKNeNq8sISMKC0fqeuT+4rkuZcUOV0oj2zRoHl4EOajx/CLsIttkXEco+sb4i
	qoNPRgNJvpW8EoL5mhRTi1g8He0m3wx/I+UuU+UzQvMS3ewlqWVj/CmK/SY+po9JLEHD
	hKPimLw7jZgM7reQ/xQVCtsHTEEGkQL/bjYvB7tESfvzJidkI5xlnsJwKK1D5Ibt9fjQ
	UQFw==
X-Gm-Message-State: APjAAAVmJzOMF+60ntuYGW/nj134z+64LCwghpLgoqt9sKPkFgu87RMQ
	YlGCSDQL7KFj7SDUDLXbhN7NfQNCP9Q=
X-Google-Smtp-Source: APXvYqy8kXG2WDUbiq1OYij02hmw2yqZ6sgpbZz/grgyoYeIEfFayBuehbOdXvibcbmGZ1fMZyyyNg==
X-Received: by 2002:a63:f907:: with SMTP id h7mr48457572pgi.418.1568472216521; 
	Sat, 14 Sep 2019 07:43:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id 24sm7631333pfh.12.2019.09.14.07.43.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 07:43:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Sat, 14 Sep 2019 07:43:26 -0700
Message-Id: <20190914144326.2954755-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] libion: Fix musl build
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
X-List-Received-Date: Sat, 14 Sep 2019 14:43:39 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tead-of-__BEGIN_DECL-__END_DECL-macr.patch | 42 +++++++++++++++++++
 recipes-devtools/ion/libion_git.bb            |  4 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 recipes-devtools/ion/libion/0001-Use-extern-C-instead-of-__BEGIN_DECL-__END_DECL-macr.patch

diff --git a/recipes-devtools/ion/libion/0001-Use-extern-C-instead-of-__BEGIN_DECL-__END_DECL-macr.patch b/recipes-devtools/ion/libion/0001-Use-extern-C-instead-of-__BEGIN_DECL-__END_DECL-macr.patch
new file mode 100644
index 00000000..530c869e
--- /dev/null
+++ b/recipes-devtools/ion/libion/0001-Use-extern-C-instead-of-__BEGIN_DECL-__END_DECL-macr.patch
@@ -0,0 +1,42 @@
+From 197e7bf9a20076c6564a860bd2215e8101ee4cad Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Sep 2019 07:36:47 -0700
+Subject: [PATCH] Use extern "C" instead of __BEGIN_DECL/__END_DECL macros
+
+these macros are defined in sys/cdefs.h for glibc and this header is not available on all libc
+
+for glibc they are defined like below
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/ion/ion.h | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/include/ion/ion.h b/include/ion/ion.h
+index 81ab9cc..e95df4b 100644
+--- a/include/ion/ion.h
++++ b/include/ion/ion.h
+@@ -24,7 +24,9 @@
+ #include <sys/types.h>
+ #include <linux/ion.h>
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ int ion_open();
+ int ion_close(int fd);
+@@ -34,6 +36,8 @@ int ion_free(int fd, int handle_fd);
+ int ion_query_heap_cnt(int fd, int* cnt);
+ int ion_query_get_heaps(int fd, int cnt, void* buffers);
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* __ION_H */
+-- 
+2.23.0
+
diff --git a/recipes-devtools/ion/libion_git.bb b/recipes-devtools/ion/libion_git.bb
index 7c93ed3f..38ba9bd8 100644
--- a/recipes-devtools/ion/libion_git.bb
+++ b/recipes-devtools/ion/libion_git.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 PV = "1.0.0"
 
 BRANCH = "master"
-SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH} \
+           file://0001-Use-extern-C-instead-of-__BEGIN_DECL-__END_DECL-macr.patch \
+"
 SRCREV = "11dad7977ec3ecba37c013da7ec0408c01413000"
 
 S = "${WORKDIR}/git"
-- 
2.23.0


