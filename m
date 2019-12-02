Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
 by mx.groups.io with SMTP id smtpd.web10.313.1575289393893382398
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Dec 2019 04:23:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lucaceresoli.net, ip: 89.40.174.40, mailfrom: luca@lucaceresoli.net)
Received: from [109.168.11.45] (port=53226 helo=pc-ceresoli.dev.aim)
	by hostingweb31.netsons.net with esmtpa (Exim 4.92)
	(envelope-from <luca@lucaceresoli.net>)
	id 1ibkjQ-003B1H-5q; Mon, 02 Dec 2019 13:23:12 +0100
From: "Luca Ceresoli" <luca@lucaceresoli.net>
To: meta-ti@lists.yoctoproject.org
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
	"Kemal R . Shakir" <kemal@ti.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] Fix "basehash value changed" errors when BB_NUMBER_THREADS is modified
Date: Mon,  2 Dec 2019 13:22:52 +0100
Message-Id: <20191202122252.305-1-luca@lucaceresoli.net>
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
value changed" error. Fix by using vardepsexclude since the parallelism is
supposed to not modify the build result.

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
 classes/ti-pdk.bbclass         | 2 ++
 recipes-ti/ipc/ti-ipc-rtos.inc | 1 +
 2 files changed, 3 insertions(+)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index f0e6f2d2738a..203f26c498f2 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -84,6 +84,7 @@ EXTRA_OEMAKE = " \
     ${@get_doxygen_support(d)} \
 "
 
+do_configure[vardepsexclude] = "PARALLEL_XDC"
 do_configure() {
     BUILD_DIR=${B}/`get_build_dir_bash`
 
@@ -113,6 +114,7 @@ do_configure() {
 
 }
 
+do_compile[vardepsexclude] = "PARALLEL_XDC"
 do_compile() {
 
     if [ "${TI_PDK_XDCMAKE}" == "1" ]
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index dcd6309fe2ab..3935568a4ed8 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -84,6 +84,7 @@ IPC_TARGETS_am65xx = "\
     ti.targets.arm.elf.R5F="${M4_TOOLCHAIN_INSTALL_DIR}" \
 "
 
+EXTRA_OEMAKE[vardepsexclude] = "BB_NUMBER_THREADS"
 EXTRA_OEMAKE = "\
     PLATFORM=${PLATFORM} \
     XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
-- 
2.24.0

