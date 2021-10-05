Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.4194.1633474347115550053
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Oct 2021 15:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 074B440C2A;
	Tue,  5 Oct 2021 22:52:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NH40Fp9JA0vG; Tue,  5 Oct 2021 22:52:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DB8D1407DA;
	Tue,  5 Oct 2021 22:52:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 174AF174677; Tue,  5 Oct 2021 18:52:24 -0400 (EDT)
Date: Tue, 5 Oct 2021 18:52:24 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Vivien Didelot <vivien.didelot@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [meta-arago][PATCH] qtwebengine: replace patch with chromium flags
Message-ID: <20211005225224.GF1528@denix.org>
References: <20211005212507.3301764-1-vdidelot@pbsc.com>
MIME-Version: 1.0
In-Reply-To: <20211005212507.3301764-1-vdidelot@pbsc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

meta-ti is the wrong mailing list for this patch. Please send it to meta-arago 
instead.

-- 
Denys


On Tue, Oct 05, 2021 at 05:25:07PM -0400, Vivien Didelot wrote:
> Instead of maintaining an inappropriate hack on qtwebengine to disable
> seccomp filter sandbox, export the corresponding chromium flag in
> the QTWEBENGINE_CHROMIUM_FLAGS environment variable.
> 
> Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
> ---
>  .../qt5/qtbase-conf/ti33x/qt_env.sh           |  5 +++
>  ...-disable-SECCOMP-BPF-Sandbox-at-star.patch | 32 -------------------
>  .../recipes-qt/qt5/qtwebengine_git.bbappend   |  4 ---
>  3 files changed, 5 insertions(+), 36 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> index 29fa2969..96526393 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> @@ -7,3 +7,8 @@ export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
>  export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
>  export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
>  export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
> +
> +# SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
> +# from the pthread implementation. Disable this feature temporarily until
> +# those issues are resolved.
> +export QTWEBENGINE_CHROMIUM_FLAGS="--disable-seccomp-filter-sandbox"
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
> deleted file mode 100644
> index 09f1870d..00000000
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 77fc6e4391562a1f84d82b58319a73de08242797 Mon Sep 17 00:00:00 2001
> -From: Eric Ruei <e-ruei1@ti.com>
> -Date: Fri, 8 Mar 2019 18:17:06 -0500
> -Subject: [PATCH 3/3] qtwebengine: HACK: disable SECCOMP-BPF Sandbox at startup
> -
> -SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
> -from the pthread implementation
> -Disable this feature temporarily until those issues are resolved.
> -
> -Upstream-Status: Inappropriate [HACK]
> -
> -Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ----
> - src/core/web_engine_context.cpp | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/core/web_engine_context.cpp b/src/core/web_engine_context.cpp
> -index 48e5bc4..9ba3fa4 100644
> ---- a/src/core/web_engine_context.cpp
> -+++ b/src/core/web_engine_context.cpp
> -@@ -347,6 +347,8 @@ WebEngineContext::WebEngineContext()
> -         parsedCommandLine->AppendSwitch(switches::kNoSandbox);
> - #elif defined(Q_OS_LINUX)
> -         parsedCommandLine->AppendSwitch(service_manager::switches::kDisableSetuidSandbox);
> -+        // HACK: disable seccomp filter sandbox for now because it does not work
> -+        parsedCommandLine->AppendSwitch(service_manager::switches::kDisableSeccompFilterSandbox);
> - #endif
> -     } else {
> -         parsedCommandLine->AppendSwitch(switches::kNoSandbox);
> --- 
> -1.9.1
> -
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
> index c50b020f..6459bbf7 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
> @@ -1,8 +1,4 @@
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  PR_append = ".arago1"
>  
> -SRC_URI += " \
> -    file://0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch \
> -"
> -
>  DEPENDS += "bison-native"
> -- 
> 2.33.0
> 
