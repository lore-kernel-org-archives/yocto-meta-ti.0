Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 484CFE00BAD; Thu,  6 Jul 2017 09:28:39 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4138AE00B57
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 09:28:37 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66GSRuF027986
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:28:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499358507;
	bh=qnTt4/DwxQs3OtQrqi8bW1MDjWZijnhYbmyipIOHJqI=;
	h=From:To:CC:Subject:Date;
	b=bvYw2bhWW1slJ/2fSS/sEqgUhQMr9Gt/v1Rb2PEcvEbBjdajk1sTvhCriHmKGRRZJ
	CWdUUjd8zK4VuKsrpfFaeI8fFbTARJ2Gt+tO7LJjmr/pSmxlG1bwxSFUlh62kZDZWm
	r7nPr2/HXAXekKtmVknk/LKcEKGz/U4+EgGm1e3w=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66GSMdZ011674
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:28:22 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 11:28:21 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66GSLfj031346;	Thu, 6 Jul 2017 11:28:21 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 12:28:19 -0400
Message-ID: <1499358499-34957-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] eclipse-plugin: Added eclipse plugin bbclass
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
X-List-Received-Date: Thu, 06 Jul 2017 16:28:39 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 classes/eclipse-plugin.bbclass | 182 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 182 insertions(+)
 create mode 100644 classes/eclipse-plugin.bbclass

diff --git a/classes/eclipse-plugin.bbclass b/classes/eclipse-plugin.bbclass
new file mode 100644
index 0000000..35af07c
--- /dev/null
+++ b/classes/eclipse-plugin.bbclass
@@ -0,0 +1,182 @@
+
+ECLIPSE_PLUGIN_EXTENSION_FILE = ".eclipseextension"
+create_eclipse_plugin_extension() {
+    mkdir -p "${D}${ECLIPSE_PLUGIN_DIR}"
+    cat > "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_EXTENSION_FILE}" << EOF
+id=org.eclipse.platform
+name=Eclipse Platform
+version=3.2.0
+EOF
+}
+
+
+ECLIPSE_PLUGIN_FEATURE_DIR  = "features/${ECLIPSE_PLUGIN_RTSC}.product_${ECLIPSE_PLUGIN_VERSION}"
+ECLIPSE_PLUGIN_FEATURE_FILE = "${ECLIPSE_PLUGIN_FEATURE_DIR}/feature.xml"
+create_eclipse_plugin_feature() {
+    mkdir -p "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_FEATURE_DIR}"
+
+    cat > "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_FEATURE_FILE}" << EOF
+<?xml version="1.0" encoding="UTF-8"?>
+<feature
+      id="${ECLIPSE_PLUGIN_RTSC}.product_${ECLIPSE_PLUGIN_VERSION}"
+      label="${ECLIPSE_PLUGIN_NAME}"
+      version="${ECLIPSE_PLUGIN_VERSION}"
+      provider-name="${ECLIPSE_PLUGIN_PROVIDER}">
+
+   <description url="${ECLIPSE_PLUGIN_DESC_URL}">
+      ${ECLIPSE_PLUGIN_DESC}
+   </description>
+
+   <copyright>
+      ${ECLIPSE_PLUGIN_COPYRIGHT}
+   </copyright>
+
+   <license>
+      Released under the Eclipse Public License 1.0 (http://www.eclipse.org/legal/epl-v10.html)
+   </license>
+
+   <plugin
+        id="${ECLIPSE_PLUGIN_RTSC}.product_${ECLIPSE_PLUGIN_VERSION}"
+        version="${ECLIPSE_PLUGIN_VERSION}"
+        unpack="false" />
+
+</feature>
+EOF
+}
+
+ECLIPSE_PLUGIN_PLUGIN_DIR  = "plugins/${ECLIPSE_PLUGIN_RTSC}.product_${ECLIPSE_PLUGIN_VERSION}"
+ECLIPSE_PLUGIN_PLUGIN_FILE = "${ECLIPSE_PLUGIN_PLUGIN_DIR}/plugin.xml"
+create_eclipse_plugin_plugin() {
+    mkdir -pv "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_PLUGIN_DIR}"
+
+    cat > "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_PLUGIN_FILE}" << EOF
+<?xml version="1.0" encoding="UTF-8"?>
+<?eclipse version="3.2"?>
+<plugin
+    name="${ECLIPSE_PLUGIN_NAME} ${ECLIPSE_PLUGIN_VERSION}"
+    id="${ECLIPSE_PLUGIN_RTSC}.product_${ECLIPSE_PLUGIN_VERSION}"
+    version="${ECLIPSE_PLUGIN_VERSION}"
+    provider-name="${ECLIPSE_PLUGIN_PROVIDER}">
+EOF
+
+    if [ ! -z "${ECLIPSE_PLUGIN_CDOC}" ]
+    then
+        cat >> "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_PLUGIN_FILE}" << EOF
+    <extension point="org.eclipse.help.toc">
+        <toc file="toc_top.xml" primary="true"/>
+        <toc file="toc_cdoc.xml"/>
+    </extension>
+EOF
+    fi
+
+    cat >> "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_PLUGIN_FILE}" << EOF
+    <extension point="org.eclipse.help.contentProducer">
+        <contentProducer>
+            <producer class="org.eclipse.rtsc.xdctools.ui.help.HelpContentProducer"/>
+        </contentProducer>
+    </extension>
+
+    <extension point="org.eclipse.rtsc.xdctools.ui.productInfo">
+        <repository location="${ECLIPSE_PLUGIN_REPO}"/>
+        <docs location="${ECLIPSE_PLUGIN_DOCS}"/>
+        <info
+            installLocation="${ECLIPSE_PLUGIN_ROOT}"
+            productName="${ECLIPSE_PLUGIN_NAME}"
+            versionNumber="${ECLIPSE_PLUGIN_VERSION}"
+        />
+    </extension>
+
+
+    <extension point="org.eclipse.rtsc.xdctools.managedbuild.core.rtscProductTypes">
+        <productType
+            id="${ECLIPSE_PLUGIN_RTSC}"
+            name="${ECLIPSE_PLUGIN_NAME}"
+            folderPrefix="${ECLIPSE_FOLDER_PREFIX}"
+            rootMacroName="${ECLIPSE_ROOT_MACRO}"/>
+    </extension>
+
+    <extension point="org.eclipse.rtsc.xdctools.managedbuild.core.rtscProducts">
+        <product
+            productTypeId="${ECLIPSE_PLUGIN_RTSC}"
+            version="${ECLIPSE_PLUGIN_VERSION}"/>
+    </extension>
+
+</plugin>
+EOF
+}
+
+ECLIPSE_PLUGIN_TOC_FILE = "${ECLIPSE_PLUGIN_PLUGIN_DIR}/toc_top.xml"
+ECLIPSE_PLUGIN_CDOC_FILE = "${ECLIPSE_PLUGIN_PLUGIN_DIR}/toc_cdoc.xml"
+create_eclipse_plugin_toc() {
+    cat > "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_TOC_FILE}" << EOF
+<?xml version="1.0" encoding="UTF-8"?>
+<?NLS TYPE="org.eclipse.help.toc"?>
+
+<toc label="${ECLIPSE_PLUGIN_NAME} ${ECLIPSE_PLUGIN_VERSION}">
+    <topic label="API Reference"><link toc="toc_cdoc.xml"/></topic>
+</toc>
+EOF
+
+    cat > "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_CDOC_FILE}" << EOF
+<?xml version="1.0" encoding="utf-8"?>
+<?xml-stylesheet type="text/xsl" href="toc.xsl"?>
+<toc label="${ECLIPSE_PLUGIN_NAME}" topic="packages.html">
+EOF
+
+    for cdoc in ${ECLIPSE_PLUGIN_CDOC}
+    do
+        cat "${WORKDIR}/$cdoc" >> \
+            "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_CDOC_FILE}"
+    done
+
+    cat >> "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_CDOC_FILE}" << EOF
+</toc>
+EOF
+}
+
+ECLIPSE_PLUGIN_MANIFEST_DIR  = "${ECLIPSE_PLUGIN_PLUGIN_DIR}/META-INF"
+ECLIPSE_PLUGIN_MANIFEST_FILE = "${ECLIPSE_PLUGIN_MANIFEST_DIR}/MANIFEST.MF"
+create_eclipse_plugin_manifest() {
+    mkdir -p "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_MANIFEST_DIR}"
+
+    cat > "${D}${ECLIPSE_PLUGIN_DIR}/${ECLIPSE_PLUGIN_MANIFEST_FILE}" << EOF
+Manifest-Version: 1.0
+Bundle-ManifestVersion: 2
+Bundle-Name: ${ECLIPSE_PLUGIN_NAME} ${ECLIPSE_PLUGIN_VERSION}
+Bundle-SymbolicName: ${ECLIPSE_PLUGIN_RTSC}.product_${ECLIPSE_PLUGIN_VERSION};singleton:=true
+Bundle-Version: ${ECLIPSE_PLUGIN_VERSION}
+Bundle-Activator: org.eclipse.rtsc.xdctools.ui.CCSActivator
+Bundle-Vendor: ${ECLIPSE_PLUGIN_PROVIDER}
+Require-Bundle: org.eclipse.ui,
+ org.eclipse.core.runtime,
+ org.eclipse.help,
+ org.eclipse.rtsc.xdctools.ui
+Eclipse-LazyStart: true
+EOF
+}
+
+create_eclipse_plugin() {
+    create_eclipse_plugin_extension
+    create_eclipse_plugin_feature
+    create_eclipse_plugin_plugin
+
+    if [ ! -z "${ECLIPSE_PLUGIN_CDOC}" ]
+    then
+        create_eclipse_plugin_toc
+    fi
+
+    create_eclipse_plugin_manifest
+}
+
+do_install_append() {
+    bbwarn "CDOC = \"${ECLIPSE_PLUGIN_CDOC}\""
+    bbwarn "SRC_URI = \"${SRC_URI}\""
+    create_eclipse_plugin
+}
+
+def string_set(iterable):
+    return ' '.join(set(iterable))
+
+SRC_URI_append = "${@string_set('file://%s' %cdoc for cdoc in (d.getVar("ECLIPSE_PLUGIN_CDOC", True) or "").split())}"
+
+FILES_${PN} = "${ECLIPSE_PLUGIN_DIR}"
-- 
1.9.1


