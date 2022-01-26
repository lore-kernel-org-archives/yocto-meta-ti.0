Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.20670.1643238548158258145
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7A57740CBF;
	Wed, 26 Jan 2022 23:09:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gx1XGUMQasLp; Wed, 26 Jan 2022 23:09:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5608340CC0;
	Wed, 26 Jan 2022 23:09:06 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1650A17472C;
	Wed, 26 Jan 2022 18:09:04 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 04/19] dmai: remove Davinci Multimedia Application Interface (DMAI)
Date: Wed, 26 Jan 2022 18:08:44 -0500
Message-Id: <1643238539-20686-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238539-20686-1-git-send-email-denis@denix.org>
References: <1643238539-20686-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Was used with deprecated DaVinci, OMAP-L1 and OMAP3 families of platforms.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-ti/dmai/ti-dmai.inc                        | 162 ----------------
 recipes-ti/dmai/ti-dmai/arago-tdox                 | 210 ---------------------
 recipes-ti/dmai/ti-dmai/doxygen_templates.tar.gz   | Bin 8012 -> 0 bytes
 .../dmai/ti-dmai/loadmodules-ti-dmai-apps.sh       |  37 ----
 .../dmai/ti-dmai/loadmodules-ti-dmai-dm355_al.sh   |  23 ---
 .../dmai/ti-dmai/loadmodules-ti-dmai-dm365_al.sh   |  25 ---
 .../dmai/ti-dmai/loadmodules-ti-dmai-dm6446_al.sh  |  19 --
 .../dmai/ti-dmai/loadmodules-ti-dmai-dm6467_al.sh  |  19 --
 .../dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh   |  42 -----
 .../dmai/ti-dmai/loadmodules-ti-dmai-ol137_al.sh   |  19 --
 .../dmai/ti-dmai/loadmodules-ti-dmai-ol138_al.sh   |  19 --
 .../omap3530-r642-remove-include-videodev.diff     |  64 -------
 recipes-ti/dmai/ti-dmai/r642-fix-config-bld.diff   |  48 -----
 .../dmai/ti-dmai/remove-unneeded-includes.patch    |  26 ---
 .../dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh     |  12 --
 recipes-ti/dmai/ti-dmai_svn.bb                     |  43 -----
 recipes-ti/includes/ti-paths.inc                   |   2 -
 17 files changed, 770 deletions(-)
 delete mode 100644 recipes-ti/dmai/ti-dmai.inc
 delete mode 100644 recipes-ti/dmai/ti-dmai/arago-tdox
 delete mode 100644 recipes-ti/dmai/ti-dmai/doxygen_templates.tar.gz
 delete mode 100755 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh
 delete mode 100755 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm355_al.sh
 delete mode 100644 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm365_al.sh
 delete mode 100755 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm6446_al.sh
 delete mode 100755 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm6467_al.sh
 delete mode 100755 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh
 delete mode 100755 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-ol137_al.sh
 delete mode 100755 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-ol138_al.sh
 delete mode 100644 recipes-ti/dmai/ti-dmai/omap3530-r642-remove-include-videodev.diff
 delete mode 100644 recipes-ti/dmai/ti-dmai/r642-fix-config-bld.diff
 delete mode 100644 recipes-ti/dmai/ti-dmai/remove-unneeded-includes.patch
 delete mode 100644 recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh
 delete mode 100644 recipes-ti/dmai/ti-dmai_svn.bb

diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
deleted file mode 100644
index c9c4086..0000000
--- a/recipes-ti/dmai/ti-dmai.inc
+++ /dev/null
@@ -1,162 +0,0 @@
-DESCRIPTION = "Davinci Multimedia Application Interface (DMAI) for TI ARM/DSP processors"
-HOMEPAGE = "https://gforge.ti.com/gf/project/dmai/"
-SECTION = "multimedia"
-LICENSE = "BSD"
-
-# TODO :: 
-
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-staging.inc
-
-PROVIDES += "ti-dmai-apps"
-
-PE = "1"
-
-SRCREV               ?= "UNDEFINED_SRCREV"
-DMAIBRANCH           ?= "UNDEFINED_DMAIBRANCH"
-
-S = "${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}/dmai"
-
-SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};protocol=https;user=anonymous;pswd='' \
-		file://loadmodules-ti-dmai-dm6446_al.sh \
-		file://loadmodules-ti-dmai-dm6467_al.sh \
-		file://loadmodules-ti-dmai-o3530_al.sh \
-		file://loadmodules-ti-dmai-dm355_al.sh \
-		file://loadmodules-ti-dmai-dm365_al.sh \
-		file://loadmodules-ti-dmai-ol137_al.sh \
-		file://loadmodules-ti-dmai-ol138_al.sh \
-	    file://doxygen_templates.tar.gz \
-        file://arago-tdox \
-	"
-
-DEPENDS = "virtual/kernel alsa-lib ti-framework-components ti-codec-engine ti-xdctools-native"
-
-DEPENDS:append_dm6446 	= " ti-codecs-dm6446   ti-dspbios ti-cgt6x ti-linuxutils"
-DEPENDS:append_dm6467 	= " ti-codecs-dm6467   ti-dspbios ti-cgt6x ti-linuxutils"
-DEPENDS:append:omap3    = " ti-codecs-omap3530 ti-dspbios ti-cgt6x ti-linuxutils"
-DEPENDS:append_dm355  	= " ti-codecs-dm355"
-DEPENDS:append_dm365    = " ti-codecs-dm365"
-DEPENDS:append:omapl137 = " ti-codecs-omapl137 ti-dspbios ti-cgt6x ti-linuxutils"
-DEPENDS:append:omapl138 = " ti-codecs-omapl138 ti-dspbios ti-cgt6x ti-linuxutils"
-
-# Define DMAI build time variables
-DMAIPLATFORM_dm6446    = "dm6446_al"
-DMAIPLATFORM_dm6467    = "dm6467_al"
-DMAIPLATFORM:omap3     = "o3530_al"
-DMAIPLATFORM_dm355     = "dm355_al"
-DMAIPLATFORM_dm365     = "dm365_al"
-DMAIPLATFORM:omapl137  = "ol137_al"
-DMAIPLATFORM:omapl138  = "ol138_al"
-DMAIPLATFORM          ?= "UNDEFINED_DMAIPLATFORM"
-
-# Need to set this for other platforms as well
-#GPPOS_dm355      = "LINUX_GCC"
-#GPPOS_dm365      = "LINUX_GCC"
-#GPPOS           ?= "UNDEFINEDGPPOS"
-
-# Need to re-define this for OMAP-L137/L138
-DSPSUFFIX:omapl137 = "x64P"
-DSPSUFFIX:omapl138 = "x64P"
-DSPSUFFIX ?= "x64p"
-
-# This is needed for dm355/dm365 targets in order to find ti.sdo.codecs.g711
-# TODO :: review - should we just pass this in do_compile?
-USER_XDC_PATH = "${CE_INSTALL_DIR}/examples"
-
-PARALLEL_MAKE = ""
-
-do_prepsources() {
-    # run the release steps - this will delete .svn file and run doxygen to
-    # generate proper documentation of the source etc.
-    find ${WORKDIR}/${DMAIBRANCH} -name .svn -type d | xargs rm -rf
-    cp -pPrf ${WORKDIR}/doxygen_templates ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface
-    cp -pPrf ${WORKDIR}/arago-tdox ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/tdox
-    chmod a+x ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/release.sh
-    chmod a+x ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/tdox
-    sed -i 's|tdox|./tdox|g' ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/release.sh
-    rm -rf ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}/*
-    (cd ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface; ./release.sh ${PV})
-}
-
-# run prepare sources before do_patch to ensure that sourceipk picks the right sources.
-addtask prepsources after do_unpack before do_patch
-
-do_compile () {
-	# Recent kernel headers warn against inclusion from userspace
-    for makefile in $(find ${S} -name "Makefile") ; do
-        sed -i -e s:-Werror::g $makefile
-    done
-
-    # Angstrom 2008 breaks with -Wl,-T, while angstrom 2010 needs it
-    if [ $(${TARGET_PREFIX}gcc -dumpversion | awk -F. '{print $2}') -gt 3 ] ; then
-        # Fix up linkerscripts, recent toolchains need -T to prepend the default script to the custom one 
-        for appmakefile in $(find ${S} -name "Makefile.app") ; do
-            sed -i -e 's: $(XDC_CFG)/linker.cmd: -Wl,-T,$(XDC_CFG)/linker.cmd:g' $appmakefile
-        done
-    fi
-
-    # TODO :: Why do we do this?
-    unset DMAI_INSTALL_DIR
-    cd ${S}
-
-    make XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" PLATFORM="${DMAIPLATFORM}" clean
-
-    for dir in ${S}; do
-        cd $dir
-        #  TODO: Figure out how to pass the alsa require location, currently 
-        #  LINUXLIBS_INSTALL_DIR is hard-coded for armv5te
-        make \
-            CE_INSTALL_DIR="${CE_INSTALL_DIR}" \
-            CODEC_INSTALL_DIR="${CODEC_INSTALL_DIR}" \
-            FC_INSTALL_DIR="${FC_INSTALL_DIR}" \
-            LINUXKERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" \
-            XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
-            CODEGEN_INSTALL_DIR="${CODEGEN_INSTALL_DIR}" \
-            BIOS_INSTALL_DIR="${BIOS_INSTALL_DIR}"\
-            LINUXLIBS_INSTALL_DIR="${STAGING_DIR_TARGET}/usr" \
-            USER_XDC_PATH="${USER_XDC_PATH}" \
-            CROSS_COMPILE="${TOOLCHAIN_PATH}/${TARGET_PREFIX}" \
-            CSTOOL_DIR="${TOOLCHAIN_PATH}" \
-            VERBOSE="true" \
-            XDAIS_INSTALL_DIR="${XDAIS_INSTALL_DIR}" \
-            LINK_INSTALL_DIR="${LINK_INSTALL_DIR}" \
-            CMEM_INSTALL_DIR="${CMEM_INSTALL_DIR}" \
-            LPM_INSTALL_DIR="${LPM_INSTALL_DIR}" \	
-            C6ACCEL_INSTALL_DIR=${C6ACCEL_INSTALL_DIR} \
-            MVTOOL_PREFIX="${TARGET_PREFIX}" \
-            PLATFORM="${DMAIPLATFORM}" 
-	done
-}
-
-do_install () {
-
-    # TODO :: Why do we do this?
-    unset DMAI_INSTALL_DIR
-
-    install -d ${D}/${installdir}/ti-dmai-apps
-    cd ${S}
-    make PLATFORM="${DMAIPLATFORM}" EXEC_DIR=${D}/${installdir}/ti-dmai-apps install 
-    install -m 0755 ${WORKDIR}/loadmodules-ti-dmai-${DMAIPLATFORM}.sh ${D}/${installdir}/ti-dmai-apps/loadmodules.sh 
-
-    install -d ${D}${DMAI_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${DMAI_INSTALL_DIR_RECIPE}
-}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PACKAGES += "ti-dmai-apps"
-FILES:ti-dmai-apps = "${installdir}/ti-dmai-apps/*"
-INSANE_SKIP:ti-dmai-apps = "1"
-
-RDEPENDS:ti-dmai-apps_dm6446    += "ti-codecs-dm6446-server   ti-cmem-module ti-dsplink-module"
-RDEPENDS:ti-dmai-apps_dm6467    += "ti-codecs-dm6467          ti-cmem-module ti-dsplink-module"
-RDEPENDS:ti-dmai-apps:omap3     += "ti-codecs-omap3530-server ti-cmem-module ti-dsplink-module ti-lpm-module ti-sdma-module"
-RDEPENDS:ti-dmai-apps_dm355     += "ti-codecs-dm355           ti-cmem-module ti-dm355mm-module"
-RDEPENDS:ti-dmai-apps_dm365     += "ti-codecs-dm365           ti-cmem-module ti-dm365mm-module ti-edma-module ti-irq-module"
-RDEPENDS:ti-dmai-apps:omapl137  += "ti-codecs-omapl137-server ti-cmem-module ti-dsplink-module"
-RDEPENDS:ti-dmai-apps:omapl138  += "ti-codecs-omapl138-server ti-cmem-module ti-dsplink-module"
-
-pkg_postinst:ti-dmai-apps () {
-	ln -sf ${installdir}/ti-codecs-server/*.${DSPSUFFIX} ${installdir}/ti-dmai-apps/
-}
-
diff --git a/recipes-ti/dmai/ti-dmai/arago-tdox b/recipes-ti/dmai/ti-dmai/arago-tdox
deleted file mode 100644
index 81538cf..0000000
--- a/recipes-ti/dmai/ti-dmai/arago-tdox
+++ /dev/null
@@ -1,210 +0,0 @@
-#!/bin/bash
-#
-#
-# This script sets a series of environment variable that are referenced
-# in a doxygen configuration file.  The values passed in here are simply
-# plugged into the file locations and doxygen proceeds normaly.
-#
-# template location is ${VENDORS}/opensource/doxygen/templates/<version>
-#
-#
-
-# Revision history
-#! 02 Jul 2009 cring: Added cmd line args for doxygendir (-x) and template (-t)
-#! 13 Jul 2006 ada: New template smaller pdf generation
-#! 16 May 2006 ada: Added -p file to pdf for space in project names
-#! 08 May 2006 ada: Added pdf generation to tdox (Solaris/Linux only).
-#! 23 Jan 2006 ada: Overide file to change default doxyfile behaivior
-#! 19 Jan 2006 ada: 1093, ENUM_VALUES_PER_LINE set to 1, ref doxyfile via vers
-#! 05 Oct 2005 ada: 933,  doxyfile in tools, removed win and unix vendors path
-#! 24 Aug 2005 ada: Added 897 changes, optional css c or jave optimization
-#! 18 Aug 2005 ada: inital version from AR 887
-
-# Set these defaults here as the usage statement uses them
-TDOX_TEMPLATEDIR=${TOOLS}/default/doxygen_templates
-DOXYGEN_EXECUTABLE=doxygen
-
-function usage
-{
-  OPTIONS="`basename $0` code_location out_doc_location [-x doxygen_exe ] [-t tdox_templatedir] [-n project_name] [-v version] [-f FILE_PATTERNS ] [-s strip_dir] [-c css location] [-e exclude dirs] [-b enabled sections] [-m generate chm] [-p pdf_file] [-o override doxyfile] [-j]"
-  echo "`basename $1` $OPTIONS"
-  echo "Where: "
-  echo "\tcode_location: Top of tree(s) to search for code (required as 1st param)"
-  echo "\tout_doc_location: Output location for generated files (required as 2nd param)"
-  echo "\t[-n project_name]: title of generated documentation (defaults to Project)"
-  echo "\t[-x doxygen_exe]: location of doxygen executable (defaults to $DOXYGEN_EXECUTABLE)"
-  echo "\t[-t tdox_templatedir]: location of tdox templates (defaults to $TDOX_TEMPLATEDIR)"
-  echo "\t[-v version]: version number or string (defaults to 1.0)"
-  echo "\t[-f FILE_PATTERNS]: Optional list of files to document (defaults to all)"
-  echo "\t[-s strip_dirs]: Remove directory prefix from generated files (defaults to not remove)"
-  echo "\t[-c path_to_css]: Path to a user suplied CSS style sheet"
-  echo "\t[-e exclude dirs]: List of directories to exclude"
-  echo "\t[-b enabled sections]: List of sections to enable"
-  echo "\t[-m generate chm]: chm file name (required)"
-  echo "\t[-p generate pdf <file>]: create <file>.pdf in html/pdf (Linux only)"
-  echo "\t[-o override doxyfile]: file (advanced) Overide any doxyfile default"
-  echo "\t[-j]: Optimize for Java (Generate class files) defaults to C"
-  echo "\t[-r]: Call rshd to windows for chm generation (defaults to wine)"
-  echo
-  exit
-}
-
-function optimizeForJava
-{
-  DOX_OPTIMIZE_OUTPUT_JAVA="YES"
-  DOX_OPTIMIZE_OUTPUT_FOR_C="NO"
-}
-
-if [ "$#" -lt 2 ]; then
-   echo "Invalid number of parameters"
-   usage $0
-fi
-
-# get the required parameters then shift for the getopts parameters
-export DOX_INPUT="$1"
-shift
-export DOX_OUTPUT_DIRECTORY="$1"
-shift
-
-#set the global defaults
-DOX_QUIET="YES"
-DOX_OPTIMIZE_OUTPUT_JAVA="NO"
-DOX_OPTIMIZE_OUTPUT_FOR_C="YES"
-DOX_CHM_FILE=
-DOX_GENERATE_HTMLHELP="NO"
-OVERRIDE_FILE=""
-PDF=""
-
-# Process the rest of the arguments as getopts
-# parameters
-while getopts b:c:e:f:m:n:o:p:s:t:v:x:dhjr arg
-do
-  case $arg in
-    b)  DOX_ENABLED_SECTIONS=${OPTARG};;
-    c)  DOX_HTML_STYLESHEET=${OPTARG};;
-    d)  DEBUG=1;;
-    e)  DOX_EXCLUDE=${OPTARG};;
-    f)  DOX_FILE_PATTERNS=${OPTARG};;
-    h)  usage;exit 0;;
-    j)  optimizeForJava;;
-    r)  USERSHD=1;;
-    m)  DOX_CHM_FILE=${OPTARG};DOX_GENERATE_HTMLHELP="YES";;
-    n)  DOX_PROJECT_NAME=${OPTARG};;
-    s)  DOX_STRIP_FROM_PATH=${OPTARG};;
-    t)  TDOX_TEMPLATEDIR=${OPTARG};;
-    v)  DOX_PROJECT_NUMBER=${OPTARG};;
-    x)  DOXYGEN_EXECUTABLE=${OPTARG};;
-    o)  OVERRIDE_FILE=${OPTARG};;
-    p)  PDF=${OPTARG};;
-    \?) usage
-        exit 2;;
-  esac
-done
-
-if [ "$DEBUG" = "1" ]; then
-   DOX_QUIET="NO"
-   set -x
-fi
-
-if [ "$DOX_PROJECT_NAME" = "" ]; then
-   DOX_PROJECT_NAME="Project"
-fi
-
-if [ "$DOX_PROJECT_NUMBER" = "" ]; then
-   DOX_PROJECT_NUMBER="1.0"
-fi
-
-if [ "$DOX_FILE_PATTERNS" = "" ]; then
-   DOX_FILE_PATTERNS="*.c \
-                  *.cc \
-                  *.cxx \
-                  *.cpp \
-                  *.c++ \
-                  *.d \
-                  *.java \
-                  *.ii \
-                  *.ixx \
-                  *.ipp \
-                  *.i++ \
-                  *.inl \
-                  *.h \
-                  *.hh \
-                  *.hxx \
-                  *.hpp \
-                  *.h++ \
-                  *.idl \
-                  *.odl \
-                  *.cs \
-                  *.php \
-                  *.php3 \
-                  *.inc \
-                  *.m \
-                  *.mm \
-                  *.dox"
-fi
-
-export DOX_INPUT
-export DOX_OUTPUT_DIRECTORY
-export DOX_PROJECT_NAME
-export DOX_PROJECT_NUMBER
-export DOX_FILE_PATTERNS
-export DOX_STRIP_FROM_PATH
-export DOX_QUIET
-export DOX_HTML_STYLESHEET
-export DOX_OPTIMIZE_OUTPUT_FOR_C
-export DOX_OPTIMIZE_OUTPUT_JAVA
-export DOX_EXCLUDE
-export DOX_ENABLED_SECTIONS
-export DOX_CHM_FILE
-export DOX_GENERATE_HTMLHELP
-export TDOX_TEMPLATEDIR
-
-
-# Make sure the dir exists
-mkdir -p $DOX_OUTPUT_DIRECTORY
-
-# Create temp file copy of doxyfile and append overrides to the end of the file
-cp ${TDOX_TEMPLATEDIR}/doxyfile /tmp/doxyfile$$
-
-chmod +w /tmp/doxyfile$$
-if [ "$OVERRIDE_FILE" != "" ]; then
-   cat $OVERRIDE_FILE >> /tmp/doxyfile$$
-fi
-
-# Run doxygen and clean up temp file
-${DOXYGEN_EXECUTABLE} /tmp/doxyfile$$
-rm -f /tmp/doxyfile$$
-
-# Copy the TI banner gifs to the html directory.
-cp -p ${TDOX_TEMPLATEDIR}/*gif $DOX_OUTPUT_DIRECTORY/html
-
-# Generate PDF files
-if [ "$PDF" != "" ]; then
-  if [ "$BUILD_HOST_OS" = "Linux" ]; then
-    rm -rf $DOX_OUTPUT_DIRECTORY/html/pdf
-    mkdir -p $DOX_OUTPUT_DIRECTORY/html/pdf
-    cwd=`pwd`
-    cd  $DOX_OUTPUT_DIRECTORY/latex
-    latex refman.tex
-    makeindex refman.idx
-    latex refman.tex
-    latex_count=5
-    while egrep -s 'Rerun (LaTeX|to get cross-references right)' refman.log && [ $$latex_count -gt 0 ]
-    do
-        latex refman.tex
-        latex_count=`expr $$latex_count - 1`
-    done
-    dvips -o refman.ps refman.dvi
-    ps2pdf refman.ps refman.pdf
-    cd $cwd
-    mv $DOX_OUTPUT_DIRECTORY/latex/refman.pdf $DOX_OUTPUT_DIRECTORY/html/pdf/${PDF}.pdf
-  else
-    echo "Sorry... pdf generation supported under Linux only"
-  fi
-fi
-
-# Generate Windows compressed help
-if [ "$DOX_GENERATE_HTMLHELP" = "YES" ]; then
- 
-     echo "chm generation is not supported"
-fi
diff --git a/recipes-ti/dmai/ti-dmai/doxygen_templates.tar.gz b/recipes-ti/dmai/ti-dmai/doxygen_templates.tar.gz
deleted file mode 100644
index 6d613bf50f52595ee6aee56e08e3044c7a19f8e4..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 8012
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
H2Il_&Pb+J)

diff --git a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh
deleted file mode 100755
index 7120b74..0000000
--- a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh
+++ /dev/null
@@ -1,37 +0,0 @@
-#
-# Default Memory Map - for OMAP3530 dvsdk examples from 3.00.00.29 - this memory map is used for DMAI apps
-#
-# Start Addr    Size    Description
-# -------------------------------------------
-# 0x80000000    88 MB   Linux
-# 0x85800000    08 MB   CMEM
-# 0x86800000    16 MB   DDRALGHEAP
-# 0x87800000     6 MB   DDR2 (BIOS, Codecs, Applications)
-# 0x87E00000     1 MB   DSPLINK (MEM)
-# 0x87F00000     4 KB   DSPLINK (RESET)
-# 0x87F01000  1020 KB   unused
-
-# sanity check to verify that we're using the right mem=xxM (88M in this case)
-awk '/MemTotal:/ {
-    mem=$2
-
-    if (mem > 88 * 1024)
-        print "Warning! You need to use mem=88M or less on the kernel cmdline"
-
-    printf "You have %dkB total memory for Linux\n", mem
-}' /proc/meminfo
-
-# Select cmemk parameters for best fit, i.e. starting at 0x85000000
-modprobe cmemk phys_start=0x85800000 phys_end=0x86800000 pools=20x4096,8x131072,5x1048576,1x1429440,1x256000,1x3600000,5x829440
-
-# insert DSP/BIOS Link driver
-#
-modprobe dsplinkk
-
-# make /dev/dsplink
-#rm -f /dev/dsplink
-#mknod /dev/dsplink c `awk "\\$2==\"dsplink\" {print \\$1}" /proc/devices` 0
-
-# insert Local Power Manager driver
-#
-modprobe lpm_omap3530
diff --git a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm355_al.sh b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm355_al.sh
deleted file mode 100755
index ca357e2..0000000
--- a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm355_al.sh
+++ /dev/null
@@ -1,23 +0,0 @@
-#!/bin/sh
-#
-# loadmodules.sh
-#
-# Copyright (C) $year Texas Instruments Incorporated - http://www.ti.com/
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU Lesser General Public License as
-# published by the Free Software Foundation version 2.1 of the License.
-#
-# This program is distributed #as is# WITHOUT ANY WARRANTY of any kind,
-# whether express or implied; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-# Lesser General Public License for more details.
-
-# 12MB
-modprobe cmemk phys_start=0x87400000 phys_end=0x88000000 pools=1x2903040,1x1529856,7x829440,1x524288,1x108680,1x81920,2x8192,6x4096
-
-./mapdmaq
-
-modprobe dm350mmap
-rm -f /dev/dm350mmap
-mknod /dev/dm350mmap c `awk "\\$2==\"dm350mmap\" {print \\$1}" /proc/devices` 0
diff --git a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm365_al.sh b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm365_al.sh
deleted file mode 100644
index 36dc78e..0000000
--- a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm365_al.sh
+++ /dev/null
@@ -1,25 +0,0 @@
-#!/bin/sh
-
-# This loadmodules script is provided to support 1920x1080 resolution file based encode/decode DMAI unit test applications
-
-# Sample bootargs is given below
-# mem=60M console=ttyS0,115200n8 root=/dev/nfs rw nfsroot=<nfsroot> ip=dhcp video=davincifb:vid0=OFF:vid1=OFF:osd0=720x576x16,2025K dm365_imp.oper_mode=0
-
-depmod -a
-rmmod cmemk 2>/dev/null
-rmmod irqk 2>/dev/null
-rmmod edmak 2>/dev/null
-rmmod dm365mmap 2>/dev/null
-
-# Pools configuration
-modprobe cmemk phys_start=0x83C00000 phys_end=0x88000000 pools=1x384,2x5984,2x3133440,1x16384,1x48952,1x20480,1x60288,1x74,1x28,1x2048,1x6785280,1x146,1x896,1x65536,1x98,1x296,29x56,2x24,1x624,4x62,1x1456,1x18321120,1x65792,5x3523584,1x4194304,1x8355840
-
-#VC1 decode pool configuration
-# insmod cmemk.ko phys_start=0x83C00000 phys_end=0x88000000 pools=1x384,1x112665,3x7680,1x319264,2x1024,5x7208960,1x80,1x116,1x29184,1x2688,1x30720,1x551680,2x128,1x74,1x28,1x10240,1x47232,1x448,2x1152,1x8192,2x272896,18x56,2x24,1x86,4x62,2x7808,1x2097152
-
-modprobe irqk
-modprobe edmak
-modprobe dm365mmap
-
-rm -f /dev/dm365mmap
-mknod /dev/dm365mmap c `awk "\\$2==\"dm365mmap\" {print \\$1}" /proc/devices` 0
diff --git a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm6446_al.sh b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm6446_al.sh
deleted file mode 100755
index b4a230d..0000000
--- a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm6446_al.sh
+++ /dev/null
@@ -1,19 +0,0 @@
-#
-# loadmodules.sh
-#
-# Copyright (C) $year Texas Instruments Incorporated - http://www.ti.com/
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU Lesser General Public License as
-# published by the Free Software Foundation version 2.1 of the License.
-#
-# This program is distributed #as is# WITHOUT ANY WARRANTY of any kind,
-# whether express or implied; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-# Lesser General Public License for more details.
-
-modprobe cmemk phys_start=0x87800000 phys_end=0x88E00000 pools=20x4096,8x202752,10x131072,2x1048576,1x2097152,10x829440,1x6750000
-modprobe dsplinkk ddr_start=0x8F800000  ddr_size=0x600000
-
-rm -rf /dev/dsplink
-mknod /dev/dsplink c `awk "\\$2==\"dsplink\" {print \\$1}" /proc/devices` 0
diff --git a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm6467_al.sh b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm6467_al.sh
deleted file mode 100755
index b4a230d..0000000
--- a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-dm6467_al.sh
+++ /dev/null
@@ -1,19 +0,0 @@
-#
-# loadmodules.sh
-#
-# Copyright (C) $year Texas Instruments Incorporated - http://www.ti.com/
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU Lesser General Public License as
-# published by the Free Software Foundation version 2.1 of the License.
-#
-# This program is distributed #as is# WITHOUT ANY WARRANTY of any kind,
-# whether express or implied; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-# Lesser General Public License for more details.
-
-modprobe cmemk phys_start=0x87800000 phys_end=0x88E00000 pools=20x4096,8x202752,10x131072,2x1048576,1x2097152,10x829440,1x6750000
-modprobe dsplinkk ddr_start=0x8F800000  ddr_size=0x600000
-
-rm -rf /dev/dsplink
-mknod /dev/dsplink c `awk "\\$2==\"dsplink\" {print \\$1}" /proc/devices` 0
diff --git a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh
deleted file mode 100755
index 076af07..0000000
--- a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh
+++ /dev/null
@@ -1,42 +0,0 @@
-# loadmodules.sh
-#
-# Copyright (C) $year Texas Instruments Incorporated - http://www.ti.com/
-#
-# This program is free software; you can redistribute it and/or modify 
-# it under the terms of the GNU Lesser General Public License as
-# published by the Free Software Foundation version 2.1 of the License.
-#
-# This program is distributed #as is# WITHOUT ANY WARRANTY of any kind,
-# whether express or implied; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-# Lesser General Public License for more details.
-
-#
-# Default Memory Map
-#
-# Start Addr    Size    Description
-# -------------------------------------------
-# 0x80000000    88 MB   Linux
-# 0x85800000    08 MB   CMEM
-# 0x86800000    24 MB   DDRALGHEAP
-# 0x87800000     6 MB   DDR2 (BIOS, Codecs, Applications)
-# 0x87E00000     1 MB   DSPLINK (MEM)
-# 0x87F00000     4 KB   DSPLINK (RESET)
-# 0x87F01000  1020 KB   unused
-
-modprobe cmemk phys_start=0x85800000 phys_end=0x86800000 pools=20x4096,8x131072,4x829440,1x5250000,1x1429440,1x256000
-
-
-# insert DSP/BIOS Link driver
-#
-modprobe dsplinkk
-
-# make /dev/dsplink
-rm -f /dev/dsplink
-mknod /dev/dsplink c `awk "\\$2==\"dsplink\" {print \\$1}" /proc/devices` 0
-
-
-# insert Local Power Manager driver
-#
-modprobe lpm_omap3530
-
diff --git a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-ol137_al.sh b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-ol137_al.sh
deleted file mode 100755
index 2c98c78..0000000
--- a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-ol137_al.sh
+++ /dev/null
@@ -1,19 +0,0 @@
-#
-# loadmodules.sh
-#
-# Copyright (C) $year Texas Instruments Incorporated - http://www.ti.com/
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU Lesser General Public License as
-# published by the Free Software Foundation version 2.1 of the License.
-#
-# This program is distributed #as is# WITHOUT ANY WARRANTY of any kind,
-# whether express or implied; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-# Lesser General Public License for more details.
-
-modprobe cmemk phys_start=0xC2200000 phys_end=0xC3200000 pools=1x5250000,3x1048576,3x829440,1x256000,4x131072
-modprobe dsplinkk
-
-rm -rf /dev/dsplink
-mknod /dev/dsplink c `awk "\\$2==\"dsplink\" {print \\$1}" /proc/devices` 0
diff --git a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-ol138_al.sh b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-ol138_al.sh
deleted file mode 100755
index 2c98c78..0000000
--- a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-ol138_al.sh
+++ /dev/null
@@ -1,19 +0,0 @@
-#
-# loadmodules.sh
-#
-# Copyright (C) $year Texas Instruments Incorporated - http://www.ti.com/
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU Lesser General Public License as
-# published by the Free Software Foundation version 2.1 of the License.
-#
-# This program is distributed #as is# WITHOUT ANY WARRANTY of any kind,
-# whether express or implied; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-# Lesser General Public License for more details.
-
-modprobe cmemk phys_start=0xC2200000 phys_end=0xC3200000 pools=1x5250000,3x1048576,3x829440,1x256000,4x131072
-modprobe dsplinkk
-
-rm -rf /dev/dsplink
-mknod /dev/dsplink c `awk "\\$2==\"dsplink\" {print \\$1}" /proc/devices` 0
diff --git a/recipes-ti/dmai/ti-dmai/omap3530-r642-remove-include-videodev.diff b/recipes-ti/dmai/ti-dmai/omap3530-r642-remove-include-videodev.diff
deleted file mode 100644
index 63f9cc6..0000000
--- a/recipes-ti/dmai/ti-dmai/omap3530-r642-remove-include-videodev.diff
+++ /dev/null
@@ -1,64 +0,0 @@
-From 06c4cfeec98f4f1e31543878ceb74c5fff1907e4 Mon Sep 17 00:00:00 2001
-From: Enrico Butera <ebutera@users.berlios.de>
-Date: Thu, 22 Dec 2011 11:01:58 +0100
-Subject: [PATCH 1/2] adjust videdev headers for recent kernels
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- .../packages/ti/sdo/dmai/linux/omap3530/Capture.c  |    1 -
- .../ti/sdo/dmai/linux/omap3530/Display_v4l2.c      |    1 -
- .../ti/sdo/dmai/linux/omap3530/_VideoBuf.c         |    1 -
- .../ti/sdo/dmai/linux/omap3530/priv/_VideoBuf.h    |    1 -
- 4 files changed, 0 insertions(+), 4 deletions(-)
-
-diff --git a/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/Capture.c b/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/Capture.c
-index a924169..c2b45d2 100644
---- a/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/Capture.c
-+++ b/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/Capture.c
-@@ -40,7 +40,6 @@
- #include <sys/mman.h>
- #include <sys/ioctl.h>
- #include <asm/types.h>
--#include <linux/videodev.h>
- #include <linux/videodev2.h>
- 
- #include <xdc/std.h>
-diff --git a/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c b/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c
-index 0d01b39..0c35efe 100644
---- a/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c
-+++ b/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c
-@@ -38,7 +38,6 @@
- #include <sys/ioctl.h>
- #include <sys/mman.h>
- #include <errno.h>
--#include <linux/videodev.h>
- #include <linux/videodev2.h>
- 
- #include <xdc/std.h>
-diff --git a/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/_VideoBuf.c b/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/_VideoBuf.c
-index 5615e2f..5cb712d 100644
---- a/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/_VideoBuf.c
-+++ b/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/_VideoBuf.c
-@@ -38,7 +38,6 @@
- #include <sys/ioctl.h>
- #include <sys/mman.h>
- #include <errno.h>
--#include <linux/videodev.h>
- #include <linux/videodev2.h>
- 
- #include <xdc/std.h>
-diff --git a/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/priv/_VideoBuf.h b/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/priv/_VideoBuf.h
-index b2128a3..dbaa4eb 100644
---- a/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/priv/_VideoBuf.h
-+++ b/davinci_multimedia_application_interface/dmai/packages/ti/sdo/dmai/linux/omap3530/priv/_VideoBuf.h
-@@ -34,7 +34,6 @@
- #ifndef ti_sdo_dai_linux_priv__VideoBuf_h_
- #define ti_sdo_dai_linux_priv__VideoBuf_h_
- 
--#include <linux/videodev.h>
- #include <linux/videodev2.h>
- 
- #include <ti/sdo/dmai/BufferGfx.h>
--- 
-1.7.2.5
-
diff --git a/recipes-ti/dmai/ti-dmai/r642-fix-config-bld.diff b/recipes-ti/dmai/ti-dmai/r642-fix-config-bld.diff
deleted file mode 100644
index 2f328c0..0000000
--- a/recipes-ti/dmai/ti-dmai/r642-fix-config-bld.diff
+++ /dev/null
@@ -1,48 +0,0 @@
-From 86e89bb160cfe67c173f1260b93066b12dd73580 Mon Sep 17 00:00:00 2001
-From: Enrico Butera <ebutera@users.berlios.de>
-Date: Thu, 22 Dec 2011 11:03:58 +0100
-Subject: [PATCH 2/2] fix toolchain names in config.bld
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- .../dmai/packages/config.bld                       |   24 +------------------
- 1 files changed, 2 insertions(+), 22 deletions(-)
-
-diff --git a/davinci_multimedia_application_interface/dmai/packages/config.bld b/davinci_multimedia_application_interface/dmai/packages/config.bld
-index 8c2e96e..566f907 100644
---- a/davinci_multimedia_application_interface/dmai/packages/config.bld
-+++ b/davinci_multimedia_application_interface/dmai/packages/config.bld
-@@ -44,28 +44,8 @@ var C6X = xdc.useModule('ti.targets.C64P');
- C6X.rootDir = codegen;
- C6X.platform = xdcplat;
- 
--/* User passes in $(CROSS_COMPILE) where $(CROSS_COMPILE)gcc is their compiler
--   Then the TOOLDIR and LONGNAME are derived based on a regex of CROSS_COMPILE
--*/
--var crosscompile = "" + java.lang.System.getenv("CROSS_COMPILE");
--
--var tooldir = "";
--var longName = "";
--
--/* Search CROSS_COMPILE for bin/ If only 1 bin/ is found, set the tooldir to
--   the path prior to bin/ and the prefix to "bin/" + remainder of path,
--   else leave the tooldir as "" and set the LONGNAME to the full CROSS_COMPILE
--   path
--*/
--var regex = new RegExp("bin/");
--var find = crosscompile.split( regex );
--
--if (find[0]!=crosscompile && find.length==2) {
--    tooldir = find[0];
--    longName = "bin/" + find[1] + "gcc";
--} else {
--    longName = crosscompile + "gcc";
--}
-+var tooldir = "" + java.lang.System.getenv("CSTOOL_DIR");
-+var longName = "" + java.lang.System.getenv("MVTOOL_PREFIX") + "gcc";
- 
- /* location of the GCC Arm9 tools */
- var GCArmv5T = xdc.useModule('gnu.targets.arm.GCArmv5T');
--- 
-1.7.2.5
-
diff --git a/recipes-ti/dmai/ti-dmai/remove-unneeded-includes.patch b/recipes-ti/dmai/ti-dmai/remove-unneeded-includes.patch
deleted file mode 100644
index cfd325a..0000000
--- a/recipes-ti/dmai/ti-dmai/remove-unneeded-includes.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Index: a/packages/ti/sdo/dmai/Makefile
-===================================================================
---- a/packages/ti/sdo/dmai/Makefile
-+++ b/packages/ti/sdo/dmai/Makefile
-@@ -107,7 +107,7 @@ XDCPATH	+= $(XDC_INSTALL_DIR)/packages;$
- 
- CPP_FLAGS	+= -I$(XDC_INSTALL_DIR)/packages -I$(DMAI_INSTALL_DIR)/packages -I$(CE_INSTALL_DIR)/packages -I$(FC_INSTALL_DIR)/packages -I$(XDAIS_INSTALL_DIR)/packages -I$(CODEC_INSTALL_DIR)/packages -DDmai_Device_$(PLATFORM_DEVICE)
- 
--GCC_CPP_FLAGS	+= $(CPP_FLAGS) -I$(LINUXKERNEL_INSTALL_DIR)/include -I$(LINUXKERNEL_INSTALL_DIR)/arch/arm/include -I$(LINUXKERNEL_INSTALL_DIR)/arch/arm/$(PLATFORM_ARCH)/include $(HAVE_AUTOCONFIG) -I$(CMEM_INSTALL_DIR)/packages -I$(LINK_INSTALL_DIR) -DDmai_BuildOs_linux -Dxdc_target_types__=gnu/targets/std.h -I$(LINUXLIBS_INSTALL_DIR)/include -Dxdc_target_name__=arm/GCArmv5T
-+GCC_CPP_FLAGS	+= $(CPP_FLAGS) $(HAVE_AUTOCONFIG) -I$(CMEM_INSTALL_DIR)/packages -I$(LINK_INSTALL_DIR) -DDmai_BuildOs_linux -Dxdc_target_types__=gnu/targets/std.h -I$(LINUXLIBS_INSTALL_DIR)/include -Dxdc_target_name__=arm/GCArmv5T
- C64P_CPP_FLAGS	+= $(CPP_FLAGS) -I$(BIOS_INSTALL_DIR)/packages/ti/bios/include -I$(BIOS_INSTALL_DIR)/packages -DDmai_BuildOs_bios -Dxdc_target__='<ti/targets/std.h>' -I$(CODEGEN_INSTALL_DIR)/include -mv6400+ -pdse225 -eo$(PLATFORM_DEVICE).o$(EXT)
- 
- GCC_C_FLAGS	+= $(C_FLAGS) -Wall 
-Index: a/packages/ti/sdo/dmai/apps/Makefile.app
-===================================================================
---- a/packages/ti/sdo/dmai/apps/Makefile.app
-+++ b/packages/ti/sdo/dmai/apps/Makefile.app
-@@ -121,7 +121,7 @@ C64P_C_FLAGS	= $(C_FLAGS)
- GCC_CPP_FLAGS  	= $(CPP_FLAGS) -I$(LINUXKERNEL_INSTALL_DIR)/include
- C64P_CPP_FLAGS	= $(CPP_FLAGS) -pdse225 -I$(CODEGEN_INSTALL_DIR)/include -mv6400+ -I$(BIOS_INSTALL_DIR)/packages/ti/bios/include -eo$(PLATFORM_DEVICE).o$(EXT)
- 
--GCC_LD_FLAGS	= $(LD_FLAGS) -lpthread -lm -L$(LINUXLIBS_INSTALL_DIR)/lib -lasound
-+GCC_LD_FLAGS	= $(LD_FLAGS) -lpthread -lm --sysroot=$(PKG_CONFIG_SYSROOT_DIR) -L$(LINUXLIBS_INSTALL_DIR)/lib -lasound
- C64P_LD_FLAGS	= $(LD_FLAGS) -z -w -x -c -i$(RTDX_INSTALL_DIR)/packages/ti/rtdx/iom/lib/debug -i$(RTDX_INSTALL_DIR)/packages/ti/rtdx/cio/lib/release -i$(RTDX_INSTALL_DIR)/packages/ti/rtdx/lib/c6000 
- 
- SOURCES 	= $(wildcard *.c)
diff --git a/recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh b/recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh
deleted file mode 100644
index 793d727..0000000
--- a/recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh
+++ /dev/null
@@ -1,12 +0,0 @@
-# Unload modules - DMAI - OMAP3530
-
-# remove lpm module
-rmmod lpm_omap3530
-
-# remove DSP/BIOS Link driver
-rmmod dsplinkk
-#rm -f /dev/dsplink
-
-# remove cmem module
-rmmod cmemk
-
diff --git a/recipes-ti/dmai/ti-dmai_svn.bb b/recipes-ti/dmai/ti-dmai_svn.bb
deleted file mode 100644
index fb7ff3c..0000000
--- a/recipes-ti/dmai/ti-dmai_svn.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-require ti-dmai.inc
-
-# Need to descend one level more to find source
-S = "${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}/dmai"
-
-# Hack to be able to use recent kernel headers from userspace
-TARGET_CC_ARCH += " -D__EXPORTED_HEADERS__"
-
-PV = "2_10_00_01+svnr${SRCPV}"
-
-LIC_FILES_CHKSUM = "file://dmai_${PV}_License.html;md5=3302f728a5a42f97cabc26a54d7fa607"
-
-# This package has high dependence on kernel, use kernel PR as base and append a local version
-PR = "${MACHINE_KERNEL_PR}"
-PR:append = "p"
-
-DMAIBRANCH_dm6446     = "trunk"
-DMAIBRANCH_dm6467     = "branches/GITPSP_INT_101009"
-DMAIBRANCH:omap3      = "trunk"
-DMAIBRANCH_dm355      = "branches/GITPSP_INT_101009"
-DMAIBRANCH_dm365      = "trunk"
-DMAIBRANCH:omapl137   = "trunk"
-DMAIBRANCH:omapl138   = "trunk"
-DMAIBRANCH           ?= "UNDEFINED_DMAIBRANCH"
-
-SRCREV_dm6446         = "482"
-SRCREV_dm6467         = "441"
-SRCREV:omap3          = "642"
-SRCREV_dm355          = "424"
-SRCREV_dm365          = "570"
-SRCREV:omapl137       = "482"
-SRCREV:omapl138       = "570"
-SRCREV               ?= "UNDEFINED_SRCREV"
-
-SRC_URI:append = " file://omap3530-r642-remove-include-videodev.diff;striplevel=3 \
-                   file://r642-fix-config-bld.diff;striplevel=3 \
-                   file://remove-unneeded-includes.patch \
-                 "
-
-INSANE_SKIP:${PN} = "installed-vs-shipped"
-
-COMPATIBLE_HOST ?= "null"
-COMPATIBLE_HOST:ti-soc = "(.*)"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index a2d6b26..e553003 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -13,7 +13,6 @@ export CMEM_INSTALL_DIR_RECIPE       = "${installdir}/ti-linuxutils-tree"
 export CODEC_INSTALL_DIR_RECIPE      = "${installdir}/ti-codecs-tree"
 export CODEGEN_ARM_INSTALL_DIR_RECIPE= "${installdir}/ti-cgt470-tree"
 export CODEGEN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt6x-tree"
-export DMAI_INSTALL_DIR_RECIPE       = "${installdir}/ti-dmai-tree"
 export DSP_BENCHMARK_INSTALL_DIR_RECIPE = "${installdir}/ti-dsp-benchmark-tree"
 export DSPLIB_C64P_INSTALL_DIR_RECIPE = "${installdir}/ti-dsplib-c64p-tree"
 export DSPLIB_C674_INSTALL_DIR_RECIPE = "${installdir}/ti-dsplib-c674x-tree"
@@ -73,7 +72,6 @@ export CMEM_INSTALL_DIR       = "${STAGING_DIR_TARGET}${CMEM_INSTALL_DIR_RECIPE}
 export CODEC_INSTALL_DIR      = "${STAGING_DIR_TARGET}${CODEC_INSTALL_DIR_RECIPE}"
 export CODEGEN_ARM_INSTALL_DIR= "${STAGING_DIR_TARGET}${CODEGEN_ARM_INSTALL_DIR_RECIPE}"
 export CODEGEN_INSTALL_DIR    = "${STAGING_DIR_TARGET}${CODEGEN_INSTALL_DIR_RECIPE}"
-export DMAI_INSTALL_DIR       = "${STAGING_DIR_TARGET}${DMAI_INSTALL_DIR_RECIPE}"
 export DSP_BENCHMARK_INSTALL_DIR = "${STAGING_DIR_TARGET}${DSP_BENCHMARK_INSTALL_DIR_RECIPE}"
 export EDMA3_LLD_INSTALL_DIR  = "${STAGING_DIR_TARGET}${EDMA3_LLD_INSTALL_DIR_RECIPE}"
 export EDMA3_LLD_SYSBIOS_INSTALL_DIR  = "${STAGING_DIR_TARGET}${EDMA3_LLD_SYSBIOS_INSTALL_DIR_RECIPE}"
-- 
2.7.4


