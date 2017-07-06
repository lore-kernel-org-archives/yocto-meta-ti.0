Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D7FFE00BAD; Thu,  6 Jul 2017 09:29:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 462A2E00B57
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 09:29:35 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66GTPZP028091
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:29:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499358565;
	bh=o7zeob+4BFdAoA6yDl2eji5PxNmak3cf22cqbFlcWzA=;
	h=From:To:CC:Subject:Date;
	b=OOcLoF8kdTitG/+ei1tnOHnYui0uCtAV6l3Ce+NVn0vK3HKkzSsyI5/3aWkZwwSkj
	olnaGgczDRzva4G5MtjBxlRG5FUoOtw51fVa26bUiDuA7tkCcUm7h446Tc0zRKVPbI
	1FfERI/PkGW/sThQ2zd2Shg1ti63XUrhEm6ieYbE=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66GTJXG026342
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:29:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 11:29:19 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66GTJgY011544;	Thu, 6 Jul 2017 11:29:19 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 12:29:18 -0400
Message-ID: <1499358558-35023-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] trim_install: Add trim install bbclass
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
X-List-Received-Date: Thu, 06 Jul 2017 16:29:36 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 classes/trim_install.bbclass | 199 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 199 insertions(+)
 create mode 100644 classes/trim_install.bbclass

diff --git a/classes/trim_install.bbclass b/classes/trim_install.bbclass
new file mode 100644
index 0000000..1a80390
--- /dev/null
+++ b/classes/trim_install.bbclass
@@ -0,0 +1,199 @@
+TRIM_ROOT_DIR ?= ""
+
+do_trim_install() {
+    WANT_M4="yes"
+    WANT_M4F="yes"
+    WANT_C64P="yes"
+    WANT_C674="yes"
+    WANT_C66="yes"
+    WANT_ARM9="yes"
+    WANT_A8="yes"
+    WANT_A9="yes"
+    WANT_A15="yes"
+    WANT_ARMV7A="yes"
+    WANT_EVE="no"
+}
+
+do_trim_install_append_dra7xx-evm() {
+    WANT_EVE="yes"
+}
+
+do_trim_install_append() {
+    
+    if [ -e "${TRIM_ROOT_DIR}" ]
+    then
+        # Remove coff libs
+        find ${TRIM_ROOT_DIR} \
+               -name "*.a66"   -o -name "*.a66e"  \
+            -o -name "*.a64e"  -o -name "*.a64Pe"  -o -name "*.a64Te"  -o -name "*.a674e"  -o -name "*.a67e" \
+            -o -name "*.a64"   -o -name "*.a64P"   -o -name "*.a64T"   -o -name "*.a674"   -o -name "*.a67"  \
+            -o -name "*.a67P"  -o -name "*.a67Pe" \
+            -o -name "*.o64"   -o -name "*.o64P"   -o -name "*.o64T"   -o -name "*.o674"   -o -name "*.o67"  \
+            -o -name "*.o64e"  -o -name "*.o64Pe"  -o -name "*.o64Te"  -o -name "*.o674e"  -o -name "*.o67e" \
+            -o -name "*.o67P"  -o -name "*.o67Pe" \
+            -o -name "*.l66"   -o -name "*.l66e"   -o -name "*.l64P"   -o -name "*.l64Pe"  \
+            -o -name "*.l64"   -o -name "*.l64e" | xargs -r rm -rf
+
+        # Remove old 64, 67, and 64T libs
+        find ${TRIM_ROOT_DIR} \
+               -name "*.ae64"  -o -name "*.ae67"   -o -name "*.ae64T"  \
+            -o -name "*.oe64"  -o -name "*.oe67"   -o -name "*.oe64T" | xargs -r rm -rf
+
+        # Remove other a8 and armv7 ABIs
+        find ${TRIM_ROOT_DIR} \
+               -name "*.aea8f"  -o -name "*.aea8ft" -o -name "*.aea8fv" -o -name "*.av7A" \
+            -o -name "*.oea8f"  -o -name "*.oea8ft" -o -name "*.oea8fv" -o -name "*.ov7A" \
+            | xargs -r rm -rf
+
+        # Remove IAR compiler libs
+        find ${TRIM_ROOT_DIR} \
+               -name "*.arm3"  -o -name "*.arm4"   -o -name "*.arm4f" \
+            -o -name "*.orm3"  -o -name "*.orm4"   -o -name "*.orm4f" | xargs -r rm -rf
+
+        # Remove msp430 and C2000 libs
+        find ${TRIM_ROOT_DIR} \
+               -name "*.ae430"  -o -name "*.ae430X" -o -name "*.ae430XS" -o -name "*.ae430XL" \
+            -o -name "*.ar430"  -o -name "*.ar430X" -o -name "*.ar430XS" -o -name "*.ar430XL" \
+            -o -name "*.a430"   -o -name "*.a430X"  -o -name "*.a430XS"  -o -name "*.a430XL"  \
+            -o -name "*.oe430"  -o -name "*.oe430X" -o -name "*.oe430XS" -o -name "*.oe430XL" \
+            -o -name "*.or430"  -o -name "*.or430X" -o -name "*.or430XS" -o -name "*.or430XL" \
+            -o -name "*.o430"   -o -name "*.o430X"  -o -name "*.o430XS"  -o -name "*.o430XL"  \
+            -o -name "*.a28"    -o -name "*.a28L"   -o -name "*.a28FP"  \
+            -o -name "*.o28"    -o -name "*.o28L"   -o -name "*.o28FP" | xargs -r rm -rf
+
+        # Remove armv6, and tms470 libs
+        find ${TRIM_ROOT_DIR} \
+            -o -name "*.av6"     -o -name "*.ov6" \
+            -o -name "*.a470uC"  -o -name "*.o470uC" | xargs -r rm -rf
+
+        # Remove M0 libs
+        find ${TRIM_ROOT_DIR} \
+               -name "*.aem0" -o -name "*.am0g" \
+            -o -name "*.oem0" -o -name "*.om0g" | xargs -r rm -rf
+
+        # Remove M3 libs
+        find ${TRIM_ROOT_DIR} \
+               -name "*.aem3" -o -name "*.am3g" \
+            -o -name "*.oem3" -o -name "*.om3g" | xargs -r rm -rf
+
+        # Remove R4F libs
+        find ${TRIM_ROOT_DIR} \
+               -name "*.ar4fg" -o -name "*.aer4f"   \
+            -o -name "*.or4fg" -o -name "*.oer4f" | xargs -r rm -rf
+
+        # Remove R5F libs
+        find ${TRIM_ROOT_DIR} \
+               -name "*.ar5fg" -o -name "*.aer5f"   \
+            -o -name "*.or5fg" -o -name "*.oer5f" | xargs -r rm -rf
+
+        # Remove M4 (w/o F) libs
+        if [ "$WANT_M4" == "no" ]
+        then
+            # Remove M4 (w/o F) libs
+            echo "Trim M4 (w/o F)"
+            find ${TRIM_ROOT_DIR} \
+                   -name "*.aem4" -o -name "*.am4g" \
+                -o -name "*.oem4" -o -name "*.om4g" | xargs -r rm -rf
+        fi
+
+        if [ "$WANT_M4F" == "no" ]
+        then
+            # Remove M4F libs
+            echo "Trim M4F"
+            find ${TRIM_ROOT_DIR} \
+                   -name "*.am4fg" -o -name "*.aem4f"   \
+                -o -name "*.om4fg" -o -name "*.oem4f" | xargs -r rm -rf
+        fi
+        
+        if [ "$WANT_C64P" == "no" ]
+        then
+            # Remove c64+ (DM3530, DM6446, 6472, 6457, etc) libs
+            echo "Trim c64+"
+            find ${TRIM_ROOT_DIR} \
+                   -name "*.ae64P"    -o -name "*.ae64Pe"       \
+                -o -name "*.oe64P"    -o -name "*.oe64Pe"       \
+                -o -name "*.l64P_elf" -o -name "*.l64Pe_elf" | xargs -r rm -rf
+        fi
+        
+        if [ "$WANT_C674" == "no" ]
+        then
+            # Remove c674x (Primus, Freon aka omapl aka ...) libs
+            echo "Trim c674x"
+            find ${TRIM_ROOT_DIR} \
+                   -name "*.ae67P" -o -name "*.ae67Pe"  \
+                -o -name "*.oe67P" -o -name "*.oe67Pe"  \
+                -o -name "*.ae674" -o -name "*.ae674e"  \
+                -o -name "*.oe64P" -o -name "*.oe674e" | xargs -r rm -rf
+        fi
+        
+        if [ "$WANT_C66" == "no" ]
+        then
+            # Remove c66 libs
+            echo "Trim c66"
+            find ${TRIM_ROOT_DIR} \
+                   -name "*.ae66"  -o -name "*.ae66e"   \
+                -o -name "*.oe66"  -o -name "*.oe66e"   \
+                -o -name "*.l66_elf" -o -name "*.l66e_elf" | xargs -r rm -rf
+        fi
+        
+        if [ "$WANT_ARM9" == "no" ]
+        then
+            # Remove arm926 (Davinci omapl etc) libs
+            echo "Trim arm926"
+            find ${TRIM_ROOT_DIR} \
+                   -name "*.av5T" -o -name "*.aev5T"   \
+                -o -name "*.ov5T" -o -name "*.oev5T" | xargs -r rm -rf
+        fi
+        
+        if [ "$WANT_A8" == "no" ]
+        then
+            # Remove A8 libs
+            echo "Trim A8"
+            find ${TRIM_ROOT_DIR} \
+                   -name "*.aa8fg" -o -name "*.aea8fnv" -o -name "*.a8_elf.lib" \
+                -o -name "*.oa8fg" -o -name "*.oea8fnv" -o -name "*.a8_elf.o" \
+                | xargs -r rm -rf
+        fi
+        
+        if [ "$WANT_A9" == "no" ]
+        then
+            # Remove A9 libs
+            echo "Trim A9"
+            find ${TRIM_ROOT_DIR} \
+                   -name "*.aa9fg" -o -name "*.ae9" -o -name "*.a9_elf.lib" \
+                -o -name "*.oa8fg" -o -name "*.oe9" -o -name "*.a9_elf.o"   \
+                -o -name "*.am437x_elf.lib" | xargs -r rm -rf
+        fi
+        
+        if [ "$WANT_A15" == "no" ]
+        then
+            # Remove A15 libs
+            echo "Trim A15"
+            find ${TRIM_ROOT_DIR} \
+                   -name "*.aa15fg" -o -name "*.aea15f" -o -name "*.a15_elf.lib" \
+                -o -name "*.oa15fg" -o -name "*.oea15f" -o -name "*.a15_elf.o" \
+                | xargs -r rm -rf
+        fi
+        
+        if [ "$WANT_ARMV7A" == "no" ]
+        then
+            # Remove generic armv7a libs (does anything use .av7AF?)
+            echo "Trim armv7a"
+            find ${TRIM_ROOT_DIR} \
+                   -name "*.av7AF" \
+                -o -name "*.ov7AF" | xargs -r rm -rf
+        fi
+
+        if [ "$WANT_EVE" == "no" ]
+        then
+            # Remove EVE
+            echo "Trim EVE"
+            find ${TRIM_ROOT_DIR} \
+                   -name "*.aearp32" -o -name "*.aearp32F" \
+                -o -name "*.oearp32" -o -name "*.oearp32F" \
+                | xargs -r rm -rf
+        fi
+    fi
+}
+
+addtask do_trim_install after do_compile before do_install
-- 
1.9.1


