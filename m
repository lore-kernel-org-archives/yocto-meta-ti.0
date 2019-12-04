Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
 by mx.groups.io with SMTP id smtpd.web10.7267.1575477941347977664
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Dec 2019 08:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lucaceresoli.net, ip: 89.40.174.40, mailfrom: luca@lucaceresoli.net)
Received: from [109.168.11.45] (port=33408 helo=pc-ceresoli.dev.aim)
	by hostingweb31.netsons.net with esmtpa (Exim 4.92)
	(envelope-from <luca@lucaceresoli.net>)
	id 1icXmU-00FtpC-Cc; Wed, 04 Dec 2019 17:45:38 +0100
From: "Luca Ceresoli" <luca@lucaceresoli.net>
To: meta-ti@lists.yoctoproject.org
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
	"Kemal R . Shakir" <kemal@ti.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] Fix "basehash value changed" errors and BB_NUMBER_THREADS usage
Date: Wed,  4 Dec 2019 17:45:29 +0100
Message-Id: <20191204164529.19951-1-luca@lucaceresoli.net>
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

Changing BB_NUMBER_THREADS between successive builds causes a "basehash
value changed" error. Additionally, using BB_NUMBER_THREADS to pass a
number of processes to run to xdc is wrong: PARALLEL_MAKE is the correct
variable to use.

Fix both problems by using oe.utils.parallel_make_argument() to obtain the
number of processes to run from PARALLEL_MAKE.

Fixes:

  ERROR: When reparsing .../meta-ti/recipes-ti/ipc/ti-ipc-rtos_git.bb.do_configure, the basehash value changed from 63897a188012cedde03f756b5dbbfa70 to 13b80bf4f4327c367bd201eb4aa32ad7. The metadata is not deterministic and this needs to be fixed.
  ERROR: When reparsing .../meta-ti/recipes-ti/ipc/ti-ipc-rtos_git.bb.do_compile, the basehash value changed from 2fb59a7db2a2f69d2c25c06c1b6a4245 to 314c664cc040afae2800fcc378dd9ae0. The metadata is not deterministic and this needs to be fixed.

Steps to reproduce:

  BB_NUMBER_THREADS="3" bitbake ti-ipc-rtos ti-ipc-examples-linux
  BB_NUMBER_THREADS="4" bitbake -c cleansstate osal-rtos
  BB_NUMBER_THREADS="5" bitbake ti-ipc-rtos ti-ipc-examples-linux

Reported here: https://e2e.ti.com/support/processors/f/791/p/825142/3059419
Reported-by: Matthew McKee (e-mail unknown)
Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

Changes v2 -> v3:
 - reimplement using oe.utils.parallel_make_argument(), thanks to Khem for
   the hint
---
 classes/ti-pdk.bbclass         | 2 +-
 recipes-ti/ipc/ti-ipc-rtos.inc | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index 7030f70ed8e2..a07fdbb34bbe 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -71,7 +71,7 @@ TI_PDK_DOXYGEN_SUPPORT ?= "1"
 
 TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
 
-PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
+PARALLEL_XDC = "${@oe.utils.parallel_make_argument(d, '--jobs=%d')}"
 PARALLEL_MAKE = ""
 
 def get_doxygen_support(d):
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index 7789b5a1ad2d..baf1ccc1f7b4 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -84,12 +84,13 @@ IPC_TARGETS_am65xx = "\
     ti.targets.arm.elf.R5F="${M4_TOOLCHAIN_INSTALL_DIR}" \
 "
 
+PARALLEL_XDC = "${@oe.utils.parallel_make_argument(d, '--jobs=%d')}"
 EXTRA_OEMAKE = "\
     PLATFORM=${PLATFORM} \
     XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
     BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
     ${IPC_TARGETS} \
-    JOBS="--jobs=${BB_NUMBER_THREADS}" \
+    ${PARALLEL_XDC} \
     JAVA_TOOL_OPTIONS=-Xss2560k \
 "
 EXTRA_OEMAKE_append_am65xx = " PDK_INSTALL_DIR=${PDK_INSTALL_DIR}"
-- 
2.24.0

