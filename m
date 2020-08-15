Received: from spam.elettra.eu (spam.elettra.eu [140.105.206.206])
 by mx.groups.io with SMTP id smtpd.web12.4318.1597494095185358559
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 15 Aug 2020 05:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: elettra.eu, ip: 140.105.206.206, mailfrom: alessio.bogani@elettra.eu)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with ESMTP id 19FC535014E4_F37D34BB;
	Sat, 15 Aug 2020 12:21:31 +0000 (GMT)
Received: from unknown-host
	by spam.elettra.eu with queue id 2372007;
	Sat, 15 Aug 2020 12:21:29 GMT
Received: from pc-bogani.elettra.trieste.it (pc-bogani.elettra.trieste.it [192.168.205.85])
	by spam.elettra.eu (Sophos Email Appliance) with ESMTP id BAE7635010D1_F37D349F;
	Sat, 15 Aug 2020 12:21:29 +0000 (GMT)
From: "Alessio Igor Bogani" <alessio.bogani@elettra.eu>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@lists.yoctoproject.org,
	Alessio Igor Bogani <alessio.bogani@elettra.eu>
Subject: [PATCH] Replace hard-coded lib with base_libdir variable
Date: Sat, 15 Aug 2020 14:21:18 +0200
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200814222804.GO13081@beryl>
References: <20200814222804.GO13081@beryl>
X-SASI-RCODE: 200
Message-Id: <20200815122131.19FC535014E4_F37D34BB@spam.elettra.eu>

Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
---
 recipes-bsp/pru/pru-icss_git.bb | 320 ++++++++++++++++----------------
 1 file changed, 160 insertions(+), 160 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 23097d97..eda235de 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -53,11 +53,11 @@ do_compile() {
 
 do_install() {
     CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-    install -d ${D}/lib/firmware/pru
+    install -d ${D}${base_libdir}/firmware/pru
     install -d ${D}${includedir}
     cp ${CP_ARGS} ${S}/include/* ${D}${includedir}
-    install -d ${D}${libdir}
-    install -m 0644 ${S}/lib/rpmsg_lib.lib ${D}${libdir}
+    install -d ${D}${base_libdir}
+    install -m 0644 ${S}/lib/rpmsg_lib.lib ${D}${base_libdir}
 }
 
 FILES_${PN}-staticdev = "${libdir}"
@@ -65,49 +65,49 @@ FILES_${PN}-dev = "${includedir}"
 
 do_install_append_ti33x() {
     install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
-                   ${D}/lib/firmware/pru
+                   ${D}${base_libdir}/firmware/pru
     for i in 0 1
     do
         install -m 0644 ${S}/examples/am335x/PRU_RPMsg_Echo_Interrupt${i}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
-                        ${D}/lib/firmware/pru
+                        ${D}${base_libdir}/firmware/pru
     done
 }
 
 do_install_append_ti43x() {
     install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
-                   ${D}/lib/firmware/pru
+                   ${D}${base_libdir}/firmware/pru
     for i in 0 1
     do
         for j in 0 1
         do
             install -m 0644 ${S}/examples/am437x/PRU_RPMsg_Echo_Interrupt${i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}/lib/firmware/pru
+                            ${D}${base_libdir}/firmware/pru
         done
     done
 }
 
 do_install_append_omap-a15() {
     install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
-                   ${D}/lib/firmware/pru
+                   ${D}${base_libdir}/firmware/pru
     for i in 1 2
     do
         for j in 0 1
         do
             install -m 0644 ${S}/examples/am572x/PRU_RPMsg_Echo_Interrupt${i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}/lib/firmware/pru
+                            ${D}${base_libdir}/firmware/pru
         done
     done
 }
 
 do_install_append_k2g() {
     install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
-                   ${D}/lib/firmware/pru
+                   ${D}${base_libdir}/firmware/pru
     for i in 0 1
     do
         for j in 0 1
         do
             install -m 0644 ${S}/examples/k2g/PRU_RPMsg_Echo_Interrupt${i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}/lib/firmware/pru
+                            ${D}${base_libdir}/firmware/pru
         done
     done
 }
@@ -116,20 +116,20 @@ do_install_append_am65xx() {
     for i in 0 1 
     do
         install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \
-                   ${D}/lib/firmware/pru
+                   ${D}${base_libdir}/firmware/pru
         install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_Halt_${i}.out \
-                   ${D}/lib/firmware/pru
+                   ${D}${base_libdir}/firmware/pru
         install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU${i}/TX_PRU_Halt_${i}.out \
-                   ${D}/lib/firmware/pru
+                   ${D}${base_libdir}/firmware/pru
     done
     for i in 0 1 2
     do
         for j in 0 1
         do
             install -m 0644 ${S}/examples/am65x/PRU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}/lib/firmware/pru
+                            ${D}${base_libdir}/firmware/pru
             install -m 0644 ${S}/examples/am65x/RTU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/RTU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}/lib/firmware/pru
+                            ${D}${base_libdir}/firmware/pru
 
         done
     done
@@ -139,28 +139,28 @@ do_install_append_j7() {
     for i in 0 1
     do
         install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \
-                   ${D}/lib/firmware/pru
+                   ${D}${base_libdir}/firmware/pru
         install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_Halt_${i}.out \
-                   ${D}/lib/firmware/pru
+                   ${D}${base_libdir}/firmware/pru
         install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU${i}/TX_PRU_Halt_${i}.out \
-                   ${D}/lib/firmware/pru
+                   ${D}${base_libdir}/firmware/pru
     done
     for i in 0 1
     do
         for j in 0 1
         do
             install -m 0644 ${S}/examples/j721e/PRU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}/lib/firmware/pru
+                            ${D}${base_libdir}/firmware/pru
             install -m 0644 ${S}/examples/j721e/RTU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/RTU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}/lib/firmware/pru
+                            ${D}${base_libdir}/firmware/pru
 
         done
     done
 }
 
 
-FILES_${PN}-halt = "/lib/firmware/pru/PRU_Halt* /lib/firmware/pru/RTU_Halt* /lib/firmware/pru/TX_PRU_Halt*"
-FILES_${PN}-rpmsg-echo = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt* /lib/firmware/pru/RTU_RPMsg_Echo_Interrupt*"
+FILES_${PN}-halt = "${base_libdir}/firmware/pru/PRU_Halt* ${base_libdir}/firmware/pru/RTU_Halt* ${base_libdir}/firmware/pru/TX_PRU_Halt*"
+FILES_${PN}-rpmsg-echo = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt* ${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt*"
 
 # Set up names for the firmwares
 PRU_ICSS_ALTERNATIVES_ti33x    = "am335x-pru0-fw am335x-pru1-fw"
@@ -171,55 +171,55 @@ PRU_ICSS_ALTERNATIVES_am65xx   = "am65x-pru0_0-fw am65x-pru0_1-fw am65x-pru1_0-f
 PRU_ICSS_ALTERNATIVES_j7       = "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
 
 # Set up link names for the firmwares
-ALTERNATIVE_LINK_NAME[am335x-pru0-fw] = "/lib/firmware/am335x-pru0-fw"
-ALTERNATIVE_LINK_NAME[am335x-pru1-fw] = "/lib/firmware/am335x-pru1-fw"
-
-ALTERNATIVE_LINK_NAME[am437x-pru0_0-fw] = "/lib/firmware/am437x-pru0_0-fw"
-ALTERNATIVE_LINK_NAME[am437x-pru0_1-fw] = "/lib/firmware/am437x-pru0_1-fw"
-ALTERNATIVE_LINK_NAME[am437x-pru1_0-fw] = "/lib/firmware/am437x-pru1_0-fw"
-ALTERNATIVE_LINK_NAME[am437x-pru1_1-fw] = "/lib/firmware/am437x-pru1_1-fw"
-
-ALTERNATIVE_LINK_NAME[am57xx-pru1_0-fw] = "/lib/firmware/am57xx-pru1_0-fw"
-ALTERNATIVE_LINK_NAME[am57xx-pru1_1-fw] = "/lib/firmware/am57xx-pru1_1-fw"
-ALTERNATIVE_LINK_NAME[am57xx-pru2_0-fw] = "/lib/firmware/am57xx-pru2_0-fw"
-ALTERNATIVE_LINK_NAME[am57xx-pru2_1-fw] = "/lib/firmware/am57xx-pru2_1-fw"
-
-ALTERNATIVE_LINK_NAME[k2g-pru0_0-fw] = "/lib/firmware/k2g-pru0_0-fw"
-ALTERNATIVE_LINK_NAME[k2g-pru0_1-fw] = "/lib/firmware/k2g-pru0_1-fw"
-ALTERNATIVE_LINK_NAME[k2g-pru1_0-fw] = "/lib/firmware/k2g-pru1_0-fw"
-ALTERNATIVE_LINK_NAME[k2g-pru1_1-fw] = "/lib/firmware/k2g-pru1_1-fw"
-
-ALTERNATIVE_LINK_NAME[am65x-pru0_0-fw] = "/lib/firmware/am65x-pru0_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-pru0_1-fw] = "/lib/firmware/am65x-pru0_1-fw"
-ALTERNATIVE_LINK_NAME[am65x-pru1_0-fw] = "/lib/firmware/am65x-pru1_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-pru1_1-fw] = "/lib/firmware/am65x-pru1_1-fw"
-ALTERNATIVE_LINK_NAME[am65x-pru2_0-fw] = "/lib/firmware/am65x-pru2_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-pru2_1-fw] = "/lib/firmware/am65x-pru2_1-fw"
-ALTERNATIVE_LINK_NAME[am65x-rtu0_0-fw] = "/lib/firmware/am65x-rtu0_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-rtu0_1-fw] = "/lib/firmware/am65x-rtu0_1-fw"
-ALTERNATIVE_LINK_NAME[am65x-rtu1_0-fw] = "/lib/firmware/am65x-rtu1_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-rtu1_1-fw] = "/lib/firmware/am65x-rtu1_1-fw"
-ALTERNATIVE_LINK_NAME[am65x-rtu2_0-fw] = "/lib/firmware/am65x-rtu2_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] = "/lib/firmware/am65x-rtu2_1-fw"
-ALTERNATIVE_LINK_NAME[am65x-txpru0_0-fw] = "/lib/firmware/am65x-txpru0_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-txpru0_1-fw] = "/lib/firmware/am65x-txpru0_1-fw"
-ALTERNATIVE_LINK_NAME[am65x-txpru1_0-fw] = "/lib/firmware/am65x-txpru1_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-txpru1_1-fw] = "/lib/firmware/am65x-txpru1_1-fw"
-ALTERNATIVE_LINK_NAME[am65x-txpru2_0-fw] = "/lib/firmware/am65x-txpru2_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-txpru2_1-fw] = "/lib/firmware/am65x-txpru2_1-fw"
-
-ALTERNATIVE_LINK_NAME[j7-pru0_0-fw] = "/lib/firmware/j7-pru0_0-fw"
-ALTERNATIVE_LINK_NAME[j7-pru0_1-fw] = "/lib/firmware/j7-pru0_1-fw"
-ALTERNATIVE_LINK_NAME[j7-pru1_0-fw] = "/lib/firmware/j7-pru1_0-fw"
-ALTERNATIVE_LINK_NAME[j7-pru1_1-fw] = "/lib/firmware/j7-pru1_1-fw"
-ALTERNATIVE_LINK_NAME[j7-rtu0_0-fw] = "/lib/firmware/j7-rtu0_0-fw"
-ALTERNATIVE_LINK_NAME[j7-rtu0_1-fw] = "/lib/firmware/j7-rtu0_1-fw"
-ALTERNATIVE_LINK_NAME[j7-rtu1_0-fw] = "/lib/firmware/j7-rtu1_0-fw"
-ALTERNATIVE_LINK_NAME[j7-rtu1_1-fw] = "/lib/firmware/j7-rtu1_1-fw"
-ALTERNATIVE_LINK_NAME[j7-txpru0_0-fw] = "/lib/firmware/j7-txpru0_0-fw"
-ALTERNATIVE_LINK_NAME[j7-txpru0_1-fw] = "/lib/firmware/j7-txpru0_1-fw"
-ALTERNATIVE_LINK_NAME[j7-txpru1_0-fw] = "/lib/firmware/j7-txpru1_0-fw"
-ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] = "/lib/firmware/j7-txpru1_1-fw"
+ALTERNATIVE_LINK_NAME[am335x-pru0-fw] = "${base_libdir}/firmware/am335x-pru0-fw"
+ALTERNATIVE_LINK_NAME[am335x-pru1-fw] = "${base_libdir}/firmware/am335x-pru1-fw"
+
+ALTERNATIVE_LINK_NAME[am437x-pru0_0-fw] = "${base_libdir}/firmware/am437x-pru0_0-fw"
+ALTERNATIVE_LINK_NAME[am437x-pru0_1-fw] = "${base_libdir}/firmware/am437x-pru0_1-fw"
+ALTERNATIVE_LINK_NAME[am437x-pru1_0-fw] = "${base_libdir}/firmware/am437x-pru1_0-fw"
+ALTERNATIVE_LINK_NAME[am437x-pru1_1-fw] = "${base_libdir}/firmware/am437x-pru1_1-fw"
+
+ALTERNATIVE_LINK_NAME[am57xx-pru1_0-fw] = "${base_libdir}/firmware/am57xx-pru1_0-fw"
+ALTERNATIVE_LINK_NAME[am57xx-pru1_1-fw] = "${base_libdir}/firmware/am57xx-pru1_1-fw"
+ALTERNATIVE_LINK_NAME[am57xx-pru2_0-fw] = "${base_libdir}/firmware/am57xx-pru2_0-fw"
+ALTERNATIVE_LINK_NAME[am57xx-pru2_1-fw] = "${base_libdir}/firmware/am57xx-pru2_1-fw"
+
+ALTERNATIVE_LINK_NAME[k2g-pru0_0-fw] = "${base_libdir}/firmware/k2g-pru0_0-fw"
+ALTERNATIVE_LINK_NAME[k2g-pru0_1-fw] = "${base_libdir}/firmware/k2g-pru0_1-fw"
+ALTERNATIVE_LINK_NAME[k2g-pru1_0-fw] = "${base_libdir}/firmware/k2g-pru1_0-fw"
+ALTERNATIVE_LINK_NAME[k2g-pru1_1-fw] = "${base_libdir}/firmware/k2g-pru1_1-fw"
+
+ALTERNATIVE_LINK_NAME[am65x-pru0_0-fw] = "${base_libdir}/firmware/am65x-pru0_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-pru0_1-fw] = "${base_libdir}/firmware/am65x-pru0_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-pru1_0-fw] = "${base_libdir}/firmware/am65x-pru1_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-pru1_1-fw] = "${base_libdir}/firmware/am65x-pru1_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-pru2_0-fw] = "${base_libdir}/firmware/am65x-pru2_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-pru2_1-fw] = "${base_libdir}/firmware/am65x-pru2_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu0_0-fw] = "${base_libdir}/firmware/am65x-rtu0_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu0_1-fw] = "${base_libdir}/firmware/am65x-rtu0_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu1_0-fw] = "${base_libdir}/firmware/am65x-rtu1_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu1_1-fw] = "${base_libdir}/firmware/am65x-rtu1_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu2_0-fw] = "${base_libdir}/firmware/am65x-rtu2_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] = "${base_libdir}/firmware/am65x-rtu2_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru0_0-fw] = "${base_libdir}/firmware/am65x-txpru0_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru0_1-fw] = "${base_libdir}/firmware/am65x-txpru0_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru1_0-fw] = "${base_libdir}/firmware/am65x-txpru1_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru1_1-fw] = "${base_libdir}/firmware/am65x-txpru1_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru2_0-fw] = "${base_libdir}/firmware/am65x-txpru2_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru2_1-fw] = "${base_libdir}/firmware/am65x-txpru2_1-fw"
+
+ALTERNATIVE_LINK_NAME[j7-pru0_0-fw] = "${base_libdir}/firmware/j7-pru0_0-fw"
+ALTERNATIVE_LINK_NAME[j7-pru0_1-fw] = "${base_libdir}/firmware/j7-pru0_1-fw"
+ALTERNATIVE_LINK_NAME[j7-pru1_0-fw] = "${base_libdir}/firmware/j7-pru1_0-fw"
+ALTERNATIVE_LINK_NAME[j7-pru1_1-fw] = "${base_libdir}/firmware/j7-pru1_1-fw"
+ALTERNATIVE_LINK_NAME[j7-rtu0_0-fw] = "${base_libdir}/firmware/j7-rtu0_0-fw"
+ALTERNATIVE_LINK_NAME[j7-rtu0_1-fw] = "${base_libdir}/firmware/j7-rtu0_1-fw"
+ALTERNATIVE_LINK_NAME[j7-rtu1_0-fw] = "${base_libdir}/firmware/j7-rtu1_0-fw"
+ALTERNATIVE_LINK_NAME[j7-rtu1_1-fw] = "${base_libdir}/firmware/j7-rtu1_1-fw"
+ALTERNATIVE_LINK_NAME[j7-txpru0_0-fw] = "${base_libdir}/firmware/j7-txpru0_0-fw"
+ALTERNATIVE_LINK_NAME[j7-txpru0_1-fw] = "${base_libdir}/firmware/j7-txpru0_1-fw"
+ALTERNATIVE_LINK_NAME[j7-txpru1_0-fw] = "${base_libdir}/firmware/j7-txpru1_0-fw"
+ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] = "${base_libdir}/firmware/j7-txpru1_1-fw"
 
 # Create the pru-icss-halt firmware alternatives
 ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
@@ -228,55 +228,55 @@ ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
 ALTERNATIVE_pru-icss-halt_append_am65xx = " am65x-txpru0_0-fw am65x-txpru0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txpru2_1-fw"
 ALTERNATIVE_pru-icss-halt_append_j7 = " j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
 
-ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "/lib/firmware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] = "/lib/firmware/pru/PRU_Halt.out"
-
-ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
-
-ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
-
-ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
-
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
-
-ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
-ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
+
+ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
+
+ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
+
+ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
+
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_0-fw] = "${base_libdir}/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_1-fw] = "${base_libdir}/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_0-fw] = "${base_libdir}/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_1-fw] = "${base_libdir}/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_0-fw] = "${base_libdir}/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_1-fw] = "${base_libdir}/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_0-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_1-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_0-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_1-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_0-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_1-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_1.out"
+
+ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_0-fw] = "${base_libdir}/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_1-fw] = "${base_libdir}/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_0-fw] = "${base_libdir}/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_1-fw] = "${base_libdir}/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_0-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_1-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_0-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_1-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_1.out"
 
 
 ALTERNATIVE_PRIORITY_pru-icss-halt = "50"
@@ -284,45 +284,45 @@ ALTERNATIVE_PRIORITY_pru-icss-halt = "50"
 # Create the pru-icss-rpmsg-echo firmware alternatives
 ALTERNATIVE_pru-icss-rpmsg-echo = "${PRU_ICSS_ALTERNATIVES}"
 
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
-
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
-
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
-
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
-
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt2_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt2_1.out"
-
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
+
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
+
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
+
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
+
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_0-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_1-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_0-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_1-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_0-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt2_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_1-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt2_1.out"
+
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_0-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_1-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_0-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_1-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
 
 ALTERNATIVE_PRIORITY_pru-icss-rpmsg-echo = "100"
 
-- 
2.17.1

