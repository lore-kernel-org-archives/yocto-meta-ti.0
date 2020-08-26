Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.14833.1598455436729243777
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Aug 2020 08:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Ly8yOk88;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-stiffler@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07QFNkqp084902;
	Wed, 26 Aug 2020 10:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1598455426;
	bh=o4kdXfsflO3BZSDLG6p/71W28fJ+E0CKJ0lMUwGGlvY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Ly8yOk88D3fw9FWx37taLQ0+ZKSq3Idm/1xCx1tXc139GCn/GPq1EywpH054KSzxp
	 iET2B3dHxJD92+t7uB0FPLqOMGPCYrMDrrLhg/JtCLWU327XON0htbqaUpMa+EV+j4
	 wi4PYYKdtKUz54qJ5AtKSWtrZGUaeUeaO6WMwZG4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07QFNkcE093015
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Aug 2020 10:23:46 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 26
 Aug 2020 10:23:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 26 Aug 2020 10:23:46 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07QFNjJ8077606;
	Wed, 26 Aug 2020 10:23:45 -0500
Subject: Re: [EXTERNAL] [meta-ti] [dunfell/master][PATCH v2 3/3] ti-rtos-firmware: add recipe for RTOS FW binary integration
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>
References: <1597946476-11345-1-git-send-email-denis@denix.org>
 <1597946476-11345-3-git-send-email-denis@denix.org>
From: "Jacob Stiffler" <j-stiffler@ti.com>
Message-ID: <03e22f60-b0fc-d925-2f4f-75597514c560@ti.com>
Date: Wed, 26 Aug 2020 11:23:43 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <1597946476-11345-3-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------A670F6AA29198831A3C92273"
Content-Language: en-US

--------------A670F6AA29198831A3C92273
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 8/20/2020 2:01 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - make use of file prefix and suffix more generic for nightlies
>
>   recipes-ti/ti-rtos-bin/files/empty         |  1 +
>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 76 ++++++++++++++++++++++++++++++
>   2 files changed, 77 insertions(+)
>   create mode 100644 recipes-ti/ti-rtos-bin/files/empty
>   create mode 100644 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>
> diff --git a/recipes-ti/ti-rtos-bin/files/empty b/recipes-ti/ti-rtos-bin/files/empty
> new file mode 100644
> index 0000000..c6cac69
> --- /dev/null
> +++ b/recipes-ti/ti-rtos-bin/files/empty
> @@ -0,0 +1 @@
> +empty
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> new file mode 100644
> index 0000000..9bfbe74
> --- /dev/null
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -0,0 +1,76 @@
> +SUMMARY = "TI RTOS prebuilt binary firmware images"
> +
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/../meta-ti/licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
> +
> +COMPATIBLE_MACHINE = "k3"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +inherit deploy
> +
> +# First, let's try including metadata.inc that could be fetched and deployed
> +# by ti-rtos-metadata earlier and provide new set of CORESDK_RTOS_* variables
> +include ${DEPLOY_DIR_IMAGE}/metadata.inc

What controls this dependency? Is it possible to have parsing depend on 
a recipe task?


> +
> +# Set some defaults for when metadata.inc is not available
> +DEFAULT_RTOS_FAMILY = "jacinto"
> +DEFAULT_RTOS_VERSION = "07_01_00_02"
> +DEFAULT_RTOS_VERSION_DOT = "07.01.00.02"
> +
> +DEFAULT_RTOS_SOC = "undefined"
> +DEFAULT_RTOS_SOC_j7 = "j721e"
> +DEFAULT_RTOS_SOC_j7200-evm = "j7200"
> +DEFAULT_RTOS_SOC_am65xx = "am65xx"
> +
> +DEFAULT_RTOS_WEBLINK = "undefined"
> +DEFAULT_RTOS_WEBLINK_j7 = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"
> +DEFAULT_RTOS_WEBLINK_am65xx = "https://software-dl.ti.com/processor-sdk-rtos/esd/AM65X/firmware/${CORESDK_RTOS_VERSION}"
> +
> +DEFAULT_FIRMWARE_FILE = "coresdk_rtos_${CORESDK_RTOS_SOC}_${CORESDK_RTOS_VERSION}_firmware.tar.xz"
> +
> +DEFAULT_FIRMWARE_URL = "file://empty"
> +DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
> +
> +DEFAULT_FIRMWARE_SHA256SUM = "unknown"
> +DEFAULT_FIRMWARE_SHA256SUM_j7 = "e1e2eb0086a28468f1bb4b796571dcf1bfa23aedbb092bd02227e777a078afe3"
> +DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "218e51739c53e306cc61bbb705b3d8eeae3afb63869f2aa82a4c804f7847bd63"
> +DEFAULT_FIRMWARE_SHA256SUM_am65xx = "37188564fbb8420ba9dadb74ecf05b3aac2bf39a0e72c18c23272a141e69ace7"
> +
> +# Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
> +CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
> +CORESDK_RTOS_VERSION ?= "${DEFAULT_RTOS_VERSION}"
> +CORESDK_RTOS_VERSION_DOT ?= "${DEFAULT_RTOS_VERSION_DOT}"
> +CORESDK_RTOS_SOC ?= "${DEFAULT_RTOS_SOC}"
> +CORESDK_RTOS_WEBLINK ?= "${DEFAULT_RTOS_WEBLINK}"
> +CORESDK_RTOS_FIRMWARE_URL ?= "${DEFAULT_FIRMWARE_URL}"
> +CORESDK_RTOS_FIRMWARE_SHA256SUM ?= "${DEFAULT_FIRMWARE_SHA256SUM}"
> +CORESDK_RTOS_FILE_PREFIX ?= ""
> +CORESDK_RTOS_FILE_SUFFIX ?= ""
> +
> +# Common code below
> +S = "${WORKDIR}/lib/"
> +
> +PV = "${CORESDK_RTOS_VERSION_DOT}"
> +
> +SRC_URI = "${CORESDK_RTOS_FIRMWARE_URL}${CORESDK_RTOS_FILE_SUFFIX}"
> +SRC_URI[sha256sum] = "${CORESDK_RTOS_FIRMWARE_SHA256SUM}"
> +
> +FILES_${PN} += "${base_libdir}"
> +
> +do_install() {
> +	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +	install -d ${D}${base_libdir}
> +	cp ${CP_ARGS} ${S} ${D}
> +}
> +
> +FILES_${PN} = "${base_libdir}"
> +
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +INSANE_SKIP_${PN} += "arch"
> +
> +do_compile[noexec] = "1"
> +do_configure[noexec] = "1"
>
> 

--------------A670F6AA29198831A3C92273
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/20/2020 2:01 PM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1597946476-11345-3-git-send-email-denis@denix.org">
      <pre class="moz-quote-pre" wrap="">From: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>

Signed-off-by: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>
---
v2 - make use of file prefix and suffix more generic for nightlies

 recipes-ti/ti-rtos-bin/files/empty         |  1 +
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 76 ++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 recipes-ti/ti-rtos-bin/files/empty
 create mode 100644 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb

diff --git a/recipes-ti/ti-rtos-bin/files/empty b/recipes-ti/ti-rtos-bin/files/empty
new file mode 100644
index 0000000..c6cac69
--- /dev/null
+++ b/recipes-ti/ti-rtos-bin/files/empty
@@ -0,0 +1 @@
+empty
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
new file mode 100644
index 0000000..9bfbe74
--- /dev/null
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -0,0 +1,76 @@
+SUMMARY = "TI RTOS prebuilt binary firmware images"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COREBASE}/../meta-ti/licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a">"file://${COREBASE}/../meta-ti/licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"</a>
+
+COMPATIBLE_MACHINE = "k3"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+inherit deploy
+
+# First, let's try including metadata.inc that could be fetched and deployed
+# by ti-rtos-metadata earlier and provide new set of CORESDK_RTOS_* variables
+include ${DEPLOY_DIR_IMAGE}/metadata.inc</pre>
    </blockquote>
    <p>What controls this dependency? Is it possible to have parsing
      depend on a recipe task?<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:1597946476-11345-3-git-send-email-denis@denix.org">
      <pre class="moz-quote-pre" wrap="">
+
+# Set some defaults for when metadata.inc is not available
+DEFAULT_RTOS_FAMILY = "jacinto"
+DEFAULT_RTOS_VERSION = "07_01_00_02"
+DEFAULT_RTOS_VERSION_DOT = "07.01.00.02"
+
+DEFAULT_RTOS_SOC = "undefined"
+DEFAULT_RTOS_SOC_j7 = "j721e"
+DEFAULT_RTOS_SOC_j7200-evm = "j7200"
+DEFAULT_RTOS_SOC_am65xx = "am65xx"
+
+DEFAULT_RTOS_WEBLINK = "undefined"
+DEFAULT_RTOS_WEBLINK_j7 = <a class="moz-txt-link-rfc2396E" href="https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}">"https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"</a>
+DEFAULT_RTOS_WEBLINK_am65xx = <a class="moz-txt-link-rfc2396E" href="https://software-dl.ti.com/processor-sdk-rtos/esd/AM65X/firmware/${CORESDK_RTOS_VERSION}">"https://software-dl.ti.com/processor-sdk-rtos/esd/AM65X/firmware/${CORESDK_RTOS_VERSION}"</a>
+
+DEFAULT_FIRMWARE_FILE = "coresdk_rtos_${CORESDK_RTOS_SOC}_${CORESDK_RTOS_VERSION}_firmware.tar.xz"
+
+DEFAULT_FIRMWARE_URL = <a class="moz-txt-link-rfc2396E" href="file://empty">"file://empty"</a>
+DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
+
+DEFAULT_FIRMWARE_SHA256SUM = "unknown"
+DEFAULT_FIRMWARE_SHA256SUM_j7 = "e1e2eb0086a28468f1bb4b796571dcf1bfa23aedbb092bd02227e777a078afe3"
+DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "218e51739c53e306cc61bbb705b3d8eeae3afb63869f2aa82a4c804f7847bd63"
+DEFAULT_FIRMWARE_SHA256SUM_am65xx = "37188564fbb8420ba9dadb74ecf05b3aac2bf39a0e72c18c23272a141e69ace7"
+
+# Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
+CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
+CORESDK_RTOS_VERSION ?= "${DEFAULT_RTOS_VERSION}"
+CORESDK_RTOS_VERSION_DOT ?= "${DEFAULT_RTOS_VERSION_DOT}"
+CORESDK_RTOS_SOC ?= "${DEFAULT_RTOS_SOC}"
+CORESDK_RTOS_WEBLINK ?= "${DEFAULT_RTOS_WEBLINK}"
+CORESDK_RTOS_FIRMWARE_URL ?= "${DEFAULT_FIRMWARE_URL}"
+CORESDK_RTOS_FIRMWARE_SHA256SUM ?= "${DEFAULT_FIRMWARE_SHA256SUM}"
+CORESDK_RTOS_FILE_PREFIX ?= ""
+CORESDK_RTOS_FILE_SUFFIX ?= ""
+
+# Common code below
+S = "${WORKDIR}/lib/"
+
+PV = "${CORESDK_RTOS_VERSION_DOT}"
+
+SRC_URI = "${CORESDK_RTOS_FIRMWARE_URL}${CORESDK_RTOS_FILE_SUFFIX}"
+SRC_URI[sha256sum] = "${CORESDK_RTOS_FIRMWARE_SHA256SUM}"
+
+FILES_${PN} += "${base_libdir}"
+
+do_install() {
+	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+	install -d ${D}${base_libdir}
+	cp ${CP_ARGS} ${S} ${D}
+}
+
+FILES_${PN} = "${base_libdir}"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INSANE_SKIP_${PN} += "arch"
+
+do_compile[noexec] = "1"
+do_configure[noexec] = "1"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A670F6AA29198831A3C92273--
