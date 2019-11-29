Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
 by mx.groups.io with SMTP id smtpd.web11.8801.1575038936365701224
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 29 Nov 2019 06:48:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lucaceresoli.net, ip: 89.40.174.40, mailfrom: luca@lucaceresoli.net)
Received: from [109.168.11.45] (port=45260 helo=pc-ceresoli.dev.aim)
	by hostingweb31.netsons.net with esmtpa (Exim 4.92)
	(envelope-from <luca@lucaceresoli.net>)
	id 1iahZl-004PDo-H8; Fri, 29 Nov 2019 15:48:53 +0100
From: "Luca Ceresoli" <luca@lucaceresoli.net>
To: meta-ti@lists.yoctoproject.org
Cc: "Kemal R. Shakir" <kemal@ti.com>,
	Luca Ceresoli <luca@lucaceresoli.net>
Subject: [PATCH] meta-ti: Set the --jobs based on host cpu_count
Date: Fri, 29 Nov 2019 15:48:18 +0100
Message-Id: <20191129144818.14061-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Transfer-Encoding: 8bit

From: "Kemal R. Shakir" <kemal@ti.com>

Using BB_NUMBER_THREADS to set variables causes an "basehash value changed"
error when BB_NUMBER_THREADS is changed between successive builds.

Fixes:

  ERROR: When reparsing .../meta-ti/recipes-ti/ipc/ti-ipc-rtos_git.bb.do_configure, the basehash value changed from 63897a188012cedde03f756b5dbbfa70 to 13b80bf4f4327c367bd201eb4aa32ad7. The metadata is not deterministic and this needs to be fixed.
  ERROR: When reparsing .../meta-ti/recipes-ti/ipc/ti-ipc-rtos_git.bb.do_compile, the basehash value changed from 2fb59a7db2a2f69d2c25c06c1b6a4245 to 314c664cc040afae2800fcc378dd9ae0. The metadata is not deterministic and this needs to be fixed.

Steps to reproduce:

  BB_NUMBER_THREADS="3" bitbake ti-ipc-rtos
  BB_NUMBER_THREADS="4" bitbake -c cleansstate osal-rtos
  BB_NUMBER_THREADS="5" bitbake ti-ipc-rtos

Reported here: https://e2e.ti.com/support/processors/f/791/p/825142/3059419
Patch from Kemal R. Shakir
Reported-by: Matthew McKee (e-mail unknown)
[Luca: add detailed commit message]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

I'm having the same problem and found this patch solving it on e2e.ti.com,
but it does not appear on any git branch nor in the meta-ti mailing list. I
tested it on the thud branch and fixes the problem. Can it be applied to
both thud and future branches?

Thanks
---
 classes/ti-pdk.bbclass         | 2 +-
 recipes-ti/ipc/ti-ipc-rtos.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index f0e6f2d2738a..5f78bafa94b5 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -68,7 +68,7 @@ TI_PDK_DOXYGEN_SUPPORT ?= "1"
 
 TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
 
-PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
+PARALLEL_XDC = "--jobs=${@oe.utils.cpu_count()}"
 PARALLEL_MAKE = ""
 
 def get_doxygen_support(d):
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index dcd6309fe2ab..1b21375edd33 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -89,7 +89,7 @@ EXTRA_OEMAKE = "\
     XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
     BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
     ${IPC_TARGETS} \
-    JOBS="--jobs=${BB_NUMBER_THREADS}" \
+    JOBS="--jobs=${@oe.utils.cpu_count()}" \
     JAVA_TOOL_OPTIONS=-Xss2560k \
 "
 EXTRA_OEMAKE_append_am65xx = " PDK_INSTALL_DIR=${PDK_INSTALL_DIR}"
-- 
2.24.0

