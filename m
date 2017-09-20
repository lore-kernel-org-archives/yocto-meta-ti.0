Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00DD3E00956; Wed, 20 Sep 2017 08:37:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B53EE00851
	for <meta-ti@yoctoproject.org>; Wed, 20 Sep 2017 08:37:33 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KFbWRa012601
	for <meta-ti@yoctoproject.org>; Wed, 20 Sep 2017 10:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505921852;
	bh=9nevnMFweFnNcG6tlzKllThDM95vlbfRwhu8v/z+hzY=;
	h=From:To:CC:Subject:Date;
	b=GcebE1MxjSy9Y6ds8p81Zw/DQB6mGx8QeWEeEjUemt21P8krrIvf7IoJX0pkNglF8
	rMIvdlmjT1zLn1ZDw9chcf7miHdWKfHcjBBLMzaoh0Bz/V8AO+n1IeDvoMX9S/8lks
	7yina+bVt/4dZ/eLNwNmn0Domk4HywlucZGKAocM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KFbWei001619
	for <meta-ti@yoctoproject.org>; Wed, 20 Sep 2017 10:37:32 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 10:37:32 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 10:37:32 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KFbWon026552;
	Wed, 20 Sep 2017 10:37:32 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 20 Sep 2017 11:37:30 -0400
Message-ID: <1505921850-10668-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] component-meta: Adding component meta information
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
X-List-Received-Date: Wed, 20 Sep 2017 15:37:34 -0000
Content-Type: text/plain

Class for adding component meta information

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 classes/component_meta.bbclass | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 classes/component_meta.bbclass

diff --git a/classes/component_meta.bbclass b/classes/component_meta.bbclass
new file mode 100644
index 0000000..f2dc754
--- /dev/null
+++ b/classes/component_meta.bbclass
@@ -0,0 +1,29 @@
+CM_NAME ?= ""
+CM_VERSION ?= ""
+CM_ROOT_DIR ?= ""
+CM_BINARY ?= ""
+CM_DESCRIPTION ?= ""
+
+do_component_meta() {
+    if [ ! -d "${DEPLOY_DIR_IMAGE}" ]
+    then
+        mkdir -p ${DEPLOY_DIR_IMAGE}    
+    fi
+
+    if [ ! -e "${DEPLOY_DIR_IMAGE}/.components_meta" ]
+    then
+        touch ${DEPLOY_DIR_IMAGE}/.components_meta
+    fi
+
+    # Check if component is already documented in .components_meta
+    if ! grep -q "${CM_ROOT_DIR}" ${DEPLOY_DIR_IMAGE}/.components_meta
+    then
+        # Add component meta information
+        echo "${CM_NAME}|${CM_VERSION}|${CM_ROOT_DIR}|${CM_BINARY}|${CM_DESCRIPTION}" >> \
+            ${DEPLOY_DIR_IMAGE}/.components_meta
+    fi
+}
+
+do_component_meta[lockfiles] = "${DEPLOY_DIR_IMAGE}/component_meta.lock"
+
+addtask do_component_meta after do_install before do_package
-- 
1.9.1


