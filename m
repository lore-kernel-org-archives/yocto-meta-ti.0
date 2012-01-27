Return-Path: <raj.khem@gmail.com>
Received: from mail-gx0-f176.google.com (mail-gx0-f176.google.com
	[209.85.161.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 752E6E00592
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 16:32:12 -0800 (PST)
Received: by ggnq1 with SMTP id q1so798811ggn.35
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 16:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4wyuRdMeFw49zIdJTBFrzgwxMoPG3ulX5bPBUX/vpaM=;
	b=BnTtyDNN9OAJ2qttQN7xgEGZ3wQWjnhYR9cIQfeNEU/ffdZRYLkKRkdVTvxAjuXdaP
	PIbqulMjpVIy0kPV3jyzbSCZeU0weSzGmznK5dW9V8MdyLSY1JONawHtpkHjKEPIYce7
	NR662keVlsH1BudvksLw+nN70EXLob6uqd+yA=
Received: by 10.101.2.32 with SMTP id e32mr2081603ani.13.1327624331637;
	Thu, 26 Jan 2012 16:32:11 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id i12sm15390198anm.6.2012.01.26.16.32.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 16:32:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Thu, 26 Jan 2012 16:31:29 -0800
Message-Id: <1327624289-20845-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] meta-ti: Guard use of SOC_FAMILY to account for it being empty
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
X-List-Received-Date: Fri, 27 Jan 2012 00:32:12 -0000

Right now SOC_FAMILY is set to 'Unknown' by default by angstrom
distro but others might not set it as all so it will be empty
hence we take care of the case if this is empty

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-ti/linuxutils/ti-linuxutils.inc |   10 +++++-----
 recipes-ti/syslink/ti-syslink.inc       |    2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/linuxutils/ti-linuxutils.inc b/recipes-ti/linuxutils/ti-linuxutils.inc
index d6cd18c..06b254d 100644
--- a/recipes-ti/linuxutils/ti-linuxutils.inc
+++ b/recipes-ti/linuxutils/ti-linuxutils.inc
@@ -23,12 +23,12 @@ do_compile() {
     do_make_scripts
     unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 
-    case ${SOC_FAMILY} in 
-    dm365)
+    case "${SOC_FAMILY}" in
+    "dm365")
             modules="cmem edma irq";;
-    omap3)
+    "omap3")
             modules="cmem sdma";;
-	dm355)
+    "dm355")
             modules="cmem edma irq";;
     *)
             modules="cmem"
@@ -58,7 +58,7 @@ do_install () {
       EXEC_DIR="${D}${installdir}/ti-linuxutils-app/cmem-app" \
       install
     # Install EDMA
-    if [ ${SOC_FAMILY} = "dm365" ] ; then
+    if [ "${SOC_FAMILY}" = "dm365" ] ; then
         cd ${S}/packages/ti/sdo/linuxutils/edma/apps
         make \
          LINUXKERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" \
diff --git a/recipes-ti/syslink/ti-syslink.inc b/recipes-ti/syslink/ti-syslink.inc
index 8cc5775..d7df8c1 100644
--- a/recipes-ti/syslink/ti-syslink.inc
+++ b/recipes-ti/syslink/ti-syslink.inc
@@ -196,7 +196,7 @@ do_install () {
     # Install the rtos example apps 
     install -d ${D}/${installdir}/ti-syslink-examples/dsp
     cd ${SYSLINK_ROOT}/ti/syslink/samples/rtos
-    for i in $(find . -name "*.${SYSLINKSUFFIX}" | grep ${SOC_FAMILY}); do
+    for i in $(find . -name "*.${SYSLINKSUFFIX}" | grep "${SOC_FAMILY}"); do
         install ${i} ${D}/${installdir}/ti-syslink-examples/dsp/
     done
 
-- 
1.7.5.4


