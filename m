Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web08.3082.1633469187836287255
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Oct 2021 14:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kO1ReHWV;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id d20so577845qvm.8
        for <meta-ti@lists.yoctoproject.org>; Tue, 05 Oct 2021 14:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dZI0ySfH8vY5h1ZB7JmKo7yBNmBiygqLeqK60tCXEGY=;
        b=kO1ReHWVsgyKJq2sG+UcMjnksy3skER7jySLkWIR/3Tl8d0808qOBeB4g5H1bmVsch
         XEkWdAAQJ8uV5ndIlyeuAsV4otumPUGMyv84bejXUixHLTy4+lVvNi1tkDpp/WfbmLZ8
         6Fs405rnGh/Bd0No6jNmP3IKNUfTdyWazZ4XxQe7N9g5Jc25ZDwOhFRqCS/6S3nJ8QRJ
         KsWMcXB2IY6EuaHbUZT+4UbQbetC9jFGRlFmwuc0H75oWmvjlAH2FNn5kwZ/jH092BQ4
         3k2DsmFxdac9XVyWnAR/zDydwK/gm8XDloMhsifgUAEKQhKBuVdUVp6VpMFB2lO0ZLdP
         0zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dZI0ySfH8vY5h1ZB7JmKo7yBNmBiygqLeqK60tCXEGY=;
        b=i8HJ9RrZ7x06eLgkWlpbNgXslnLQm5sYvsGqAVBMCD1GtzkZBvw7XIQ2A1qC98SPDy
         yYIspQfMqjYdfsgwQgrj+RHDxjws/m5695C2jhs3nkc9J+j9frafJkObSLfcbFRhpewE
         WAz71F82A9VxKx6hK9BBH/7oo8zQ+zVNctJf9mYb0TlQD7SgUW5WWDVc+iQWl0OPiLk7
         LuvA2pYcOBSHxrB8WW81gX+ry41G+uUvtdNgIW9iwhlU5Pe3cl/i33UBKRokIqZXvIUl
         DliAn9g8C6iLqKImM6NqNO5GZ0RJKwL+BbifKpmgFM/JE5DzzIwgXml1xhgMrd2lQR3M
         B8sA==
X-Gm-Message-State: AOAM533qghF/T5Kg6gjZ1ssac3L5jHdM+rMifSD0MHf38bUHDgHfXjpy
	O7bn4tLzKabKZqsXlXbjKesYRuzf6zU=
X-Google-Smtp-Source: ABdhPJxGaF1b6TsYkG00iTTgXJQ55gHipnzNkl+qL3nSvah46rktLjFOE/0p44ZVJPdGzjOpuSPvrA==
X-Received: by 2002:a05:6214:224d:: with SMTP id c13mr10323846qvc.37.1633469186861;
        Tue, 05 Oct 2021 14:26:26 -0700 (PDT)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (bras-base-mtrlpq2848w-grc-41-70-53-240-121.dsl.bell.ca. [70.53.240.121])
        by smtp.gmail.com with ESMTPSA id m11sm10056090qkm.88.2021.10.05.14.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 14:26:26 -0700 (PDT)
From: "Vivien Didelot" <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: meta-ti@lists.yoctoproject.org
Cc: Eric Ruei <e-ruei1@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][PATCH] qtwebengine: replace patch with chromium flags
Date: Tue,  5 Oct 2021 17:25:07 -0400
Message-Id: <20211005212507.3301764-1-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of maintaining an inappropriate hack on qtwebengine to disable
seccomp filter sandbox, export the corresponding chromium flag in
the QTWEBENGINE_CHROMIUM_FLAGS environment variable.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 .../qt5/qtbase-conf/ti33x/qt_env.sh           |  5 +++
 ...-disable-SECCOMP-BPF-Sandbox-at-star.patch | 32 -------------------
 .../recipes-qt/qt5/qtwebengine_git.bbappend   |  4 ---
 3 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
index 29fa2969..96526393 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
@@ -7,3 +7,8 @@ export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
 export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
 export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
 export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
+
+# SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
+# from the pthread implementation. Disable this feature temporarily until
+# those issues are resolved.
+export QTWEBENGINE_CHROMIUM_FLAGS="--disable-seccomp-filter-sandbox"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
deleted file mode 100644
index 09f1870d..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 77fc6e4391562a1f84d82b58319a73de08242797 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Fri, 8 Mar 2019 18:17:06 -0500
-Subject: [PATCH 3/3] qtwebengine: HACK: disable SECCOMP-BPF Sandbox at startup
-
-SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
-from the pthread implementation
-Disable this feature temporarily until those issues are resolved.
-
-Upstream-Status: Inappropriate [HACK]
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- src/core/web_engine_context.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/core/web_engine_context.cpp b/src/core/web_engine_context.cpp
-index 48e5bc4..9ba3fa4 100644
---- a/src/core/web_engine_context.cpp
-+++ b/src/core/web_engine_context.cpp
-@@ -347,6 +347,8 @@ WebEngineContext::WebEngineContext()
-         parsedCommandLine->AppendSwitch(switches::kNoSandbox);
- #elif defined(Q_OS_LINUX)
-         parsedCommandLine->AppendSwitch(service_manager::switches::kDisableSetuidSandbox);
-+        // HACK: disable seccomp filter sandbox for now because it does not work
-+        parsedCommandLine->AppendSwitch(service_manager::switches::kDisableSeccompFilterSandbox);
- #endif
-     } else {
-         parsedCommandLine->AppendSwitch(switches::kNoSandbox);
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
index c50b020f..6459bbf7 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
@@ -1,8 +1,4 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 PR_append = ".arago1"
 
-SRC_URI += " \
-    file://0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch \
-"
-
 DEPENDS += "bison-native"
-- 
2.33.0

